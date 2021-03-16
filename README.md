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

Updated: 2021-03-17

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
    ##  1 United States           77132. 29155892            378
    ##  2 Brazil                  31204. 11483370            368
    ##  3 India                   31089. 11409831            367
    ##  4 Russia                  12147.  4409438            363
    ##  5 United Kingdom          11279.  4263531            378
    ##  6 France                  10549.  4008600            380
    ##  7 Spain                    8430.  3195062            379
    ##  8 Italy                    8368.  3238394            387
    ##  9 Turkey                   7974.  2894893            363
    ## 10 Germany                  6775.  2581329            381
    ## 11 Colombia                 6344.  2303144            363
    ## 12 Argentina                6065.  2195722            362
    ## 13 Mexico                   5967.  2166290            363
    ## 14 Poland                   5264.  1931921            367
    ## 15 Iran                     4558.  1754933            385
    ## 16 South Africa             4238.  1530033            361
    ## 17 Ukraine                  4137.  1477190            357
    ## 18 Indonesia                3883.  1425044            367
    ## 19 Peru                     3880.  1412406            364
    ## 20 Czech Republic           3829.  1412962            369

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                365.             134876.            369
    ##  2 Israel                        303.             111435.            368
    ##  3 United States                 249.              93981.            378
    ##  4 Jordan                        211.              75927.            359
    ##  5 Portugal                      207.              76294.            368
    ##  6 Belgium                       206.              77849.            377
    ##  7 Sweden                        199.              74564.            374
    ##  8 Switzerland                   199.              75336.            378
    ##  9 Serbia                        196.              70922.            362
    ## 10 Netherlands                   187.              69850.            374
    ## 11 Spain                         181.              68702.            379
    ## 12 United Kingdom                181.              68382.            378
    ## 13 Slovakia                      172.              62243.            362
    ## 14 France                        163.              61891.            380
    ## 15 Austria                       161.              60034.            373
    ## 16 Brazil                        155.              57102.            368
    ## 17 Hungary                       147.              53008.            361
    ## 18 Argentina                     147.              53110.            362
    ## 19 Chile                         147.              53518.            365
    ## 20 Italy                         139.              53669.            387

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               24.0         699     2912
    ##  2 Mexico               8.99     194710  2166290
    ##  3 Syria                6.67       1104    16556
    ##  4 Sudan                6.32       1959    30989
    ##  5 Egypt                5.92      11340   191555
    ##  6 Ecuador              5.37      16240   302498
    ##  7 China                4.73       4849   102411
    ##  8 Bolivia              4.61      11958   259389
    ##  9 Afghanistan          4.39       2460    55995
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.12       1504    36504
    ## 12 Somalia              4.06        379     9328
    ## 13 Mali                 4.06        360     8862
    ## 14 Bulgaria             4.05      11472   283194
    ## 15 Niger                3.74        182     4865
    ## 16 Guatemala            3.59       6575   183014
    ## 17 Chad                 3.58        155     4328
    ## 18 Iran                 3.49      61330  1754933
    ## 19 Tunisia              3.47       8404   242124
    ## 20 Peru                 3.47      49003  1412406

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2258.      23657   10.5 
    ##  2 Belgium                2167.      22545   10.4 
    ##  3 United Kingdom         2014.     125580   62.3 
    ##  4 Mexico                 1731.     194710  112.  
    ##  5 Hungary                1726.      17226    9.98
    ##  6 United States          1709.     530114  310.  
    ##  7 Italy                  1699.     102499   60.3 
    ##  8 Peru                   1639.      49003   29.9 
    ##  9 Bulgaria               1605.      11472    7.15
    ## 10 Slovakia               1589.       8669    5.46
    ## 11 Portugal               1564.      16694   10.7 
    ## 12 Spain                  1557.      72424   46.5 
    ## 13 France                 1394.      90265   64.8 
    ## 14 Brazil                 1384.     278229  201.  
    ## 15 Sweden                 1376.      13146    9.56
    ## 16 Chile                  1300.      21772   16.7 
    ## 17 Argentina              1298.      53670   41.3 
    ## 18 Colombia               1279.      61143   47.8 
    ## 19 Switzerland            1237.       9380    7.58
    ## 20 Poland                 1236.      47578   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
