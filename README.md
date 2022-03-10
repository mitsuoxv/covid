WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2022-03-11

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

## Summary

<https://mitsuoxv.shinyapps.io/covid/>

Coronavirus is affecting the world economy. Uncertaintiy is very high. I
searched around and found some informative sites, like [Coronavirus
Situation
Dashboard](https://who.maps.arcgis.com/apps/opsdashboard/index.html#/c88e37cfc43b4ed3baf977d77e4a0667)
and [Coronavirus Update by
worldometer](https://www.worldometers.info/coronavirus/). But they fail
to offer time-series data of the newly confirmed cases by each area, in
which I am most interested. If the average number of infections one
infected person inflict is even slightly more than one, infections grow
exponentially. If less than one, the newly confirmed cases begin to
decrease, and the virus will be contained eventually in that area.

Note that the confirmed cases are not the actual cases, due to delays
from infection to symptoms, limited testing capacity, and so on, as
[Nate Silver tells
us](https://fivethirtyeight.com/features/coronavirus-case-counts-are-meaningless/).

I later found [Johns Hopkins University, Coronavirus Resource
Center](https://coronavirus.jhu.edu/) and [Financial Times, Coronavirus
tracked](https://www.ft.com/content/a26fbf7e-48f8-11ea-aeb3-955839e06441)
are very informative, and that they provide some time-series charts of
the newly confirmed cases.

I added the United States page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on May 25, 2020. I use data
from [USAFacts
page](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).

## Read data from WHO

WHO offers [Data Table in its Dashboard](https://covid19.who.int/table).
I use the data from
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

I also use the data, like area name and population, from
<https://countrycode.org/>.

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/). One exception
is “West Europe”, which I make by combining “Western”, “Northern” and
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          106713. 78647682            737
    ##  2 India                   59201. 42980067            726
    ##  3 Brazil                  40080. 29138362            727
    ##  4 France                  30500. 22539786            739
    ##  5 United Kingdom          26287. 19373888            737
    ##  6 Russia                  23810. 17191300            722
    ##  7 Germany                 22304. 16504822            740
    ##  8 Turkey                  20025. 14457990            722
    ##  9 Italy                   17640. 13159342            746
    ## 10 Spain                   15151. 11181510            738
    ## 11 Argentina               12421.  8955458            721
    ## 12 Iran                     9552.  7107167            744
    ## 13 Netherlands              9430.  6912110            733
    ## 14 Colombia                 8412.  6073416            722
    ## 15 Indonesia                8055.  5847900            726
    ## 16 Poland                   7973.  5788363            726
    ## 17 Mexico                   7659.  5575608            728
    ## 18 Japan                    7415.  5546271            748
    ## 19 South Korea              7396.  5539650            749
    ## 20 Vietnam                  7022.  5042036            718

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       726.             530401.            731
    ##  2 Israel                        690.             502324.            728
    ##  3 Netherlands                   567.             415266.            733
    ##  4 Switzerland                   536.             395068.            737
    ##  5 Austria                       500.             365678.            731
    ##  6 Czech Republic                480.             349572.            728
    ##  7 Belgium                       473.             348002.            736
    ##  8 France                        471.             348006.            739
    ##  9 Portugal                      434.             315424.            727
    ## 10 United Kingdom                422.             310736.            737
    ## 11 Slovakia                      393.             283503.            722
    ## 12 Serbia                        365.             263152.            721
    ## 13 Norway                        362.             266271.            736
    ## 14 Jordan                        360.             258257.            718
    ## 15 Sweden                        352.             257742.            733
    ## 16 United States                 344.             253512.            737
    ## 17 Spain                         326.             240432.            738
    ## 18 Greece                        320.             232864.            728
    ## 19 Argentina                     300.             216613.            721
    ## 20 Italy                         292.             218085.            746

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2138    11781
    ##  2 Sudan                 7.89       4865    61643
    ##  3 Peru                  5.99     211252  3528939
    ##  4 Mexico                5.74     320166  5575608
    ##  5 Syria                 5.63       3105    55193
    ##  6 Somalia               5.15       1359    26400
    ##  7 Egypt                 4.91      24257   493658
    ##  8 Afghanistan           4.35       7636   175525
    ##  9 Ecuador               4.19      35316   843760
    ## 10 Niger                 3.50        307     8774
    ## 11 Bulgaria              3.25      35995  1107888
    ## 12 Myanmar               3.22      19398   602321
    ## 13 Malawi                3.07       2620    85461
    ## 14 Paraguay              2.87      18494   644609
    ## 15 Tunisia               2.75      28009  1018447
    ## 16 Haiti                 2.72        827    30432
    ## 17 South Africa          2.70      99656  3688423
    ## 18 El Salvador           2.62       4093   156364
    ## 19 Chad                  2.62        190     7260
    ## 20 Honduras              2.61      10812   414714

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7064.     211252   29.9 
    ##  2 Bulgaria               5035.      35995    7.15
    ##  3 Hungary                4468.      44603    9.98
    ##  4 Czech Republic         3729.      39068   10.5 
    ##  5 Slovakia               3449.      18817    5.46
    ##  6 Brazil                 3246.     652829  201.  
    ##  7 United States          3078.     954913  310.  
    ##  8 Argentina              3071.     126955   41.3 
    ##  9 Poland                 2940.     113186   38.5 
    ## 10 Romania                2922.      64156   22.0 
    ## 11 Belgium                2918.      30354   10.4 
    ## 12 Colombia               2912.     139154   47.8 
    ## 13 Paraguay               2901.      18494    6.38
    ## 14 Mexico                 2847.     320166  112.  
    ## 15 Tunisia                2645.      28009   10.6 
    ## 16 United Kingdom         2606.     162482   62.3 
    ## 17 Italy                  2591.     156357   60.3 
    ## 18 Chile                  2585.      43283   16.7 
    ## 19 Russia                 2551.     358911  141.  
    ## 20 Greece                 2397.      26366   11

EOL
