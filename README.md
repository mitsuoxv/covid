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

Updated: 2020-07-29

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
    ##  1 United States           28635.  4209509            147
    ##  2 Brazil                  17787.  2419091            136
    ##  3 India                   10905.  1483156            136
    ##  4 Russia                   6238.   823515            132
    ##  5 South Africa             3427.   452530            132
    ##  6 Mexico                   2980.   390516            131
    ##  7 Peru                     2914.   384797            132
    ##  8 Chile                    2595.   347923            134
    ##  9 United Kingdom           2069.   300115            145
    ## 10 Pakistan                 2053.   275225            134
    ## 11 Bangladesh               2001.   226225            113
    ## 12 Saudi Arabia             1977.   268934            136
    ## 13 Iran                     1918.   293606            153
    ## 14 Colombia                 1900.   248976            131
    ## 15 Spain                    1883.   278782            148
    ## 16 Turkey                   1718.   227019            132
    ## 17 Italy                    1578.   246286            156
    ## 18 Germany                  1383.   206242            149
    ## 19 Argentina                1249.   162526            130
    ## 20 France                   1157.   171476            148

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            155.               20776.            134
    ##  2 Peru                              97.4              12866.            132
    ##  3 United States                     92.3              13569.            147
    ##  4 Brazil                            88.4              12029.            136
    ##  5 Saudi Arabia                      76.8              10451.            136
    ##  6 South Africa                      69.9               9235.            132
    ##  7 Israel                            62.2               8482.            136
    ##  8 Bolivia                           58.6               6980.            119
    ##  9 Belarus                           57.8               6956.            120
    ## 10 Sweden                            57.6               8308.            144
    ## 11 Dominican Republic                51.2               6531.            127
    ## 12 Kyrgyzstan                        51.0               6144.            120
    ## 13 Kazakhstan                        44.4               5518.            124
    ## 14 Russia                            44.3               5853.            132
    ## 15 Belgium                           44.2               6377.            144
    ## 16 Ecuador                           41.5               5487.            132
    ## 17 Honduras                          40.5               4916.            121
    ## 18 Spain                             40.5               5995.            148
    ## 19 Colombia                          39.8               5210.            131
    ## 20 Portugal                          34.3               4711.            137

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.6         484     1695
    ##  2 France                 17.5       30093   171476
    ##  3 United Kingdom         15.2       45759   300115
    ##  4 Belgium                14.8        9822    66335
    ##  5 Italy                  14.3       35112   246286
    ##  6 Hungary                13.4         596     4456
    ##  7 Netherlands            11.6        6141    53151
    ##  8 Mexico                 11.2       43680   390516
    ##  9 Spain                  10.2       28434   278782
    ## 10 Chad                    8.13         75      922
    ## 11 Canada                  7.80       8890   113911
    ## 12 Sweden                  7.18       5700    79395
    ## 13 Ecuador                 6.82       5532    81161
    ## 14 Sudan                   6.31        725    11496
    ## 15 Niger                   6.10         69     1132
    ## 16 Syria                   5.93         40      674
    ## 17 Iran                    5.42      15912   293606
    ## 18 China                   5.34       4663    87245
    ## 19 Egypt                   5.03       4652    92482
    ## 20 Switzerland             4.94       1700    34390

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 944.       9822   10.4 
    ##  2 United Kingdom          734.      45759   62.3 
    ##  3 Spain                   611.      28434   46.5 
    ##  4 Peru                    610.      18229   29.9 
    ##  5 Sweden                  596.       5700    9.56
    ##  6 Italy                   582.      35112   60.3 
    ##  7 Chile                   549.       9187   16.7 
    ##  8 United States           472.     146331  310.  
    ##  9 France                  465.      30093   64.8 
    ## 10 Brazil                  433.      87004  201.  
    ## 11 Mexico                  388.      43680  112.  
    ## 12 Ecuador                 374.       5532   14.8 
    ## 13 Netherlands             369.       6141   16.6 
    ## 14 Canada                  264.       8890   33.7 
    ## 15 Bolivia                 260.       2583    9.95
    ## 16 Kyrgyzstan              241.       1329    5.51
    ## 17 Switzerland             224.       1700    7.58
    ## 18 Iran                    207.      15912   76.9 
    ## 19 Colombia                178.       8525   47.8 
    ## 20 Portugal                161.       1719   10.7

EOL
