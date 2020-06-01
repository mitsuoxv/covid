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

Updated: 2020-06-02

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

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           19266.  1734040             90
    ##  2 Brazil                   6308.   498440             79
    ##  3 Russia                   5530.   414878             75
    ##  4 United Kingdom           3121    274766             88
    ##  5 Spain                    2634.   239801             91
    ##  6 India                    2410.   190535             79
    ##  7 Italy                    2352.   233019             99
    ##  8 Turkey                   2183.   163942             75
    ##  9 Peru                     2074.   155671             75
    ## 10 Germany                  1975.   181815             92
    ## 11 France                   1630.   148524             91
    ## 12 Iran                     1576.   151466             96
    ## 13 Chile                    1293.    99688             77
    ## 14 Mexico                   1181     87512             74
    ## 15 Canada                   1116.    90516             81
    ## 16 Saudi Arabia             1078.    85261             79
    ## 17 Pakistan                  939.    72460             77
    ## 18 Bangladesh                840.    47153             56
    ## 19 Belgium                   670.    58381             87
    ## 20 China                     634.    84588            133

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Chile                         77.2               5953.             77
    ##  2 Peru                          69.3               5205.             75
    ##  3 Belgium                       64.4               5612.             87
    ##  4 United States                 62.1               5589.             90
    ##  5 Spain                         56.6               5156.             91
    ##  6 United Kingdom                50.1               4407.             88
    ##  7 Saudi Arabia                  41.9               3313.             79
    ##  8 Russia                        39.3               2949.             75
    ##  9 Italy                         39.0               3862.             99
    ## 10 Portugal                      37.9               3044.             80
    ## 11 Ecuador                       35.1               2643.             75
    ## 12 Canada                        33.1               2688.             81
    ## 13 Netherlands                   32.0               2790.             87
    ## 14 Brazil                        31.4               2479.             79
    ## 15 Turkey                        28.1               2107.             75
    ## 16 France                        25.2               2293.             91
    ## 17 Germany                       24.1               2223.             92
    ## 18 Iran                          20.5               1969.             96
    ## 19 Romania                       11.0                877.             79
    ## 20 Kazakhstan                    10.9                737.             67

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  24.8          81      327
    ##  2 France                 19.4       28746   148524
    ##  3 Belgium                16.2        9467    58381
    ##  4 Italy                  14.3       33415   233019
    ##  5 United Kingdom         14.0       38489   274766
    ##  6 Netherlands            12.8        5956    46442
    ##  7 Spain                  12.1       29045   239801
    ##  8 Mexico                 11.2        9779    87512
    ##  9 Ecuador                 8.59       3358    39098
    ## 10 Chad                    8.35         65      778
    ## 11 Canada                  7.84       7092    90516
    ## 12 Algeria                 6.95        653     9394
    ## 13 Niger                   6.68         64      958
    ## 14 Romania                 6.55       1262    19257
    ## 15 Indonesia               6.09       1613    26473
    ## 16 Mali                    6.09         77     1265
    ## 17 Burkina Faso            6.02         53      881
    ## 18 Greece                  6.00        175     2917
    ## 19 United States           5.92     102640  1734040
    ## 20 Brazil                  5.78      28834   498440

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                910.        9467    10.4
    ##  2 Spain                  625.       29045    46.5
    ##  3 United Kingdom         617.       38489    62.3
    ##  4 Italy                  554.       33415    60.3
    ##  5 France                 444.       28746    64.8
    ##  6 Netherlands            358.        5956    16.6
    ##  7 United States          331.      102640   310. 
    ##  8 Ecuador                227.        3358    14.8
    ##  9 Canada                 211.        7092    33.7
    ## 10 Peru                   146.        4371    29.9
    ## 11 Brazil                 143.       28834   201. 
    ## 12 Portugal               132.        1410    10.7
    ## 13 Germany                104.        8511    81.8
    ## 14 Iran                   101.        7797    76.9
    ## 15 Mexico                  86.9       9779   112. 
    ## 16 Chile                   62.9       1054    16.7
    ## 17 Turkey                  58.4       4540    77.8
    ## 18 Romania                 57.5       1262    22.0
    ## 19 Russia                  34.5       4855   141. 
    ## 20 Czech Republic          30.5        320    10.5

EOL
