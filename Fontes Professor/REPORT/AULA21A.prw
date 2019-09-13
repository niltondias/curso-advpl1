#include 'protheus.ch'
#include 'TBICONN.ch' // INCLUDEPRA ATIVAR AMBIENTE SEM LOGIN

user function AULA21A()

IF SELECT("SA1") == 0  // VERIFICA SE ESTA COM AMBIENTE ATIVADO
     CONOUT("**************************************")
     CONOUT("**************************************")
     CONOUT("*******INICIANDO    ******************")
     PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"  
     CONOUT("**************************************")
     CONOUT("**************************************")
ENDIF

Private cXAlias := GetNextAlias()  //DEFININDO APELIDO PARA TABELA 
Private oTable  := FWTemporaryTable():New( cXAlias )  // OBJETO TABELA
Private aStrut  := {}  // VETOR COM ESTRUTURA

// DEFININDO ESTRUTURA

AADD(aStrut,{"PRODUTO"   ,"C",15,00})
AADD(aStrut,{"QTDADE"    ,"N",15,02})
AADD(aStrut,{"CONTAGEM" ,"N",15,02})
AADD(aStrut,{"TOTAL"     ,"N",15,02})
oTable:SetFields( aStrut ) // INFORMA ESTRUTURA AO OBJETO
oTable:AddIndex("INDICE1", {"PRODUTO"} ) // INDICE
oTable:Create()

// CARGA NA TABELA TEMPORARIA
DBSELECTAREA("SD2")
DBGOTOP()
WHILE SD2->(!EOF())
    CONOUT("***  SD2:"+STRZERO( SD2->(RECNO()) , 6)   )
     
     dbselectarea(cXAlias)
     dbgotop()
     if dbseek(SD2->D2_COD)
         CONOUT("***  ATUALIZANDO :"+SD2->D2_COD)
         RECLOCK(cXAlias,.F.) //ALTERACAO
     ELSE
         CONOUT("***  CRIANDO :"+SD2->D2_COD)
         RECLOCK(cXAlias,.T.)  // CRIANDO
         (cXAlias)->PRODUTO  := SD2->D2_COD
     ENDIF 
     
     (cXAlias)->QTDADE   += SD2->D2_QUANT
     (cXAlias)->CONTAGEM += 1 
     (cXAlias)->TOTAL    += SD2->D2_TOTAL
      
     MSUNLOCK()
     COMMIT
     
	SD2->(DBSKIP())
ENDDO	

CONOUT("******************************")
CONOUT("***COMO FICOU? ********")
CONOUT("******************************")

DbSelectArea(cXAlias)
dbgotop()
WHILE !EOF()
    
    conout( (cXAlias)->PRODUTO+"  VALOR TOTAL "+TRANSFORM((cXAlias)->TOTAL,"@E 999,999,999.99") )

   DBSKIP()
ENDDO





















	
return