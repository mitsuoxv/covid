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

Updated: 2020-06-15

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
    ##  1 United States           19732.  2032524            103
    ##  2 Brazil                   9007.   828810             92
    ##  3 Russia                   6009.   528964             88
    ##  4 India                    3487.   320922             92
    ##  5 United Kingdom           2913.   294379            101
    ##  6 Peru                     2507.   220749             88
    ##  7 Spain                    2341.   243605            104
    ##  8 Italy                    2112.   236651            112
    ##  9 Turkey                   2006.   176677             88
    ## 10 Chile                    1858.   167355             90
    ## 11 Germany                  1773.   186269            105
    ## 12 Iran                     1696.   184955            109
    ## 13 Mexico                   1599.   139196             87
    ## 14 Pakistan                 1545.   139230             90
    ## 15 France                   1464.   152460            104
    ## 16 Saudi Arabia             1339.   123308             92
    ## 17 Bangladesh               1221.    84379             69
    ## 18 Canada                   1040.    97943             94
    ## 19 South Africa              746.    65736             88
    ## 20 Belarus                   699.    53241             76

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            111.                9993.             90
    ##  2 Peru                              83.8               7381.             88
    ##  3 Belarus                           72.1               5497.             76
    ##  4 United States                     63.6               6552.            103
    ##  5 Belgium                           57.5               5760.            100
    ##  6 Sweden                            53.2               5330.            100
    ##  7 Saudi Arabia                      52.0               4792.             92
    ##  8 Spain                             50.3               5238.            104
    ##  9 United Kingdom                    46.7               4722.            101
    ## 10 Brazil                            44.8               4121.             92
    ## 11 Russia                            42.7               3759.             88
    ## 12 Switzerland                       40.6               4091.            100
    ## 13 Portugal                          36.6               3415.             93
    ## 14 Ecuador                           35.5               3134.             88
    ## 15 Italy                             35.0               3922.            112
    ## 16 Canada                            30.9               2908.             94
    ## 17 Netherlands                       29.1               2922.            100
    ## 18 Israel                            27.6               2567.             92
    ## 19 Dominican Republic                27.4               2298.             83
    ## 20 Turkey                            25.8               2271.             88

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  22.7         161      709
    ##  2 France                 19.2       29335   152460
    ##  3 Belgium                16.1        9650    59918
    ##  4 Italy                  14.5       34301   236651
    ##  5 United Kingdom         14.2       41662   294379
    ##  6 Hungary                13.8         559     4064
    ##  7 Netherlands            12.5        6057    48640
    ##  8 Mexico                 11.8       16448   139196
    ##  9 Spain                  11.1       27136   243605
    ## 10 Sweden                  9.57       4874    50931
    ## 11 Chad                    8.49         72      848
    ## 12 Ecuador                 8.36       3874    46356
    ## 13 Canada                  8.22       8049    97943
    ## 14 Algeria                 7.03        760    10810
    ## 15 Niger                   6.65         65      978
    ## 16 Romania                 6.42       1391    21679
    ## 17 Sudan                   6.38        447     7007
    ## 18 Burkina Faso            5.94         53      892
    ## 19 Greece                  5.88        183     3112
    ## 20 Mali                    5.86        104     1776

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                928.        9650   10.4 
    ##  2 United Kingdom         668.       41662   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  568.       34301   60.3 
    ##  5 Sweden                 510.        4874    9.56
    ##  6 France                 453.       29335   64.8 
    ##  7 United States          369.      114466  310.  
    ##  8 Netherlands            364.        6057   16.6 
    ##  9 Ecuador                262.        3874   14.8 
    ## 10 Canada                 239.        8049   33.7 
    ## 11 Switzerland            221.        1676    7.58
    ## 12 Peru                   211.        6308   29.9 
    ## 13 Brazil                 208.       41828  201.  
    ## 14 Chile                  185.        3101   16.7 
    ## 15 Mexico                 146.       16448  112.  
    ## 16 Portugal               142.        1512   10.7 
    ## 17 Iran                   113.        8730   76.9 
    ## 18 Denmark                109.         597    5.48
    ## 19 Germany                107.        8787   81.8 
    ## 20 Austria                 82.5        677    8.20

EOL
