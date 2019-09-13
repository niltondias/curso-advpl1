#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA02A()

// COM ERP NAO PRECISA DOS 3 COMANDOS ABAIXO	
SET EPOCH TO 1950  // data a partir de 1950
SET DATE BRITISH   // data formato britanico  DD/MM/AAAA
SET CENTURY ON     // ano com 4 digitos AAAA
	
//EXERC01() // processa exercicio 01	
//EXERC02() // processa exercicio 02

//EXERC03()  // processa exercicio 03

EXERC04()
	
return

/*===============================================================================
1. Utilizando as variáveis listadas abaixo, crie uma “função de usuário” que
apresente na tela a frase: “Total de vendas do dia 20/01/2012 foi de 1.786,11”,
para essa apresentação use a função MsgInfo().
nTotVenda  1786.11
dDtVenda  20/01/2012
================================================================================*/

STATIC FUNCTION EXERC01()

Local nTotVenda := 1786.11  //NUMERICO
Local dDtVenda  := CTOD("20/01/2012")   //DATA
Local cMsg := "Total de vendas do dia "+DTOC(dDtVenda)+" foi de "+transform(nTotVenda,"@E 999,999.99")

MsgInfo(cMsg)

RETURN


/*===============================================================================
2. Utilizando as variáveis listadas abaixo, crie uma função de usuário que calcule o
valor do imposto e apresente na tela a frase: “Base de calculo: 5.000,00 Aliquota
18% Valor do imposto: 900,00”.
nBaseCalc  5000
nAliq  18
nImposto  900
================================================================================*/
STATIC FUNCTION EXERC02()

Private nBaseCalc := 5000
Private nAliq     := 18
Private nImposto  := 900
Private cMsg      := "Base de calculo: "+TRANSFORM(nBaseCalc,"@E 999,999.99")+" Aliquota "+;
    TRANSFORM(nAliq,"@E 99")+"% Valor do imposto: "+TRANSFORM(nImposto,"@E 999,999.99")

MsgAlert(cMsg)


RETURN

/*==================================================================================
Exercícios com vetores
==================================================================================*/
STATIC FUNCTION EXERC03()

Local aArray1 := array(5,3)
Local aArray2 := array(10,1)
Local aNomes
Local bAcao1, bAcao2
Local cMens := ''

aArray1[1,1] := 'X'
aArray1[3,2] := 9
aArray1[5,3] := .T.

aArray2[5,1] := 'A'
aArray1[1,3] := aArray2[5,1]


aNomes := {{"Roberto",0},{"Joao",0},{"Ana",0}} // Array com 3 linhas e duas colunas. Coluna 1 - nome, Coluna 2 - codigo aleatório entre 1000 e 9999

bAcao1 := {|X,Y| aNomes[Y,2]:= CVALTOCHAR(RANDOMIZE(1000,9999))}
bAcao2 := {|X,Y| cMens += X[1]+" "+CVALTOCHAR(X[2]) + CRLF }
aEval(aNomes, bAcao1)
aEval(aNomes, bAcao2)

MsgInfo( cMens )

RETURN


STATIC FUNCTION EXERC04()
Local aNotas 				
Local x
Local cMens := ''
Local nMedia

aNotas := {                     ; 
			{'Maria',34,45,29,18,9},;
		    {'JOAQUIM',10,22,35,19,9},;
		    {'Maria',2,9,2,8,5};
	      }
 

FOR x := 1 TO len(aNotas)
	nMedia := aNotas[x,2] + aNotas[x,3] + aNotas[x,4] + aNotas[x,5] + aNotas[x,6]
	nMedia := nMedia / 5 
	cMens += aNotas[x,1] + " " + CVALTOCHAR(nMedia) + " - " 

	IF nMedia > 25
		cMens += "Aprovado"
		
	ELSEIF nMedia >= 10 .AND. nMedia <= 25	
	    cMens += "Recuperação"
	    	
	ELSE
		cMens += "Reprovado"
	ENDIF
	
	cMens += CRLF	
	
NEXT

MsgInfo(cMens)

RETURN



