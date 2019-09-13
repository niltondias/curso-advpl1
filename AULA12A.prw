#INCLUDE "PROTHEUS.CH"

/*/
===========================================================================
EXEMPLO EXECAUTO PV

==========================================================================
*/

USER Function AULA12A(_aCabec,_aItens,_nOpc)

	DEFAULT _nOpc := 3
	PRIVATE _aCabSC5 := {}
	PRIVATE _aIteSC6 := {}

    //***** INICIO DE TRANSACAO
    Begin Transaction
   
	_aCabSC5:={}
	Aadd(_aCabSC5,{"C5_TIPO"		,"N"						,Nil})
	Aadd(_aCabSC5,{"C5_CLIENTE"		,_aCabec[1]				,Nil})
	Aadd(_aCabSC5,{"C5_LOJACLI"		,_aCabec[2]				,Nil})
	Aadd(_aCabSC5,{"C5_CLIENT"		,_aCabec[3]				,Nil})
	Aadd(_aCabSC5,{"C5_LOJAENT"		,_aCabec[4]				,Nil})
	Aadd(_aCabSC5,{"C5_CONDPAG"		,Iif(Empty(_aCabec[5]),"001",_aCabec[5]),Nil})
	Aadd(_aCabSC5,{"C5_EMISSAO"		,dDataBase					,Nil})
	Aadd(_aCabSC5,{"C5_MOEDA"		,1							,Nil})

	For nI := 1 to len(_aItens)

		_aLinha:={}
		Aadd(_aLinha,{"C6_ITEM"		,strzero(nI,2)				,Nil})
		Aadd(_aLinha,{"C6_PRODUTO"	,_aItens[nI,1]  			,Nil})
		Aadd(_aLinha,{"C6_UM"		,_aItens[nI,2]				,Nil})
		Aadd(_aLinha,{"C6_QTDVEN"	,_aItens[nI,3]				,Nil})
		Aadd(_aLinha,{"C6_PRCVEN"	,_aItens[nI,4]  		    ,Nil})
		Aadd(_aLinha,{"C6_VALOR"	,A410Arred(_aItens[nI,3] * _aItens[nI,4],"C6_VALOR")			,Nil})
		Aadd(_aLinha,{"C6_QTDLIB"	,_aItens[nI,3]														,Nil})//LIBERADO PRA FATURAR
		Aadd(_aLinha,{"C6_TES"	,"501"    												,Nil})
		Aadd(_aIteSC6,_aLinha)
		
	Next

	lMsErroAuto	:= .F.

	MSExecAuto({|x,y,z| MATA410(x,y,z)}   ,_aCabSC5  ,_aIteSC6 , _nOpc  ) 
	
	If !lMsErroAuto
		ConfirmSx8()//CONFIRMA O NUMERO DO C5_NUM
	Else
		RollBackSx8() // DESFAZ O NUMRO DO C5_NUM
		MostraErro()
		DisarmTransaction() //DESFAZ TRANSACAOI
	EndIf


    // **** FIM DE TRANSACAO
	End Transaction

Return()