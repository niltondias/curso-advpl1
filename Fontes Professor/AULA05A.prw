#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA05A()

	EXERC01()
	EXERC02()
	EXERC03()
	EXERC04()
	EXERC05()
	EXERC06()
	EXERC07()
	EXERC08()

return

/*=====================================================================================
1. Fazer Algoritmo que leia um vetor de 3 linhas e 5 colunas e imprima o seu
conteúdo na tela, utilizando o que foi visto em vetores e estruturas de repetição.
=======================================================================================*/
STATIC FUNCTION EXERC01()

	Local aVetor := {}
	Local cMsg   := ""

	AADD(aVetor,{"UM","DOIS","TRES","QUATRO","CINCO"})
	AADD(aVetor,{"UM","DOIS","TRES","QUATRO","CINCO"})
	AADD(aVetor,{"UM","DOIS","TRES","QUATRO","CINCO"})

	// aVetor := {{"UM","DOIS","TRES","QUATRO","CINCO"},{"UM","DOIS","TRES","QUATRO","CINCO"},{"UM","DOIS","TRES","QUATRO","CINCO"}}
	//                                1                              2                                          3

	For nX := 1 to len(aVetor)
		For nY := 1 to len(aVetor[nX])
			cMsg += strzero(nX,2)+" x "+strzero(nY,2)+" = "+aVetor[nX,nY]+"  "+CRLF // CRLF VARIVEL PUBLICA, CONTEUDO CHR(13)+CHR(10), CARRO RETURN, LINE FEED
		Next
	Next

	Msgalert(cMsg)

RETURN

/*=====================================================================================
2. Com base no Array informado mostrar na tela a media de cada aluno:
Local aArray := { { “Maria”, 10, 7, 15, 31} ,;
{ “Jose ”, 15, 16, 21, 33} , ;
{ “Petruncio”, 8, 8, 8, 6} , ;
{ “Firmino”, 15, 16, 21, 33} , ;
{ “Felizberto”, 10, 17, 31, 25} }
=======================================================================================*/
STATIC FUNCTION EXERC02()

	Local cMsg  := ""
	Local nNota := 0
	Local aArray := { { "Maria", 10, 7, 15, 31} ,;
	{ "Jose ", 15, 16, 21, 33} , ;
	{ "Petruncio", 8, 8, 8, 6} , ;
	{ "Firmino", 15, 16, 21, 33} , ;
	{ "Felizberto", 10, 17, 31, 25} }

	For nX := 1 to len(aArray)
		nNota := 0
		For nY := 2 to len(aArray[nX])
			nNota += aArray[nX,nY]
		Next

		cMsg += "Media de "+aArray[nX,1]+" Media:"+TRANSFORM(nNota/4,"@ 999,99")+CRLF // CRLF VARIVEL PUBLICA, CONTEUDO CHR(13)+CHR(10), CARRO RETURN, LINE FEED

	Next

	Msgalert(cMsg)

RETURN

/*=====================================================================================
3. Com base nesse mesmo array imprimir o nome informando mostrar na tela a
media de cada aluno, conforme regra a seguir:
Nome do aluno seguida da palavra
14 Aprovado se a media for maior que 25
15 Exame se a media for entre 10 e 25
16 Reprovado se a media for menor que 10
=======================================================================================*/
STATIC FUNCTION EXERC03

	LOcal aStatus := {": Aprovado",": Exame",": Reprovado"}
	Local cMsg  := ""
	Local nNota := 0
	Local aArray := { { "Maria", 10, 7, 15, 31} ,;
	{ "Jose ", 15, 16, 21, 33} , ;
	{ "Petruncio", 8, 8, 8, 6} , ;
	{ "Firmino", 15, 16, 21, 33} , ;
	{ "Felizberto", 10, 17, 31, 25} }

	For nX := 1 to len(aArray)
		nNota := 0
		For nY := 2 to len(aArray[nX])
			nNota += aArray[nX,nY]
		Next

		cMsg += "Media de "+aArray[nX,1]+" Media:"+TRANSFORM(nNota/4,"@ 999,99")+iif( nNota/4 > 25, aStatus[1] , iif( nNota/4 < 10 , aStatus[3], aStatus[2] )  )+CRLF // CRLF VARIVEL PUBLICA, CONTEUDO CHR(13)+CHR(10), CARRO RETURN, LINE FEED

	Next

	Msgalert(cMsg)

RETURN

/*=====================================================================================
4. Matheus é um homem de negócios e sempre viaja ao exterior e precisa controlar
tudo que traz de lá. Sempre que ele traz mercadorias que ultrapassam R$
10.000,00, deve ser pago o imposto de 15%. Faça um algoritmo que leia o valor
da mercadoria e grave na variável M o valor da mercadoria e se ultrapassar o
valor, calcular o valor do imposto na variável I, caso não ultrapasse grave 0.

Nota: criad vetor como exemplo pois nao foi instruito tela de digitacao
=======================================================================================*/
STATIC FUNCTION EXERC04

	Local aValores := {10100,9000,20300,5000}
	Local nImp     := 0.15
	Local cMsg     := ""

	For nX := 1 to len(aValores)
		IF aValores[nX] >= 10000
			cMsg += "EX"+STRZERO(nX,2)+" M = $ "+TRANSFORM(aValores[nX],"@E 999,999.99")+" I(15%) = "+TRANSFORM(aValores[nX]*nImp,"@E 999,999.99")+CRLF
		else
			cMsg += "EX"+STRZERO(nX,2)+" M = $ "+TRANSFORM(aValores[nX],"@E 999,999.99")+" I(15%) = "+TRANSFORM(0,"@E 999,999.99")+CRLF
		endif
	Next

	MsgINfo(cMSg)

RETURN

/*=====================================================================================
5. Calcule o Salário de um funcionário recebendo em uma variável o valor hora e
em outra a quantidade de horas. Caso a qtde de horas ultrapasse a meta (180)
acrescentar 2,00 por hora trabalhada e em seguida mostre na tela o salário a
receber.
=======================================================================================*/
STATIC FUNCTION EXERC05

	Local nsal := 0
	LOcal cMsg := ""
	Local nAcres := 2
	Local aPonto := {}
	AADD(aPonto,{20,160})
	AADD(aPonto,{45,182})
	AADD(aPonto,{33,145})
	AADD(aPonto,{60,132})
	AADD(aPonto,{55,192})

	For nS := 1 to len(aPonto)
		if aPonto[nS,2] > 180
			nSal := aPonto[nS,2] * (aPonto[nS,1]+nAcres)
			cMsg += "Colaborasdor "+strzero(nS,2)+" Salário de R$ "+transform(nSal,"@E 999,999.99")+CRLF
		else
			nSal := aPonto[nS,2] * (aPonto[nS,1])
			cMsg += "Colaborasdor "+strzero(nS,2)+" Salário de R$ "+transform(nSal,"@E 999,999.99")+CRLF
		endif
	Next

	alert(cMsg)

RETURN

/*================================================================
6. Desenvolva um fluxograma que:
· Leia 4 (quatro) números;
· Calcule o quadrado de cada um;
· Se o valor resultante do quadrado do terceiro for >= 1000, imprima-o e
finalize;
· Caso contrário, imprima os valores lidos e seus respectivos quadrados.
==================================================================*/
STATIC FUNCTION EXERC06

	Local aD := {10,43,33,87}
	LOcal aQ := {}, cMsg := ""

	For nConta := 1 to len(aD)
		AADD(aQ, aD[nConta] * aD[nConta]  )
	Next

	IF aQ[3] > 1000
		MsgAlert(transform(aQ[3],"@E 999,999.99"))
	else
		For nConta := 1 to len(aD)
			cMsg += "Numero: "+str(aD[nConta])+" Seu Quadrado:"+str(aQ[nConta])+CRLF
		Next

		ALERT(cMsg)

	endif

RETURN

/*===================================================================================
7. Elabore um algoritmo que dada a idade de um nadador classifique-o em uma das
seguintes categorias:
Infantil A = 5 a 7 anos
Infantil B = 8 a 11 anos
Juvenil A = 12 a 13 anos
Juvenil B = 14 a 17 anos
Adultos = Maiores de 18 anos
====================================================================================*/
STATIC FUNCTION EXERC07

Local cMsg   := ""
Local aIdade := {11,5,8,9,12,15,23,8,34, 3}

For nI := 1 to len(aIdade)
    do case
       case  aIdade[nI] >= 5 .AND. aIdade[nI] <= 7
            cMsg += "Nadador "+cValtochar(nI)+" Categoria Infantial A"+CRLF
            
       case  aIdade[nI] >= 8 .AND. aIdade[nI] <= 11
            cMsg += "Nadador "+cValtochar(nI)+" Categoria Infantial B"+CRLF

       case  aIdade[nI] >= 12 .AND. aIdade[nI] <= 13
            cMsg += "Nadador "+cValtochar(nI)+" Categoria Juvenil A"+CRLF

       case  aIdade[nI] >= 14 .AND. aIdade[nI] <= 17
            cMsg += "Nadador "+cValtochar(nI)+" Categoria Juvenil b"+CRLF

       case  aIdade[nI] >= 18
            cMsg += "Nadador "+cValtochar(nI)+" Adultos"+CRLF
    
       OTHERWISE        
            cMsg += "Nadador "+cValtochar(nI)+" **** SEMCATEGORIA *** "+CRLF
            
    endcase



Next



alert(cMSg)


RETURN

/////////////////////////////////////////////////////
STATIC FUNCTION EXERC08

RETURN