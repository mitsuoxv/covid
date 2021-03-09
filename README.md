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

Updated: 2021-03-10

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
    ##  1 United States           77361. 28700966            371
    ##  2 India                   31235. 11244786            360
    ##  3 Brazil                  30524. 11019344            361
    ##  4 Russia                  12198.  4342474            356
    ##  5 United Kingdom          11383.  4223236            371
    ##  6 France                  10299.  3841709            373
    ##  7 Spain                    8497.  3160970            372
    ##  8 Italy                    8109.  3081368            380
    ##  9 Turkey                   7847.  2793632            356
    ## 10 Germany                  6709.  2509445            374
    ## 11 Colombia                 6395.  2276656            356
    ## 12 Argentina                6069.  2154694            355
    ## 13 Mexico                   5979.  2128600            356
    ## 14 Poland                   5030.  1811036            360
    ## 15 Iran                     4492.  1698005            378
    ## 16 South Africa             4274.  1521706            356
    ## 17 Ukraine                  4028.  1410061            350
    ## 18 Indonesia                3851.  1386556            360
    ## 19 Peru                     3840.  1371176            357
    ## 20 Czech Republic           3690.  1335815            362

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                352.             127512.            362
    ##  2 Israel                        301.             108814.            361
    ##  3 United States                 249.              92514.            371
    ##  4 Portugal                      210.              75914.            361
    ##  5 Belgium                       205.              75844.            370
    ##  6 Switzerland                   200.              74181.            371
    ##  7 Sweden                        195.              71679.            367
    ##  8 Jordan                        193.              67914.            352
    ##  9 Serbia                        188.              66649.            355
    ## 10 Netherlands                   184.              67522.            367
    ## 11 Spain                         183.              67969.            372
    ## 12 United Kingdom                183.              67736.            371
    ## 13 Slovakia                      167.              59356.            355
    ## 14 France                        159.              59315.            373
    ## 15 Austria                       158.              57743.            366
    ## 16 Brazil                        152.              54794.            361
    ## 17 Argentina                     147.              52117.            355
    ## 18 Chile                         144.              51386.            358
    ## 19 Hungary                       134.              47606.            354
    ## 20 Italy                         134.              51066.            380

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               25.7         654     2549
    ##  2 Mexico               8.95     190604  2128600
    ##  3 Syria                6.66       1068    16042
    ##  4 Sudan                6.24       1915    30686
    ##  5 Egypt                5.90      11038   187094
    ##  6 Ecuador              5.45      16039   294503
    ##  7 China                4.75       4848   102125
    ##  8 Bolivia              4.65      11823   254273
    ##  9 Afghanistan          4.39       2451    55876
    ## 10 Mali                 4.16        358     8613
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.10       1487    36289
    ## 13 Bulgaria             4.09      10764   263303
    ## 14 Niger                3.67        177     4829
    ## 15 Somalia              3.64        307     8438
    ## 16 Guatemala            3.62       6479   178770
    ## 17 Iran                 3.58      60786  1698005
    ## 18 Peru                 3.49      47854  1371176
    ## 19 Tunisia              3.46       8225   238017
    ## 20 Hungary              3.40      16146   475207

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2143.      22292   10.4 
    ##  2 Czech Republic         2114.      22147   10.5 
    ##  3 United Kingdom         1998.     124566   62.3 
    ##  4 Mexico                 1695.     190604  112.  
    ##  5 United States          1681.     521625  310.  
    ##  6 Italy                  1659.     100103   60.3 
    ##  7 Hungary                1618.      16146    9.98
    ##  8 Peru                   1600.      47854   29.9 
    ##  9 Portugal               1552.      16565   10.7 
    ## 10 Spain                  1536.      71436   46.5 
    ## 11 Bulgaria               1506.      10764    7.15
    ## 12 Slovakia               1452.       7921    5.46
    ## 13 France                 1366.      88457   64.8 
    ## 14 Sweden                 1361.      13003    9.56
    ## 15 Brazil                 1320.     265411  201.  
    ## 16 Argentina              1285.      53121   41.3 
    ## 17 Colombia               1266.      60503   47.8 
    ## 18 Chile                  1264.      21163   16.7 
    ## 19 Switzerland            1226.       9294    7.58
    ## 20 Bolivia                1189.      11823    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
