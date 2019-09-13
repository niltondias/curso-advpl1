#include 'protheus.ch'
#include 'parmtype.ch'

user function AULA06A()

//------ acesso e alteracao de parametros sistema
Private _lHelp      := .F. // MOSTRA MSG DE ERRO
Private _dDTDefault := dDatabase // data pádrao, caso nao localize
Private _cFilSX6    := "" // FILIAL PADRAO DE PESQUISA, SE BRANCO, USA FILIAL CORRENTE
Private _cMV_ULMES  := SUPERGETMV("MV_ULMES",_lHelp,_dDTDefault,_cFilSX6) // TRAZ O PARAMETRO DO SX6 MV_ULMES

CONOUT("PARAMETRO SX6=MV_ULMES: "+DTOC(_cMV_ULMES))

PUTMV("MV_ULMES",DATE())

CONOUT("PARAMETRO SX6=MV_ULMES: "+DTOC(SUPERGETMV("MV_ULMES",_lHelp,_dDTDefault,_cFilSX6)))


	
return