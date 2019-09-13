#Include "Totvs.ch"
#Include "FwMvcDef.ch"

/*
=============================================================================
MVC - TESTE DE CONCEITO
=============================================================================
*/
User Function TESTE09A()

Private oBrowse 	:= FwMBrowse():New()	
oBrowse:SetAlias('PA0')
oBrowse:SetDescripton("TESTE") 
oBrowse:Activate()

Return

/*
==============================================================================
MNUDEF
==============================================================================
*/

Static Function MenuDef()
Local aMenu :=	{}
	
ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.TESTE09A'	OPERATION 2 ACCESS 0 
ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.TESTE09A' 	OPERATION 3 ACCESS 0
ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.TESTE09A' 	OPERATION 4 ACCESS 0
ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.TESTE09A' 	OPERATION 5 ACCESS 0
ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.TESTE09A'	OPERATION 8 ACCESS 0
ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.TESTE09A'	OPERATION 9 ACCESS 0
	
Return(aMenu)

/*
==========================================================================================
MODELDEF
==========================================================================================
*/
Static Function ModelDef()

Local oStruct	:=	FWFormStruct(1,"PA0") 
Local oModel

oModel	:=	MpFormModel():New('PETESTE01',/*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Cancel*/)
oModel:AddFields('MODEL_PA0', /*cOwner*/, oStruct, /*bPreValidacao*/ , /*bPosValidacao*/, /*bCarga*/ )
oModel:SetPrimaryKey({"PA0_SORTE"})                      
oModel:SetDescription( 'Modelo de Dados' )
cTexto := 'Formulario de  Cadastro'
oModel:GetModel( 'MODEL_PA0' ):SetDescription( cTexto )

Return(oModel)

/*
==========================================================================================
VIEWDEF
==========================================================================================
*/

Static Function ViewDef()
Local oStruct	:=	FWFormStruct(2,"PA0")
Local oModel	:=	FwLoadModel('TESTE09A')	 
Local oView		:=	FwFormView():New()      

oView:SetModel(oModel)	
oView:AddField( 'VIEW_PA0', oStruct, 'MODEL_PA0')
oView:CreateHorizontalBox( 'JANELA'  , 100 )
oView:SetOwnerView( 'VIEW_PA0', 'JANELA' )

Return(oView)                       




