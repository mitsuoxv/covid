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

Updated: 2021-03-26

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
    ##  1 United States           76624. 29653604            387
    ##  2 Brazil                  32175. 12130019            377
    ##  3 India                   31350. 11787534            376
    ##  4 Russia                  12077.  4492692            372
    ##  5 United Kingdom          11144.  4312912            387
    ##  6 France                  11069.  4306105            389
    ##  7 Italy                    8689.  3440862            396
    ##  8 Spain                    8354.  3241345            388
    ##  9 Turkey                   8309.  3091282            372
    ## 10 Germany                  6957.  2713180            390
    ## 11 Colombia                 6309.  2347224            372
    ## 12 Argentina                6096.  2261577            371
    ## 13 Mexico                   5922.  2203041            372
    ## 14 Poland                   5731.  2154821            376
    ## 15 Iran                     4627.  1823317            394
    ## 16 Ukraine                  4362.  1596575            366
    ## 17 South Africa             4139.  1540009            372
    ## 18 Peru                     3971.  1481259            373
    ## 19 Czech Republic           3956.  1495361            378
    ## 20 Indonesia                3937.  1476452            375

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                378.             142742.            378
    ##  2 Israel                        299.             112830.            377
    ##  3 United States                 247.              95585.            387
    ##  4 Jordan                        239.              87849.            368
    ##  5 Belgium                       211.              81620.            386
    ##  6 Sweden                        209.              80158.            383
    ##  7 Serbia                        208.              77152.            371
    ##  8 Portugal                      203.              76694.            377
    ##  9 Switzerland                   199.              77219.            387
    ## 10 Netherlands                   191.              73352.            383
    ## 11 Spain                         180.              69697.            388
    ## 12 United Kingdom                179.              69174.            387
    ## 13 Slovakia                      175.              64928.            371
    ## 14 France                        171.              66485.            389
    ## 15 Austria                       166.              63369.            382
    ## 16 Hungary                       163.              60443.            370
    ## 17 Brazil                        160.              60317.            377
    ## 18 Chile                         151.              56596.            374
    ## 19 Poland                        149.              55969.            376
    ## 20 Argentina                     147.              54703.            371

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               21.6         801     3707
    ##  2 Mexico               9.04     199048  2203041
    ##  3 Syria                6.68       1195    17896
    ##  4 Sudan                6.46       2028    31407
    ##  5 Egypt                5.94      11720   197350
    ##  6 Ecuador              5.22      16540   316807
    ##  7 China                4.73       4850   102612
    ##  8 Bolivia              4.54      12093   266086
    ##  9 Somalia              4.40        463    10531
    ## 10 Afghanistan          4.39       2467    56226
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.13       1516    36749
    ## 13 Bulgaria             3.91      12413   317116
    ## 14 Mali                 3.88        372     9577
    ## 15 Niger                3.73        185     4955
    ## 16 Guatemala            3.56       6730   189067
    ## 17 Chad                 3.55        158     4453
    ## 18 Tunisia              3.49       8637   247254
    ## 19 Peru                 3.41      50474  1481259
    ## 20 Iran                 3.40      62045  1823317

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2429.      25450   10.5 
    ##  2 Belgium                2190.      22786   10.4 
    ##  3 United Kingdom         2027.     126382   62.3 
    ##  4 Hungary                1926.      19224    9.98
    ##  5 Mexico                 1770.     199048  112.  
    ##  6 Italy                  1762.     106339   60.3 
    ##  7 United States          1737.     539027  310.  
    ##  8 Bulgaria               1736.      12413    7.15
    ##  9 Slovakia               1707.       9313    5.46
    ## 10 Peru                   1688.      50474   29.9 
    ## 11 Spain                  1593.      74064   46.5 
    ## 12 Portugal               1574.      16805   10.7 
    ## 13 Brazil                 1485.     298676  201.  
    ## 14 France                 1430.      92608   64.8 
    ## 15 Sweden                 1398.      13357    9.56
    ## 16 Chile                  1338.      22402   16.7 
    ## 17 Argentina              1326.      54823   41.3 
    ## 18 Poland                 1321.      50860   38.5 
    ## 19 Colombia               1303.      62274   47.8 
    ## 20 Switzerland            1253.       9498    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
