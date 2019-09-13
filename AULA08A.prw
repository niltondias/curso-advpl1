#include 'protheus.ch'
#include 'tbiconn.ch'

//====================================================================
// EXEMPLO DE TRABALHO DE TABELA TEMPORARIA
//====================================================================
user function AULA08A()

// o select() verifica qual posicao de pilha de tabelas abertas o alias esta
// USAMOS ESTE RECURSO PRA SABER SE O AMBIENTE ESTALOGADO *ACESSAD VIA MENU
// NESTE EXEMPLO, EH COMO SE FOSSEUM JOB LOGANDO NA 99/01


    IF SELECT("SX6") == 0 
         CONOUT("  ***** PREPARE *****")
         PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FIN"
    ENDIF

	Private xAlias := GetNextAlias() // cria alias randomico
	Private xIndice := "INDICE_1"  // nome de arquivo de indice alocado
	Private aFields := {} // vetor com campos da tabela temporaria
	//--------------------------------------------------
	//Criação do objeto , quando fecha objeto,tabela eh apagada
	// somente a sessao/thread que cria a tabela consegue ver
	//-------------------------------------------------
	oTempTable := FWTemporaryTable():New( xAlias )

	//--------------------------
	//Monta os campos da tabela
	//--------------------------
	aadd(aFields,{"CODIGO"   ,"C",006,0})
	aadd(aFields,{"DESCRI"   ,"C",255,0})
	aadd(aFields,{"HORA"     ,"C",008,0})
	aadd(aFields,{"VALOR"    ,"N",015,2})
	aadd(aFields,{"EMISSAO"  ,"D",008,0})

	oTemptable:SetFields( aFields )
	oTempTable:AddIndex(XINDICE, {"CODIGO"} )

	//------------------
	//Criação da tabela
	//------------------
	oTempTable:Create()

	For nI := 1 to 1000
		conout("carga de dados teoricos: "+ STRZERO(nI,6))
		
		dbselectarea(xAlias)
		dbgotop()
		RECLOCK(xAlias,.T.)
		(xAlias)->CODIGO := STRZERO(nI,6)
		(xAlias)->DESCRI := Extenso(nI)
		(xAlias)->HORA   := time()
		(xAlias)->VALOR  := (nI/3)
		(xAlias)->EMISSAO := (DATE() - nI)
		MSUNLOCK()
		COMMIT
	Next

	dbselectarea(xAlias)
	dbgotop()
	while (xAlias)->(!eof())
		CONOUT("****** FUNCIONA? *****")
		CONOUT("***** "+(xAlias)->CODIGO)
		CONOUT((xAlias)->DESCRI)

		(xAlias)->(dbskip())
	enddo
	//---------------------------------
	//Exclui a tabela
	//---------------------------------
	oTempTable:Delete()

	CONOUT("****** ACABOU *****")
	CONOUT("****** ACABOU *****")
	CONOUT("****** ACABOU *****")
	CONOUT("****** ACABOU *****")

return