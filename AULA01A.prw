#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA01A()

SET EPOCH TO 1950  // data a partir de 1950
SET DATE BRITISH   // data formato britanico
SET CENTURY ON     // ano com 4 digitos


	Private nTotVenda := 1786.11
	Private dDtVenda  := CTOD('01/01/2012')
	Private cNumero  := ""
	
	cNumero := TRANSFORM(nTotVenda, "@E 999,999.99")
	MsgInfo("Total de vendas do dia " + DTOC(dDtVenda) + " foi de " + cNumero )
	
	U_AULA01C()
	
return

static user function AULA01C()
	
	local aAlunos := {"Alan Marx","Douglas Logo","Rodrigo Resende"}
	local aArray1 := {}
	local aArray2 := { {1}, {2}, {3}, {4}, {5}, {6},{7}, {8}, {9}, {10} }
	
	aadd(aArray1, {1,1,1} )
	aadd(aArray1, {2,2,2} )
	aadd(aArray1, {3,3,3} )
	aadd(aArray1, {4,4,4} )
	aadd(aArray1, {5,5,5} )
	
	aArray1[1,1] := "x"
		
	MsgInfo(aAlunos[1] + " | " + aAlunos[2] + " | " + aAlunos[3])
	
return

static Function exec03()
	
Return 