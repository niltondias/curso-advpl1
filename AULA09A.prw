#include 'Totvs.ch'
#include 'FwMvcDef.ch'

user function AULA09A()
	Private oBrowse := FwMBrowse:New()  //Variavel do Browse
	
	//Alias do Browse
	oBrowse:SetAlias("PA0")
	
	//Descrição do Browse
	oBrowse:SetDescription("Sorteios Megasena")
	
	//Legendas do Browse
	oBrowse:AddLegend("PA0->PA_VLROK > 0","GREEN","Ganhou")
	oBrowse:AddLegend("PA0->PA_VLRACU > 0","RED","Acumulou")
	
	//Abilita os botoes de ambiente e walkthru
	oBrowse:SetWalkThru(.T.)
	
	//Ativando o Browse
	oBrowse:Activate()
		
return

static MenuDef()
	Local aMenu :={}
	
	ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw' 		 OPERATION 1 ACCESS 0
	ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.AULA09A' OPERATION 2 ACCESS 0
	ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.AULA09A' OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.AULA09A' OPERATION 4 ACCESS 0
	ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.AULA09A' OPERATION 5 ACCESS 0
	ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.AULA09A' OPERATION 8 ACCESS 0
	ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.AULA09A' OPERATION 9 ACCESS 0

return (aMenu)

"PA0->PA0_DAT.PA0->PA0_N1.PA0->PA0_N2.PA0->PA0_N3.PA0->PA0_N4.PA0->PA0_N5.PA0->PA0_N6.PA0->PA0_VLROK.PA0->PA0_VLRACU"


static function ModelDef()
	Local oStruct := FWFormStruct(1,"PA0", {|x| alltrim(x) $ "PA0->PA0_DAT.PA0->PA0_N1.PA0->PA0_N2.PA0->PA0_N3.PA0->PA0_N4.PA0->PA0_N5.PA0->PA0_N6.PA0->PA0_VLROK.PA0->PA0_VLRACU" })
	
	
return ()