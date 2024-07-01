
<!-- README.md is generated from README.Rmd. Please edit that file -->

# planex

<!-- badges: start -->
<!-- badges: end -->

Funções e bancos de dados para a disciplina de Planejamento de
Experimentos.

## Installation

Você pode instalar a versão de desenvolvimento do pacote planex a partir
do [GitHub](https://github.com/) da seguinte forma:

``` r
# install.packages("devtools")
devtools::install_github("fndemarqui/planex")
```

## Exemplo

``` r
library(planex)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: ggplot2
```

``` r
data(saquinhos)
saquinhos$concentracao <- as.factor(saquinhos$concentracao)
mod <- aov(resistencia ~ concentracao, data = saquinhos)
plotResiduals(mod)
```

<img src="man/figures/README-saquinhos-1.png" width="100%" /><img src="man/figures/README-saquinhos-2.png" width="100%" /><img src="man/figures/README-saquinhos-3.png" width="100%" /><img src="man/figures/README-saquinhos-4.png" width="100%" /><img src="man/figures/README-saquinhos-5.png" width="100%" />

``` r
testResiduals(mod)
#> 
#>  Shapiro-Wilk normality test
#> 
#> data:  resid
#> W = 0.96624, p-value = 0.5757
#> 
#> ------------------------------------------ 
#> Bartlett test of Homogeneity of Variances: 
#>              Bartlett's K-squared df   p.value
#> concentracao             1.135246  3 0.7685731
#> 
#> ----------------------------------------------- 
#> Durbin-Watson Test for Autocorrelated Errors: 
#>  lag Autocorrelation D-W Statistic p-value
#>    1      -0.1303884      2.181178   0.886
#>  Alternative hypothesis: rho != 0
```

``` r
summary(mod)
#>              Df Sum Sq Mean Sq F value   Pr(>F)    
#> concentracao  3  382.8  127.60   19.61 3.59e-06 ***
#> Residuals    20  130.2    6.51                     
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Realizando as comparações múltiplas:

``` r
library(agricolae)
library(multcomp)
#> Loading required package: mvtnorm
#> Loading required package: survival
#> Loading required package: TH.data
#> Loading required package: MASS
#> 
#> Attaching package: 'MASS'
#> The following object is masked from 'package:dplyr':
#> 
#>     select
#> 
#> Attaching package: 'TH.data'
#> The following object is masked from 'package:MASS':
#> 
#>     geyser
```

``` r
library(emmeans)
#> Welcome to emmeans.
#> Caution: You lose important information if you filter this package's results.
#> See '? untidy'
```

``` r

comp1 <- HSD.test(mod, "concentracao", group = FALSE)
comp2 <- glht(mod, linfct = mcp(concentracao = "Tukey"))
comp3 <- emmeans(mod, pairwise ~ concentracao, adjust = "tukey")

comp1$comparison
#>         difference pvalue signif.       LCL         UCL
#> 10 - 15  -1.333333 0.8022         -5.455896  2.78922925
#> 10 - 20  -5.500000 0.0066      ** -9.622563 -1.37743741
#> 10 - 5    5.666667 0.0051      **  1.544104  9.78922925
#> 15 - 20  -4.166667 0.0470       * -8.289229 -0.04410408
#> 15 - 5    7.000000 0.0007     ***  2.877437 11.12256259
#> 20 - 5   11.166667 0.0000     ***  7.044104 15.28922925
```

``` r
summary(comp2)
#> 
#>   Simultaneous Tests for General Linear Hypotheses
#> 
#> Multiple Comparisons of Means: Tukey Contrasts
#> 
#> 
#> Fit: aov(formula = resistencia ~ concentracao, data = saquinhos)
#> 
#> Linear Hypotheses:
#>              Estimate Std. Error t value Pr(>|t|)    
#> 10 - 5 == 0     5.667      1.473   3.847  0.00537 ** 
#> 15 - 5 == 0     7.000      1.473   4.753  < 0.001 ***
#> 20 - 5 == 0    11.167      1.473   7.581  < 0.001 ***
#> 15 - 10 == 0    1.333      1.473   0.905  0.80224    
#> 20 - 10 == 0    5.500      1.473   3.734  0.00669 ** 
#> 20 - 15 == 0    4.167      1.473   2.829  0.04673 *  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> (Adjusted p values reported -- single-step method)
```

``` r
comp3$contrasts
#>  contrast                        estimate   SE df t.ratio p.value
#>  concentracao5 - concentracao10     -5.67 1.47 20  -3.847  0.0051
#>  concentracao5 - concentracao15     -7.00 1.47 20  -4.753  0.0007
#>  concentracao5 - concentracao20    -11.17 1.47 20  -7.581  <.0001
#>  concentracao10 - concentracao15    -1.33 1.47 20  -0.905  0.8022
#>  concentracao10 - concentracao20    -5.50 1.47 20  -3.734  0.0066
#>  concentracao15 - concentracao20    -4.17 1.47 20  -2.829  0.0470
#> 
#> P value adjustment: tukey method for comparing a family of 4 estimates
```
