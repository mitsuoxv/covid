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

Updated: 2020-06-24

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
    ##  1 United States           20256.  2268753            112
    ##  2 Brazil                  10742.  1085038            101
    ##  3 Russia                   6181.   599705             97
    ##  4 India                    4358.   440215            101
    ##  5 United Kingdom           2774.   305293            110
    ##  6 Peru                     2627.   254936             97
    ##  7 Chile                    2493    246963             99
    ##  8 Spain                    2180.   246504            113
    ##  9 Italy                    1972.   238720            121
    ## 10 Turkey                   1945.   188897             97
    ## 11 Mexico                   1879.   180545             96
    ## 12 Pakistan                 1867.   185034             99
    ## 13 Iran                     1757.   207525            118
    ## 14 Germany                  1673.   190862            114
    ## 15 Saudi Arabia             1593.   161005            101
    ## 16 Bangladesh               1483.   115786             78
    ## 17 France                   1369.   154892            113
    ## 18 South Africa             1046.   101590             97
    ## 19 Canada                    983.   101337            103
    ## 20 Colombia                  714     68652             96

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            149.               14747.             99
    ##  2 Peru                              87.8               8524.             97
    ##  3 Belarus                           71.5               6094.             85
    ##  4 United States                     65.3               7313.            112
    ##  5 Saudi Arabia                      61.9               6257.            101
    ##  6 Sweden                            56.4               6167.            109
    ##  7 Brazil                            53.4               5395.            101
    ##  8 Belgium                           53.3               5820.            109
    ##  9 Spain                             46.9               5300.            113
    ## 10 United Kingdom                    44.5               4897.            110
    ## 11 Russia                            43.9               4262.             97
    ## 12 Switzerland                       37.5               4118.            109
    ## 13 Portugal                          36.1               3690.            102
    ## 14 Ecuador                           35.2               3424.             97
    ## 15 Italy                             32.7               3956.            121
    ## 16 Dominican Republic                30.0               2786.             92
    ## 17 Canada                            29.2               3009.            103
    ## 18 Bolivia                           29.1               2452.             84
    ## 19 Israel                            27.8               2830.            101
    ## 20 Netherlands                       27.3               2983.            109

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.6         258      971
    ##  2 France                 19.1       29591   154892
    ##  3 Belgium                16.0        9696    60550
    ##  4 Italy                  14.5       34657   238720
    ##  5 United Kingdom         14.0       42647   305293
    ##  6 Hungary                14.0         573     4107
    ##  7 Netherlands            12.3        6090    49658
    ##  8 Mexico                 12.1       21825   180545
    ##  9 Spain                  11.5       28324   246504
    ## 10 Sweden                  8.69       5122    58932
    ## 11 Chad                    8.62         74      858
    ## 12 Ecuador                 8.34       4223    50640
    ## 13 Canada                  8.32       8430   101337
    ## 14 Algeria                 7.15        852    11920
    ## 15 Niger                   6.41         67     1046
    ## 16 Romania                 6.27       1523    24291
    ## 17 Sudan                   6.13        533     8698
    ## 18 Burkina Faso            5.87         53      903
    ## 19 Greece                  5.78        190     3287
    ## 20 Mali                    5.66        111     1961

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                932.        9696   10.4 
    ##  2 United Kingdom         684.       42647   62.3 
    ##  3 Spain                  609.       28324   46.5 
    ##  4 Italy                  574.       34657   60.3 
    ##  5 Sweden                 536.        5122    9.56
    ##  6 France                 457.       29591   64.8 
    ##  7 United States          386.      119761  310.  
    ##  8 Netherlands            366.        6090   16.6 
    ##  9 Ecuador                286.        4223   14.8 
    ## 10 Peru                   269.        8045   29.9 
    ## 11 Chile                  269.        4502   16.7 
    ## 12 Brazil                 252.       50617  201.  
    ## 13 Canada                 250.        8430   33.7 
    ## 14 Switzerland            222.        1680    7.58
    ## 15 Mexico                 194.       21825  112.  
    ## 16 Portugal               144.        1534   10.7 
    ## 17 Iran                   127.        9742   76.9 
    ## 18 Denmark                110.         602    5.48
    ## 19 Germany                109.        8895   81.8 
    ## 20 Austria                 84.1        690    8.20

EOL
