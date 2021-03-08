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

Updated: 2021-03-09

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
    ##  1 United States           77249. 28659480            371
    ##  2 India                   31279. 11229398            359
    ##  3 Brazil                  30301. 10938836            361
    ##  4 Russia                  12205.  4333029            355
    ##  5 United Kingdom          11401.  4218524            370
    ##  6 France                  10313.  3836480            372
    ##  7 Spain                    8470.  3142358            371
    ##  8 Italy                    8093.  3067486            379
    ##  9 Turkey                   7832.  2780417            355
    ## 10 Germany                  6716.  2505193            373
    ## 11 Colombia                 6403.  2273245            355
    ## 12 Argentina                6038.  2149636            356
    ## 13 Mexico                   5988.  2125866            355
    ## 14 Poland                   5017.  1801083            359
    ## 15 Iran                     4482.  1689692            377
    ## 16 South Africa             4272.  1521068            356
    ## 17 Ukraine                  4031.  1406800            349
    ## 18 Indonesia                3843.  1379662            359
    ## 19 Peru                     3834.  1364964            356
    ## 20 Czech Republic           3671.  1325291            361

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                350.             126507.            361
    ##  2 Israel                        302.             108814.            360
    ##  3 United States                 249.              92381.            371
    ##  4 Portugal                      211.              75880.            360
    ##  5 Belgium                       205.              75737.            369
    ##  6 Switzerland                   199.              73820.            370
    ##  7 Sweden                        196.              71679.            366
    ##  8 Jordan                        190.              66757.            351
    ##  9 Serbia                        187.              66092.            354
    ## 10 Netherlands                   184.              67292.            366
    ## 11 United Kingdom                183.              67660.            370
    ## 12 Spain                         182.              67569.            371
    ## 13 Slovakia                      168.              59356.            354
    ## 14 France                        159.              59234.            372
    ## 15 Austria                       158.              57504.            365
    ## 16 Brazil                        151.              54394.            361
    ## 17 Argentina                     146.              51995.            356
    ## 18 Chile                         143.              51102.            357
    ## 19 Italy                         134.              50836.            379
    ## 20 Colombia                      134.              47567.            355

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               26.3         652     2477
    ##  2 Mexico               8.95     190357  2125866
    ##  3 Syria                6.65       1063    15981
    ##  4 Sudan                6.20       1895    30540
    ##  5 Egypt                5.90      10995   186503
    ##  6 Ecuador              5.45      16039   294503
    ##  7 China                4.75       4848   102101
    ##  8 Bolivia              4.65      11807   253950
    ##  9 Afghanistan          4.39       2451    55876
    ## 10 Mali                 4.17        358     8580
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.09       1485    36271
    ## 13 Bulgaria             4.08      10614   260308
    ## 14 Niger                3.67        177     4828
    ## 15 Somalia              3.63        302     8321
    ## 16 Guatemala            3.63       6473   178560
    ## 17 Iran                 3.59      60687  1689692
    ## 18 Peru                 3.49      47681  1364964
    ## 19 Tunisia              3.45       8201   237704
    ## 20 Hungary              3.41      15988   468713

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2140.      22261   10.4 
    ##  2 Czech Republic         2089.      21882   10.5 
    ##  3 United Kingdom         1996.     124419   62.3 
    ##  4 Mexico                 1693.     190357  112.  
    ##  5 United States          1679.     520751  310.  
    ##  6 Italy                  1654.      99785   60.3 
    ##  7 Hungary                1602.      15988    9.98
    ##  8 Peru                   1594.      47681   29.9 
    ##  9 Portugal               1549.      16540   10.7 
    ## 10 Spain                  1516.      70501   46.5 
    ## 11 Bulgaria               1485.      10614    7.15
    ## 12 Slovakia               1452.       7921    5.46
    ## 13 Sweden                 1361.      13003    9.56
    ## 14 France                 1360.      88099   64.8 
    ## 15 Brazil                 1314.     264325  201.  
    ## 16 Argentina              1279.      52880   41.3 
    ## 17 Colombia               1264.      60412   47.8 
    ## 18 Chile                  1259.      21077   16.7 
    ## 19 Switzerland            1224.       9278    7.58
    ## 20 Bolivia                1187.      11807    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
