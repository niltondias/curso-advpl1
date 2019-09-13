#include 'protheus.ch'
#include 'parmtype.ch'
#include 'report.ch'

user function AULA13A()

	Local oReport, oPA1, oPA2, oBreak
	
	Pergunte("PA1001",.F.)
	
	DEFINE REPORT oReport NAME "RCHAMADO1" TITLE "Relatório de Chamados" PARAMETER "PA1001" ACTION {|| PrintReport(oReport, oPA1, oPA2) } 

	DEFINE SECTION oPA1 OF oReport TITLE "Chamado" TABLES "PA1"
	DEFINE CELL NAME "PA1_CODIGO" OF oPA1 ALIAS "PA1"
	DEFINE CELL NAME "A1_NOME"   OF oPA1 ALIAS "SA1"
			
	DEFINE SECTION oPA2 OF oReport TITLE "Itens" TABLES "PA2"
	//DEFINE CELL NAME "PA2_CODIGO" OF oPA2 ALIAS "PA2"
	DEFINE CELL NAME "PA2_SEQ"  OF oPA2 ALIAS "PA2"
	DEFINE CELL NAME "PA2_DATA" OF oPA2 ALIAS "PA2"
	DEFINE CELL NAME "PA2_VLHORA"  OF oPA2 ALIAS "PA2"
	DEFINE CELL NAME "PA2_TOTAL"  OF oPA2 ALIAS "PA2"
	DEFINE CELL NAME "PA2_OBS" OF oPA2 ALIAS "PA2"
	
	DEFINE BREAK oBreak OF oPA2 WHEN oPA1:Cell("PA1_CODIGO") 
	DEFINE FUNCTION FROM oPA2:Cell("PA2_TOTAL") FUNCTION SUM BREAK oBreak
	
oReport:PrintDialog()	
	
return

static function PrintReport( oReport, oPA1, oPA2 )
	
	dbSelectArea("PA1")
	dbSetOrder(1)
	dbGoTop()
	dbSeek(xFilial("PA1")+MV_PAR03,.T.)

	
	Do While PA1->( !EOF() ) .AND. PA1->PA1_CODIGO <= MV_PAR04
		
		if !( PA1->PA1_CLIENT >= MV_PAR01 .AND. PA1->PA1_CLIENT <= MV_PAR02 ) 
			PA1->( dbSkip() )
			loop
		endif
		
		//
		// Posicionando cliente
		dbSelectArea("SA1")
		dbSetOrder(1)
		dbSeek( xFilial("SA1")+PA1->PA1_CLIENT, .T. )
		
		oPA1:Init()   // Iniciando a impressão
		oPA1:PrintLine()  // Imprimindo a linha
		
		
		dbSelectArea("PA2")		
		dbSetOrder(1)
		dbSeek( xFilial("PA2")+PA1->PA1_CODIGO, .T. )
		oPA2:Init()   // Iniciando a impressão
		
		Do While PA2->( !EOF() ) .AND. PA2->PA2_CODIGO == PA1->PA1_CODIGO
			oPA2:PrintLine()  // Imprimindo a linha
			PA2->( dbSkip() )
		Enddo
		
		oPA2:Finish()	
		oPA1:Finish()	
				
		PA1->( dbSkip() )
			
	Enddo
	
	

	
return