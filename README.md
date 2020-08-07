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

Updated: 2020-08-08

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
    ##  1 United States           30455.  4781612            157
    ##  2 Brazil                  19582.  2859073            146
    ##  3 India                   13883.  2027074            146
    ##  4 Russia                   6176.   877135            142
    ##  5 South Africa             3789.   538184            142
    ##  6 Mexico                   3234.   456100            141
    ##  7 Peru                     3151.   447624            142
    ##  8 Chile                    2545.   366671            144
    ##  9 Colombia                 2451.   345714            141
    ## 10 Bangladesh               2029.   249651            123
    ## 11 United Kingdom           1987.   308138            155
    ## 12 Iran                     1963.   320117            163
    ## 13 Pakistan                 1962.   282645            144
    ## 14 Spain                    1960.   309855            158
    ## 15 Saudi Arabia             1946.   284226            146
    ## 16 Turkey                   1670.   237265            142
    ## 17 Argentina                1575.   220682            140
    ## 18 Italy                    1500.   249204            166
    ## 19 Germany                  1346.   214214            159
    ## 20 France                   1158.   183172            158

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            152.               21895.            144
    ##  2 Peru                             105.               14967.            142
    ##  3 United States                     98.2              15413.            157
    ##  4 Brazil                            97.4              14217.            146
    ##  5 South Africa                      77.3              10983.            142
    ##  6 Saudi Arabia                      75.6              11046.            146
    ##  7 Israel                            72.7              10636.            146
    ##  8 Bolivia                           66.3               8559.            129
    ##  9 Dominican Republic                56.7               7791.            137
    ## 10 Sweden                            55.6               8578.            154
    ## 11 Kyrgyzstan                        54.5               7109.            130
    ## 12 Belarus                           54.3               7073.            130
    ## 13 Colombia                          51.3               7234.            141
    ## 14 Kazakhstan                        51.3               6879.            134
    ## 15 Belgium                           44.8               6914.            154
    ## 16 Russia                            43.9               6234.            142
    ## 17 Ecuador                           43.0               6121.            142
    ## 18 Honduras                          43.0               5645.            131
    ## 19 Spain                             42.2               6663.            158
    ## 20 Argentina                         38.1               5338.            140

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         509     1767
    ##  2 France                 16.5       30189   183172
    ##  3 United Kingdom         15.1       46413   308138
    ##  4 Italy                  14.1       35187   249204
    ##  5 Belgium                13.7        9861    71923
    ##  6 Hungary                13.1         600     4597
    ##  7 Mexico                 10.9       49698   456100
    ##  8 Netherlands            10.8        6153    56982
    ##  9 Spain                   9.20      28500   309855
    ## 10 Chad                    8.07         76      942
    ## 11 Canada                  7.58       8962   118187
    ## 12 Sweden                  7.03       5766    81967
    ## 13 Ecuador                 6.49       5877    90537
    ## 14 Sudan                   6.49        769    11850
    ## 15 Niger                   5.98         69     1153
    ## 16 Iran                    5.62      17976   320117
    ## 17 China                   5.27       4687    88937
    ## 18 Egypt                   5.21       4951    95006
    ## 19 Mali                    4.86        124     2552
    ## 20 Syria                   4.80         48      999

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 948.       9861   10.4 
    ##  2 United Kingdom          744.      46413   62.3 
    ##  3 Peru                    676.      20228   29.9 
    ##  4 Spain                   613.      28500   46.5 
    ##  5 Sweden                  603.       5766    9.56
    ##  6 Chile                   591.       9889   16.7 
    ##  7 Italy                   583.      35187   60.3 
    ##  8 United States           507.     157357  310.  
    ##  9 Brazil                  484.      97256  201.  
    ## 10 France                  466.      30189   64.8 
    ## 11 Mexico                  442.      49698  112.  
    ## 12 Ecuador                 397.       5877   14.8 
    ## 13 Netherlands             370.       6153   16.6 
    ## 14 Bolivia                 340.       3385    9.95
    ## 15 Canada                  266.       8962   33.7 
    ## 16 Kyrgyzstan              263.       1451    5.51
    ## 17 Colombia                243.      11624   47.8 
    ## 18 Iran                    234.      17976   76.9 
    ## 19 Switzerland             225.       1708    7.58
    ## 20 South Africa            196        9604   49

EOL
