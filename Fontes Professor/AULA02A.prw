#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA02A()

// COM ERP NAO PRECISA DOS 3 COMANDOS ABAIXO	
SET EPOCH TO 1950  // data a partir de 1950
SET DATE BRITISH   // data formato britanico  DD/MM/AAAA
SET CENTURY ON     // ano com 4 digitos AAAA
	
EXERC01() // processa exercicio 01	
EXERC02() // processa exercicio 02	
	
return

/*===============================================================================
1. Utilizando as variáveis listadas abaixo, crie uma “função de usuário” que
apresente na tela a frase: “Total de vendas do dia 20/01/2012 foi de 1.786,11”,
para essa apresentação use a função MsgInfo().
nTotVenda  1786.11
dDtVenda  20/01/2012
================================================================================*/

STATIC FUNCTION EXERC01()

Local nTotVenda AS NUMERIC
Local dDtVenda  AS DATE
Local cMsg      AS CHARACTER

nTotVenda := 1786.11  //NUMERICO
dDtVenda  := CTOD("20/01/2012")   //DATA
cMsg := "Total de vendas do dia "+DTOC(dDtVenda)+" foi de "+transform(nTotVenda,"@E 999,999.99")

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

Private nBaseCalc AS NUMERIC
Private nAliq     AS NUMERIC
Private nImposto  AS NUMERIC
Private cMsg      AS CHARACTER

nBaseCalc := 5000
nAliq     := 18
nImposto  := 900
cMsg      := "Base de calculo: "+TRANSFORM(nBaseCalc,"@E 999,999.99")+" Aliquota "+;
    TRANSFORM(nAliq,"@E 99")+"% Valor do imposto: "+TRANSFORM(nImposto,"@E 999,999.99")

MsgAlert(cMsg)


RETURN




