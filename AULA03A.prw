#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA03A()
	//exec01()
	exec02()

return 

static function exec01()
	Local aVet01 := {}
	Local x
	Local nTaxa := 0.15
	Local nValPago := 0
	
	aadd(aVet01,{"Fone de ouvido",200})
	aadd(aVet01,{"Camiseta"      ,100})
	aadd(aVet01,{"Calça"         ,150})
	aadd(aVet01,{"Mouse"         ,50})
	aadd(aVet01,{"Laptop"        ,11000})
	
	for x := 1 to len(aVet01)
		nValPago := aVet01[x,2]
		if aVet01[x,2] > 10000
			nValPago := aVet01[x,2] * (1 + nTaxa )
		endif 
		MsgInfo("Produto: " + aVet01[x,1] + "    Valor pago: " + alltrim(str(nValPago)))
	next 
	
return

static function exec02()
	Local aVet01 := {}
	Local x 
	
	aadd(aVet01,{"Maria",20,110})
	aadd(aVet01,{"Paulo",10,170})
	aadd(aVet01,{"Lucia",30,190})
	aadd(aVet01,{"Marcos",50,200})
	
	for x := 1 to len(aVet01)
		if aVet01[x,3] > 180
			msgInfo("Hora extra para o(a) funcionario(a) " + aVet01[x,1] + "Salario pago: " + alltrim(str((aVet01[x,2]+2)*aVet01[x,3])))
		endif
	next
return