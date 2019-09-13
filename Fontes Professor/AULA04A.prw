#include 'protheus.ch'
#include 'parmtype.ch'

// CONTROLE DE FLUXO
user function AULA04A()

	Private nCont := 0
	// CONTROLE FOR, UTILIZADO COM CONTADOR COMO LACO

	For nCont := 1 to 10
		CONOUT(TIME()+" TESTE DE FOR..."+STRZERO(nCont,5))
	Next

	CONOUT("$$$$$$$$$$$$$$$$$$$$$$$$")
	SLEEP(5000)//ELE PARA O PROCESSADOR 5 SEGUNDOS

	For nCont := 0 to 10 step 2
		CONOUT(TIME()+" TESTE DE FOR..."+STRZERO(nCont,5))
	Next

	CONOUT("$$$$$$$$$$$$$$$$$$$$$$$$ ABAIXO MOSTRA LOOP E EXIT")
	CONOUT("$$$$$$$$$$$$$$$$$$$$$$$$ ABAIXO MOSTRA LOOP E EXIT")
	SLEEP(5000)//ELE PARA O PROCESSADOR 5 SEGUNDOS

	For nCont := 10 to 1000 step 5

		if nCont >= 30 .AND. nCont <= 60
			loop // volta ao inicio do laco
		ENDIF

		IF nCont > 600
			exit // sai do laco
		ENDIF

		CONOUT(TIME()+" TESTE DE FOR..."+STRZERO(nCont,5))
	Next

	// executando aula03a
	U_AULA03A()

	For nT := 1 to len(aVet03) // len conta os elementos de um vetor
		CONOUT(" POSICAO: "+STRZERO(nT,2)+" Nome:"+aVet03[nT])
	NExt

	CONOUT("")
	CONOUT("")
	CONOUT("CONTAGEM NEGATIVA")
	CONOUT("")

	For nCont := 1000 to 10 step -4
		CONOUT("TESTE: "+STR(nCont))
	NExt

return

// LACO WHILE
USER FUNCTION AULA04B()

	Private lcontinua := .T.
	Private nCont := 0

	WHILE lContinua // ENQUANTO FOR POSITIVO, CONTINUA O PROCESSAMENTO
		nCont := nCont +1

		sleep(200) // espera 2 segundos

		if nCont >= 30 .AND. nCont <= 60
			loop // volta ao inicio do laco
		ENDIF

		IF nCont > 600
			exit // sai do laco
		ENDIF

		if file("c:\temp\while.txt") // FILE() VERIFICA SE O ARQUIVO EXISTE
			lContinua := .f.
			CONOUT("MUDANDO CONTINUA PARA .F.")
		endif

		conout(time()+" processando..."+strzero(nCont,5))
	ENDDO

RETURN

///////////////////////////////////////////////////////////////////////////
// decidindo
user function aula04c()

    //  DATE() TRAZ A DATA DO SERVIDOR, DOW() DIA DA SEMANA, CVALTOCHAR() TRANSFORMA EM TEXTO, $ CONTIDO
    Local cSemana := IIF( CVALTOCHAR(DOW(DATE())) $ "1/7","Final de semana", "Dia Util"      ) 
	//00:00:00  time()
	//12345678

	// if com um scape(else)
	if substr(time(),7,2) <= "30"   // funcao substr pega pedaco de uma string/caratcer conforme parametros, caratcer, posicao ininial, quantos digitos
		msgalert("Menos de 30 segundos")
	else
		msgalert("Mais que 30 segundos")
	endif

	// 3 ifs cascateados com um scape(else)
	if substr(time(),7,2) == "10"
		msgalert("10 segundos")
	elseif substr(time(),7,2) == "20"
		msgalert("20 segundos")
	elseif substr(time(),7,2) == "30"
		msgalert("30 segundos")
	else
		msgalert("Nao encontrado 10,20,30 segundos")
	endif

	// trabalhando case
	do case
		case substr(time(),7,2) >= '00' .and. substr(time(),7,2) <= '10'
		Msgalert("Entre 00 e 10")
		
		case substr(time(),7,2) >  '10' .and. substr(time(),7,2) <= '20'
		Msgalert("Entre 11 e 20")
		
		case substr(time(),7,2) >  '20' .and. substr(time(),7,2) <= '30'
		Msgalert("Entre 21 e 30")
		
		otherwise
		MsgAlert("Mais que 30")
	endcase

	endif

return