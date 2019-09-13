#Include "Totvs.ch"
#Include "FwMvcDef.ch"

User Function AULA14A()

Private oBrowse 	:= FwMBrowse():New()				//Variavel de Browse 
oBrowse:SetAlias('sb7')
oBrowse:SetDescripton("INVENTARIO") 
oBrowse:Activate()


Return

Static Function MenuDef()
Local aMenu :=	{}
	
	ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
	ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.AULA14A'	OPERATION 2 ACCESS 0
	ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.AULA14A' 	OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.AULA14A' 	OPERATION 4 ACCESS 0
	ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.AULA14A' 	OPERATION 5 ACCESS 0
	ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.AULA14A'	OPERATION 8 ACCESS 0
	ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.AULA14A'	OPERATION 9 ACCESS 0
	
	
Return(aMenu)


Static Function ModelDef()
Local oStruct1	:=	FWFormStruct(1,"SB7",{|cCampo|  AllTrim(cCampo)+"|" $ "B7_DOC.B7_DATA.B7_CONTAGE"})
Local oStruct2	:=	FWFormStruct(1,"SB7",{|cCampo| !AllTrim(cCampo)+"|" $ "B7_DOC.B7_DATA.B7_CONTAGE"})
Local oModel

oModel:= MPFormModel():New("PEAULA14A", /*Pre-Validacao*/,{|| SB7SEEK(oModel),.T.}/*Pos-Validacao*/,/*Commit*/,/*Cancel*/)
oModel:AddFields("MODEL_CAB", Nil/*cOwner*/, oStructCab ,/*Pre-Validacao*/,/*Pos-Validacao*/,/*Carga*/)
oModel:AddGrid("MODEL_ITE", "MODEL_CAB", oStructSB7 , ,/*bLinePost*/,/*bPre*/,/*bPost*/,/*Carga*/)


oModel:GetModel("MODEL_CAB"):SetDescription("INVENTARIO")


oModel:GetModel("MODEL_ITE"):SetUseOldGrid()
oModel:SetPrimaryKey({"B7_DOC","B7_DATA","B7_PRODUTO"})
oModel:SetRelation("MODEL_ITE",{{"B7_FILIAL",'xFilial("SB7")'},{"B7_DOC","B7_DOC"},{"B7_DATA","B7_DATA"}},"B8_FILIAL+B7_DOC+B7_DATA") // ACHO QUE PRECISA DTOS


Return(oModel)


Static Function ViewDef()
Local oStruct1	:=	FWFormStruct(2,'PA1') 	//Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oStruct2	:=	FWFormStruct(2,'PA2',{|X| !ALLTRIM(X)$"PA2_CODIGO"}) 	//Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oModel	:=	FwLoadModel('MVCAULA2')	//Retorna o Objeto do Modelo de Dados 
Local oView		:=	FwFormView():New()      //Instancia do Objeto de Visualização

//Define o Modelo sobre qual a Visualizacao sera utilizada
oView:SetModel(oModel)	

//Vincula o Objeto visual de Cadastro com o modelo 
oView:AddField( 'VIEW_PA1', oStruct1, 'MODEL_PA1')

//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid(  'VIEW_PA2', oStruct2, 'MODEL_PA2')

//Define o Preenchimento da Janela
oView:CreateHorizontalBox( 'ID_HBOX_SUPERIOR', 40 )
oView:CreateHorizontalBox( 'ID_HBOX_INFERIOR', 60 )


// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'VIEW_PA1', 'ID_HBOX_SUPERIOR' )
oView:SetOwnerView( 'VIEW_PA2', 'ID_HBOX_INFERIOR' )


// Define campos que terao Auto Incremento
oView:AddIncrementField( 'VIEW_PA2', 'PA2_SEQ' )




Return(oView)
































































Static Function ModelDef()

Local oStructCab := Nil
Local oStructSB7 := Nil
Local oModel     := Nil
//-----------------------------------------
//Monta a estrutura do formulário com base no dicionário de dados
//-----------------------------------------
oStructCab := 
oStructSB7 := FWFormStruct(1,"SB7",{|cCampo| !AllTrim(cCampo)+"|" $ "B7_DOC.B7_DATA.B7_CONTAGE"})

//-----------------------------------------
//Monta o modelo do formulário
//-----------------------------------------

///////////////////////////////////////////////////////////////////////////////////////////////////
Static Function SB7SEEK(oModel)

dbSelectArea("SB7")
dbSetOrder(4) // 4 B7_FILIAL, B7_DOC, B7_DATA, R_E_C_N_O_, D_E_L_E_T_
DBGOTOP()
_cChave := oModel:GetValue("MODEL_CAB","B7_DOC")+DTOS(oModel:GetValue("MODEL_CAB","B7_DATA"))
MsSeek(xFilial("SB7")+_cChave)

RETURN


////////////////////////////////////////////
Static Function ViewDef()
Local oView
Local oStructCAB
Local oStructSB7
Local oModel     := FWLoadModel("AULA14A")

oStructCab := FWFormStruct(2,"SB7",{|cCampo|  AllTrim(cCampo)+"|" $ "B7_DOC.B7_DATA.B7_CONTAGE"})
oStructSB7 := FWFormStruct(2,"SB7",{|cCampo| !AllTrim(cCampo)+"|" $ "B7_DOC.B7_DATA.B7_CONTAGE"})

oView := FWFormView():New()

oView:AddField( "VIEW_CAB",oStructCab,"MODEL_CAB")   
oView:AddGrid(  "VIEW_ITE",oStructSB7,"MODEL_ITE")

oView:CreateHorizontalBox("CABEC"  ,20)
oView:CreateHorizontalBox("GRID"   ,80)

oView:SetOwnerView( "VIEW_CAB","CABEC")
oView:SetOwnerView( "VIEW_ITE","GRID")


Return oView
  