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

Updated: 2020-08-14

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

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/).

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           31254.  5094500            163
    ##  2 Brazil                  20457.  3109630            152
    ##  3 India                   15767.  2396637            152
    ##  4 Russia                   6133.   907758            148
    ##  5 South Africa             3843.   568919            148
    ##  6 Mexico                   3350.   492522            147
    ##  7 Peru                     3308.   489680            148
    ##  8 Colombia                 2791.   410453            147
    ##  9 Chile                    2520.   378168            150
    ## 10 Bangladesh               2065.   266498            129
    ## 11 Spain                    2010.   329784            164
    ## 12 Iran                     1974.   333699            169
    ## 13 United Kingdom           1948.   313802            161
    ## 14 Saudi Arabia             1927.   293037            152
    ## 15 Pakistan                 1910.   286683            150
    ## 16 Argentina                1786.   260911            146
    ## 17 Turkey                   1650.   244392            148
    ## 18 Italy                    1463.   251713            172
    ## 19 Germany                  1332.   219964            165
    ## 20 France                   1180.   193694            164

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            150.               22582.            150
    ##  2 Peru                             111.               16373.            148
    ##  3 Brazil                           102.               15463.            152
    ##  4 United States                    101.               16422.            163
    ##  5 South Africa                      78.4              11611.            148
    ##  6 Israel                            75.9              11566.            152
    ##  7 Saudi Arabia                      74.9              11388.            152
    ##  8 Bolivia                           69.4               9382.            135
    ##  9 Colombia                          58.4               8589.            147
    ## 10 Dominican Republic                58.4               8370.            143
    ## 11 Kyrgyzstan                        54.7               7455.            136
    ## 12 Sweden                            54.5               8733.            160
    ## 13 Kazakhstan                        54.5               7634.            140
    ## 14 Belarus                           52.3               7135.            136
    ## 15 Belgium                           45.3               7263.            160
    ## 16 Honduras                          44.1               6058.            137
    ## 17 Russia                            43.6               6452.            148
    ## 18 Ecuador                           43.6               6461.            148
    ## 19 Spain                             43.2               7091.            164
    ## 20 Argentina                         43.2               6311.            146

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.7         529     1845
    ##  2 France                 15.6       30243   193694
    ##  3 United Kingdom         14.9       46706   313802
    ##  4 Italy                  14.0       35225   251713
    ##  5 Belgium                13.1        9900    75554
    ##  6 Hungary                12.7         605     4768
    ##  7 Mexico                 10.9       53929   492522
    ##  8 Netherlands            10.2        6152    60572
    ##  9 Spain                   8.67      28579   329784
    ## 10 Chad                    8.01         76      949
    ## 11 Canada                  7.47       8991   120421
    ## 12 Sweden                  6.92       5774    83455
    ## 13 Sudan                   6.54        792    12115
    ## 14 Ecuador                 6.23       5951    95563
    ## 15 Niger                   5.94         69     1161
    ## 16 Iran                    5.69      18988   333699
    ## 17 Egypt                   5.30       5085    95963
    ## 18 China                   5.25       4704    89526
    ## 19 Mali                    4.84        125     2582
    ## 20 Switzerland             4.62       1713    37079

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 952.       9900   10.4 
    ##  2 United Kingdom          749.      46706   62.3 
    ##  3 Peru                    719.      21501   29.9 
    ##  4 Spain                   615.      28579   46.5 
    ##  5 Chile                   609.      10205   16.7 
    ##  6 Sweden                  604.       5774    9.56
    ##  7 Italy                   584.      35225   60.3 
    ##  8 United States           527.     163340  310.  
    ##  9 Brazil                  512.     103026  201.  
    ## 10 Mexico                  480.      53929  112.  
    ## 11 France                  467.      30243   64.8 
    ## 12 Ecuador                 402.       5951   14.8 
    ## 13 Bolivia                 378.       3761    9.95
    ## 14 Netherlands             370.       6152   16.6 
    ## 15 Colombia                282.      13475   47.8 
    ## 16 Kyrgyzstan              270.       1487    5.51
    ## 17 Canada                  267.       8991   33.7 
    ## 18 Iran                    247.      18988   76.9 
    ## 19 Switzerland             226.       1713    7.58
    ## 20 South Africa            225.      11010   49

EOL
