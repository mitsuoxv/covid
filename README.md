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

Updated: 2021-12-16

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
    ##  1 United States           76431. 49833416            652
    ##  2 India                   54151. 34710628            641
    ##  3 Brazil                  34529. 22167781            642
    ##  4 United Kingdom          16768. 10932549            652
    ##  5 Russia                  15860. 10103160            637
    ##  6 Turkey                  14255.  9080455            637
    ##  7 France                  12372.  8091438            654
    ##  8 Germany                 10097.  6613730            655
    ##  9 Iran                     9348.  6160303            659
    ## 10 Argentina                8431.  5361967            636
    ## 11 Spain                    8217.  5366128            653
    ## 12 Colombia                 8000.  5095821            637
    ## 13 Italy                    7956.  5258886            661
    ## 14 Indonesia                6645.  4259644            641
    ## 15 Mexico                   6095.  3918987            643
    ## 16 Poland                   6055.  3881349            641
    ## 17 Ukraine                  5671.  3578557            631
    ## 18 South Africa             5031.  3204642            637
    ## 19 Netherlands              4486.  2906969            648
    ## 20 Philippines              4426.  2836868            641

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                351.             225952.            643
    ##  2 Belgium                       291.             189202.            651
    ##  3 Israel                        286.             183855.            643
    ##  4 Serbia                        273.             173831.            636
    ##  5 Netherlands                   270.             174645.            648
    ##  6 United Kingdom                269.             175346.            652
    ##  7 Jordan                        251.             159151.            633
    ##  8 United States                 246.             160632.            652
    ##  9 Austria                       232.             150144.            646
    ## 10 Switzerland                   230.             150110.            652
    ## 11 Slovakia                      227.             144596.            637
    ## 12 Argentina                     204.             129694.            636
    ## 13 Sweden                        200.             130049.            649
    ## 14 France                        191.             124929.            654
    ## 15 Hungary                       191.             121020.            635
    ## 16 Turkey                        183.             116709.            637
    ## 17 Spain                         177.             115386.            653
    ## 18 Portugal                      175.             112420.            642
    ## 19 Brazil                        172.             110231.            642
    ## 20 Colombia                      167.             106629.            637

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1972    10075
    ##  2 Peru                 8.95     201848  2255318
    ##  3 Mexico               7.57     296721  3918987
    ##  4 Sudan                7.21       3252    45112
    ##  5 Ecuador              6.29      33561   533457
    ##  6 Somalia              5.78       1333    23074
    ##  7 Syria                5.71       2823    49423
    ##  8 Egypt                5.70      21155   370819
    ##  9 Afghanistan          4.65       7329   157660
    ## 10 China                4.41       5697   129247
    ## 11 Bulgaria             4.14      29764   718651
    ## 12 Niger                3.75        269     7170
    ## 13 Malawi               3.69       2310    62615
    ## 14 Myanmar              3.64      19193   527274
    ## 15 Paraguay             3.56      16513   463828
    ## 16 Tunisia              3.53      25443   719903
    ## 17 Bolivia              3.48      19330   554999
    ## 18 Mali                 3.38        633    18719
    ## 19 Indonesia            3.38     143969  4259644
    ## 20 Romania              3.22      57847  1794589

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6749.     201848   29.9 
    ##  2 Bulgaria               4164.      29764    7.15
    ##  3 Hungary                3730.      37232    9.98
    ##  4 Czech Republic         3323.      34813   10.5 
    ##  5 Brazil                 3064.     616251  201.  
    ##  6 Slovakia               2864.      15621    5.46
    ##  7 Argentina              2825.     116792   41.3 
    ##  8 Colombia               2703.     129163   47.8 
    ##  9 Belgium                2661.      27685   10.4 
    ## 10 Mexico                 2638.     296721  112.  
    ## 11 Romania                2634.      57847   22.0 
    ## 12 Paraguay               2590.      16513    6.38
    ## 13 United States          2554.     792371  310.  
    ## 14 Tunisia                2403.      25443   10.6 
    ## 15 United Kingdom         2352.     146627   62.3 
    ## 16 Poland                 2330.      89714   38.5 
    ## 17 Chile                  2312.      38723   16.7 
    ## 18 Ecuador                2269.      33561   14.8 
    ## 19 Italy                  2238.     135049   60.3 
    ## 20 Russia                 2082.     292891  141.

EOL
