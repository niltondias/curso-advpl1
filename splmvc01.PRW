#Include "Totvs.ch"
#Include "FwMvcDef.ch"
// EXEMPLO SIMPLES

User Function SPLMVC01()

Private oBrowse 	:= FwMBrowse():New()				//Variavel de Browse 

//Alias do Browse
oBrowse:SetAlias('PA1')
//Descri็ใo da Parte Superior Esquerda do Browse
oBrowse:SetDescripton("Cadastro de Autor/Interpret") 

//Legendas do Browse
oBrowse:AddLegend( "ZA0_TIPO=='C'", "YELLOW", "Autor"  )
oBrowse:AddLegend( "ZA0_TIPO=='I'", "BLUE"  , "Interprete"  )

//Habilita os Bot๕es Ambiente e WalkThru
oBrowse:SetWalkThru(.T.)

//Desabilita os Detalhes da parte inferior do Browse
//oBrowse:DisableDetails()
          	
// Habilita Filtro Padrao
//oBrowse:SetFilterDefault("ZA1_TIPO == 'C'")

	
//Ativa o Browse
oBrowse:Activate()

Return


/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMVCAULA1  บAutor  ณADVPL BIALE - FAB. SOFTWAREบ Data ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao para Menu do Browse                                  บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula MVC                                                   บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function MenuDef()
Local aMenu :=	{}
	
ADD OPTION aMenu TITLE 'Pesquisar'  ACTION 'PesqBrw'       		OPERATION 1 ACCESS 0
ADD OPTION aMenu TITLE 'Visualizar' ACTION 'VIEWDEF.SPLMVC01'	OPERATION 2 ACCESS 0 // viewdef.nomedoarquivofisicoonde esta o viewdef
ADD OPTION aMenu TITLE 'Incluir'    ACTION 'VIEWDEF.SPLMVC01' 	OPERATION 3 ACCESS 0
ADD OPTION aMenu TITLE 'Alterar'    ACTION 'VIEWDEF.SPLMVC01' 	OPERATION 4 ACCESS 0
ADD OPTION aMenu TITLE 'Excluir'    ACTION 'VIEWDEF.SPLMVC01' 	OPERATION 5 ACCESS 0
ADD OPTION aMenu TITLE 'Imprimir'   ACTION 'VIEWDEF.SPLMVC01'	OPERATION 8 ACCESS 0
ADD OPTION aMenu TITLE 'Copiar'     ACTION 'VIEWDEF.SPLMVC01'	OPERATION 9 ACCESS 0
	
Return(aMenu)



/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณMVCAULA1  บAutor  ณADVPL BIALE - FAB. SOFTWAREบ Data ณ  05/27/12   บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณFuncao de Modelo de Dados.                                  บฑฑ
ฑฑบ          ณOnde ้ definido a estrutura de dados                        บฑฑ
ฑฑบ          ณRegra	 de Negocio.                                           บฑฑ
ฑฑฬออออออออออุออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออนฑฑ
ฑฑบUso       ณ Aula de MVC                                                บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿
*/

Static Function ModelDef()
//Retorna a Estrutura do Alias passado como Parametro (1=Model,2=View)
Local oStruct	:=	FWFormStruct(1,"ZA0",{|X|ALLTRM(X)$"CAMPO1.CAMPO2.CAMPO3"})// para cada campo do dicionario ele chama o bloco, que tem que retornar .t. 
Local oModel

//Instancia do Objeto de Modelo de Dados
oModel	:=	FwFormModel():New('PEMVC01',/*Pre-Validacao*/,/*Pos-Validacao*/;
                                       ,/*Commit*/,/*Cancel*/)// PEMVC, PONTOO DE ENTRADA UNIVERSAO MVC, CADA UM COLOCA UM NOME, SERA UMA USER FUNCTION

//Adiciona um modelo de Formulario de Cadastro Similar เ Enchoice ou Msmget
oModel:AddFields('ID_TAB1_ENC_MODEL', /*cOwner*/, oStruct, /*bPreValidacao*/;
                       , /*bPosValidacao*/, /*bCarga*/ )

oModel:SetPrimaryKey({"ZA0_FILIAL","ZA0_CODIGO"}) // NAO PRECISA CASO UTILIZE X2_UNIQ, EH A CHAVE UNICA DO MODELO                     

//Adiciona Descricao do Modelo de Dados
oModel:SetDescription( 'Modelo de Dados do Cadastro de Autor/Interprete' )

//Adiciona Descricao do Componente do Modelo de Dados      
cTexto := 'Formulario de  Cadastro dos Dados de Autores/Interpretes'
oModel:GetModel( 'ID_TAB1_ENC_MODEL' ):SetDescription( cTexto )


Return(oModel)


Static Function ViewDef()
Local oStruct	:=	FWFormStruct(2,"ZA0") 	//Retorna a Estrutura do Alias passado
                                            // como Parametro (1=Model,2=View)
Local oModel	:=	FwLoadModel('SPLMVC01')	//Retorna o Objeto do Modelo de Dados, NOME DO FONTE ONDE ESTA O MODEL 
Local oView		:=	FwFormView():New()      //Instancia do Objeto de Visualiza็ใo

//Define o Modelo sobre qual a Visualizacao sera utilizada
oView:SetModel(oModel)	

//Vincula o Objeto visual de Cadastro com o modelo 
oView:AddField( 'ID_TAB1_ENC_VIEW', oStruct, 'ID_TAB1_ENC_MODEL')

//Define o Preenchimento da Janela
oView:CreateHorizontalBox( 'JANELA'  , 100 )
oView:SetOwnerView( 'ID_TAB_ENC_MODEL', 'JANELA' )

Return(oView)                       




