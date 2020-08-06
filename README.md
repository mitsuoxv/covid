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

Updated: 2020-08-07

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
    ##  1 United States           30309.  4728239            156
    ##  2 Brazil                  19323.  2801921            145
    ##  3 India                   13548.  1964536            145
    ##  4 Russia                   6183.   871894            141
    ##  5 South Africa             3757.   529877            141
    ##  6 Mexico                   3213.   449961            140
    ##  7 Peru                     3119.   439890            141
    ##  8 Chile                    2549.   364723            143
    ##  9 Colombia                 2392.   334979            140
    ## 10 Bangladesh               2021.   246674            122
    ## 11 United Kingdom           1994.   307188            154
    ## 12 Pakistan                 1970.   281863            143
    ## 13 Iran                     1959.   317483            162
    ## 14 Saudi Arabia             1950.   282824            145
    ## 15 Spain                    1947.   305767            157
    ## 16 Turkey                   1673.   236112            141
    ## 17 Argentina                1535.   213535            139
    ## 18 Italy                    1507.   248803            165
    ## 19 Germany                  1348.   213067            158
    ## 20 France                   1156.   181652            157

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            152.               21779.            143
    ##  2 Peru                             104.               14709.            141
    ##  3 United States                     97.7              15241.            156
    ##  4 Brazil                            96.1              13933.            145
    ##  5 South Africa                      76.7              10814.            141
    ##  6 Saudi Arabia                      75.8              10991.            145
    ##  7 Israel                            71.6              10407.            145
    ##  8 Bolivia                           65.4               8380.            128
    ##  9 Dominican Republic                56.4               7702.            136
    ## 10 Sweden                            55.7               8533.            153
    ## 11 Belarus                           54.6               7060.            129
    ## 12 Kyrgyzstan                        54.3               7018.            129
    ## 13 Colombia                          50.1               7009.            140
    ## 14 Kazakhstan                        47.0               6254.            133
    ## 15 Belgium                           44.6               6831.            153
    ## 16 Russia                            43.9               6197.            141
    ## 17 Honduras                          42.5               5545.            130
    ## 18 Ecuador                           42.5               6008.            141
    ## 19 Spain                             41.9               6575.            157
    ## 20 Argentina                         37.1               5165.            139

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         509     1767
    ##  2 France                 16.6       30182   181652
    ##  3 United Kingdom         15.1       46364   307188
    ##  4 Italy                  14.1       35181   248803
    ##  5 Belgium                13.9        9859    71065
    ##  6 Hungary                13.1         599     4564
    ##  7 Netherlands            10.9        6153    56381
    ##  8 Mexico                 10.9       48869   449961
    ##  9 Spain                   9.32      28499   305767
    ## 10 Chad                    7.99         75      939
    ## 11 Canada                  7.60       8958   117792
    ## 12 Sweden                  7.06       5760    81540
    ## 13 Ecuador                 6.58       5847    88866
    ## 14 Sudan                   6.48        763    11780
    ## 15 Niger                   5.99         69     1152
    ## 16 Iran                    5.61      17802   317483
    ## 17 China                   5.27       4684    88804
    ## 18 Egypt                   5.20       4931    94875
    ## 19 Syria                   5.08         48      944
    ## 20 Mali                    4.87        124     2546

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 948.       9859   10.4 
    ##  2 United Kingdom          744.      46364   62.3 
    ##  3 Peru                    669.      20007   29.9 
    ##  4 Spain                   613.      28499   46.5 
    ##  5 Sweden                  603.       5760    9.56
    ##  6 Chile                   585.       9792   16.7 
    ##  7 Italy                   583.      35181   60.3 
    ##  8 United States           503.     156050  310.  
    ##  9 Brazil                  476.      95819  201.  
    ## 10 France                  466.      30182   64.8 
    ## 11 Mexico                  435.      48869  112.  
    ## 12 Ecuador                 395.       5847   14.8 
    ## 13 Netherlands             370.       6153   16.6 
    ## 14 Bolivia                 334.       3320    9.95
    ## 15 Canada                  266.       8958   33.7 
    ## 16 Kyrgyzstan              263.       1447    5.51
    ## 17 Colombia                237.      11315   47.8 
    ## 18 Iran                    231.      17802   76.9 
    ## 19 Switzerland             225.       1705    7.58
    ## 20 South Africa            190.       9298   49

EOL
