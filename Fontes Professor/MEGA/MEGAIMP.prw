#include 'protheus.ch'
#include 'parmtype.ch'
/*
CRIAR TABELA PA0SORTEIO MEGASENA
PA0_SORTE CARACTER 6 CODIGO SORTEIO
PA0_DAT   DATA       DATA SORTEIO
PA0_N1    CARACTER 2 NUMERO 1
PA0_N2    CARACTER 2 NUMERO 2
PA0_N3    CARACTER 2 NUMERO 3
PA0_N4    CARACTER 2 NUMERO 4
PA0_N5    CARACTER 2 NUMERO 5
PA0_N6    CARACTER 2 NUMERO 6
PA0_VLROK  NUMERICO 15,2 VLR GANHO
PA0_VLRACU NUMERICO 15,2 VLR ACUMULADO

INDICE PA0_FILIAL+PA0_SORTE

*/


user function MEGAIMP()

Private cMascara := "arq csv|*.csv| Todos | *.* "
Private cTitulo  := "Selecionar"
Private nMascpadrao := 1
Private cDirinicial := ""
Private lSalvar := .t.
Private nOpcoes :=  GETF_LOCALHARD + GETF_NETWORKDRIVE 
Private cPathFile  := cGetFile(cMascara,cTitulo, nMascpadrao,cDirinicial,lSalvar,nOpcoes ) 

CONOUT("Arq Selecionado:"+cPathFile)

IF FT_FUSE(cPathFile) < 0   // SE RETORNO DEFT_FUSE < 0, NAO CONSEGUIU ABRIR ARQUIVO
	MsgAlert("Erro abertura:"+cPathFile)
	return
ENDIF	


FT_FGOTOP() // INDO PRA PRIMEIRA LINHA DO ARQUIVO

WHILE !FT_FEOF()
     
     IF FT_FRECNO() == 1
         FT_FSKIP()
         LOOP
     ENDIF
         
     cLinha := FT_FREADLN()
     alinha := strtokarr2(cLinha,";",.t.)
     
     // tratar data  "21/09/1976"
     //        data := CTOD(data)

     // tratar  valor := "1.111.111,11" ( UM MILHAO, CENTO E ONZE MIL, CENTRO E ONZE E ONZE DECIMOS
     //   tirar os pontos   valor := strtran(valor,".","") // trocando ponto por "nada"
     //   trocar virgula por ponto valor := strtran(valor,",",".") // trocando ponto por virgula
     //   mudar para numerico   valor := val(valor) //mudando para numerico
     
     // gerar numeros com zero a esquerda, 6 digitos total
     // numero := "123"
     // numero := strzero(  val(  numero  ) ,  6  ) // "000123"
     
     // segunda forma
     // numero := right("000000"+numero,6)  // "000123"    
     
     cSorteio := strzero(val(alinha[1]),6)  // "1" "000001" 
     dData    := CTOD(alinha[2])
     cN1      := strzero(val(alinha[3]),2) 
     cN2      := strzero(val(alinha[4]),2)
     cN3      := strzero(val(alinha[5]),2) 
     cN4      := strzero(val(alinha[6]),2)
     cN5      := strzero(val(alinha[7]),2)
     cN6      := strzero(val(alinha[8]),2) // "3" "03"
     nV1      := val(strtran( strtran( alinha[13] ,".","") , ",","." ))
     nV2      := val(strtran( strtran( alinha[19] ,".","") , ",","." ))
     
     dbselectarea("PA0")
     dbsetorder(1)
     dbgotop()
     if dbseek(xfilial("PA0")+cSorteio,.T.)
        RECLOCK("PA0", .F. )
     ELSE
        RECLOCK("PA0", .T. )
     ENDIF      
     
     PA0->PA0_FILIAL := XFILIAL("PA0")
     PA0->PA0_SORTE  := cSorteio
     PA0->PA0_DATA   := dData
     PA0->PA0_N1    := cN1
     PA0->PA0_N2    := cN2
     PA0->PA0_N3    := cN3
     PA0->PA0_N4    := cN4 
     PA0->PA0_N5    := cN5
     PA0->PA0_N6    := cN6
     PA0->PA0_VLROK := nV1
     PA0->PA0_VLRACU := nV1
     MSUNLOCK()
     COMMIT
         
     CONOUT(cLinha)
     
     FT_FSKIP()
ENDDO

FT_FUSE() // SEM PATH+NOME DE ARQUIVO ELE FECHA
	
return























USER FUNCTION TESTE()

Private bProc := {|| TESTE2() }
Private cTit  := "TESTE"
Private cMsg  := "TESTEMSG"

PROCESSA(bProc,cTit,cMsg)

return

static function teste2()

PROCREGUA(0) // COLOCA ZERO PRA REGRA IR DE UM LADO PRA OUTRO

For nX := 1 to 100
  sleep(1000)
  incproc("")
next  


return












