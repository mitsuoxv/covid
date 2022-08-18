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

Updated: 2022-08-19

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
    ##  1 United States          102444. 91995265            898
    ##  2 India                   49942. 44298864            887
    ##  3 Brazil                  38602. 34201280            886
    ##  4 France                  36972. 33275006            900
    ##  5 Germany                 35172. 31725160            902
    ##  6 United Kingdom          26126. 23461239            898
    ##  7 South Korea             24023. 21861296            910
    ##  8 Italy                   23765. 21554626            907
    ##  9 Russia                  21517. 19000055            883
    ## 10 Turkey                  18718. 16528070            883
    ## 11 Japan                   17780. 16161801            909
    ## 12 Spain                   14801. 13306301            899
    ## 13 Vietnam                 12939. 11373276            879
    ## 14 Australia               11068.  9851002            890
    ## 15 Argentina               10836.  9633732            889
    ## 16 Netherlands              9362.  8370162            894
    ## 17 Iran                     8280.  7493317            905
    ## 18 Mexico                   7806.  6939755            889
    ## 19 Colombia                 7127.  6286392            882
    ## 20 Indonesia                7104.  6301523            887

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        706.             628226.            890
    ##  2 Austria                       668.             596136.            892
    ##  3 Denmark                       666.             594399.            892
    ##  4 Switzerland                   587.             526802.            898
    ##  5 France                        571.             513754.            900
    ##  6 Portugal                      569.             504452.            887
    ##  7 Netherlands                   562.             502863.            894
    ##  8 Australia                     514.             457851.            890
    ##  9 South Korea                   496.             451468.            910
    ## 10 Belgium                       478.             428778.            897
    ## 11 Greece                        476.             423158.            889
    ## 12 Czech Republic                432.             383768.            889
    ## 13 Germany                       430.             387827.            902
    ## 14 United Kingdom                419.             376292.            898
    ## 15 Italy                         394.             357218.            907
    ## 16 Slovakia                      380.             335419.            883
    ## 17 Serbia                        344.             302985.            882
    ## 18 United States                 330.             296536.            898
    ## 19 Norway                        325.             291158.            896
    ## 20 Spain                         318.             286120.            899

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11914
    ##  2 Sudan                 7.86       4961    63147
    ##  3 Syria                 5.56       3160    56797
    ##  4 Peru                  5.33     215088  4037977
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24786   515198
    ##  7 Mexico                4.74     328798  6939755
    ##  8 Afghanistan           4.09       7759   189710
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.41        312     9157
    ## 11 Myanmar               3.16      19437   614541
    ## 12 Bulgaria              3.05      37517  1230822
    ## 13 Malawi                3.05       2673    87718
    ## 14 Paraguay              2.72      19357   712907
    ## 15 Chad                  2.59        193     7456
    ## 16 Haiti                 2.56        838    32703
    ## 17 Tunisia               2.56      29189  1141135
    ## 18 Algeria               2.55       6878   269473
    ## 19 South Africa          2.54     101982  4008988
    ## 20 Indonesia             2.50     157317  6301523

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7192.     215088   29.9 
    ##  2 Bulgaria               5248.      37517    7.15
    ##  3 Hungary                4717.      47083    9.98
    ##  4 Czech Republic         3884.      40687   10.5 
    ##  5 Slovakia               3725.      20322    5.46
    ##  6 Chile                  3585.      60036   16.7 
    ##  7 Brazil                 3390.     681763  201.  
    ##  8 United States          3313.    1027845  310.  
    ##  9 Argentina              3134.     129566   41.3 
    ## 10 Belgium                3115.      32410   10.4 
    ## 11 Paraguay               3036.      19357    6.38
    ## 12 Poland                 3034.     116826   38.5 
    ## 13 Romania                3025.      66417   22.0 
    ## 14 United Kingdom         3000.     187018   62.3 
    ## 15 Colombia               2956.     141287   47.8 
    ## 16 Mexico                 2923.     328798  112.  
    ## 17 Greece                 2912.      32028   11   
    ## 18 Italy                  2889.     174300   60.3 
    ## 19 Tunisia                2757.      29189   10.6 
    ## 20 Russia                 2725.     383362  141.

EOL
