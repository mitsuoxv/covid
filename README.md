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

Updated: 2020-07-30

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
    ##  1 United States           28807.  4263531            148
    ##  2 Brazil                  17827.  2442375            137
    ##  3 India                   11179.  1531669            137
    ##  4 Russia                   6232.   828990            133
    ##  5 South Africa             3456.   459761            133
    ##  6 Mexico                   2995.   395489            132
    ##  7 Peru                     2929.   389717            133
    ##  8 Chile                    2590.   349800            135
    ##  9 United Kingdom           2059.   300696            146
    ## 10 Pakistan                 2045.   276288            135
    ## 11 Bangladesh               2009.   229185            114
    ## 12 Saudi Arabia             1976.   270831            137
    ## 13 Colombia                 1947.   257101            132
    ## 14 Iran                     1923.   296273            154
    ## 15 Spain                    1883.   280610            149
    ## 16 Turkey                   1713.   227982            133
    ## 17 Italy                    1569.   246488            157
    ## 18 Germany                  1379.   206926            150
    ## 19 Argentina                1277.   167416            131
    ## 20 France                   1154.   172148            149

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            155.               20888.            135
    ##  2 Peru                              97.9              13031.            133
    ##  3 United States                     92.9              13743.            148
    ##  4 Brazil                            88.6              12145.            137
    ##  5 Saudi Arabia                      76.8              10525.            137
    ##  6 South Africa                      70.5               9383.            133
    ##  7 Israel                            63.8               8761.            137
    ##  8 Bolivia                           59.5               7156.            120
    ##  9 Belarus                           57.5               6971.            121
    ## 10 Sweden                            57.3               8319.            145
    ## 11 Kyrgyzstan                        51.6               6265.            121
    ## 12 Dominican Republic                51.3               6585.            128
    ## 13 Kazakhstan                        44.9               5619.            125
    ## 14 Russia                            44.3               5892.            133
    ## 15 Belgium                           44.1               6399.            145
    ## 16 Ecuador                           41.7               5563.            133
    ## 17 Colombia                          40.7               5380.            132
    ## 18 Honduras                          40.7               4974.            122
    ## 19 Spain                             40.5               6034.            149
    ## 20 Portugal                          34.1               4722.            138

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         485     1707
    ##  2 France                 17.5       30105   172148
    ##  3 United Kingdom         15.3       45878   300696
    ##  4 Belgium                14.8        9833    66569
    ##  5 Italy                  14.2       35123   246488
    ##  6 Hungary                13.3         596     4465
    ##  7 Netherlands            11.5        6145    53374
    ##  8 Mexico                 11.1       44022   395489
    ##  9 Spain                  10.1       28436   280610
    ## 10 Chad                    8.10         75      926
    ## 11 Canada                  7.77       8901   114597
    ## 12 Sweden                  7.17       5702    79494
    ## 13 Ecuador                 6.79       5584    82279
    ## 14 Sudan                   6.31        725    11496
    ## 15 Niger                   6.10         69     1132
    ## 16 Syria                   5.76         40      694
    ## 17 Iran                    5.45      16147   296273
    ## 18 China                   5.33       4664    87457
    ## 19 Egypt                   5.05       4691    92947
    ## 20 Switzerland             4.93       1702    34522

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 945.       9833   10.4 
    ##  2 United Kingdom          736.      45878   62.3 
    ##  3 Peru                    616.      18418   29.9 
    ##  4 Spain                   611.      28436   46.5 
    ##  5 Sweden                  597.       5702    9.56
    ##  6 Italy                   582.      35123   60.3 
    ##  7 Chile                   552.       9240   16.7 
    ##  8 United States           475.     147449  310.  
    ##  9 France                  465.      30105   64.8 
    ## 10 Brazil                  436.      87618  201.  
    ## 11 Mexico                  391.      44022  112.  
    ## 12 Ecuador                 378.       5584   14.8 
    ## 13 Netherlands             369.       6145   16.6 
    ## 14 Bolivia                 266.       2647    9.95
    ## 15 Canada                  264.       8901   33.7 
    ## 16 Kyrgyzstan              245.       1347    5.51
    ## 17 Switzerland             225.       1702    7.58
    ## 18 Iran                    210.      16147   76.9 
    ## 19 Colombia                184.       8777   47.8 
    ## 20 Portugal                161.       1722   10.7

EOL
