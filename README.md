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

Updated: 2020-06-06

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

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           19550.  1837803             94
    ##  2 Brazil                   7035.   584016             83
    ##  3 Russia                   5692.   449834             79
    ##  4 United Kingdom           3060.   281665             92
    ##  5 India                    2731.   226770             83
    ##  6 Spain                    2532.   240660             95
    ##  7 Italy                    2271.   234013            103
    ##  8 Peru                     2263.   178914             79
    ##  9 Turkey                   2117.   167410             79
    ## 10 Germany                  1908.   183271             96
    ## 11 Iran                     1641.   164270            100
    ## 12 France                   1566.   148941             95
    ## 13 Chile                    1458.   118292             81
    ## 14 Mexico                   1296.   101238             78
    ## 15 Saudi Arabia             1121.    93157             83
    ## 16 Pakistan                 1100.    89249             81
    ## 17 Canada                   1098.    93441             85
    ## 18 Bangladesh                957.    57563             60
    ## 19 Belarus                   684.    45981             67
    ## 20 Belgium                   645.    58767             91

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             87.1               7064.             81
    ##  2 Peru                              75.7               5982.             79
    ##  3 Belarus                           70.6               4748.             67
    ##  4 United States                     63.0               5924.             94
    ##  5 Belgium                           62.0               5649.             91
    ##  6 Spain                             54.4               5175.             95
    ##  7 United Kingdom                    49.1               4518.             92
    ##  8 Sweden                            48.0               4383.             91
    ##  9 Switzerland                       44.4               4067.             91
    ## 10 Saudi Arabia                      43.6               3620.             83
    ## 11 Russia                            40.5               3197.             79
    ## 12 Italy                             37.6               3878.            103
    ## 13 Portugal                          37.3               3146.             84
    ## 14 Brazil                            35.0               2904.             83
    ## 15 Ecuador                           34.9               2770.             79
    ## 16 Canada                            32.6               2774.             85
    ## 17 Netherlands                       30.9               2820.             91
    ## 18 Israel                            28.4               2379.             83
    ## 19 Turkey                            27.2               2152.             79
    ## 20 Dominican Republic                24.9               1865.             74

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  22.8         104      457
    ##  2 France                 19.5       29007   148941
    ##  3 Belgium                16.2        9548    58767
    ##  4 Italy                  14.4       33689   234013
    ##  5 United Kingdom         14.2       39904   281665
    ##  6 Hungary                13.6         539     3954
    ##  7 Netherlands            12.8        5990    46942
    ##  8 Mexico                 11.6       11728   101238
    ##  9 Spain                  11.3       27133   240660
    ## 10 Sweden                 10.9        4562    41883
    ## 11 Ecuador                 8.51       3486    40966
    ## 12 Canada                  8.07       7543    93441
    ## 13 Chad                    7.97         66      828
    ## 14 Algeria                 6.93        681     9831
    ## 15 Niger                   6.75         65      963
    ## 16 Romania                 6.53       1299    19907
    ## 17 Greece                  6.09        179     2937
    ## 18 Burkina Faso            5.99         53      885
    ## 19 Indonesia               5.97       1721    28818
    ## 20 Sudan                   5.83        333     5714

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                918.        9548   10.4 
    ##  2 United Kingdom         640.       39904   62.3 
    ##  3 Spain                  583.       27133   46.5 
    ##  4 Italy                  558.       33689   60.3 
    ##  5 Sweden                 477.        4562    9.56
    ##  6 France                 448.       29007   64.8 
    ##  7 Netherlands            360.        5990   16.6 
    ##  8 United States          345.      106876  310.  
    ##  9 Ecuador                236.        3486   14.8 
    ## 10 Canada                 224.        7543   33.7 
    ## 11 Switzerland            219.        1659    7.58
    ## 12 Peru                   164.        4894   29.9 
    ## 13 Brazil                 162.       32548  201.  
    ## 14 Portugal               136.        1455   10.7 
    ## 15 Denmark                106.         582    5.48
    ## 16 Germany                105.        8613   81.8 
    ## 17 Iran                   105.        8071   76.9 
    ## 18 Mexico                 104.       11728  112.  
    ## 19 Austria                 81.7        670    8.20
    ## 20 Chile                   81.0       1356   16.7

EOL
