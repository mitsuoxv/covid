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

Updated: 2020-06-08

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
    ##  1 United States           19653.  1886794             96
    ##  2 Brazil                   7596.   645771             85
    ##  3 Russia                   5772.   467673             81
    ##  4 United Kingdom           3029.   284872             94
    ##  5 India                    2900.   246628             85
    ##  6 Spain                    2487.   241310             97
    ##  7 Peru                     2312.   187400             81
    ##  8 Italy                    2235.   234801            105
    ##  9 Turkey                   2087.   169218             81
    ## 10 Germany                  1876.   183979             98
    ## 11 Iran                     1660.   169425            102
    ## 12 France                   1545.   150022             97
    ## 13 Chile                    1537.   127745             83
    ## 14 Mexico                   1374.   110026             80
    ## 15 Pakistan                 1190.    98943             83
    ## 16 Saudi Arabia             1162.    98869             85
    ## 17 Canada                   1083.    94335             87
    ## 18 Bangladesh               1015.    63026             62
    ## 19 Belarus                   677.    46868             69
    ## 20 Belgium                   634.    59072             93

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             91.8               7628.             83
    ##  2 Peru                              77.3               6266.             81
    ##  3 Belarus                           69.9               4839.             69
    ##  4 United States                     63.3               6082.             96
    ##  5 Belgium                           60.9               5678.             93
    ##  6 Spain                             53.5               5189.             97
    ##  7 Sweden                            49.2               4593.             93
    ##  8 United Kingdom                    48.6               4569.             94
    ##  9 Saudi Arabia                      45.2               3842.             85
    ## 10 Switzerland                       43.5               4072.             93
    ## 11 Russia                            41.0               3324.             81
    ## 12 Brazil                            37.8               3211.             85
    ## 13 Portugal                          37.3               3218.             86
    ## 14 Italy                             37.0               3891.            105
    ## 15 Ecuador                           35.5               2889.             81
    ## 16 Canada                            32.1               2801.             87
    ## 17 Netherlands                       30.5               2844.             93
    ## 18 Israel                            28.0               2408.             85
    ## 19 Turkey                            26.8               2175.             81
    ## 20 Dominican Republic                25.4               1954.             76

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.0         112      486
    ##  2 France                 19.4       29084   150022
    ##  3 Belgium                16.2        9580    59072
    ##  4 Italy                  14.4       33846   234801
    ##  5 United Kingdom         14.2       40465   284872
    ##  6 Hungary                13.7         542     3970
    ##  7 Netherlands            12.7        6011    47335
    ##  8 Mexico                 12.0       13170   110026
    ##  9 Spain                  11.2       27135   241310
    ## 10 Sweden                 10.6        4656    43887
    ## 11 Ecuador                 8.44       3608    42728
    ## 12 Chad                    8.25         69      836
    ## 13 Canada                  8.17       7703    94335
    ## 14 Algeria                 6.95        698    10050
    ## 15 Niger                   6.70         65      970
    ## 16 Romania                 6.50       1318    20290
    ## 17 Greece                  6.10        180     2952
    ## 18 Burkina Faso            5.97         53      888
    ## 19 Mali                    5.91         90     1523
    ## 20 Sudan                   5.90        359     6081

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                921.        9580   10.4 
    ##  2 United Kingdom         649.       40465   62.3 
    ##  3 Spain                  583.       27135   46.5 
    ##  4 Italy                  561.       33846   60.3 
    ##  5 Sweden                 487.        4656    9.56
    ##  6 France                 449.       29084   64.8 
    ##  7 Netherlands            361.        6011   16.6 
    ##  8 United States          351.      109038  310.  
    ##  9 Ecuador                244.        3608   14.8 
    ## 10 Canada                 229.        7703   33.7 
    ## 11 Switzerland            219.        1660    7.58
    ## 12 Brazil                 174.       35026  201.  
    ## 13 Peru                   173.        5162   29.9 
    ## 14 Portugal               138.        1474   10.7 
    ## 15 Mexico                 117.       13170  112.  
    ## 16 Denmark                107.         587    5.48
    ## 17 Iran                   107.        8209   76.9 
    ## 18 Germany                106.        8668   81.8 
    ## 19 Chile                   92.0       1541   16.7 
    ## 20 Austria                 81.9        672    8.20

EOL
