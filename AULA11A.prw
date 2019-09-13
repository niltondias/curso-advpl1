#include 'protheus.ch'
#include 'parmtype.ch'

//
// Ler um arquivo texto ( municipio.CSV )
// Tratar os dados 
// Incluir na tabela de clientes utilizando execauto()
//

user function AULA11A()
	Private bProc := {|| CargaCID() }
	Private cTit  := "Carga de dados"
	Private cMens := "Incluindo clientes"
	processa( {|| CargaCID() }, cTit, cMens )
return

static function CargaCid()
	procregua(0)   // colocar zero para ir de um lado para o outro
return