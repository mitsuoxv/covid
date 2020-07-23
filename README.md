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

Updated: 2020-07-24

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
    ##  1 United States           27242.  3868453            142
    ##  2 Brazil                  16485.  2159654            131
    ##  3 India                    9454.  1238635            131
    ##  4 Russia                   6259.   795038            127
    ##  5 South Africa             3109.   394948            127
    ##  6 Peru                     2850.   362087            127
    ##  7 Mexico                   2826.   356255            126
    ##  8 Chile                    2607.   336402            129
    ##  9 United Kingdom           2116.   296381            140
    ## 10 Pakistan                 2085.   269191            129
    ## 11 Bangladesh               1973.   213254            108
    ## 12 Saudi Arabia             1970.   258156            131
    ## 13 Iran                     1900.   281413            148
    ## 14 Spain                    1870.   267551            143
    ## 15 Turkey                   1750.   222402            127
    ## 16 Colombia                 1674.   211038            126
    ## 17 Italy                    1622.   245032            151
    ## 18 Germany                  1411.   203368            144
    ## 19 France                   1170.   167456            143
    ## 20 Argentina                1088.   136118            125

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               20088.            129
    ##  2 Peru                              95.3              12107.            127
    ##  3 United States                     87.8              12470.            142
    ##  4 Brazil                            82.0              10739.            131
    ##  5 Saudi Arabia                      76.6              10033.            131
    ##  6 South Africa                      63.4               8060.            127
    ##  7 Belarus                           59.6               6868.            115
    ##  8 Sweden                            59.0               8215.            139
    ##  9 Israel                            56.3               7393.            131
    ## 10 Bolivia                           54.9               6269.            114
    ## 11 Kyrgyzstan                        47.7               5505.            115
    ## 12 Dominican Republic                46.6               5705.            122
    ## 13 Belgium                           44.6               6203.            139
    ## 14 Russia                            44.5               5651.            127
    ## 15 Kazakhstan                        42.0               5006.            119
    ## 16 Ecuador                           41.0               5223.            127
    ## 17 Spain                             40.2               5753.            143
    ## 18 Honduras                          38.0               4424.            116
    ## 19 Colombia                          35.0               4416.            126
    ## 20 Portugal                          34.8               4604.            132

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.9         459     1644
    ##  2 France                 18.0       30060   167456
    ##  3 United Kingdom         15.4       45501   296381
    ##  4 Belgium                15.2        9808    64534
    ##  5 Italy                  14.3       35082   245032
    ##  6 Hungary                13.6         596     4380
    ##  7 Netherlands            11.8        6139    52241
    ##  8 Mexico                 11.3       40400   356255
    ##  9 Spain                  10.6       28426   267551
    ## 10 Chad                    8.44         75      889
    ## 11 Canada                  7.93       8862   111697
    ## 12 Sweden                  7.22       5667    78504
    ## 13 Ecuador                 7.01       5418    77257
    ## 14 Sudan                   6.30        708    11237
    ## 15 Niger                   6.15         69     1122
    ## 16 Syria                   5.70         32      561
    ## 17 China                   5.39       4655    86361
    ## 18 Iran                    5.28      14853   281413
    ## 19 Romania                 5.23       2101    40163
    ## 20 Switzerland             5.01       1692    33796

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 943.       9808   10.4 
    ##  2 United Kingdom          730.      45501   62.3 
    ##  3 Spain                   611.      28426   46.5 
    ##  4 Sweden                  593.       5667    9.56
    ##  5 Italy                   581.      35082   60.3 
    ##  6 Chile                   521.       8722   16.7 
    ##  7 France                  464.      30060   64.8 
    ##  8 United States           456.     141479  310.  
    ##  9 Peru                    454.      13579   29.9 
    ## 10 Brazil                  405.      81487  201.  
    ## 11 Netherlands             369.       6139   16.6 
    ## 12 Ecuador                 366.       5418   14.8 
    ## 13 Mexico                  359.      40400  112.  
    ## 14 Canada                  263.       8862   33.7 
    ## 15 Bolivia                 229.       2273    9.95
    ## 16 Switzerland             223.       1692    7.58
    ## 17 Kyrgyzstan              212.       1169    5.51
    ## 18 Iran                    193.      14853   76.9 
    ## 19 Portugal                159.       1702   10.7 
    ## 20 Colombia                150.       7166   47.8

EOL
