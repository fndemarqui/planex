

#' Resistência de saquinhos de papel
#'
#' @name saquinhos
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com um fator fixo conduzido para avaliar o efeito de 4 diferentes concentrações de madeira de lei sobre a resistência de saquinhos de papel.
#' @format Data frame com 24 linhas e duas variáveis:
#' \itemize{
#'   \item resistencia: resistência dos saquinhos (variável resposta)
#'   \item concentracao: concentração de madeira de lei (variável categórica com quadro níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Consumo de chocolate sobre saúde cardiovascular
#'
#' @name chocolate
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Um experimento foi conduzido para investigar o efeito do consumo de chocolate sobre saúde cardiovascular. O experimento consistiu no uso de três tipos diferentes de chocolates: 100 g de chocolate, 100 g de chocolate amargo com 200 mL de leite integral, e 200 g de chocolate ao leite. Os voluntários participantes do estudo receberam aleatoriamente um dos 3 tipos de chocolates investigados e depois de uma hora do consumo do produto a capacidade antioxidante do plasma sanguíneo foi medida em um ensaio. Analise adequadamente os dados provenientes desse experimento, apresentando as conclusões práticas.
#' @format Data frame com 36 linhas e duas variáveis:
#' \itemize{
#'   \item capacidade: capacidade antioxidante do plasma sanguíneo (variável resposta)
#'   \item tipo: tipo de chocolate consumido (variável categórica com quadro níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Efeito de dietas sobre o teor de proteínas do leite
#'
#' @name dietas
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 13.13: Um experimento foi realizado para analisar o efeito de 3 dietas sobre o teor de proteína de leite de vaca. Os dados foram coletados depois de uma semana e incluem 25 vacas sujeitas à dietada de cevada, 27 vacas sujeitas à outras duas dietas. Analise adequadamente os dados provenientes desse experimento e apresente as conclusões práticas obtidas.
#' @format Data frame com 79 linhas e duas variáveis:
#' \itemize{
#'   \item teor: teor de proteína do leite (variável resposta)
#'   \item dieta: tipo de dieta (variável categórica com três níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL

#' Efeito de diferentes temperaturas sobre a densidade de tijolos
#'
#' @name tijolos
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 13.15: Um experimento foi realizado para determinar se quatro temperaturas específicas de queima afetam a densidade de certo tipo de tijolo. Analise adequadamente os dados provenientes deste experimento, apresentando as conclusões práticas.
#' @format Data frame com 22 linhas e duas variáveis:
#' \itemize{
#'   \item densidade: densidade do tijolo (variável resposta)
#'   \item temperatura: temperatura do forno, em ºF; (variável categórica com quatro níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Homogeneidade da produção de teares
#'
#' @name teares
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com um fator aleatório conduzido para avaliar a homogeneidade da resistência de tecidos produzidos por diferentes teares de uma fábrica.
#' @format Data frame com 16 linhas e duas variáveis:
#' \itemize{
#'   \item resistencia: resistência dos tecidos (variável resposta)
#'   \item tear: variável indicadora dos teares selecionados aleatoriamente da linha de produção (variável categórica com quadro níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Homogeneidade da produção de teares
#'
#' @name moinho
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 13.29: Um moinho têxtil tem um grande número de teares. Supõe-se que cada tear forneça a mesma quantidade de tecidos. Para investigar essa suposição, 5 teares foram escolhidos ao acaso e suas produções foram medidas em diferentes tempos. Pede-se: a) Os teares são similares em relação à produção? Use alpha=0,05. b) Estime a variabilidade entre os teares. c) Estime a variância do erro experimental. d) Analise os resíduos desse experimento e verifique a adequação do modelo.
#' @format Data frame com 25 linhas e duas variáveis:
#' \itemize{
#'   \item producao: produção do tear em 1b/min. (variável resposta)
#'   \item tear: variável indicadora dos teares selecionados aleatoriamente da linha de produção (variável categórica com quadro níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Homogeneidade do brilho da polpa
#'
#' @name brilho
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 13.31: Um experimento foi conduzido para investigar os efeitos no brilho da polpa, de 4 produtos químicos de branqueamento. Esses produtos químicos foram selecionados ao acaso, a partir de uma população grande de agentes potenciais para o branqueamento. Pede-se: a) Existe uma diferença nos tipos de produtos químicos? b) Estime a variabilidade entre os teares. c) Estime a variância do erro experimental. d) Analise os resíduos desse experimento e verifique a adequação do modelo.
#' @format Data frame com 20 linhas e duas variáveis:
#' \itemize{
#'   \item producao: produção do tear em 1b/min. (variável resposta)
#'   \item produto: variável indicadora do produto químico selecionado aleatoriamente da população de agentes para branqueamento (variável categórica com quadro níveis; fator de interesse)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Resistência de tecidos
#'
#' @name tecidos
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento em esquema de blocos completos aleatorizados e um fator fixo conduzido para avaliar o efeito de 4 diferentes produtos químicos sobre a resistência de tecidos.
#' @format Data frame com 20 linhas e 3 variáveis:
#' \itemize{
#'   \item resistencia: resistência do tecido (variável resposta)
#'   \item produto: tipo de produto químico (variável categórica com quadro níveis; fator de interesse)
#'   \item amostra: amostra de tecido utilizada no experimento (bloco; fator de interesse secundário)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Efeitos do tipo de bocal sobre medidas de formas
#'
#' @name bocais
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 13.37: Um experimento foi realizado em que uma medida de forma foi determinda para vários tipos diferentes de bocais, com níveis diferentes de velocidade de jatos de saída. O interesse nesse experimento está principalmente no tipo de bocal, sendo a velocidade um fator de ruído. Analise adequadamente os dados desse experimentos, apresentando as conclusões práticas.
#' @format Data frame com 30 linhas e três variáveis:
#' \itemize{
#'   \item medida: medida da forma (variável resposta)
#'   \item bocal: tipo de bocal (variável categórica com 5 níveis; fator de interesse)
#'   \item velocidade: velocidade do jato de saída, em m/s; (bloco; fator de interesse secundário)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Efeitos do tipo de bocal sobre medidas de formas
#'
#' @name escapamento
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 13.41: Um experimento foi conduzido a fim de se investigar o escapamento de corrente elétrica em um dispositivo SOS MOSFETS. A finalidade do experimento foi investigar como o escapamento de corrente elétrica varia com o comprimento do canal. Quatro comprimentos diferentes do canal foram selecionados. Para cada comprimento do canal, 5 larguras diferentes foram também usadas. A largura deve ser considerada um fator de ruído.  Analise adequadamente os dados desse experiemnto, apresentando as conclusões práticas.
#' @format Data frame com 25 linhas e três variáveis:
#' \itemize{
#'   \item escapamento: escapamento de corrente elétrica (variável resposta)
#'   \item comprimento: comprimento do canal (variável categórica com 4 níveis; fator de interesse)
#'   \item largura: largura do canal (bloco; fator de interesse secundário)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL



#' Tempo de vida de baterias
#'
#' @name baterias
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com dois fatores fixos cruzados conduzido para avaliar o efeito do tipo de material e nível de temperatura sobre o tempo de vida de baterias.
#' @format Data frame com 36 linhas e 3 variáveis:
#' \itemize{
#'   \item tempo: tempo de vida das baterias (em horas; variável resposta)
#'   \item tipo: tipo de material utilizado para a fabricação da bateria (variável categórica com três níveis; fator de interesse principal)
#'   \item temperatura: temperatura (em ºF) na qual a bateria será exposta (variável categórica com três níveis; fator de interesse principal)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL



#' Volume de garrafas de refrigerantes
#'
#' @name refrigerantes
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com 3 fatores fixos cruzados conduzido para avaliar o efeito da carbonatação, da pressão de operação, e a da velocidade da linha de produção sobre o desvio do volume nominal de garrafas de refrigerante.
#' @format Data frame com 24 linhas e 4 variáveis:
#' \itemize{
#'   \item devio: desvio do volume nominal da garrafa (em ml; variável resposta)
#'   \item carbonatacao: percentual de carbonatação (variável categórica com três níveis; fator de interesse principal)
#'   \item pressao:  pressão (em libras)  (variável categórica com 2 níveis; fator de interesse principal)
#'   \item velocidade: velocidade da linha de produção (variável categórica com 2 níveis; fator de interesse principal)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Força de fibras de monofilamento
#'
#' @name fibras
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com um fator fixo e uma covariável conduzido para avaliar se existem diferenças na forças de fibras de monofilamentos produzidas por 3 máquinas.
#' @format Data frame com 15 linhas e 3 variáveis:
#' \itemize{
#'   \item força: força da fibra de monofilamento (variável resposta)
#'   \item maquina: máquina utilizada na produção das fibras de monofilamento (variável categórica com três níveis; fator de interesse principal)
#'   \item diametro:  diâmetro da fibra de monofilamento (covariável; interesse secundário)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Propulsores de foguetes
#'
#' @name propulsores
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description (Exemplo 4.3) Delineamento em esquema quadrado greco-latino conduzido para avaliar 5 diferentes formulações de propulsores de foguetes.
#' @format Data frame com 25 linhas e 5 variáveis:
#' \itemize{
#'   \item lote: lote de materia prima utilizado no preparo das formulações (variável categórica com 5 níveis; bloco 1)
#'   \item operador: operador responsável por preparar as formulações (variável categórica com 5 níveis; bloco 2)
#'   \item montagem:  método de montagem empregado (variável categórica com 5 níveis; bloco 3)
#'   \item formulacao: tipos de formulação sendo comparadas (variável categórica com 5 níveis; fator de interesse principal)
#'   \item queima: taxa de queima
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Tempo de reação de um processo químico
#'
#' @name catalisadores
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com blocos incompletos balanceados conduzido com o objetivo de avaliar o efeito de 4 diferentes tipos de catalisadores sobre o tempo de reação de um processo químico.
#' @format Data frame com 12 linhas e 3 variáveis:
#' \itemize{
#'   \item lote: lote de materia prima utilizada no processo (variável categórica com 4 níveis; bloco)
#'   \item catalisador: catalisador utilizado no processo (variável categórica com 4 níveis; fator de interesse principal)
#'   \item tempo: tempo de reação do processo químico (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL



#' Sistema de medições
#'
#' @name medicoes
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com dois fatores aleatórios conduzido com o objetivo de avaliar potenciais fontes de variabilidade de um sistema de medições.
#' @format Data frame com 12 linhas e 3 variáveis:
#' \itemize{
#'   \item peca: peça que será submetida à medição (fator 1)
#'   \item operador: operador operar o equipamento (fator 2)
#'   \item dimensao: dimensão da peça (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Enxertos vasculares (veias artificiais)
#'
#' @name enxertos
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Um delineamento com blocos completos aleatorizados foi realizado com o objetivo de avaliar o efeito de diferentes níveis de pressão na ocorrência de saliências em enxertos vasculares produzidos com diferentes lotes de materia prima (fonte de variablidade de perturbação). Analise adequadamente os dados provenientes desse experimento, apresentando as conclusões práticas.
#' @format Data frame com 24 linhas e 3 variáveis:
#' \itemize{
#'   \item pressao: pressão de extrusão (em libras; fator de interesse principal)
#'   \item lote: lote de materia prima (bloco - fator de interesse secundário)
#'   \item saliencia: saliência (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL



#' Efeito de ingredientes sobre o tempo de reação de um processo químico
#'
#' @name ingredientes
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description O efeito de cinco ingredientes diferentes (A, B, C, D, E) sobre o tempo de reação de um processo químico está sendo estudado. Cada lote de material novo é grande o suficiente para permitir cinco corridas do experimento. Além disso, cada corrida requer aproximadamente 1.5 horas, de forma que apenas cinco execuções podem ser feitas em um dia. O engenheiro decide executar um experimento quadrado latino para que os efeitos do dia e do lote podem ser sistematicamente controlados. Analise os dados desta experiência (use um nível de significância de 0,05) e tire conclusões.
#' @format Data frame com 20 linhas e 4 variáveis:
#' \itemize{
#'   \item ingrediente: ingrediente utilizado no processo químico (fator de interesse principal; 5 níveis)
#'   \item dia: dia de execução do experimento (bloco1 - fator de interesse secundário)
#'   \item lote: lote de materia prima (bloco2 - fator de interesse secundário)
#'   \item tempo: tempo de reação do processo químico (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Tempo de montagem de um componente de tv
#'
#' @name montagem
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 4.36: Um engenheiro industrial está investigando o efeito de 4 tipos de métodos de montagem sobre o tempo de montagem de um componente de tv. Quatro operadores foram selecionados para o  estudo. Além disso, o engenheiro sabe que que cada processo de montagem gera fadiga (no operador), afetando o tempo de montagem das sucessivas componentes. O engenheiro também suspeita que o local de trabalho dos operadores pode afetar o tempo de montagem. Desta forma, um experimento do tipo quadrado greco-latino foi conduzido, visando controlar as fontes de variação de perturbação. Analise adequadamente os dados desse experimento, apresentando as conclusões práticas.
#' @format Data frame com 16 linhas e 5 variáveis:
#' \itemize{
#'   \item ordem: ordem de montagem (variável categórica com 4 níveis; bloco 1)
#'   \item operador: operador selecionado (variável categórica com 4 níveis; bloco 2)
#'   \item local:  local de trabaho (variável categórica com 4 níveis; bloco 3)
#'   \item metodo: método de montagem (variável categórica com 4 níveis; fator de interesse principal)
#'   \item tempo: tempo de montagem da componente
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Rendimeno de um processo químico
#'
#' @name rendimento
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 4.35: O rendimento de um processo químico foi medido usando-se 5 lotes de matéria prima, 5 concentrações de ácido, 5 tempos de espera, e 5 concentrações de catalisadores, configurando um delineamento do tipo quadrado greco-latino. Analise adequadamente os dados provenientes desse experimento, apresentando as suas conclusões práticas.
#' @format Data frame com 25 linhas e 5 variáveis:
#' \itemize{
#'   \item lote: lote de materia prima utilizado no preparo das formulações (variável categórica com 5 níveis; bloco 1)
#'   \item acido: concentracao de ácido utilizado no processo (variável categórica com 5 níveis; bloco 2)
#'   \item catalisador:  concentração de catalisador utilizado no processo (variável categórica com 5 níveis; bloco 3)
#'   \item tempo: tempo de espera (variável categórica com 5 níveis; fator de interesse principal)
#'   \item rendimento: rendimento do processo químico
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Efeito de aditivos na gasolina sobre a quilometragem
#'
#' @name quilometragem
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 4.40: Um engenheiro está estudando o desempenho da quilometragem característica de cinco tipos de aditivos à gasolina. No teste de estrada ele deseja usar carros como blocos; no entanto, devido a uma restrição de tempo, ele deve usar um delineamento com blocos incompletos. Analise adequadamente os dados desse experimento e apresente as conclusões práticas.
#' @format Data frame com 20 linhas e 3 variáveis:
#' \itemize{
#'   \item aditivo: aditivo utilizado (variável categórica com 5 níveis; fator de interesse principal)
#'   \item carro: carro utilizado para a realização do experimento (variável categórica com 5 níveis; bloco)
#'   \item quilometragem: quilometragem observada (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Efeito da concentração de madeira sobre a força do papel
#'
#' @name papel
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 4.42: Sete concentrações diferentes de madeira estão sendo estudados para determinar seu efeito sobre a força do papel produzido. No entanto, a planta piloto só pode produzir três corridas do experimento por dia. Como os dias podem afetar a força do papel produzido, um delineamento com blocos incompletos aleatorizados foi conduzido. Analise os dados desse experimento e apresente as conclusões práticas.
#' @format Data frame com 21 linhas e 3 variáveis:
#' \itemize{
#'   \item concentracao: concentração de madeira (variável categórica com 7 níveis; fator de interesse principal)
#'   \item dia: dia em que o experimento foi conduzido (variável categórica com 4 níveis; bloco)
#'   \item forca: forca do papel (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Rendimento de um processo químico
#'
#' @name rendimento2k
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exemplo (pág. 234): Um engenheiro químico está interessado em investigar o efeito da concentração de um reagente (fator A) e da quantidade de catalisador (fator B) sobre o rendimento de um processo químico com o objetivo de verificar se ajustes sobre os níveis tais fatores aumentariam o rendimento.
#' @format Data frame com 12 linhas e 3 variáveis:
#' \itemize{
#'   \item reagente: nivel baixo (15%): -1 ; nivel alto (20%): +1
#'   \item catalisador: nivel baixo (1 libra): -1; nivel alto (2 libras): +1
#'   \item rendimento: rendimento do processo químico
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Entendendo efeitos de interação (caso 1)
#'
#' @name interacao1
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exemplo de efeitos de interação em delineamentos com dois fatores fixos cruzados.
#' @format Data frame com 8 linhas e 3 variáveis:
#' \itemize{
#'   \item fator A: variável categórica com 2 níveis
#'   \item fator B: variável categórica com 2 níveis
#'   \item resp: variável resposta
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Entendendo efeitos de interação (caso 2)
#'
#' @name interacao2
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exemplo de efeitos de interação em delineamentos com dois fatores fixos cruzados.
#' @format Data frame com 8 linhas e 3 variáveis:
#' \itemize{
#'   \item fator A: variável categórica com 2 níveis
#'   \item fator B: variável categórica com 2 níveis
#'   \item resp: variável resposta
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Entendendo efeitos de interação (caso 3)
#'
#' @name interacao3
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exemplo de efeitos de interação em delineamentos com dois fatores fixos cruzados.
#' @format Data frame com 8 linhas e 3 variáveis:
#' \itemize{
#'   \item fator A: variável categórica com 2 níveis
#'   \item fator B: variável categórica com 2 níveis
#'   \item resp: variável resposta
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Impureza de um produto químico
#'
#' @name impureza
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exemplo 5.2: A impureza de um produto químico é afetada por dois fatores, a saber: temperatura e pressão. Um exeprimento com dois fatores fixos cruzados foi conduzido para avaliar o efeito desses dois fatores sobre a impureza do produto químico.
#' @format Data frame com 15 linhas e 3 variáveis:
#' \itemize{
#'   \item temperatura: variável categórica com 3 níveis (fator 1)
#'   \item pressão: variável categórica com 5 níveis (fator 2)
#'   \item impureza: impureza do produto químico (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL



#' Taxa de filtragem de um produto químico
#'
#' @name filtragem
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exemplo 6.2: Um produto químico é produzido em um vaso de pressão. Um experimento fatorial é realizado na planta piloto para estudar os fatores que podem vir a influenciar a taxa de filtragem desse produto. Os quatro fatores são temperatura (A), pressão (B), concentração de formaldeído (C) e taxa de agitação (D). Cada fator está presente em dois níveis. O desenho da matriz e os dados de resposta obtidos de uma única réplica. As 16 corridas são feitas em ordem aleatória. O engenheiro de processos está interessado em maximizar a taxa de filtração.
#' @format Data frame com 16 linhas e 5 variáveis:
#' \itemize{
#'   \item temperatura: taxa de agitação (variável categórica com 2 níveis; fator4)
#'   \item pressao: taxa de agitação (variável categórica com 2 níveis; fator4)
#'   \item concentracao: taxa de agitação (variável categórica com 2 níveis; fator4)
#'   \item agitacao: taxa de agitação (variável categórica com 2 níveis; fator4)
#'   \item filtragem: taxa de filtragem (variável resposta)
#'   \item comb_trat: combinação de tratamentos (ausência da letra indica nível baixo; presença, nível alto)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL


#' Zarcao de tintas para aviões
#'
#' @name zarcao
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com um fator fixo conduzido para avaliar o efeito de 4 diferentes concentrações de madeira de lei sobre a resistência de saquinhos de papel.
#' @format Data frame com 18 linhas e três variáveis:
#' \itemize{
#'   \item adesao: adesao da tinta (variável resposta)
#'   \item tipo: tipo de zarcao (variável categórica com 3 níveis; fator 1)
#'   \item metodo: método de aplicação do zarcao (variável categórica com 2 níveis; fator 2)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL



#' Rugosidade da superfície
#'
#' @name rugosidade
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Um engenheiro mecânico está estudando a rugosidade da superfície de uma peça usinada. Três fatores são de interesse: taxa de alimentaçao, profundidade do corte e ângulo da ferramenta. O engenheiro decidiu realizar um experinto 2^3 fatorial com duas réplicas completas do experimento
#' @format Data frame com 16 linhas e 4 variáveis:
#' \itemize{
#'   \item rugosidade: rugosidade (variável resposta)
#'   \item alimentacao: taxa de alimentacao (variável categórica com 2 níveis; fator 1)
#'   \item profundidade: profundade do corte (variável categórica com 2 níveis; fator 2)
#'   \item angulo:  ângulo da ferramenta (variável categórica com 2 níveis; fator 3)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL



#' Sabor de um refrigerante
#'
#' @name refrigerantes2k
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 14.13: Pensa-se que quatro fatores influenciam o sabor de um refrigerante: tipo de adoçante (A), razão entre xarope e água (B), nível de carbonatação (C), e temperataura. Cada fator pode ser corrido em dois níveis, produzindo um delineamento $2^4$ com duas replicações completas. Em cada corrida do experimento amostras de refrigerante são dadas a 20 pessoas para testar. Cara pessoa atribui uma nota de 1 a 10 ao refrigerante provado. A  pontuação total é a variável resposta, e o objetivo é encontrar uma formulação que maximize a pontuação total. Analise adequadamente os dados desse experimento e tire as suas conclusões.
#' @format Data frame com 32 linhas e duas variáveis:
#' \itemize{
#'   \item pontuacao: pontuacao atribuida à amostra de refrigerante (variável resposta)
#'   \item comb_trat: combinação de tratamentos na ordenação de Yates.
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Semicondutores
#'
#' @name semicondutores
#' @docType data
#' @author Fábio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Exercício 14.17:
#' @format Data frame com 32 linhas e duas variáveis:
#' \itemize{
#'   \item rendimento:
#'   \item comb_trat: combinação de tratamentos na ordenação de Yates.
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL
