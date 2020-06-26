WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-06-26

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

WHO offers those numbers in [the situation
reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/),
which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning
regular expressions, and made the shiny app above. I would like to
update frequently, but I am not sure. The ugly codes I wrote are in R
directory. Data in Table 1 (In China) and Table 2 (World including
China) in the situation reports are in table1.csv, table2.csv and
tables.rdata in data directory.

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

## Load

Here, I load Table 1 and Table 2, which I managed to scratch from WHO
situation reports. Beware Table 1 (in\_china) includes total, but Table
2 (world) does not include subtotal or total, as I cut them.

``` r
# load data
load("data/tables.rdata")
```

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

    ## `summarise()` regrouping output by 'publish_date' (override with `.groups` argument)

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           20433.  2329463            114
    ##  2 Brazil                  11124.  1145906            103
    ##  3 Russia                   6200.   613994             99
    ##  4 India                    4592.   473105            103
    ##  5 United Kingdom           2739.   306866            112
    ##  6 Peru                     2633.   260810             99
    ##  7 Chile                    2517.   254416            101
    ##  8 Spain                    2148.   247086            115
    ##  9 Mexico                   1952.   191410             98
    ## 10 Italy                    1945.   239410            123
    ## 11 Turkey                   1934    191657             99
    ## 12 Pakistan                 1909.   192970            101
    ## 13 Iran                     1770.   212501            120
    ## 14 Germany                  1655.   192079            116
    ## 15 Saudi Arabia             1623.   167267            103
    ## 16 Bangladesh               1532.   122660             80
    ## 17 France                   1347.   155087            115
    ## 18 South Africa             1128.   111796             99
    ## 19 Canada                    970.   101963            105
    ## 20 Colombia                  750.    73572             98

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            150.               15192.            101
    ##  2 Peru                              88.0               8721.             99
    ##  3 Belarus                           71.0               6189.             87
    ##  4 United States                     65.9               7509.            114
    ##  5 Saudi Arabia                      63.1               6500.            103
    ##  6 Sweden                            58.6               6522.            111
    ##  7 Brazil                            55.3               5698.            103
    ##  8 Belgium                           52.6               5854.            111
    ##  9 Spain                             46.2               5313.            115
    ## 10 Russia                            44.1               4364.             99
    ## 11 United Kingdom                    43.9               4922.            112
    ## 12 Switzerland                       36.9               4128.            111
    ## 13 Portugal                          36.0               3756.            104
    ## 14 Ecuador                           35.6               3538.             99
    ## 15 Italy                             32.2               3968.            123
    ## 16 Dominican Republic                30.7               2914.             94
    ## 17 Bolivia                           30.7               2653.             86
    ## 18 Canada                            28.8               3027.            105
    ## 19 Israel                            28.3               2937.            103
    ## 20 Netherlands                       26.9               2992.            111

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.0         275     1019
    ##  2 France                 19.1       29655   155087
    ##  3 Belgium                16.0        9722    60898
    ##  4 Italy                  14.5       34644   239410
    ##  5 United Kingdom         14.0       43081   306866
    ##  6 Hungary                14.0         576     4114
    ##  7 Netherlands            12.2        6097    49804
    ##  8 Mexico                 12.2       23377   191410
    ##  9 Spain                  11.5       28327   247086
    ## 10 Chad                    8.60         74      860
    ## 11 Sweden                  8.36       5209    62324
    ## 12 Canada                  8.29       8454   101963
    ## 13 Ecuador                 8.23       4309    52334
    ## 14 Algeria                 7.10        869    12248
    ## 15 Niger                   6.34         67     1056
    ## 16 Romania                 6.26       1555    24826
    ## 17 Sudan                   6.16        548     8889
    ## 18 Greece                  5.74        190     3310
    ## 19 Burkina Faso            5.67         53      934
    ## 20 Mali                    5.64        113     2005

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                935.        9722   10.4 
    ##  2 United Kingdom         691.       43081   62.3 
    ##  3 Spain                  609.       28327   46.5 
    ##  4 Italy                  574.       34644   60.3 
    ##  5 Sweden                 545.        5209    9.56
    ##  6 France                 458.       29655   64.8 
    ##  7 United States          390.      120955  310.  
    ##  8 Netherlands            366.        6097   16.6 
    ##  9 Ecuador                291.        4309   14.8 
    ## 10 Chile                  283.        4731   16.7 
    ## 11 Peru                   281.        8404   29.9 
    ## 12 Brazil                 262.       52645  201.  
    ## 13 Canada                 251.        8454   33.7 
    ## 14 Switzerland            222.        1681    7.58
    ## 15 Mexico                 208.       23377  112.  
    ## 16 Portugal               145.        1543   10.7 
    ## 17 Iran                   130.        9996   76.9 
    ## 18 Denmark                110.         603    5.48
    ## 19 Germany                109.        8927   81.8 
    ## 20 Bolivia                 85.0        846    9.95

EOL
