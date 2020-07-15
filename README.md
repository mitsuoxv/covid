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

Updated: 2020-07-16

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
    ##  1 United States           24960.  3344783            134
    ##  2 Brazil                  15324.  1884967            123
    ##  3 India                    7610.   936181            123
    ##  4 Russia                   6271.   746369            119
    ##  5 Peru                     2773.   330123            119
    ##  6 Chile                    2639.   319493            121
    ##  7 Mexico                   2579.   304435            118
    ##  8 South Africa             2506.   298292            119
    ##  9 United Kingdom           2207.   291377            132
    ## 10 Pakistan                 2112.   255769            121
    ## 11 Saudi Arabia             1933.   237803            123
    ## 12 Spain                    1900.   256619            135
    ## 13 Bangladesh               1899.   190057            100
    ## 14 Iran                     1872.   262173            140
    ## 15 Turkey                   1805.   214993            119
    ## 16 Italy                    1701.   243344            143
    ## 17 Germany                  1468.   199726            136
    ## 18 Colombia                 1307.   154277            118
    ## 19 France                   1201.   162390            135
    ## 20 Argentina                 882.   103265            117

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               19078.            121
    ##  2 Peru                              92.7              11038.            119
    ##  3 United States                     80.5              10782.            134
    ##  4 Brazil                            76.2               9373.            123
    ##  5 Saudi Arabia                      75.1               9242.            123
    ##  6 Belarus                           62.8               6739.            107
    ##  7 Sweden                            60.6               7953.            131
    ##  8 South Africa                      51.1               6088.            119
    ##  9 Bolivia                           46.6               4951.            106
    ## 10 Belgium                           46.0               6035.            131
    ## 11 Russia                            44.6               5305.            119
    ## 12 Israel                            43.2               5343.            123
    ## 13 Dominican Republic                41.1               4714.            114
    ## 14 Spain                             40.9               5518.            135
    ## 15 Ecuador                           39.4               4704.            119
    ## 16 Kazakhstan                        37.2               4140.            111
    ## 17 Portugal                          35.5               4407.            124
    ## 18 United Kingdom                    35.4               4673.            132
    ## 19 Honduras                          33.0               3577.            108
    ## 20 Switzerland                       32.9               4344.            131

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.3         430     1520
    ##  2 France                 18.4       29925   162390
    ##  3 Belgium                15.6        9787    62781
    ##  4 United Kingdom         15.4       44968   291377
    ##  5 Italy                  14.4       34984   243344
    ##  6 Hungary                14.0         595     4263
    ##  7 Netherlands            12.0        6128    51091
    ##  8 Mexico                 11.7       35491   304435
    ##  9 Spain                  11.1       28409   256619
    ## 10 Chad                    8.48         75      884
    ## 11 Canada                  8.13       8790   108155
    ## 12 Ecuador                 7.37       5130    69570
    ## 13 Sweden                  7.30       5545    76001
    ## 14 Sudan                   6.33        659    10417
    ## 15 Niger                   6.19         68     1099
    ## 16 Romania                 5.75       1931    33585
    ## 17 China                   5.43       4649    85677
    ## 18 Switzerland             5.12       1687    32931
    ## 19 Burkina Faso            5.11         53     1037
    ## 20 Algeria                 5.09       1028    20216

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 941.       9787   10.4 
    ##  2 United Kingdom          721.      44968   62.3 
    ##  3 Spain                   611.      28409   46.5 
    ##  4 Sweden                  580.       5545    9.56
    ##  5 Italy                   580.      34984   60.3 
    ##  6 France                  462.      29925   64.8 
    ##  7 United States           435.     135053  310.  
    ##  8 Chile                   422.       7069   16.7 
    ##  9 Peru                    403.      12054   29.9 
    ## 10 Netherlands             368.       6128   16.6 
    ## 11 Brazil                  362.      72833  201.  
    ## 12 Ecuador                 347.       5130   14.8 
    ## 13 Mexico                  316.      35491  112.  
    ## 14 Canada                  261.       8790   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 188.       1866    9.95
    ## 17 Iran                    172.      13211   76.9 
    ## 18 Portugal                156.       1668   10.7 
    ## 19 Colombia                114.       5455   47.8 
    ## 20 Iraq                    113.       3345   29.7

EOL
