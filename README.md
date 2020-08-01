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

Updated: 2020-08-02

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
    ##  1 United States           29512.  4456389            151
    ##  2 Brazil                  18643.  2610102            140
    ##  3 India                   12113.  1695988            140
    ##  4 Russia                   6215.   845443            136
    ##  5 South Africa             3625.   493183            136
    ##  6 Mexico                   3082.   416179            135
    ##  7 Peru                     2995.   407492            136
    ##  8 Chile                    2576.   355667            138
    ##  9 Colombia                 2118.   286020            135
    ## 10 United Kingdom           2034.   303185            149
    ## 11 Bangladesh               2030.   237661            117
    ## 12 Pakistan                 2015.   278305            138
    ## 13 Saudi Arabia             1970.   275905            140
    ## 14 Iran                     1937.   304204            157
    ## 15 Spain                    1897.   288522            152
    ## 16 Turkey                   1696.   230873            136
    ## 17 Italy                    1546.   247537            160
    ## 18 Argentina                1382.   185373            134
    ## 19 Germany                  1369.   209653            153
    ## 20 France                   1156.   175920            152

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            154.               21238.            138
    ##  2 Peru                             100.               13625.            136
    ##  3 United States                     95.1              14365.            151
    ##  4 Brazil                            92.7              12979.            140
    ##  5 Saudi Arabia                      76.6              10722.            140
    ##  6 South Africa                      74.0              10065.            136
    ##  7 Israel                            66.4               9314.            140
    ##  8 Bolivia                           61.4               7563.            123
    ##  9 Sweden                            56.8               8416.            148
    ## 10 Belarus                           56.3               7001.            124
    ## 11 Dominican Republic                53.9               7090.            131
    ## 12 Kyrgyzstan                        53.0               6589.            124
    ## 13 Kazakhstan                        46.0               5891.            128
    ## 14 Belgium                           44.5               6600.            148
    ## 15 Colombia                          44.3               5985.            135
    ## 16 Russia                            44.2               6009.            136
    ## 17 Ecuador                           42.4               5771.            136
    ## 18 Honduras                          41.4               5185.            125
    ## 19 Spain                             40.8               6204.            152
    ## 20 Portugal                          33.9               4784.            141

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         494     1732
    ##  2 France                 17.1       30147   175920
    ##  3 United Kingdom         15.2       46119   303185
    ##  4 Belgium                14.3        9841    68658
    ##  5 Italy                  14.2       35141   247537
    ##  6 Hungary                13.2         596     4505
    ##  7 Netherlands            11.3        6147    54301
    ##  8 Mexico                 11.1       46000   416179
    ##  9 Spain                   9.86      28445   288522
    ## 10 Chad                    8.01         75      936
    ## 11 Canada                  7.71       8929   115799
    ## 12 Sweden                  7.14       5743    80422
    ## 13 Ecuador                 6.68       5702    85355
    ## 14 Sudan                   6.41        746    11644
    ## 15 Niger                   6.07         69     1136
    ## 16 Syria                   5.68         43      757
    ## 17 Iran                    5.51      16766   304204
    ## 18 China                   5.30       4668    88122
    ## 19 Egypt                   5.11       4805    94078
    ## 20 Mali                    4.92        124     2522

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 946.       9841   10.4 
    ##  2 United Kingdom          740.      46119   62.3 
    ##  3 Peru                    636.      19021   29.9 
    ##  4 Spain                   612.      28445   46.5 
    ##  5 Sweden                  601.       5743    9.56
    ##  6 Italy                   582.      35141   60.3 
    ##  7 Chile                   565.       9457   16.7 
    ##  8 United States           488.     151265  310.  
    ##  9 France                  465.      30147   64.8 
    ## 10 Brazil                  454.      91263  201.  
    ## 11 Mexico                  409.      46000  112.  
    ## 12 Ecuador                 386.       5702   14.8 
    ## 13 Netherlands             369.       6147   16.6 
    ## 14 Bolivia                 291.       2894    9.95
    ## 15 Canada                  265.       8929   33.7 
    ## 16 Kyrgyzstan              254.       1397    5.51
    ## 17 Switzerland             225.       1703    7.58
    ## 18 Iran                    218.      16766   76.9 
    ## 19 Colombia                205.       9810   47.8 
    ## 20 Honduras                164.       1312    7.99

EOL
