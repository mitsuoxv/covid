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

Updated: 2020-06-09

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
    ##  1 United States           19748.  1915712             97
    ##  2 Brazil                   7822.   672846             86
    ##  3 Russia                   5811.   476658             82
    ##  4 United Kingdom           3011.   286198             95
    ##  5 India                    2983.   256611             86
    ##  6 Spain                    2464.   241550             98
    ##  7 Peru                     2337.   191758             82
    ##  8 Italy                    2216.   234998            106
    ##  9 Turkey                   2072.   170132             82
    ## 10 Germany                  1859.   184193             99
    ## 11 Iran                     1666.   171789            103
    ## 12 Chile                    1595.   134150             84
    ## 13 France                   1532.   150315             98
    ## 14 Mexico                   1401.   113619             81
    ## 15 Pakistan                 1232.   103671             84
    ## 16 Saudi Arabia             1184.   101914             86
    ## 17 Canada                   1079.    95057             88
    ## 18 Bangladesh               1042     65769             63
    ## 19 Belarus                   693.    48630             70
    ## 20 Belgium                   629.    59226             94

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             95.3               8011.             84
    ##  2 Peru                              78.1               6412.             82
    ##  3 Belarus                           71.5               5021.             70
    ##  4 United States                     63.7               6175.             97
    ##  5 Belgium                           60.5               5693.             94
    ##  6 Spain                             53.0               5194.             98
    ##  7 Sweden                            49.6               4681.             94
    ##  8 United Kingdom                    48.3               4590.             95
    ##  9 Saudi Arabia                      46.0               3961.             86
    ## 10 Switzerland                       43.0               4074.             94
    ## 11 Russia                            41.3               3388.             82
    ## 12 Brazil                            38.9               3346.             86
    ## 13 Portugal                          37.0               3231.             87
    ## 14 Italy                             36.7               3895.            106
    ## 15 Ecuador                           35.4               2915.             82
    ## 16 Canada                            32.0               2822.             88
    ## 17 Netherlands                       30.3               2858.             94
    ## 18 Israel                            27.8               2418.             86
    ## 19 Turkey                            26.6               2187.             82
    ## 20 Dominican Republic                25.6               1995.             77

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.2         113      488
    ##  2 France                 19.4       29097   150315
    ##  3 Belgium                16.2        9595    59226
    ##  4 Italy                  14.4       33899   234998
    ##  5 United Kingdom         14.2       40542   286198
    ##  6 Hungary                13.7         542     3970
    ##  7 Netherlands            12.6        6013    47574
    ##  8 Mexico                 11.9       13511   113619
    ##  9 Spain                  11.2       27136   241550
    ## 10 Sweden                 10.4        4659    44730
    ## 11 Ecuador                 8.40       3621    43120
    ## 12 Chad                    8.24         69      837
    ## 13 Canada                  8.18       7773    95057
    ## 14 Algeria                 6.96        707    10154
    ## 15 Niger                   6.68         65      973
    ## 16 Romania                 6.47       1326    20479
    ## 17 Greece                  6.10        180     2952
    ## 18 Mali                    6.00         92     1533
    ## 19 Burkina Faso            5.97         53      888
    ## 20 Indonesia               5.94       1851    31186

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                922.        9595   10.4 
    ##  2 United Kingdom         650.       40542   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  562.       33899   60.3 
    ##  5 Sweden                 488.        4659    9.56
    ##  6 France                 449.       29097   64.8 
    ##  7 Netherlands            361.        6013   16.6 
    ##  8 United States          354.      109746  310.  
    ##  9 Ecuador                245.        3621   14.8 
    ## 10 Canada                 231.        7773   33.7 
    ## 11 Switzerland            219.        1660    7.58
    ## 12 Brazil                 179.       35930  201.  
    ## 13 Peru                   177.        5301   29.9 
    ## 14 Portugal               139.        1479   10.7 
    ## 15 Mexico                 120.       13511  112.  
    ## 16 Iran                   108.        8281   76.9 
    ## 17 Denmark                107.         589    5.48
    ## 18 Germany                106.        8674   81.8 
    ## 19 Chile                   97.8       1637   16.7 
    ## 20 Austria                 81.9        672    8.20

EOL
