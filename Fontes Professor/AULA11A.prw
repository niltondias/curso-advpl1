#include 'protheus.ch'
#include 'TBICONN.ch'

USER FUNCTION SIGAFAT() // PONTO ENTRADA - SIGAFAT, executa toda vez que entra no mainwnd do modulo

IF MSGNOYES("EXECUTA?")
   U_AULA11A()  
   FINAL("ACABOU")
ENDIF

RETURN


//===========================================================
user function AULA11A()

	Private aDados := {}

	IF FT_FUSE("C:\A\MUN.csv") < 0
		Msgalert("ERRO ABERTURA DE ARQUIVO!")
		RETURN
	ENDIF

	FT_FGOTOP()

	WHILE !FT_FEOF()

		cF := FT_FREADLN()
		aF := STRTOKARR2(cF,";",.t.)
		aF[2] := UPPER(FwNoAccent(aF[2]))
		nPos := AT( '(' ,  aF[2] )+1
		CONOUT(TIME()+" ***** "+aF[1]+" *** "+aF[2]+" *** "+SUBSTR(aF[2],nPos,2)  )
	
		cEst := SUBSTR(aF[2],nPos,2)

        _cCod  := cEst+aF[1]
        _cDesc := substr(aF[2],1,30)        
        
        dbselectarea("SB1")
		DBSETORDER(1)
		DBGOTOP()
		IF DBSEEK(XFILIAL("SB1")+_cCod)
			CONOUT("***** ALTERACAO!!!")
			nOpc := 4
		ELSE
			CONOUT("***** INCLUIR!!!")
			nOpc := 3

		ENDIF

		aDados := {}
		AADD(aDados,{"B1_COD"    ,_cCod ,nil})
		AADD(aDados,{"B1_DESC"   ,_cDesc,nil})
		AADD(aDados,{"B1_TIPO"   ,"PA",nil})
		AADD(aDados,{"B1_UM"     ,"UN",nil})
		AADD(aDados,{"B1_LOCPAD" ,"01",nil})

		LMSERROAUTO := .F.

		MATA010(aDados,nOpc)

		IF LMSERROAUTO
			MOSTRAERRO()
			final("falha")
		ENDIF

		FT_FSKIP()

	ENDDO

	CONOUT("ACABOU")

return