#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA01A()

Private cTitulo   := "TITULO JANELA"
Private cMensagem := "Msg da Janela"
Private aBotoes   := {"OPCAOA","OPCAOB","OPCAOC"} 
Private nTamanho  := 1 // tamanho da janela, p,m,g --> 1,2,3
Private cTexto    := "Texto que aparece na janela!"
Private nRet      := 0

// EXEMPLO FUNCAO AVISO
nRet := AVISO(cTitulo, cMensagem, aBotoes, nTamanho, cTexto )

Msgalert(nRet)
	
return