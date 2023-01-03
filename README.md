WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

- <a href="#summary" id="toc-summary">Summary</a>
- <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
  WHO</a>
- <a href="#newly-confirmed-cases-by-region"
  id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
  region</a>
- <a href="#fastest-spreading-areas"
  id="toc-fastest-spreading-areas">Fastest spreading areas</a>
- <a href="#highest-fatality-rate-areas"
  id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
- <a href="#highest-deaths-per-population-areas"
  id="toc-highest-deaths-per-population-areas">Highest deaths per
  population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2023-01-04

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
    ##  1 United States           95969. 99423758           1036
    ##  2 India                   43589. 44678956           1025
    ##  3 France                  36844. 38243932           1038
    ##  4 Germany                 35972. 37410650           1040
    ##  5 Brazil                  35480. 36331281           1024
    ##  6 South Korea             27606. 28931140           1048
    ##  7 Japan                   27473. 28764223           1047
    ##  8 Italy                   24061. 25143705           1045
    ##  9 United Kingdom          23296. 24135084           1036
    ## 10 Russia                  21362. 21810511           1021
    ## 11 Turkey                  16655. 17004677           1021
    ## 12 Spain                   13196. 13684258           1037
    ## 13 Vietnam                 11332. 11524647           1017
    ## 14 Australia               10746. 11047174           1028
    ## 15 Argentina                9631   9891139           1027
    ## 16 China                    9549. 10322499           1081
    ## 17 Netherlands              8303.  8569228           1032
    ## 18 Iran                     7249.  7561309           1043
    ## 19 Mexico                   7044.  7234467           1027
    ## 20 Indonesia                6556.  6720443           1025

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       676.             695845.           1030
    ##  2 Israel                        630.             648111.           1028
    ##  3 Denmark                       601.             618246.           1029
    ##  4 South Korea                   570.             597471.           1048
    ##  5 France                        569.             590472.           1038
    ##  6 Switzerland                   558.             577525.           1035
    ##  7 Portugal                      508.             520601.           1025
    ##  8 Australia                     499.             513446.           1028
    ##  9 Netherlands                   499.             514823.           1032
    ## 10 Greece                        491.             504408.           1027
    ## 11 Germany                       440.             457330.           1040
    ## 12 Belgium                       434.             448741.           1034
    ## 13 Czech Republic                426.             437281.           1027
    ## 14 Italy                         399.             416698.           1045
    ## 15 United Kingdom                374.             387100.           1036
    ## 16 Slovakia                      334.             340855.           1021
    ## 17 Serbia                        327.             333211.           1020
    ## 18 United States                 309.             320481.           1036
    ## 19 Chile                         294.             301213.           1023
    ## 20 Norway                        285.             294540.           1035

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4994    63686
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.90     218233  4451074
    ##  6 Egypt                 4.81      24802   515533
    ##  7 Mexico                4.58     331099  7234467
    ##  8 Afghanistan           3.78       7849   207644
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        314     9494
    ## 11 Myanmar               3.08      19490   633686
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38108  1292224
    ## 14 Tunisia               2.55      29284  1147571
    ## 15 Haiti                 2.54        860    33893
    ## 16 Algeria               2.54       6881   271217
    ## 17 Chad                  2.54        194     7650
    ## 18 South Africa          2.53     102568  4048580
    ## 19 Sri Lanka             2.50      16817   671898
    ## 20 Paraguay              2.49      19688   792215

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7297.     218233   29.9 
    ##  2 Bulgaria               5331.      38108    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4024.      42158   10.5 
    ##  5 Slovakia               3818.      20827    5.46
    ##  6 Chile                  3774.      63200   16.7 
    ##  7 United States          3489.    1082265  310.  
    ##  8 Brazil                 3450.     693853  201.  
    ##  9 Belgium                3194.      33228   10.4 
    ## 10 United Kingdom         3191.     198937   62.3 
    ## 11 Greece                 3162.      34779   11   
    ## 12 Argentina              3147.     130124   41.3 
    ## 13 Paraguay               3088.      19688    6.38
    ## 14 Poland                 3079.     118546   38.5 
    ## 15 Romania                3070.      67408   22.0 
    ## 16 Italy                  3060.     184642   60.3 
    ## 17 Colombia               2975.     142179   47.8 
    ## 18 Mexico                 2944.     331099  112.  
    ## 19 Russia                 2799.     393853  141.  
    ## 20 Tunisia                2766.      29284   10.6

EOL
