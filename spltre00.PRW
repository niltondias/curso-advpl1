#INCLUDE "PROTHEUS. 
#INCLUDE "REPORT.CH"
                       	
USER FUNCTION SPLTRE00()
LOCAL oReport    
Private oSA1
Private cPerg := "SPLTRE00"

PERGUNTE(CPERG,.F.)// .F. RESTAGA O MV_PAR?? DAS ULTIMAS PPERGUUNTAS SALVAS

DEFINE REPORT oReport NAME "SPLTRE00" TITLE "Clientes" PARAMETER cPerg;
    ACTION {|oReport| PrintReport(oReport, oSA1 )}
                  
DEFINE SECTION       oSA1 		OF oReport TITLE "Clientes" 

DEFINE CELL oCel1 NAME "Cod"   OF oSA1 BLOCK  {|| SA1->A1_COD}   TITLE "Cod"    SIZE 20
DEFINE CELL oCel2 NAME "Loja"  OF oSA1 BLOCK  {|| SA1->A1_LOJA}  TITLE "Loja"   SIZE 20
DEFINE CELL oCel3 NAME "Razao" OF oSA1 BLOCK  {|| SA1->A1_NOME} TITLE "Razao"  SIZE 20
DEFINE CELL oCel3 NAME "Razao" OF oSA1 BLOCK  {|| SA1->A1_NOME} TITLE "Razao"  SIZE 20
DEFINE CELL oCel3 NAME "Razao" OF oSA1 BLOCK  {|| DTOC(SA1->A1_NOME) } TITLE "Razao"  SIZE 20
DEFINE CELL oCel3 NAME "Razao" OF oSA1 BLOCK  {|| VALOR } TITLE "Razao" PICTURE "@E 999.999,99"  SIZE 20
		
oReport:PrintDialog()

RETURN
/////////////////////////////////////////////////////////////qq
STATIC FUNCTION PrintReport(oReport, oSA1  )    


dbselectarea("SA1")	
dbsetorder(1)
dbgotop()
dbseek(xfilial("SA1")+MV_PAR01)
oSA1:Init()               // iniciando impressao
WHILE !EOF() .AND. SA1->A1_COD <= MV_PAR02
     
    IF PA1->PA1_ACU <> MV_PAR03 
       PA1->(DBSKIP())
       LOOP
    ENDIF   
    
	oSA1:Printline()       // imprimindo linha   
    
    SA1->(DBSKIP())
 ENDDO   

oSA1:Finish()    // finaliza     
     		 
RETURN








