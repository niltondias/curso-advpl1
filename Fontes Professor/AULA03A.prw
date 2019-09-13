#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA03A()

	EXERC01()//exercicio 1
	EXERC02()//exercicio 2
	EXERC03()//exercicio 3
	EXERC04()//exercicio 4
	EXERC05()//exercicio 5
	EXERC06()//exercicio 6
	EXERC07()//exercicio 7
	EXERC08()//exercicio 8

return

/////////////////////////////////////////////////////////
STATIC FUNCTION EXERC01()

	Private aVet01 := {} // dinamico
	Private aVet02 := {"Eduardo","Rodrigo","Nilton","Alan","Dalton","Jamile"} // segunda forma, fixo
	Public  aVet03 := array(6) // terceira, cria vetor com 6 elementos conconteudo nil, atualiza em seguida

	aVet03[1] := "Eduardo"
	aVet03[2] := "Rodrigo"
	aVet03[3] := "Nilton"
	aVet03[4] := "Alan"
	aVet03[5] := "Dalton"
	aVet03[6] := "Jamile"

	AADD(aVet01,"Eduardo")
	AADD(aVet01,"Rodrigo")
	AADD(aVet01,"Nilton")
	AADD(aVet01,"Jamile")
	AADD(aVet01,"Alan")
	AADD(aVet01,"Dalton")

RETURN

/////////////////////////////////////////////////////////
STATIC FUNCTION EXERC02()

	Private aVet01 := {} // dinamico
	Private nPos   := 0  // variavel acessoria para armazenar posicao do vetor pesquisado

	AADD(aVet01,"Eduardo")
	AADD(aVet01,"Rodrigo")
	AADD(aVet01,"Nilton")
	AADD(aVet01,"Jamile")
	AADD(aVet01,"Alan")
	AADD(aVet01,"Dalton")

	nPos := ascan(aVet01,"Nilton") // pesquisando string no vetor

	if nPos > 0 // se achou, maior que zero
		aVet01[nPos] := aVet01[nPos] + " Nakamatu"
		msgalert(aVet01[nPos])
	else
		mssgalert("Falha na pesquisa")
	endif

RETURN

/////////////////////////////////////////////////////////
static function exerc03()
// deixando public para usar as variaveis de exercicio nas outras funcoes
Public array1a := array(5,3)
Public array1b := {{ nil,nil,nil},{ nil,nil,nil},{ nil,nil,nil},{ nil,nil,nil},{ nil,nil,nil}}

return

/////////////////////////////////////////////////////
Static function exerc04()

Public array2 := array(10,1)

return

//////////////////////////////////////////////////////
static function exerc05()

array1a[1,1] := "X"
// OU
array1a[1][1] := "X"

return

/////////////////////////////////////////////////
STATIC function exerc06()
array1a[3,2] := 9
// OU
array1a[3][2] := 9

return


/////////////////////////////////////////////////
STATIC function exerc07()
array1a[5,3] := .t.
// OU
array1a[5][3] := .t.

return

/////////////////////////////////////////////////
STATIC function exerc08()
array1a[1,3] := array2[5,1]
// OU
array1a[1][3] := array2[5,1]

return






















