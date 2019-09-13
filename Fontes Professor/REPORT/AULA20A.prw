#include 'protheus.ch'
#include "report.ch"
/*=============================================================================================================
RELATORIO
==============================================================================================================*/
user function AULA20A()

Private cPerg := "AULA20A"
Private oReport, oSF2, oSD2, oSA1, oSE1

IF !PERGUNTE(cPerg,.T.,"Parametros pra PRT")
   MSgAlert("Processo Cancelado!")
   return
ENDIF
   
DEFINE REPORT oReport NAME "AULA20A" TITLE "Relatorio de Vendas"  ACTION {|| PrintReport(oReport)}

	DEFINE SECTION oSF2 OF oReport TITLE "Notas" TABLES "SF2"
		DEFINE CELL NAME "F2_EMISSAO" OF oSF2 ALIAS "SF2"
		DEFINE CELL NAME "F2_DOC"     OF oSF2 ALIAS "SF2"
		DEFINE CELL NAME "F2_SERIE"   OF oSF2 ALIAS "SF2"
		DEFINE CELL NAME "F2_CLIENTE" OF oSF2 ALIAS "SF2"
		DEFINE CELL NAME "F2_LOJA"    OF oSF2 ALIAS "SF2"
	    DEFINE CELL NAME "F2_VALBRUT"  OF oSF2 PICTURE "@E 999,999.99" ALIAS "SF2"
	
	DEFINE SECTION oSD2 OF oSF2  TITLE "Itens Notas" TABLES "SD2"
		DEFINE CELL NAME "D2_ITEM"  OF oSD2 ALIAS "SD2"
		DEFINE CELL NAME "D2_COD"   OF oSD2 ALIAS "SD2"
		DEFINE CELL NAME "B1_DESC"   OF oSD2 BLOCK {|| SB1->B1_DESC}  ALIAS "SD2" SIZE 40
		
		DEFINE CELL NAME "D2_UM"    OF oSD2 ALIAS "SD2"
		DEFINE CELL NAME "D2_QUANT"  OF oSD2 ALIAS "SD2" PICTURE "@ E 999.999,99" 
		DEFINE CELL NAME "D2_PRCVEN" OF oSD2 ALIAS "SD2" PICTURE "@ E 999.999,99" 
		DEFINE CELL NAME "D2_TOTAL"  OF oSD2 ALIAS "SD2" PICTURE "@ E 999.999,99" 
	
	DEFINE SECTION oFIN OF oSF2  TITLE "Financeiro" TABLES "SE1"
		DEFINE CELL NAME "E1_PREFIXO"  OF oFIN ALIAS "SE1"
		DEFINE CELL NAME "E1_NUM"  OF oFIN ALIAS "SE1"
		DEFINE CELL NAME "E1_PARCELA"  OF oFIN ALIAS "SE1"
		DEFINE CELL NAME "E1_TIPO"  OF oFIN ALIAS "SE1"
		DEFINE CELL NAME "E1_VENCREA"  OF oFIN ALIAS "SE1"
		DEFINE CELL NAME "E1_SALDO" OF oFIN ALIAS "SE1" PICTURE "@ E 999.999,99" 

	DEFINE SECTION oSA1 OF oSF2  TITLE "Cliente" TABLES "SA1"
		DEFINE CELL NAME "A1_COD"  OF oSA1 ALIAS "SA1"
		DEFINE CELL NAME "A1_LOJA"  OF oSA1 ALIAS "SA1"
		DEFINE CELL NAME "A1_NOME"  OF oSA1 ALIAS "SA1"
		DEFINE CELL NAME "A1_NREDUZ"  OF oSA1 ALIAS "SA1"
		

oReport:PrintDialog()
	
return


/*=============================================================================================================
IMPRESSSAO
CLIENTE DE/AYE  MV_PAR01/02
EMISSAO DE/ATE  MV_PAR03/04
FIN    MV_PAR05
CONTA  MV_PAR06
==============================================================================================================*/
Static Function PrintReport(oReport)

dbselectarea("SF2")	
dbsetorder(16)
dbgotop()
dbseek(xfilial("SF2")+DTOS(MV_PAR03),.T.)


WHILE SF2->(!EOF()) .AND. SF2->F2_FILIAL == XFILIAL("SF2") .AND. DTOS(SF2->F2_EMISSAO) <= DTOS(MV_PAR04)
    oSF2:Init()               // iniciando impressao
    oSF2:Printline()       // imprimindo linha   
    IF MV_PAR06 == 2
         dbselectarea("SA1")
         DBSETORDER(1)
         DBGOTOP()
         DBSEEK(XFILIAL("SA1")+SF2->F2_CLIENTE+SF2->F2_LOJA,.T.)
         oSA1:INIT()
         OSA1:PRINTLINE()
         OSA1:FINISH()
         
    
    ENDIF
    
    dbselectarea("SD2")
    dbsetorder(3)
    dbgotop()
    dbseek(XFILIAL("SD2")+SF2->F2_DOC+SF2->F2_SERIE,.T.)
    oSD2:Init()               // iniciando impressao
    
    while SD2->(!EOF()) .AND. SD2->D2_FILIAL == XFILIAL("SD2") .AND. SD2->(D2_DOC+D2_SERIE) == SF2->(F2_DOC+F2_SERIE)
         DBSELECTAREA("SB1")
         DBSETORDER(1)
         DBGOTOP()
         DBSEEK(XFILIAL("SB1")+SD2->D2_COD)
    
 	     oSD2:Printline()       // imprimindo linha   
    
         SD2->(DBSKIP())
    ENDDO
    oSD2:FINISH()
    
    IF MV_PAR05 == 2 // PRECISA  TESTAR POIS NAO TEM TITUOLO NA BASE
           dbselectarea("SE1")
           dbsetorder(1)
           dbgotop()
           IF dbseek(xfilial("SE1")+SF2->F2_PREFIXO+SF2->F2_DOC,.T.)
                oFIN:init()
                WHILE SE1->(!EOF()) .AND. SE1->E1_FILIAL == XFILIAL("SE1") .AND. SE1->(E1_PREFIXO+E1_NUM) == SF2->(F2_PREFIXO+F2_NUM)
                   OFIN:PRINTLINE()
                   SE1->(DBSKIP())
                ENDDO
                oFIn:FINISH()
           ENDIF
    
    ENDIF
    
    
    
    SF2->(DBSKIP())
 ENDDO   

oSF2:Finish()    // finaliza     












RETURN