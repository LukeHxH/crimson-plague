module GameStory.Story (
	getYesNo,
	introducaoCidade,
	ganchoAventura,
	segundaChance
) where

import Util

getYesNo :: IO Char 
getYesNo = do
	putStrLn "O que você irá responder? "
	putStrLn "Sim (digite s)"
	putStrLn "Não (digite n)"
	option <- getLine
	return $ read option

introCity :: IO()
introCity = do
	putStrLn "Uma manhã ensolarada, você se encontra em Passagem de Duvik, uma pequena cidade"
	putStrLn "situada em um dos pequenos vales que cruzam as Montanhas Serpente."
	putStrLn "Ela tem sido por muito tempo um ponto de parada para viajantes e aventureiros"
	putStrLn "procurando descansar membros doloridos e afogar memórias ruins dentro de seus portões."
	putStrLn "E você não é uma exceção. No entanto algo te parece estranho, a cidade parece bem vazia"
	putStrLn "Você não consegue encontrar, os inúmeros animais que existiam ao redor da cidade."

ganchoAventura :: IO()
ganchoAventura = do
	clearScreen
	putStrLn "Você está na praça principal da cidade e, percebe"
	putStrLn "algumas pessoas que te chamam a atenção:"
	putStrLn "Um homem com roupas nobres, não parece ser dessa cidade."
	putStrLn "Um grupo de pessoas com manchas de carvão no rosto e braços."
	putStrLn "Alguns moradores que estão claramente abatidos."
	putStrLn ""
	clearScreen
	putStrLn "Qual deles voce ira se aproximar:"
	putStrLn "1 - O homem aparentemente rico."
	putStrLn "2 - As pessoas sujas de carvao."
	putStrLn "3 - Os moradores da cidade."
	putStrLn "4 - Ninguem."
	putStrLn ""
	option <- getLine
	mudaDirecionamento option

mudaDirecionamento :: Int -> IO()
mudaDirecionamento 1 = escolhaGancho1
mudaDirecionamento 2 = escolhaGancho2
mudaDirecionamento 3 = escolhaGancho3
mudaDirecionamento 4 = escolhaGancho4
mudaDirecionamento n = errorMessage

errorMessage :: IO()
errorMessage = do
	putStrLn "Opção inválida. Tente novamente!"
	clearScreen
	ganchoAventura

answerMessage1 :: Char -> IO()
answerMessage = do
	answer <- getYesNo
	if (answer == "s") 
		then do 
			putStrLn "Meruen: Eu sempre soube que podia contar com você. Eu acredito que você deveria investigar essa mina."
        	putStrLn "Meruen: Muito obrigado, amigo."
	else do
		putStrLn "Meruen: Você é tão vazio quanto sua alma."
        putStrLn "Meruen se afasta lentamente de você."

answerMessage2 :: Char -> IO()
answerMessage = do
	answer <- getYesNo
	if (answer == "s") 
		then do 
			putStrLn "Mal sei o que dizer. Muito obrigado!!"
	else do
		putStrLn "Com um olhar de desaprovação, lentamente começam a se afastar de você."				

escolhaGancho1 :: IO()
escolhaGancho1 = do
	clearScreen
	putStrLn "Ao se aproximar dele, voce escuta:"
	putStrLn "Prefeito: Saudações. Eu sou o prefeito dessa cidade."
	putStrLn "Prefeito: muitos dos moradores da vila estão sofrendo de uma"
	putStrLn "Prefeito: doenca extremamente letal. Não pude deixar de notar"
	putStrLn "Prefeito: que você é um aventureiro, você poderia nos ajudar"
	putStrLn "Prefeito: a acabar com essa doença? Por favor, muitos já"
	putStrLn "Prefeito: morreram com essa praga."
	answerMessage1	

escolhaGancho2 :: IO()
escolhaGancho2 = do
	clearScreen
	putStrLn "Você nao demora muito pra perceber que eles sao mineradores"
	putStrLn "Ao se aproximar, um dos mineradores, com os olhos arregalados grita:"
	putStrLn "Minerador: a caverna e amaldicoada!! Eu consegui fugir, mas muitos nao tiveram a mesma sorte."
	putStrLn "Minerador: voce parece forte. Por favor, acabe com esse mal!"
	answerMessage1

escolhaGancho3 :: IO()
escolhaGancho3 = do
	clearScreen
	putStrLn "Voce encontra diversos moradores atonitos na vila."
	putStrLn "Uma das moradoras se aproxima de voce e diz:"
	putStrLn "Senhora: senhor, me desculpe. Nao pude deixar de notar que o senhor parece um aventureiro"
	putStrLn "Senhora: meus dois filhos ja foram pegaram praga. Eu imploro, por favor acabe com isso."
	putStrLn "O que voce respondera pra ela:"
	putStrLn "1 - Voce poderia falar mais sobre essa praga?"
	putStrLn "2 - Onde eu posso acabar com isso?"
	option <- getLine
	clearScreen
	if (option == 1) 
		then do
			 putStrLn "Senhora: Chamam de praga Carmesim, ela começa de forma inofensiva."
			 putStrLn "Senhora: Porem, aos poucos ela vai ficando pior. Cada vez mais roubando a sua forca."
			 putStrLn "Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca."
			 putStrLn "Senhora: Fazem quatro dias que meus filhos estao doentes..."
			 putStrLn "Ela comeca a chorar. Solucando um pouco, ela diz:"
			 putStrLn "Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la. Por favor, me ajude..."
	else do
		putStrLn "Senhora: Esse problema comecou na mina, tenho certeza que esse mal vem de la."
		putStrLn "Senhora: Ninguem aguentou mais de uma semana apos ficar com essa doenca."
		putStrLn "Senhora: Fazem quatro dias que meus filhos estao doentes..."
		putStrLn "Senhora: Eu nao sei quanto tempo eles ainda podem aguentar... Por favor, acabe com essa praga."
		putStrLn "Apesar de tentar disfaçar, você percebe que ela começa a chorar."
	answerMessage1

escolhaGancho4 :: IO()
escolhaGancho4 = do
	clearScreen
	putStrLn "Isso não é problema seu. Você já tem problemas demais pra resolver."
	putStrLn "Esses camponeses conseguem resolver esse problema sozinho."
	putStrLn "Ao menos você acha isso."

 segundaChance :: IO()
 segundaChance = do
 	clearScreen
 	putStrLn "Uma pessoa se aproxima de você, ela te parece familiar"
 	putStrLn "quando ela fica mais próxima, você percebe que ela é um amigo de longa data, Meruen."
 	putStrLn "Um guerreiro que costumava lutar com você, alguns anos atrás."
 	putStrLn "Ele está bem magro, comparado ao tempo que ele lutava com você."
 	putStrLn "Ele se aproxima e diz: "
 	putStrLn "Meruen: Há quanto tempo, amigo. Há algo de errado em uma mina próxima dessa região"
 	putStrLn "Meruen: Acredito que ela está ligada a algum culto ou algo parecido... Bem, seja lá o motivo"
 	putStrLn "Meruen: é provável que ela esteja causando a praga que está assolando essa vila."
 	putStrLn "O que voce respondera pra ele:"
 	putStrLn "1 - Voce poderia falar mais sobre essa praga?"
 	putStrLn "2 - Voce esta bem?"
 	putStrLn "3 - Ha alguma coisa em que eu possa ajudar?"
 	option <- getLine
 	clearScreen
 	putStrLn "Meruen responde: "
 	if (option == 1)
 		then do
 			putStrLn "Meruen: Estão chamando por aqui de praga Carmesim, ela começa de forma inofensiva"
 			putStrLn "Meruen: mas fica cada vez mais severa, causando a morte do infectado em menos de uma semana."
 			putStrLn "Meruen: Infelizmente eu acabei pegando essa doença... Não acho que tenho muitos dias..."
 			putStrLn "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."
 	else if (option == 2)
 		then do
 			putStrLn "Meruen: Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..."
 			putStrLn "Meruen: Eu te peço, por todos os nossos anos de aventura. Acabe com essa praga, por favor."
 	else do
 		putStrLn "Meruen: Na verdade, tem. Eu acredito que se você for pra essa mina. Deve haver uma forma de terminar"
 		putStrLn "Meruen: Essa praga lá. Infelizmente eu acabei pegando essa praga... Não acho que tenho muitos dias..."
 		putStrLn "Meruen: Então, o que você tem a dizer? Você poderia acabar com essa praga?"
 	answerMessage2

primeiroFinal :: IO()
primeiroFinal = do
	clearScreen
	putStrLn "Conclusao"
	putStrLn "Seja por falta de interesse, ou de empatia, voce nao quis ajudar a vila."
	putStrLn "Duas semanas depois, em outra vila a procura de um artefato."
	putStrLn "Voce descobriu que nao demorou muito para Passagem de Duvik ser tomada pela praga."
	putStrLn "Aqueles que sobreviveram foram os que fugiram"
	putStrLn "de Passagem de Duvik enquanto nao tinham sido contaminados"
	putStrLn "A promissora cidade comerciante, se tornou apenas uma ruina"
	putStrLn "uma promessa do que poderia se tornar."

entradaMina :: IO()
entradaMina = do
	clearScreen
	putStrLn "Entrada da caverna"
	putStrLn "Apos algumas horas de caminhada, voce chega na caverna."
	putStrLn "Uma brisa fria desce dos picos da Montanha Serpente"
	putStrLn "Enrolada enquanto voce contempla a entrada para as"
	putStrLn "cavernas. O chao coberto de neve esta cheio de ferramentas,"
	putStrLn "picaretas e pas, muitas das quais sobressaindo dos montes"
	putStrLn "de neve. Um unico corredor escuro conduz as profundezas"
	putStrLn "da mina a frente. O caminho de terra abaixo, que possui"
	putStrLn "estruturas de suporte de madeira, esta coberto com escombros"
	putStrLn "de pedra, uns pedacos ocasionalmente brilham com o menor"
	putStrLn "pedaco de minerio. Nenhuma luz lanca-se para fora"
	putStrLn "do tunel. Tochas queimadas estão espalhadas pelo chao,"
	putStrLn "seus suportes quebrados nas paredes do tunel. Atras de"
	putStrLn "voce, a estrada gasta conduz atraves dos precipicios para o"
	putStrLn "vale abaixo. Alem do suave assobio do vento, um completo"
	putStrLn "silencio preenche a abertura nas montanhas."
	clearScreen
	putStrLn "Você encontra um kobolds, ele parece hostil"
	putStrLn "E irá atacar você! Prepare-se para o combate!"

	--inicia batalha

