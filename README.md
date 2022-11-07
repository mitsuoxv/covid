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

Updated: 2022-11-08

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
    ##  1 United States           98471. 96206427            977
    ##  2 India                   46138. 44661516            968
    ##  3 France                  36567. 35872442            981
    ##  4 Germany                 36443. 35823771            983
    ##  5 Brazil                  36028. 34839337            967
    ##  6 South Korea             26092. 25856910            991
    ##  7 United Kingdom          24443. 23930041            979
    ##  8 Italy                   23929. 23642011            988
    ##  9 Japan                   22904. 22674944            990
    ## 10 Russia                  22270. 21468271            964
    ## 11 Turkey                  17551. 16919638            964
    ## 12 Spain                   13806. 13529643            980
    ## 13 Vietnam                 11985. 11505849            960
    ## 14 Australia               10674. 10364859            971
    ## 15 Argentina               10019.  9718875            970
    ## 16 China                    8944.  9159111           1024
    ## 17 Netherlands              8740.  8521729            975
    ## 18 Iran                     7665.  7558142            986
    ## 19 Mexico                   7332.  7112504            970
    ## 20 Indonesia                6741.  6525120            968

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       685.             666210.            973
    ##  2 Israel                        657.             637631.            971
    ##  3 Denmark                       625.             608582.            973
    ##  4 Switzerland                   571.             558664.            979
    ##  5 France                        565.             553857.            981
    ##  6 South Korea                   539.             533984.            991
    ##  7 Portugal                      535.             517487.            968
    ##  8 Netherlands                   525.             511969.            975
    ##  9 Australia                     496.             481733.            971
    ## 10 Greece                        486.             471717.            970
    ## 11 Belgium                       454.             443845.            978
    ## 12 Germany                       446.             437931.            983
    ## 13 Czech Republic                410.             397270.            970
    ## 14 Italy                         397.             391811.            988
    ## 15 United Kingdom                392.             383811.            979
    ## 16 Slovakia                      352.             339793.            964
    ## 17 Serbia                        341.             327931.            963
    ## 18 United States                 317.             310110.            977
    ## 19 Norway                        299.             292543.            977
    ## 20 Spain                         297.             290923.            980

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.83       4972    63518
    ##  3 Syria                 5.51       3163    57370
    ##  4 Peru                  5.22     217025  4158534
    ##  5 Somalia               5.00       1361    27243
    ##  6 Egypt                 4.81      24798   515412
    ##  7 Mexico                4.65     330410  7112504
    ##  8 Afghanistan           3.84       7826   203732
    ##  9 Ecuador               3.56      35920  1008035
    ## 10 Niger                 3.33        314     9430
    ## 11 Myanmar               3.08      19485   632274
    ## 12 Malawi                3.05       2683    87999
    ## 13 Bulgaria              2.96      37920  1281252
    ## 14 Paraguay              2.73      19601   717955
    ## 15 Tunisia               2.55      29259  1146593
    ## 16 Chad                  2.54        194     7627
    ## 17 Haiti                 2.54        860    33828
    ## 18 Algeria               2.54       6881   270847
    ## 19 South Africa          2.54     102363  4029942
    ## 20 Sri Lanka             2.50      16782   671328

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7257.     217025   29.9 
    ##  2 Bulgaria               5304.      37920    7.15
    ##  3 Hungary                4802.      47938    9.98
    ##  4 Czech Republic         3977.      41660   10.5 
    ##  5 Slovakia               3784.      20641    5.46
    ##  6 Chile                  3686.      61725   16.7 
    ##  7 Brazil                 3422.     688228  201.  
    ##  8 United States          3418.    1060430  310.  
    ##  9 Belgium                3166.      32941   10.4 
    ## 10 Argentina              3144.     129991   41.3 
    ## 11 United Kingdom         3123.     194704   62.3 
    ## 12 Paraguay               3074.      19601    6.38
    ## 13 Poland                 3069.     118170   38.5 
    ## 14 Greece                 3068.      33750   11   
    ## 15 Romania                3061.      67213   22.0 
    ## 16 Italy                  2974.     179436   60.3 
    ## 17 Colombia               2968.     141837   47.8 
    ## 18 Mexico                 2938.     330410  112.  
    ## 19 Russia                 2776.     390649  141.  
    ## 20 Tunisia                2763.      29259   10.6

EOL
