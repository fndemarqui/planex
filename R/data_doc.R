#' Resistência de saquinhos de papel
#'
#' @name saquinhos
#' @docType data
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
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


#' Homogeneidade da produção de teares
#'
#' @name teares
#' @docType data
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
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


#' Resistência de tecidos
#'
#' @name tecidos
#' @docType data
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento em esquema de blocos completos aleatorizados e um fator fixo conduzido para avaliar o efeito de 4 diferentes produtos químicos sobre a resistência de tecidos.
#' @format Data frame com 20 linhas e duas variáveis:
#' \itemize{
#'   \item resistencia: resistência do tecido (variável resposta)
#'   \item produto: tipo de produto químico (variável categórica com quadro níveis; fator de interesse)
#'   \item amostra: amostra de tecido utilizada no experimento (bloco; fator de interesse secundário)
#' }
#' @references  Montgomery, D. C., Runger, G. C. (2015) Estatística Aplicada e Probabilidade para Engenheiros, 5ª. Edição, Rio de Janeiro: LTC.
#'
NULL


#' Tempo de vida de baterias
#'
#' @name baterias
#' @docType data
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
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
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
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
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
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
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento em esquema quadrado greco-latino conduzido para avaliar 5 diferentes formulações de propulsores de foguetes.
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
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com blocos incompletos balanceados conduzido com o objetivo de avaliar o efeito de 4 diferentes tipos de catalisadores sobre o tempo de reação de um processo químico.
#' @format Data frame com 12 linhas e 3 variáveis:
#' \itemize{
#'   \item lote: lote de materia prima utilizada no processo (variável categórica com 4 níveis; bloco)
#'   \item operador: operador responsável por preparar as formulações (variável categórica com 4 níveis; fator de interesse principal)
#'   \item tempo: tempo de reação do processo químico (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL



#' Sistema de medições
#'
#' @name medicoes
#' @docType data
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
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
#' @author Fabio N. Demarqui \email{fndemarqui@est.ufmg.br}
#' @keywords datasets
#' @description Delineamento com blocos completos aleatorizados realizado com o objetivo de avaliar o efeito de diferentes níveis de pressão na ocorrência de saliências em enxertos vasculares produzidos com diferentes lotes de materia prima.
#' @format Data frame com 12 linhas e 3 variáveis:
#' \itemize{
#'   \item pressao: pressão de extrusão (em libras; fator de interesse principal)
#'   \item lote: lote de materia prima (bloco - fator de interesse secundário)
#'   \item saliencia: saliência (variável resposta)
#' }
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#'
NULL
