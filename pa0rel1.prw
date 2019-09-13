#include 'protheus.ch'
#include 'report.ch'

user function pa0rel1()

	Local oReport, oPA0
	Local cPerg := "P001"
	
	Pergunte("P001", .F.) // .F. RESTAGA O MV_PAR?? DAS ULTIMAS PPERGUUNTAS SALVAS
	
	DEFINE REPORT oReport NAME "P001RE" TITLE "Númedos da Mega Sena" PARAMETER cPerg ;
		ACTION {|oReport| PrintReport(oReport, oPA0 )}
		
	DEFINE SECTION oPA0 OF oReport TITLE "Concurso"
	
	DEFINE CELL oCel1  NAME "CODIGO" OF oPA0 BLOCK {|| PA0->PA0_SORTE} TITLE "CODIGO" SIZE 15
	DEFINE CELL oCel2  NAME "DATA"   OF oPA0 BLOCK {|| PA0->PA0_DAT}   TITLE "DATA"   SIZE 15
	DEFINE CELL oCel3  NAME "N1"     OF oPA0 BLOCK {|| PA0->PA0_N1}    TITLE "N1"     SIZE 7
	DEFINE CELL oCel4  NAME "N2"     OF oPA0 BLOCK {|| PA0->PA0_N2}    TITLE "N2"     SIZE 7
	DEFINE CELL oCel5  NAME "N3"     OF oPA0 BLOCK {|| PA0->PA0_N3}    TITLE "N3"     SIZE 7
	DEFINE CELL oCel6  NAME "N4"     OF oPA0 BLOCK {|| PA0->PA0_N4}    TITLE "N4"     SIZE 7
	DEFINE CELL oCel7  NAME "N5"     OF oPA0 BLOCK {|| PA0->PA0_N5}    TITLE "N5"     SIZE 7
	DEFINE CELL oCel8  NAME "N6"     OF oPA0 BLOCK {|| PA0->PA0_N6}    TITLE "N6"     SIZE 7
	DEFINE CELL oCel9  NAME "N6"     OF oPA0 BLOCK {|| PA0->PA0_VLROK} TITLE "VLR GANHO"  PICTURE "@E 999,999,999.99" SIZE 15
	DEFINE CELL oCel10 NAME "N6"    OF oPA0 BLOCK {|| PA0->PA0_VLRACU} TITLE "VLR ACUM." PICTURE "@E 999,999,999.99" SIZE 15
	
	//Definindo o alinhamento cabeçalho de algumas colunas
	oCel9:SetHeaderAlign("RIGHT")
	oCeL10:SetHeaderAlign("RIGHT")
	
	oReport:PrintDialog()
	
return

static function PrintReport( oReport, oPA0)
	dbSelectArea("PA0")
	dbSetOrder(1)
	dbGoTop()
	dbSeek(xFilial("PA0")+MV_PAR01,.T.)
	oPA0:Init()   // Iniciando a impressão
	
	Do While !EOF() .AND. PA0->PA0_SORTE <= MV_PAR02
		if PA0->PA0_DAT < MV_PAR03 .OR. PA0->PA0_DAT > MV_PAR04
			PA0->( dbSkip() )
			loop
		endif
		
		oPA0:PrintLine()  // Imprimindo a linha
		PA0->( dbSkip() )
			
	Enddo
	
	oPA0:Finish()
	
return 