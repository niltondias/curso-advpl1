#include 'protheus.ch'
#include 'parmtype.ch'

user function lertxt()

	Local nCont := 0
	Local cArq := 'C:\temp\d_mega.csv'
	Local nFile := FT_FUse(cArq)
	Local cLinha, cMens := ""
	Local aDados := {}, aResult := {}
	Local bAcao := {|x,y| cMens += "Campo: " + "'" + x + "'" + "  " }
	
	if nFile < 0
		MsgFile("Falha ao abrir o arquivo  " + cArq)
	endif
	
	FT_FGOTOP()
	
	Do While !FT_FEOF() .OR. nCont++ <= 15
		cLinha := FT_FReadLn()
		if FT_FRECNO() == 1
			FT_FSKIP()
			loop
		endif	
		
		aDados := StrTokArr2( cLinha, ';', .T. )
		cMens := ""
		
		cConcurso := strzero(val(aDados[1]),5)
		dDtSort   := CTOD(aDados[2])
		aadd( aResult, {cConcurso, dDTSort} )
		
		FT_FSKIP()
	enddo
	
	FT_FUSE()
	
	For x := 1 to Len(aResult)
		conout('Concurso: ' + aResult[x,1] + "|" + 'Data Sorteio: ' + DTOC(aResult[x,2]))
		
	Next
	
return