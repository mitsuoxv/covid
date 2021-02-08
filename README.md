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

Updated: 2021-02-09

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
    ##  1 United States           77711. 26654965            343
    ##  2 India                   32743. 10838194            331
    ##  3 Brazil                  28522.  9497795            333
    ##  4 Russia                  12181.  3983197            327
    ##  5 United Kingdom          11537.  3945684            342
    ##  6 France                   9541.  3282220            344
    ##  7 Spain                    8469.  2913425            344
    ##  8 Turkey                   7741.  2531456            327
    ##  9 Italy                    7512.  2636738            351
    ## 10 Germany                  6633.  2288545            345
    ## 11 Colombia                 6578.  2151207            327
    ## 12 Argentina                6026.  1976689            328
    ## 13 Mexico                   5890.  1926080            327
    ## 14 Poland                   4691.  1552686            331
    ## 15 South Africa             4500.  1476135            328
    ## 16 Iran                     4201.  1466435            349
    ## 17 Ukraine                  3884.  1246990            321
    ## 18 Peru                     3599.  1180478            328
    ## 19 Indonesia                3498.  1157837            331
    ## 20 Czech Republic           3115.  1037405            333

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                297.              99027.            333
    ##  2 Israel                        277.              92102.            332
    ##  3 United States                 250.              85919.            343
    ##  4 Portugal                      216.              71695.            332
    ##  5 Belgium                       205.              69750.            341
    ##  6 Switzerland                   204.              69817.            342
    ##  7 United Kingdom                185.              63284.            342
    ##  8 Spain                         182.              62646.            344
    ##  9 Sweden                        182.              61539.            338
    ## 10 Netherlands                   179.              60424.            338
    ## 11 Serbia                        170.              55533.            326
    ## 12 Jordan                        162.              52310.            323
    ## 13 Austria                       152.              51267.            337
    ## 14 Slovakia                      148.              48411.            327
    ## 15 France                        147.              50676.            344
    ## 16 Argentina                     146.              47812.            328
    ## 17 Brazil                        142.              47228.            333
    ## 18 Colombia                      138.              45014.            327
    ## 19 Chile                         136.              44898.            329
    ## 20 Italy                         124.              43698.            351

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         616     2131
    ##  2 Mexico               8.61     165786  1926080
    ##  3 Syria                6.58        952    14477
    ##  4 Sudan                6.16       1835    29765
    ##  5 Ecuador              5.81      15012   258282
    ##  6 Egypt                5.69       9651   169640
    ##  7 China                4.77       4831   101316
    ##  8 Bolivia              4.73      10753   227128
    ##  9 Afghanistan          4.36       2413    55359
    ## 10 Bulgaria             4.17       9331   223734
    ## 11 Mali                 4.13        338     8176
    ## 12 Tanzania             4.13         21      509
    ## 13 Iran                 3.99      58469  1466435
    ## 14 Zimbabwe             3.84       1326    34552
    ## 15 Greece               3.64       5972   163946
    ## 16 Guatemala            3.61       5884   163137
    ## 17 Niger                3.58        165     4612
    ## 18 Chad                 3.57        125     3497
    ## 19 Peru                 3.57      42121  1180478
    ## 20 Hungary              3.48      13155   377655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2056.      21389   10.4 
    ##  2 United Kingdom         1804.     112465   62.3 
    ##  3 Czech Republic         1655.      17333   10.5 
    ##  4 Italy                  1513.      91273   60.3 
    ##  5 United States          1478.     458544  310.  
    ##  6 Mexico                 1474.     165786  112.  
    ##  7 Peru                   1408.      42121   29.9 
    ##  8 Portugal               1326.      14158   10.7 
    ##  9 Hungary                1318.      13155    9.98
    ## 10 Spain                  1307.      60802   46.5 
    ## 11 Bulgaria               1305.       9331    7.15
    ## 12 Sweden                 1268.      12115    9.56
    ## 13 France                 1213.      78560   64.8 
    ## 14 Argentina              1188.      49110   41.3 
    ## 15 Colombia               1165.      55693   47.8 
    ## 16 Switzerland            1164.       8822    7.58
    ## 17 Brazil                 1149.     231012  201.  
    ## 18 Chile                  1133.      18974   16.7 
    ## 19 Bolivia                1081.      10753    9.95
    ## 20 Poland                 1016.      39132   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
