WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

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

Updated: 2021-05-06

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           75054. 32123136            428
    ##  2 India                   49556. 20665148            417
    ##  3 Brazil                  35357. 14779529            418
    ##  4 France                  13001.  5590416            430
    ##  5 Turkey                  11934.  4929118            413
    ##  6 Russia                  11737.  4847489            413
    ##  7 United Kingdom          10336.  4423800            428
    ##  8 Italy                    9290.  4059821            437
    ##  9 Spain                    8263.  3544945            429
    ## 10 Germany                  8008.  3451550            431
    ## 11 Argentina                7333.  3021179            412
    ## 12 Colombia                 7034.  2905254            413
    ## 13 Poland                   6743.  2811951            417
    ## 14 Iran                     5921.  2575737            435
    ## 15 Mexico                   5690.  2349900            413
    ## 16 Ukraine                  5137.  2090956            407
    ## 17 Peru                     4382.  1814127            414
    ## 18 Indonesia                4053.  1686373            416
    ## 19 Czech Republic           3912.  1639248            419
    ## 20 South Africa             3840.  1586148            413

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                373.             156477.            419
    ##  2 Jordan                        273.             111705.            409
    ##  3 Israel                        273.             114052.            418
    ##  4 Sweden                        244.             103450.            424
    ##  5 United States                 242.             103545.            428
    ##  6 Serbia                        229.              94552.            412
    ##  7 Belgium                       225.              96090.            427
    ##  8 Netherlands                   216.              91591.            424
    ##  9 Switzerland                   204.              87395.            428
    ## 10 France                        201.              86314.            430
    ## 11 Hungary                       192.              78738.            411
    ## 12 Portugal                      188.              78467.            418
    ## 13 Austria                       179.              75628.            423
    ## 14 Spain                         178.              76226.            429
    ## 15 Argentina                     177.              73076.            412
    ## 16 Brazil                        176.              73492.            418
    ## 17 Chile                         175.              72795.            415
    ## 18 Poland                        175.              73038.            417
    ## 19 Slovakia                      171.              70452.            412
    ## 20 United Kingdom                166.              70953.            428

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1241     6394
    ##  2 Mexico                9.25     217345  2349900
    ##  3 Syria                 7.01       1617    23051
    ##  4 Sudan                 6.94       2365    34082
    ##  5 Egypt                 5.86      13591   231803
    ##  6 Somalia               5.11        721    14121
    ##  7 Ecuador               4.82      18863   391242
    ##  8 China                 4.68       4858   103713
    ##  9 Afghanistan           4.37       2654    60797
    ## 10 Bolivia               4.22      13035   308984
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.11       1574    38327
    ## 13 Bulgaria              4.09      16609   406192
    ## 14 Niger                 3.63        192     5286
    ## 15 Hungary               3.58      28173   785967
    ## 16 Mali                  3.52        492    13969
    ## 17 Chad                  3.52        170     4828
    ## 18 Tunisia               3.51      11016   314152
    ## 19 Peru                  3.44      62375  1814127
    ## 20 South Africa          3.44      54511  1586148

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2822.      28173    9.98
    ##  2 Czech Republic         2814.      29479   10.5 
    ##  3 Belgium                2342.      24367   10.4 
    ##  4 Bulgaria               2323.      16609    7.15
    ##  5 Slovakia               2179.      11886    5.46
    ##  6 Peru                   2086.      62375   29.9 
    ##  7 United Kingdom         2046.     127543   62.3 
    ##  8 Brazil                 2032.     408622  201.  
    ##  9 Italy                  2018.     121738   60.3 
    ## 10 Mexico                 1932.     217345  112.  
    ## 11 United States          1844.     572190  310.  
    ## 12 Poland                 1779.      68482   38.5 
    ## 13 Spain                  1686.      78399   46.5 
    ## 14 France                 1616.     104641   64.8 
    ## 15 Chile                  1594.      26696   16.7 
    ## 16 Portugal               1591.      16981   10.7 
    ## 17 Colombia               1573.      75164   47.8 
    ## 18 Argentina              1567.      64792   41.3 
    ## 19 Sweden                 1475.      14091    9.56
    ## 20 Jordan                 1398.       8955    6.41

EOL
