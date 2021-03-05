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
-   [Save data](#save-data)

Updated: 2021-03-06

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
    ##  1 United States           77360. 28468736            368
    ##  2 India                   31387. 11173761            356
    ##  3 Brazil                  29940. 10718630            358
    ##  4 Russia                  12219.  4301159            352
    ##  5 United Kingdom          11448.  4201362            367
    ##  6 France                  10213.  3768799            369
    ##  7 Spain                    8539.  3142358            368
    ##  8 Italy                    7976.  2999119            376
    ##  9 Turkey                   7801.  2746158            352
    ## 10 Germany                  6709.  2482522            370
    ## 11 Colombia                 6428.  2262646            352
    ## 12 Argentina                6034.  2130087            353
    ## 13 Mexico                   5980.  2104987            352
    ## 14 Poland                   4962.  1766490            356
    ## 15 Iran                     4452.  1665103            374
    ## 16 South Africa             4299.  1517666            353
    ## 17 Ukraine                  4002.  1384917            346
    ## 18 Indonesia                3823.  1361098            356
    ## 19 Peru                     3810.  1344969            353
    ## 20 Czech Republic           3628.  1299002            358

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                346.             123998.            358
    ##  2 Israel                        298.             106322.            357
    ##  3 United States                 249.              91766.            368
    ##  4 Portugal                      212.              75582.            357
    ##  5 Belgium                       205.              75002.            366
    ##  6 Switzerland                   201.              73658.            367
    ##  7 Sweden                        196.              71174.            363
    ##  8 Jordan                        185.              64515.            348
    ##  9 Serbia                        184.              64645.            351
    ## 10 United Kingdom                184.              67385.            367
    ## 11 Spain                         184.              67569.            368
    ## 12 Netherlands                   183.              66419.            363
    ## 13 Slovakia                      167.              58585.            351
    ## 14 France                        158.              58189.            369
    ## 15 Austria                       156.              56596.            362
    ## 16 Brazil                        149.              53299.            358
    ## 17 Argentina                     146.              51522.            353
    ## 18 Chile                         142.              50167.            354
    ## 19 Colombia                      134.              47346.            352
    ## 20 Italy                         132.              49703.            376

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.2         646     2379
    ##  2 Mexico               8.93     188044  2104987
    ##  3 Syria                6.64       1050    15815
    ##  4 Sudan                6.22       1895    30479
    ##  5 Egypt                5.88      10871   184755
    ##  6 Ecuador              5.51      15959   289735
    ##  7 China                4.75       4846   102015
    ##  8 Bolivia              4.67      11734   251391
    ##  9 Afghanistan          4.39       2449    55827
    ## 10 Mali                 4.21        357     8470
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.11      10506   255381
    ## 13 Zimbabwe             4.09       1483    36223
    ## 14 Guatemala            3.65       6427   176250
    ## 15 Iran                 3.63      60431  1665103
    ## 16 Niger                3.63        172     4740
    ## 17 Peru                 3.50      47089  1344969
    ## 18 Somalia              3.49        274     7850
    ## 19 Hungary              3.45      15619   452547
    ## 20 Tunisia              3.44       8106   235643

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2134.      22196   10.4 
    ##  2 Czech Republic         2036.      21325   10.5 
    ##  3 United Kingdom         1989.     124025   62.3 
    ##  4 Mexico                 1672.     188044  112.  
    ##  5 United States          1660.     515013  310.  
    ##  6 Italy                  1640.      98974   60.3 
    ##  7 Peru                   1575.      47089   29.9 
    ##  8 Hungary                1565.      15619    9.98
    ##  9 Portugal               1542.      16458   10.7 
    ## 10 Spain                  1516.      70501   46.5 
    ## 11 Bulgaria               1470.      10506    7.15
    ## 12 Slovakia               1405.       7665    5.46
    ## 13 Sweden                 1358.      12977    9.56
    ## 14 France                 1349.      87371   64.8 
    ## 15 Brazil                 1289.     259271  201.  
    ## 16 Argentina              1270.      52505   41.3 
    ## 17 Colombia               1257.      60082   47.8 
    ## 18 Chile                  1244.      20838   16.7 
    ## 19 Switzerland            1222.       9267    7.58
    ## 20 Bolivia                1180.      11734    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
