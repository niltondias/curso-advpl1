#include 'protheus.ch'
#include 'parmtype.ch'
#include 'tbiconn.ch'
#include 'report.ch'

//
// Emitir um relatório somando o valor do prêmio da Mega Sena de cada mês
// Utilizar tabela temporária
//
user function pa0rel2()
		
	// o select() verifica qual posicao de pilha de tabelas abertas o alias esta
	// USAMOS ESTE RECURSO PRA SABER SE O AMBIENTE ESTALOGADO *ACESSAD VIA MENU
	// NESTE EXEMPLO, EH COMO SE FOSSEUM JOB LOGANDO NA 99/01
	//if select("SX6") == 0
	//	conout(" **** PREPARE ****")
	//	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FIN"		
	//endif
	
	Private xAlias  := GetNextAlias()   // cria alias randômico
	Private xIndice := "INDICE_1"   // nome do indice alocado
	Private aFields := {}         //vetor com campos da tabela temporária
	
	//--------------------------------------------------
	//Criação do objeto , quando fecha objeto,tabela eh apagada
	// somente a sessao/thread que cria a tabela consegue ver
	//-------------------------------------------------
	oTempTable := FWTemporaryTable():New(xAlias)
	
	// Montando os campos da tabela
	aadd( aFields, {"ANO_MES","C",006,0} )
	aadd( aFields, {"VALOR",  "N",015,2} )
	
	oTempTable:SetFields( aFields )
	oTempTable:AddIndex( xIndice, {"ANO_MES"})
	
	//
	// Criando a tabela
	oTempTable:Create()
	
	dbSelectArea("PA0")
	dbSetOrder(1)
	dbGotop()
	
	do while !EOF()
		// Extraindo o ano e mês do sorteio
		//
		
		nTotal := 0
		cAno_Mes := cAux := STRZERO(year(PA0->PA0_DAT),4)+STRZERO(month(PA0->PA0_DAT),2)
				
		do while cAux == cAno_Mes	
			nTotal += PA0->PA0_VLROK
			dbSkip()
			cAno_Mes := STRZERO(year(PA0->PA0_DAT),4)+STRZERO(month(PA0->PA0_DAT),2)					
			
		enddo 
		
		(xAlias)->( dbgotop() )
		(xAlias)->( RECLOCK(xAlias, .T.) )
		(xAlias)->ANO_MES := cAux
		(xAlias)->VALOR   := nTotal
		(xAlias)->(MSUNLOCK())
		(xAlias)->( dbCommit() )
				
				
	enddo
	
	//
	//Imprimindo o relatório da tabela temporária
	//
	rel002()
		
	MsgInfo("Excluindo tabela temporária")
	oTempTable:Delete()
	


return

static function rel002()
	Local oReport, oPA0
	Local cPerg := "P001"
	
	//Pergunte("P001", .F.) // .F. RESTAGA O MV_PAR?? DAS ULTIMAS PPERGUUNTAS SALVAS
	
	DEFINE REPORT oReport NAME "P002RE" TITLE "Total em premios por mês" ACTION {|oReport| PrintReport(oReport, oPA0 )}
		
	DEFINE SECTION oPA0 OF oReport title "Concurso"
	
	DEFINE CELL oCel1 NAME "MES/ANO" OF oPA0 BLOCK {|| substr((xAlias)->ANO_MES,5,2) + "/" + substr((xAlias)->ANO_MES,1,4) } TITLE "MES/ANO" SIZE 20
	DEFINE CELL oCel2 NAME "PREMIO"  OF oPA0 BLOCK {|| (xAlias)->VALOR }   TITLE "PREMIO PAGO"  PICTURE "@E 999,999,999.99" SIZE 20
	oCel2:SetHeaderAlign("RIGHT") // Alinhando 
	oReport:PrintDialog()
	
return

static function PrintReport( oReport, oPA0)
	dbSelectArea(xAlias)
	dbSetOrder(1)
	dbGoTop()
	oPA0:Init()
	
	Do While !EOF()
		oPA0:PrintLine()  // Imprimindo a linha
		(xAlias)->( dbSkip() )
			
	Enddo
	
	oPA0:Finish()
return 
