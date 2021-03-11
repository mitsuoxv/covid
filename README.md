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

Updated: 2021-03-12

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
    ##  1 United States           77426. 28879927            373
    ##  2 India                   31175. 11285561            362
    ##  3 Brazil                  30640. 11122429            363
    ##  4 Russia                  12181.  4360823            358
    ##  5 United Kingdom          11353.  4234928            373
    ##  6 France                  10385.  3894447            375
    ##  7 Spain                    8498.  3178442            374
    ##  8 Italy                    8176.  3123368            382
    ##  9 Turkey                   7882.  2821943            358
    ## 10 Germany                  6736.  2532947            376
    ## 11 Colombia                 6375.  2282372            358
    ## 12 Argentina                6077.  2169694            357
    ## 13 Mexico                   5971.  2137884            358
    ## 14 Poland                   5109.  1849424            362
    ## 15 Iran                     4513.  1715162            380
    ## 16 South Africa             4257.  1524174            358
    ## 17 Ukraine                  4049.  1425522            352
    ## 18 Indonesia                3863.  1398578            362
    ## 19 Peru                     3844.  1380023            359
    ## 20 Czech Republic           3752.  1365724            364

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                358.             130367.            364
    ##  2 Israel                        302.             109635.            363
    ##  3 United States                 250.              93091.            373
    ##  4 Portugal                      209.              76054.            363
    ##  5 Belgium                       205.              76382.            372
    ##  6 Switzerland                   200.              74559.            373
    ##  7 Sweden                        199.              73451.            369
    ##  8 Jordan                        198.              70055.            354
    ##  9 Serbia                        190.              67897.            357
    ## 10 Netherlands                   185.              68097.            369
    ## 11 Spain                         183.              68345.            374
    ## 12 United Kingdom                182.              67924.            373
    ## 13 Slovakia                      170.              60783.            357
    ## 14 France                        160.              60129.            375
    ## 15 Austria                       159.              58358.            368
    ## 16 Brazil                        152.              55307.            363
    ## 17 Argentina                     147.              52480.            357
    ## 18 Chile                         144.              51829.            360
    ## 19 Hungary                       138.              49005.            356
    ## 20 Italy                         135.              51763.            382

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               25.2         662     2631
    ##  2 Mexico               8.97     191789  2137884
    ##  3 Syria                6.67       1079    16187
    ##  4 Sudan                6.24       1915    30686
    ##  5 Egypt                5.91      11128   188361
    ##  6 Ecuador              5.43      16105   296841
    ##  7 China                4.75       4849   102172
    ##  8 Bolivia              4.64      11858   255621
    ##  9 Afghanistan          4.38       2451    55917
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.10       1489    36341
    ## 12 Mali                 4.10        358     8739
    ## 13 Bulgaria             4.08      10999   269579
    ## 14 Somalia              3.75        327     8713
    ## 15 Niger                3.69        179     4848
    ## 16 Guatemala            3.62       6522   180393
    ## 17 Iran                 3.55      60928  1715162
    ## 18 Chad                 3.52        149     4231
    ## 19 Peru                 3.49      48163  1380023
    ## 20 Tunisia              3.46       8292   239368

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2160.      22624   10.5 
    ##  2 Belgium                2148.      22347   10.4 
    ##  3 United Kingdom         2005.     124987   62.3 
    ##  4 Mexico                 1705.     191789  112.  
    ##  5 United States          1689.     523986  310.  
    ##  6 Italy                  1671.     100811   60.3 
    ##  7 Hungary                1653.      16497    9.98
    ##  8 Peru                   1610.      48163   29.9 
    ##  9 Portugal               1556.      16617   10.7 
    ## 10 Spain                  1547.      71961   46.5 
    ## 11 Bulgaria               1539.      10999    7.15
    ## 12 Slovakia               1511.       8244    5.46
    ## 13 France                 1375.      89077   64.8 
    ## 14 Sweden                 1370.      13088    9.56
    ## 15 Brazil                 1334.     268370  201.  
    ## 16 Argentina              1291.      53359   41.3 
    ## 17 Colombia               1270.      60676   47.8 
    ## 18 Chile                  1266.      21206   16.7 
    ## 19 Switzerland            1229.       9320    7.58
    ## 20 Poland                 1204.      46373   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
