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

Updated: 2022-10-12

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
    ##  1 United States          100205. 95395143            952
    ##  2 India                   47414. 44616394            941
    ##  3 Brazil                  36936. 34719507            940
    ##  4 France                  36512. 34832512            954
    ##  5 Germany                 35691. 34121168            956
    ##  6 South Korea             25929. 24995246            964
    ##  7 United Kingdom          24932. 23735277            952
    ##  8 Italy                   23757. 22830825            961
    ##  9 Russia                  22660. 21232963            937
    ## 10 Japan                   22380. 21552357            963
    ## 11 Turkey                  18057. 16919638            937
    ## 12 Spain                   14105. 13441941            953
    ## 13 Vietnam                 12311. 11486043            933
    ## 14 Australia               10875. 10266007            944
    ## 15 Argentina               10298.  9711355            943
    ## 16 Netherlands              8916.  8452954            948
    ## 17 China                    8146.  8122054            997
    ## 18 Iran                     7875.  7552404            959
    ## 19 Mexico                   7526.  7097264            943
    ## 20 Indonesia                6852.  6448220            941

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       678.             641165.            946
    ##  2 Israel                        673.             634940.            944
    ##  3 Denmark                       638.             603916.            946
    ##  4 Switzerland                   569.             542035.            952
    ##  5 France                        564.             537801.            954
    ##  6 Portugal                      548.             515381.            941
    ##  7 Netherlands                   536.             507837.            948
    ##  8 South Korea                   535.             516189.            964
    ##  9 Australia                     505.             477139.            944
    ## 10 Greece                        480.             452279.            943
    ## 11 Belgium                       462.             439827.            951
    ## 12 Germany                       436.             417118.            956
    ## 13 Czech Republic                418.             394336.            943
    ## 14 United Kingdom                400.             380688.            952
    ## 15 Italy                         394.             378368.            961
    ## 16 Slovakia                      361.             338722.            937
    ## 17 Serbia                        346.             323985.            936
    ## 18 United States                 323.             307495.            952
    ## 19 Norway                        307.             292058.            950
    ## 20 Spain                         303.             289037.            953

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4962    63344
    ##  3 Syria                 5.52       3163    57325
    ##  4 Peru                  5.22     216755  4148587
    ##  5 Somalia               5.00       1361    27216
    ##  6 Egypt                 4.81      24797   515388
    ##  7 Mexico                4.65     330208  7097264
    ##  8 Afghanistan           3.89       7807   200504
    ##  9 Ecuador               3.57      35900  1006070
    ## 10 Niger                 3.34        314     9415
    ## 11 Myanmar               3.11      19467   626690
    ## 12 Malawi                3.05       2682    88030
    ## 13 Bulgaria              2.98      37758  1266241
    ## 14 Paraguay              2.73      19595   717039
    ## 15 Tunisia               2.55      29254  1145829
    ## 16 Chad                  2.55        193     7581
    ## 17 Algeria               2.54       6881   270707
    ## 18 South Africa          2.54     102194  4020788
    ## 19 Haiti                 2.54        857    33756
    ## 20 Sri Lanka             2.50      16768   670873

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7248.     216755   29.9 
    ##  2 Bulgaria               5282.      37758    7.15
    ##  3 Hungary                4766.      47576    9.98
    ##  4 Czech Republic         3941.      41281   10.5 
    ##  5 Slovakia               3755.      20485    5.46
    ##  6 Chile                  3663.      61339   16.7 
    ##  7 Brazil                 3415.     686851  201.  
    ##  8 United States          3389.    1051408  310.  
    ##  9 Belgium                3148.      32746   10.4 
    ## 10 Argentina              3143.     129937   41.3 
    ## 11 Paraguay               3073.      19595    6.38
    ## 12 United Kingdom         3062.     190888   62.3 
    ## 13 Poland                 3060.     117801   38.5 
    ## 14 Romania                3055.      67084   22.0 
    ## 15 Greece                 3018.      33200   11   
    ## 16 Colombia               2967.     141807   47.8 
    ## 17 Italy                  2943.     177570   60.3 
    ## 18 Mexico                 2936.     330208  112.  
    ## 19 Tunisia                2763.      29254   10.6 
    ## 20 Russia                 2760.     388404  141.

EOL
