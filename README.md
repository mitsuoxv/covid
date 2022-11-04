WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-11-05

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
    ##  1 United States           98774. 96206427            974
    ##  2 India                   46278. 44658365            965
    ##  3 France                  36649. 35843004            978
    ##  4 Germany                 36515. 35784912            980
    ##  5 Brazil                  36140. 34839337            964
    ##  6 South Korea             26073. 25760701            988
    ##  7 United Kingdom          24518. 23930041            976
    ##  8 Italy                   23889. 23531023            985
    ##  9 Japan                   22797. 22500313            987
    ## 10 Russia                  22324. 21453667            961
    ## 11 Turkey                  17606. 16919638            961
    ## 12 Spain                   13830. 13511768            977
    ## 13 Vietnam                 12022. 11504910            957
    ## 14 Australia               10707. 10364859            968
    ## 15 Argentina               10050.  9718875            967
    ## 16 China                    8889.  9075899           1021
    ## 17 Netherlands              8763.  8517666            972
    ## 18 Iran                     7688.  7557920            983
    ## 19 Mexico                   7355.  7112504            967
    ## 20 Indonesia                6749.  6512913            965

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       685.             664599.            970
    ##  2 Israel                        658.             637361.            968
    ##  3 Denmark                       627.             608477.            970
    ##  4 Switzerland                   572.             558664.            976
    ##  5 France                        566.             553403.            978
    ##  6 South Korea                   538.             531997.            988
    ##  7 Portugal                      536.             516932.            965
    ##  8 Netherlands                   526.             511725.            972
    ##  9 Australia                     498.             481733.            968
    ## 10 Greece                        488.             471717.            967
    ## 11 Belgium                       455.             443845.            975
    ## 12 Germany                       446.             437456.            980
    ## 13 Czech Republic                411.             397186.            967
    ## 14 Italy                         396.             389972.            985
    ## 15 United Kingdom                393.             383811.            976
    ## 16 Slovakia                      354.             339743.            961
    ## 17 Serbia                        341.             327690.            960
    ## 18 United States                 318.             310110.            974
    ## 19 Norway                        300.             292511.            974
    ## 20 Spain                         297.             290538.            977

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11944
    ##  2 Sudan                 7.83       4972    63509
    ##  3 Syria                 5.51       3163    57364
    ##  4 Peru                  5.22     217025  4158534
    ##  5 Somalia               5.00       1361    27237
    ##  6 Egypt                 4.81      24798   515406
    ##  7 Mexico                4.65     330410  7112504
    ##  8 Afghanistan           3.85       7823   203311
    ##  9 Ecuador               3.56      35920  1008035
    ## 10 Niger                 3.33        314     9429
    ## 11 Myanmar               3.08      19484   632014
    ## 12 Malawi                3.05       2683    88099
    ## 13 Bulgaria              2.96      37903  1280584
    ## 14 Paraguay              2.73      19601   717955
    ## 15 Tunisia               2.55      29259  1146593
    ## 16 Chad                  2.54        194     7627
    ## 17 Haiti                 2.54        860    33828
    ## 18 Algeria               2.54       6881   270840
    ## 19 South Africa          2.54     102311  4029027
    ## 20 Sri Lanka             2.50      16782   671302

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7257.     217025   29.9 
    ##  2 Bulgaria               5302.      37903    7.15
    ##  3 Hungary                4802.      47938    9.98
    ##  4 Czech Republic         3974.      41635   10.5 
    ##  5 Slovakia               3781.      20624    5.46
    ##  6 Chile                  3686.      61725   16.7 
    ##  7 Brazil                 3422.     688228  201.  
    ##  8 United States          3418.    1060430  310.  
    ##  9 Belgium                3166.      32941   10.4 
    ## 10 Argentina              3144.     129991   41.3 
    ## 11 United Kingdom         3123.     194704   62.3 
    ## 12 Paraguay               3074.      19601    6.38
    ## 13 Poland                 3069.     118157   38.5 
    ## 14 Greece                 3068.      33750   11   
    ## 15 Romania                3060.      67203   22.0 
    ## 16 Italy                  2968.     179101   60.3 
    ## 17 Colombia               2968.     141837   47.8 
    ## 18 Mexico                 2938.     330410  112.  
    ## 19 Russia                 2775.     390459  141.  
    ## 20 Tunisia                2763.      29259   10.6

EOL
