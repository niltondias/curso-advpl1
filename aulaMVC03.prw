#Include "Totvs.ch"
#Include "FwMvcDef.ch"


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MVCAULA2  �Autor  �fab. software� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Programa exemplo da utiliza��o das classes de MVC           ���
���          �Estrutura Pai e Filho                                       ���
�������������������������������������������������������������������������͹��
���Uso       � Aula de MVC                                                ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function AULAMVC03() // ALTERADO MVCAULA2()

Private oBrowse 	:= FwMBrowse():New()				//Variavel de Browse 

//Alias do Browse
oBrowse:SetAlias('PA1')

//Descri��o da Parte Superior Esquerda do Browse
oBrowse:SetDescripton("Chamados") 

//Habilita os Bot�es Ambiente e WalkThru
oBrowse:SetAmbiente(.T.)
oBrowse:SetWalkThru(.T.)

//Desabilita os Detalhes da parte inferior do Browse
//oBrowse:DisableDetails()


//Ativa o Browse
oBrowse:Activate()


Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MVCAULA2  �Autor  �fab. software� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao para Menu do Browse                                  ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Aula MVC                                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function MenuDef()
Local aMenu :=	{}
	
	ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
	ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.AULAMVC03'	OPERATION 2 ACCESS 0
	ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.AULAMVC03' 	OPERATION 3 ACCESS 0
	ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.AULAMVC03' 	OPERATION 4 ACCESS 0
	ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.AULAMVC03' 	OPERATION 5 ACCESS 0
	ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.AULAMVC03'	OPERATION 8 ACCESS 0
	ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.AULAMVC03'	OPERATION 9 ACCESS 0
	
	
Return(aMenu)



/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MVCAULA2  �Autor  �fab. software� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Modelo de Dados.                                  ���
���          �Onde � definido a estrutura de dados                        ���
���          �Regra de Negocio.                                           ���
�������������������������������������������������������������������������͹��
���Uso       � Aula de MVC                                                ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ModelDef()
Local oStruct1	:=	FWFormStruct(1,'PA1', /*bAvalCampo*/, /*lViewUsado*/ ) //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oStruct2	:=	FWFormStruct(1,'PA2', /*bAvalCampo*/, /*lViewUsado*/ ) //Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oModel

//Instancia do Objeto de Modelo de Dados
oModel	:=	MpFormModel():New('MDAULAMVC03',/*Pre-Validacao*/,/*Pos-Validacao*/,/*Commit*/,/*Cancel*/)

//Adiciona um modelo de Formulario de Cadastro Similar � Enchoice ou Msmget
oModel:AddFields('ID_MODEL_FLD_AULAMVC03', /*cOwner*/, oStruct1, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
                       
oModel:SetPrimaryKey({"P1_CODIGO"})                       
                       
                       
                       
//Adiciona um Modelo de Grid somilar � MsNewGetDados, BrGetDb
oModel:AddGrid( 'ID_MODEL_GRD_AULAMVC03', 'ID_MODEL_FLD_AULAMVC03', oStruct2, /*bLinePre*/,;
 /*bLinePost*/, /*bPreVal*/, /*bPosVal*/, /*BLoad*/ )


// Faz relaciomaneto entre os compomentes do model
oModel:SetRelation( 'ID_MODEL_GRD_AULAMVC03', { { 'PA2_FILIAL', 'xFilial( "PA2" )' };
                     , { 'PA2_CODIGO', 'PA1_CODIGO' } }, 'PA2_FILIAL + PA2_CODIGO' )

//Liga o controle de n�o repeti��o de Linha
oModel:GetModel( 'ID_MODEL_GRD_AULAMVC03' ):SetUniqueLine( { 'PA2_SEQ' } )

// Indica que � opcional ter dados informados na Grid
//oModel:GetModel( 'ID_FLD_MVCAULA2' ):SetOptional(.T.)

//Adiciona Descricao do Modelo de Dados
oModel:SetDescription( 'Modelo de dados de Chamados' )

//Adiciona Descricao dos Componentes do Modelo de Dados
oModel:GetModel( 'ID_MODEL_FLD_AULAMVC03' ):SetDescription( 'Formulario do cabe�alho dos chamados' )
oModel:GetModel( 'ID_MODEL_GRD_AULAMVC03' ):SetDescription( 'Grid  das linhas do chamado' )
Return(oModel)


/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MVCAULA2  �Autor  �fab. software� Data �  05/27/12   ���
�������������������������������������������������������������������������͹��
���Desc.     �Funcao de Visualizacao.                                     ���
���          �Onde � definido a visualizacao da Regra de Negocio.         ���
�������������������������������������������������������������������������͹��
���Uso       � Aula de MVC                                                ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

Static Function ViewDef()
Local oStruct1	:=	FWFormStruct(2,'PA1') 	//Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oStruct2	:=	FWFormStruct(2,'PA2',{|X| !ALLTRIM(X)$"PA2_CODIGO"}) 	//Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oModel	:=	FwLoadModel('AULAMVC03')	//Retorna o Objeto do Modelo de Dados 
Local oView		:=	FwFormView():New()      //Instancia do Objeto de Visualiza��o

//Define o Modelo sobre qual a Visualizacao sera utilizada
oView:SetModel(oModel)	

//Vincula o Objeto visual de Cadastro com o modelo 
oView:AddField( 'ID_VIEW_FLD_AULAMVC03', oStruct1, 'ID_MODEL_FLD_AULAMVC03')

//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
oView:AddGrid(  'ID_VIEW_GRD_AULAMVC03', oStruct2, 'ID_MODEL_GRD_AULAMVC03')

//Define o Preenchimento da Janela
oView:CreateHorizontalBox( 'ID_HBOX_SUPERIOR', 15 )
oView:CreateHorizontalBox( 'ID_HBOX_INFERIOR', 85 )


// Relaciona o ID da View com o "box" para exibicao
oView:SetOwnerView( 'ID_VIEW_FLD_AULAMVC03', 'ID_HBOX_SUPERIOR' )
oView:SetOwnerView( 'ID_VIEW_GRD_AULAMVC03', 'ID_HBOX_INFERIOR' )


// Define campos que terao Auto Incremento
oView:AddIncrementField( 'ID_VIEW_GRD_AULAMVC03', 'PA2_SEQ' )



Return(oView)


