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

Updated: 2020-06-19

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
    ##  1 United States           19868.  2126027            107
    ##  2 Brazil                   9615.   923189             96
    ##  3 Russia                   6097.   561091             92
    ##  4 India                    3821.   366946             96
    ##  5 United Kingdom           2849.   299255            105
    ##  6 Peru                     2576.   237156             92
    ##  7 Chile                    2345.   220628             94
    ##  8 Spain                    2265.   244683            108
    ##  9 Italy                    2049.   237828            116
    ## 10 Turkey                   1984.   182727             92
    ## 11 Iran                     1725.   195051            113
    ## 12 Germany                  1721.   187764            109
    ## 13 Pakistan                 1701.   160118             94
    ## 14 Mexico                   1700.   154863             91
    ## 15 Saudi Arabia             1470.   141234             96
    ## 16 France                   1418.   153356            108
    ## 17 Bangladesh               1347.    98489             73
    ## 18 Canada                   1014.    99467             98
    ## 19 South Africa              873.    80412             92
    ## 20 Belarus                   698.    56032             80

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            140.               13175.             94
    ##  2 Peru                              86.1               7930.             92
    ##  3 Belarus                           72.1               5785.             80
    ##  4 United States                     64.0               6853.            107
    ##  5 Saudi Arabia                      57.1               5489.             96
    ##  6 Belgium                           55.6               5791.            104
    ##  7 Sweden                            54.8               5710.            104
    ##  8 Spain                             48.7               5261.            108
    ##  9 Brazil                            47.8               4591.             96
    ## 10 United Kingdom                    45.7               4800.            105
    ## 11 Russia                            43.3               3988.             92
    ## 12 Switzerland                       39.2               4102.            104
    ## 13 Portugal                          36.3               3529.             97
    ## 14 Ecuador                           35.5               3278.             92
    ## 15 Italy                             34.0               3941.            116
    ## 16 Canada                            30.1               2953.             98
    ## 17 Netherlands                       28.3               2956.            104
    ## 18 Dominican Republic                27.9               2454.             87
    ## 19 Israel                            27.6               2670.             96
    ## 20 Turkey                            25.5               2349.             92

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.0         245      906
    ##  2 France                 19.2       29509   153356
    ##  3 Belgium                16.1        9675    60244
    ##  4 Italy                  14.5       34448   237828
    ##  5 United Kingdom         14.1       42153   299255
    ##  6 Hungary                13.9         568     4079
    ##  7 Netherlands            12.3        6074    49204
    ##  8 Mexico                 11.8       18310   154863
    ##  9 Spain                  11.1       27136   244683
    ## 10 Sweden                  9.24       5041    54562
    ## 11 Chad                    8.67         74      854
    ## 12 Ecuador                 8.26       4007    48490
    ## 13 Canada                  8.26       8213    99467
    ## 14 Algeria                 7.09        799    11268
    ## 15 Niger                   6.57         67     1020
    ## 16 Romania                 6.38       1451    22760
    ## 17 Sudan                   6.07        487     8020
    ## 18 Burkina Faso            5.90         53      899
    ## 19 Greece                  5.84        187     3203
    ## 20 Mali                    5.66        107     1890

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                930.        9675   10.4 
    ##  2 United Kingdom         676.       42153   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  571.       34448   60.3 
    ##  5 Sweden                 528.        5041    9.56
    ##  6 France                 456.       29509   64.8 
    ##  7 United States          376.      116702  310.  
    ##  8 Netherlands            365.        6074   16.6 
    ##  9 Ecuador                271.        4007   14.8 
    ## 10 Canada                 244.        8213   33.7 
    ## 11 Peru                   236.        7056   29.9 
    ## 12 Brazil                 225.       45241  201.  
    ## 13 Switzerland            221.        1677    7.58
    ## 14 Chile                  216.        3615   16.7 
    ## 15 Mexico                 163.       18310  112.  
    ## 16 Portugal               143.        1523   10.7 
    ## 17 Iran                   119.        9185   76.9 
    ## 18 Denmark                109.         598    5.48
    ## 19 Germany                108.        8856   81.8 
    ## 20 Austria                 83.7        687    8.20

EOL
