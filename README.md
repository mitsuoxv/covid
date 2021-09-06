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

Updated: 2021-09-07

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           70661. 39640742            561
    ##  2 India                   61049. 33027621            541
    ##  3 Brazil                  38520. 20877864            542
    ##  4 Russia                  13092.  7030455            537
    ##  5 United Kingdom          12641.  6978130            552
    ##  6 Turkey                  12100.  6498054            537
    ##  7 France                  11989.  6641804            554
    ##  8 Argentina                9706.  5202405            536
    ##  9 Iran                     9176.  5129407            559
    ## 10 Colombia                 9156.  4916980            537
    ## 11 Spain                    8809.  4871444            553
    ## 12 Italy                    8148.  4571440            561
    ## 13 Indonesia                7640.  4133433            541
    ## 14 Germany                  7226.  4010390            555
    ## 15 Mexico                   6370.  3420880            537
    ## 16 Poland                   5343.  2890666            541
    ## 17 South Africa             5224.  2805604            537
    ## 18 Ukraine                  4328.  2298307            531
    ## 19 Peru                     4004.  2154132            538
    ## 20 Philippines              3846.  2080984            541

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                295.             160433.            543
    ##  2 Israel                        280.             151971.            543
    ##  3 Argentina                     235.             125835.            536
    ##  4 Jordan                        234.             124899.            533
    ##  5 United States                 228.             127777.            561
    ##  6 Sweden                        216.             118307.            548
    ##  7 Netherlands                   214.             117407.            548
    ##  8 Belgium                       208.             114583.            551
    ##  9 United Kingdom                203.             111921.            552
    ## 10 Serbia                        198.             106159.            536
    ## 11 Colombia                      192.             102887.            537
    ## 12 Brazil                        192.             103817.            542
    ## 13 Spain                         189.             104749.            553
    ## 14 Switzerland                   188.             103601.            552
    ## 15 France                        185.             102547.            554
    ## 16 Chile                         182.              97996.            539
    ## 17 Portugal                      181.              98075.            542
    ## 18 Turkey                        156.              83518.            537
    ## 19 Austria                       154.              84408.            547
    ## 20 Hungary                       152.              81516.            535

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1519     8056
    ##  2 Peru                 9.21     198447  2154132
    ##  3 Mexico               7.68     262868  3420880
    ##  4 Sudan                7.37       2791    37873
    ##  5 Syria                7.15       2033    28423
    ##  6 Ecuador              6.42      32351   503767
    ##  7 Egypt                5.79      16789   290027
    ##  8 Somalia              5.62        997    17726
    ##  9 Afghanistan          4.65       7141   153534
    ## 10 China                4.61       5685   123231
    ## 11 Bulgaria             4.14      19115   462033
    ## 12 Myanmar              3.82      15985   417971
    ## 13 Bolivia              3.76      18507   492509
    ## 14 Hungary              3.70      30070   813688
    ## 15 Tanzania             3.66         50     1367
    ## 16 Malawi               3.62       2195    60663
    ## 17 Mali                 3.62        539    14910
    ## 18 Zimbabwe             3.56       4457   125331
    ## 19 Tunisia              3.53      23817   674047
    ## 20 Paraguay             3.48      15989   458844

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6635.     198447   29.9 
    ##  2 Hungary                3012.      30070    9.98
    ##  3 Czech Republic         2902.      30406   10.5 
    ##  4 Brazil                 2901.     583362  201.  
    ##  5 Argentina              2720.     112444   41.3 
    ##  6 Bulgaria               2674.      19115    7.15
    ##  7 Colombia               2620.     125230   47.8 
    ##  8 Paraguay               2508.      15989    6.38
    ##  9 Belgium                2441.      25397   10.4 
    ## 10 Mexico                 2337.     262868  112.  
    ## 11 Slovakia               2301.      12551    5.46
    ## 12 Tunisia                2249.      23817   10.6 
    ## 13 Chile                  2215.      37090   16.7 
    ## 14 Ecuador                2187.      32351   14.8 
    ## 15 Italy                  2146.     129515   60.3 
    ## 16 United Kingdom         2137.     133229   62.3 
    ## 17 United States          2069.     641728  310.  
    ## 18 Poland                 1958.      75379   38.5 
    ## 19 Bolivia                1860.      18507    9.95
    ## 20 Spain                  1820.      84640   46.5

EOL
