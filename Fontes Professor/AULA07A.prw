#Include "Totvs.ch"
#Include "FwMvcDef.ch"

// TELA DE BROWSE PADRAO MVC
// USANDO CLASSE MVC

user function AULA07A()

Private ccadastro := "Megasena"

Private oBrowse := FwMBrowse():New()				//Variavel E OBJETO de Browse 
oBrowse:SetAlias('PA0')   // AMARRANDO A TABELA AO OBJETO
oBrowse:SetDescripton("Mega Sena")  // titulo
oBrowse:AddLegend( "PA0_VLROK > 0  ", "GREEN", " Ganho Megasena"  )
oBrowse:AddLegend( "PA0_VLRACU > 0 ", "RED"  , " Acumulado "      )
oBrowse:Activate()

Return


//=============================================================================================
/* OPERACOES DO MENU
1-PESQUISA
2-VISULIZAR
3-INCLUIR
4-MANUTENCAO
5-EXCLUSAO


*/	
Static Function MenuDef()
Local aMenu :=	{}
	
ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0 
ADD OPTION aMenu TITLE 'Visualizar' ACTION 'axvisual'       	OPERATION 2 ACCESS 0
	
Return(aMenu)

