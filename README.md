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

Updated: 2021-03-30

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
    ##  1 United States           76525. 29921599            391
    ##  2 Brazil                  32783. 12490362            381
    ##  3 India                   31683. 12039644            380
    ##  4 Russia                  12044.  4528543            376
    ##  5 France                  11379.  4472071            393
    ##  6 United Kingdom          11082.  4333046            391
    ##  7 Italy                    8830.  3532057            400
    ##  8 Turkey                   8532.  3208173            376
    ##  9 Spain                    8285.  3247738            392
    ## 10 Germany                  7061.  2782273            394
    ## 11 Colombia                 6318.  2375591            376
    ## 12 Argentina                6137.  2301389            375
    ## 13 Poland                   5968.  2267964            380
    ## 14 Mexico                   5917.  2224767            376
    ## 15 Iran                     4662.  1855674            398
    ## 16 Ukraine                  4466.  1652409            370
    ## 17 South Africa             4110.  1545431            376
    ## 18 Peru                     4034.  1520973            377
    ## 19 Czech Republic           3970.  1516772            382
    ## 20 Indonesia                3947.  1496085            379

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             144785.            382
    ##  2 Israel                        297.             113011.            381
    ##  3 Jordan                        247.              91979.            372
    ##  4 United States                 247.              96449.            391
    ##  5 Belgium                       215.              83702.            390
    ##  6 Serbia                        213.              79717.            375
    ##  7 Sweden                        211.              81627.            387
    ##  8 Portugal                      202.              76846.            381
    ##  9 Switzerland                   199.              77758.            391
    ## 10 Netherlands                   194.              75244.            387
    ## 11 Spain                         178.              69835.            392
    ## 12 United Kingdom                178.              69497.            391
    ## 13 France                        176.              69047.            393
    ## 14 Slovakia                      175.              65649.            375
    ## 15 Hungary                       172.              64228.            374
    ## 16 Austria                       168.              65023.            386
    ## 17 Brazil                        163.              62109.            381
    ## 18 Poland                        155.              58908.            380
    ## 19 Chile                         154.              58355.            378
    ## 20 Argentina                     148.              55665.            375

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                21.1         852     4037
    ##  2 Mexico                9.05     201429  2224767
    ##  3 Syria                 6.70       1239    18498
    ##  4 Sudan                 6.46       2028    31407
    ##  5 Egypt                 5.94      11882   200050
    ##  6 Ecuador               5.16      16738   324482
    ##  7 China                 4.72       4851   102698
    ##  8 Somalia               4.58        496    10838
    ##  9 Bolivia               4.52      12165   269302
    ## 10 Afghanistan           4.39       2472    56322
    ## 11 Zimbabwe              4.13       1520    36822
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.87      12710   328753
    ## 14 Mali                  3.84        379     9871
    ## 15 Niger                 3.71        185     4987
    ## 16 Chad                  3.57        161     4506
    ## 17 Guatemala             3.52       6794   193050
    ## 18 Tunisia               3.49       8735   250565
    ## 19 South Africa          3.41      52663  1545431
    ## 20 Peru                  3.37      51238  1520973

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2485.      26036   10.5 
    ##  2 Belgium                2201.      22897   10.4 
    ##  3 United Kingdom         2030.     126592   62.3 
    ##  4 Hungary                2020.      20161    9.98
    ##  5 Mexico                 1791.     201429  112.  
    ##  6 Italy                  1789.     107933   60.3 
    ##  7 Bulgaria               1778.      12710    7.15
    ##  8 United States          1753.     543870  310.  
    ##  9 Slovakia               1749.       9542    5.46
    ## 10 Peru                   1713.      51238   29.9 
    ## 11 Spain                  1600.      74420   46.5 
    ## 12 Portugal               1577.      16837   10.7 
    ## 13 Brazil                 1544.     310550  201.  
    ## 14 France                 1452.      94042   64.8 
    ## 15 Sweden                 1402.      13402    9.56
    ## 16 Chile                  1359.      22754   16.7 
    ## 17 Poland                 1349.      51932   38.5 
    ## 18 Argentina              1339.      55368   41.3 
    ## 19 Colombia               1314.      62790   47.8 
    ## 20 Switzerland            1263.       9577    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
