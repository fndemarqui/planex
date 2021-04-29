
<!-- README.md is generated from README.Rmd. Please edit that file -->

# planex

<!-- badges: start -->
<!-- badges: end -->

The goal of planex is to …

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fndemarqui/planex")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(planex)
#> Loading required package: ggplot2
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
library(planex)
data(saquinhos)
mod <- aov(resistencia ~ concentracao, data = saquinhos)
summary(mod)
#>              Df Sum Sq Mean Sq F value   Pr(>F)    
#> concentracao  1  364.0   364.0   53.76 2.43e-07 ***
#> Residuals    22  148.9     6.8                     
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
