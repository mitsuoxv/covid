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

Updated: 2020-08-18

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

WHO offers those numbers at [Data Table tab in its
Dashboard](https://covid19.who.int/table). Fortunately I can download a
csv file, whose URL is
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

The ugly codes I wrote are in R directory. Data in Table 1 (In China)
and Table 2 (World including China) are in table1.csv, table2.csv and
tables.rdata in data directory in this repository.

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

Here, I load Table 1 and Table 2. Beware Table 1 (in\_china) includes
total, but Table 2 (world) does not include subtotal or total.

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
    ##  1 United States           31624.  5312940            168
    ##  2 Brazil                  20994.  3317096            158
    ##  3 India                   16971.  2647663            156
    ##  4 Russia                   6063.   927745            153
    ##  5 South Africa             3838.   587345            153
    ##  6 Peru                     3436.   525803            153
    ##  7 Mexico                   3405.   517714            152
    ##  8 Colombia                 3004.   456689            152
    ##  9 Chile                    2505.   385946            154
    ## 10 Bangladesh               2063.   276549            134
    ## 11 Spain                    2040.   342813            168
    ## 12 Iran                     1972.   343203            174
    ## 13 United Kingdom           1906.   318488            167
    ## 14 Saudi Arabia             1901.   298542            157
    ## 15 Argentina                1889.   289100            153
    ## 16 Pakistan                 1877.   289215            154
    ## 17 Turkey                   1628.   249309            153
    ## 18 Italy                    1434.   253915            177
    ## 19 Germany                  1317.   224014            170
    ## 20 France                   1199.   205066            171

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            150.               23046.            154
    ##  2 Peru                             115.               17581.            153
    ##  3 Brazil                           104.               16494.            158
    ##  4 United States                    102.               17126.            168
    ##  5 Israel                            78.8              12551.            159
    ##  6 South Africa                      78.3              11987.            153
    ##  7 Saudi Arabia                      73.9              11602.            157
    ##  8 Bolivia                           71.6               9967.            139
    ##  9 Colombia                          62.9               9556.            152
    ## 10 Dominican Republic                59.6               8786.            147
    ## 11 Kazakhstan                        54.4               7898.            145
    ## 12 Kyrgyzstan                        54.3               7623.            140
    ## 13 Sweden                            53.4               8821.            165
    ## 14 Belarus                           50.8               7178.            141
    ## 15 Argentina                         45.7               6993.            153
    ## 16 Belgium                           45.2               7520.            166
    ## 17 Ecuador                           44.8               6865.            153
    ## 18 Honduras                          44.3               6256.            141
    ## 19 Spain                             43.9               7371.            168
    ## 20 Russia                            43.1               6594.            153

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         531     1873
    ##  2 France                 14.8       30278   205066
    ##  3 Italy                  13.9       35396   253915
    ##  4 United Kingdom         13.0       41366   318488
    ##  5 Belgium                12.7        9939    78230
    ##  6 Hungary                12.4         608     4916
    ##  7 Mexico                 10.9       56543   517714
    ##  8 Netherlands             9.79       6163    62943
    ##  9 Spain                   8.35      28617   342813
    ## 10 Chad                    7.95         76      956
    ## 11 Canada                  7.40       9024   121889
    ## 12 Sweden                  6.86       5783    84294
    ## 13 Sudan                   6.47        803    12410
    ## 14 Ecuador                 5.98       6070   101542
    ## 15 Niger                   5.91         69     1167
    ## 16 Iran                    5.72      19639   343203
    ## 17 Egypt                   5.35       5160    96475
    ## 18 China                   5.24       4710    89859
    ## 19 Peru                    4.96      26075   525803
    ## 20 Mali                    4.73        125     2640

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 955.       9939   10.4 
    ##  2 Peru                    872.      26075   29.9 
    ##  3 United Kingdom          663.      41366   62.3 
    ##  4 Chile                   624.      10452   16.7 
    ##  5 Spain                   615.      28617   46.5 
    ##  6 Sweden                  605.       5783    9.56
    ##  7 Italy                   587.      35396   60.3 
    ##  8 United States           543.     168345  310.  
    ##  9 Brazil                  533.     107232  201.  
    ## 10 Mexico                  503.      56543  112.  
    ## 11 France                  467.      30278   64.8 
    ## 12 Ecuador                 410.       6070   14.8 
    ## 13 Bolivia                 402.       4003    9.95
    ## 14 Netherlands             370.       6163   16.6 
    ## 15 Colombia                310.      14810   47.8 
    ## 16 Kyrgyzstan              272.       1496    5.51
    ## 17 Canada                  268.       9024   33.7 
    ## 18 Iran                    255.      19639   76.9 
    ## 19 South Africa            242.      11839   49   
    ## 20 Switzerland             226.       1715    7.58

EOL
