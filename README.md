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

Updated: 2021-04-14

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
    ##  1 United States           76080. 30888765            406
    ##  2 India                   34657. 13689453            395
    ##  3 Brazil                  34045. 13482023            396
    ##  4 France                  12224.  4987689            408
    ##  5 Russia                  11912.  4657883            391
    ##  6 United Kingdom          10772.  4373347            406
    ##  7 Turkey                   9983.  3903573            391
    ##  8 Italy                    9107.  3779594            415
    ##  9 Spain                    8198.  3336637            407
    ## 10 Germany                  7389.  3022323            409
    ## 11 Poland                   6582.  2599850            395
    ## 12 Argentina                6493.  2532562            390
    ## 13 Colombia                 6486.  2536198            391
    ## 14 Mexico                   5831.  2280213            391
    ## 15 Iran                     5069.  2093452            413
    ## 16 Ukraine                  4864.  1872785            385
    ## 17 Peru                     4203.  1647694            392
    ## 18 Czech Republic           3992.  1585037            397
    ## 19 Indonesia                3989.  1571824            394
    ## 20 South Africa             3987.  1559113            391

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             151302.            397
    ##  2 Israel                        287.             113715.            396
    ##  3 Jordan                        270.             104462.            387
    ##  4 United States                 245.              99566.            406
    ##  5 Serbia                        225.              87840.            390
    ##  6 Sweden                        223.              89725.            402
    ##  7 Belgium                       220.              89131.            405
    ##  8 Netherlands                   203.              81546.            402
    ##  9 Switzerland                   201.              81820.            406
    ## 10 Portugal                      196.              77535.            396
    ## 11 France                        189.              77008.            408
    ## 12 Hungary                       187.              72939.            389
    ## 13 Spain                         176.              71746.            407
    ## 14 Austria                       175.              70166.            401
    ## 15 Slovakia                      174.              68042.            390
    ## 16 United Kingdom                173.              70144.            406
    ## 17 Poland                        171.              67529.            395
    ## 18 Brazil                        169.              67040.            396
    ## 19 Chile                         165.              64665.            393
    ## 20 Argentina                     157.              61257.            390

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1069     5450
    ##  2 Mexico                9.18     209338  2280213
    ##  3 Syria                 6.81       1385    20331
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.91      12487   211307
    ##  6 Ecuador               4.98      17298   347070
    ##  7 Somalia               4.97        624    12566
    ##  8 China                 4.71       4854   103136
    ##  9 Bolivia               4.41      12451   282095
    ## 10 Afghanistan           4.41       2529    57364
    ## 11 Zimbabwe              4.13       1542    37307
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.90      14619   375115
    ## 14 Niger                 3.72        189     5074
    ## 15 Chad                  3.60        167     4641
    ## 16 Guatemala             3.45       7020   203309
    ## 17 Mali                  3.45        414    12002
    ## 18 South Africa          3.42      53356  1559113
    ## 19 Tunisia               3.42       9332   272940
    ## 20 Malawi                3.34       1132    33859

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2676.      28038   10.5 
    ##  2 Hungary                2402.      23980    9.98
    ##  3 Belgium                2259.      23503   10.4 
    ##  4 Bulgaria               2045.      14619    7.15
    ##  5 United Kingdom         2039.     127100   62.3 
    ##  6 Slovakia               1949.      10630    5.46
    ##  7 Italy                  1899.     114612   60.3 
    ##  8 Mexico                 1861.     209338  112.  
    ##  9 Peru                   1836.      54903   29.9 
    ## 10 United States          1795.     556853  310.  
    ## 11 Brazil                 1756.     353137  201.  
    ## 12 Spain                  1638.      76179   46.5 
    ## 13 Portugal               1584.      16916   10.7 
    ## 14 Poland                 1536.      59126   38.5 
    ## 15 France                 1521.      98505   64.8 
    ## 16 Chile                  1462.      24483   16.7 
    ## 17 Sweden                 1425.      13621    9.56
    ## 18 Argentina              1398.      57779   41.3 
    ## 19 Colombia               1379.      65889   47.8 
    ## 20 Switzerland            1288.       9766    7.58

EOL
