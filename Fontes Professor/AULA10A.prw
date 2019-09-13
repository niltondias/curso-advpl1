#INCLUDE "PROTHEUS.CH" 
#INCLUDE "REPORT.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION AULA10A()

LOCAL oReport    
Private oMEGAT
Private aParambox := {}
Private aRet      := {}

//PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "ESP" USUARIO "ADMIN" PASSWORD "" 

aAdd(aParamBox,{1,"Sorteio de" ,Space(6),"","","","",10,.F.}) // Tipo caractere
aAdd(aParamBox,{1,"Sorteio ate",Space(6),"","","","",10,.F.}) // Tipo caractere
aAdd(aParamBox,{1,"Data  de"  ,Ctod(Space(8)),"","","","",10,.F.}) // Tipo data
aAdd(aParamBox,{1,"Data ate"  ,Ctod(Space(8)),"","","","",10,.F.}) // Tipo data

If !ParamBox(aParamBox,"Teste Parâmetros...",@aRet)
   For i:=1 To Len(aRet)
      MsgInfo(aRet[i],"Opção escolhida")
   Next 
Endif


DEFINE REPORT oReport NAME "MEGAT" TITLE "Clientes"   ACTION {|oReport| PrintReport(oReport, oMEGAT )}
                  
DEFINE SECTION       oMEGAT 		OF oReport TITLE "Megasena" 

DEFINE CELL oCel1 NAME "MES"     OF oMEGAT BLOCK  {|| (XALIAS)->X_MES}     TITLE "Mes"    SIZE 40
DEFINE CELL oCel2 NAME "QTDADE"  OF oMEGAT BLOCK  {|| (XALIAS)->X_QTDADE}  TITLE "Qtdade" PICTURE "@E 999,999,999.99"  SIZE 40
DEFINE CELL oCel3 NAME "VALOR"   OF oMEGAT BLOCK  {|| (XALIAS)->X_VALOR}   TITLE "Valor"  PICTURE "@E 999,999,999.99"  SIZE 40
		
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


