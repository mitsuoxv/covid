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

Updated: 2021-03-20

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
    ##  1 United States           76949. 29317562            381
    ##  2 Brazil                  31519. 11693838            371
    ##  3 India                   31120. 11514331            370
    ##  4 Russia                  12125.  4437938            366
    ##  5 United Kingdom          11236.  4280886            381
    ##  6 France                  10734.  4111105            383
    ##  7 Italy                    8478.  3306711            390
    ##  8 Spain                    8393.  3206116            382
    ##  9 Turkey                   8061.  2950603            366
    ## 10 Germany                  6848.  2629750            384
    ## 11 Colombia                 6323.  2314154            366
    ## 12 Argentina                6078.  2218425            365
    ## 13 Mexico                   5944.  2175462            366
    ## 14 Poland                   5433.  2010244            370
    ## 15 Iran                     4584.  1778645            388
    ## 16 Ukraine                  4222.  1519926            360
    ## 17 South Africa             4191.  1533961            366
    ## 18 Indonesia                3913.  1443853            369
    ## 19 Peru                     3911.  1435598            367
    ## 20 Czech Republic           3897.  1449696            372

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                372.             138383.            372
    ##  2 Israel                        302.             112145.            371
    ##  3 United States                 248.              94502.            381
    ##  4 Jordan                        222.              80240.            362
    ##  5 Belgium                       208.              79093.            380
    ##  6 Portugal                      206.              76438.            371
    ##  7 Sweden                        205.              77286.            377
    ##  8 Serbia                        200.              73099.            365
    ##  9 Switzerland                   199.              76001.            381
    ## 10 Netherlands                   188.              70869.            377
    ## 11 Spain                         180.              68940.            382
    ## 12 United Kingdom                180.              68661.            381
    ## 13 Slovakia                      174.              63455.            365
    ## 14 France                        166.              63474.            383
    ## 15 Austria                       162.              61107.            376
    ## 16 Brazil                        157.              58148.            371
    ## 17 Hungary                       151.              55083.            364
    ## 18 Chile                         148.              54427.            368
    ## 19 Argentina                     147.              53659.            365
    ## 20 Poland                        141.              52214.            370

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               23.1         724     3130
    ##  2 Mexico               9.01     195908  2175462
    ##  3 Syria                6.68       1130    16925
    ##  4 Sudan                6.32       1959    30989
    ##  5 Egypt                5.93      11472   193482
    ##  6 Ecuador              5.31      16333   307429
    ##  7 China                4.73       4849   102479
    ##  8 Bolivia              4.58      12015   262056
    ##  9 Afghanistan          4.39       2462    56069
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.12       1509    36611
    ## 12 Somalia              4.08        392     9600
    ## 13 Mali                 4.00        363     9066
    ## 14 Bulgaria             4.00      11817   295777
    ## 15 Niger                3.77        185     4906
    ## 16 Chad                 3.58        157     4380
    ## 17 Guatemala            3.58       6619   184934
    ## 18 Tunisia              3.48       8490   243935
    ## 19 Iran                 3.46      61581  1778645
    ## 20 Peru                 3.45      49523  1435598

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2323.      24331   10.5 
    ##  2 Belgium                2175.      22624   10.4 
    ##  3 United Kingdom         2020.     125926   62.3 
    ##  4 Hungary                1787.      17841    9.98
    ##  5 Mexico                 1742.     195908  112.  
    ##  6 Italy                  1721.     103855   60.3 
    ##  7 United States          1718.     532971  310.  
    ##  8 Peru                   1656.      49523   29.9 
    ##  9 Bulgaria               1653.      11817    7.15
    ## 10 Slovakia               1630.       8894    5.46
    ## 11 Portugal               1568.      16743   10.7 
    ## 12 Spain                  1565.      72793   46.5 
    ## 13 Brazil                 1416.     284775  201.  
    ## 14 France                 1408.      91162   64.8 
    ## 15 Sweden                 1385.      13236    9.56
    ## 16 Chile                  1313.      21988   16.7 
    ## 17 Argentina              1312.      54231   41.3 
    ## 18 Colombia               1287.      61498   47.8 
    ## 19 Poland                 1268.      48807   38.5 
    ## 20 Switzerland            1245.       9438    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
