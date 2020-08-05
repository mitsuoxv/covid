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

Updated: 2020-08-06

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
    ##  1 United States           30184.  4678610            155
    ##  2 Brazil                  19099.  2750318            144
    ##  3 India                   13251.  1908254            144
    ##  4 Russia                   6189.   866627            140
    ##  5 South Africa             3723.   521318            140
    ##  6 Mexico                   3192.   443813            139
    ##  7 Peru                     3093.   433100            140
    ##  8 Chile                    2555.   362962            142
    ##  9 Colombia                 2358.   327850            139
    ## 10 Bangladesh               2016.   244020            121
    ## 11 United Kingdom           2001.   306297            153
    ## 12 Pakistan                 1979.   281136            142
    ## 13 Iran                     1954.   314786            161
    ## 14 Saudi Arabia             1954.   281435            144
    ## 15 Spain                    1940.   302814            156
    ## 16 Turkey                   1677.   234934            140
    ## 17 Italy                    1514.   248419            164
    ## 18 Argentina                1497.   206743            138
    ## 19 Germany                  1350.   212022            157
    ## 20 France                   1153.   180037            156

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            153.               21674.            142
    ##  2 Peru                             103.               14482.            140
    ##  3 United States                     97.3              15081.            155
    ##  4 Brazil                            95.0              13676.            144
    ##  5 South Africa                      76.0              10639.            140
    ##  6 Saudi Arabia                      75.9              10937.            144
    ##  7 Israel                            70.5              10174.            144
    ##  8 Bolivia                           64.7               8228.            127
    ##  9 Dominican Republic                55.8               7563.            135
    ## 10 Sweden                            55.8               8495.            152
    ## 11 Belarus                           54.9               7047.            128
    ## 12 Kyrgyzstan                        53.9               6918.            128
    ## 13 Colombia                          49.3               6860.            139
    ## 14 Kazakhstan                        46.8               6185.            132
    ## 15 Belgium                           44.6               6782.            152
    ## 16 Russia                            44.0               6159.            140
    ## 17 Ecuador                           42.4               5947.            140
    ## 18 Honduras                          42.4               5482.            129
    ## 19 Spain                             41.7               6511.            156
    ## 20 Argentina                         36.2               5001.            138

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.7         507     1764
    ##  2 France                 16.8       30176   180037
    ##  3 United Kingdom         15.1       46299   306297
    ##  4 Italy                  14.2       35171   248419
    ##  5 Belgium                14.0        9852    70555
    ##  6 Hungary                13.1         598     4553
    ##  7 Netherlands            11.0        6150    55955
    ##  8 Mexico                 10.8       48012   443813
    ##  9 Spain                   9.41      28498   302814
    ## 10 Chad                    8.00         75      938
    ## 11 Canada                  7.64       8947   117031
    ## 12 Sweden                  7.08       5747    81181
    ## 13 Ecuador                 6.60       5808    87963
    ## 14 Sudan                   6.48        763    11780
    ## 15 Niger                   5.99         69     1152
    ## 16 Iran                    5.60      17617   314786
    ## 17 China                   5.28       4683    88682
    ## 18 Egypt                   5.18       4912    94752
    ## 19 Syria                   5.16         46      892
    ## 20 Mali                    4.88        124     2543

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 947.       9852   10.4 
    ##  2 United Kingdom          743.      46299   62.3 
    ##  3 Peru                    662.      19811   29.9 
    ##  4 Spain                   613.      28498   46.5 
    ##  5 Sweden                  601.       5747    9.56
    ##  6 Italy                   583.      35171   60.3 
    ##  7 Chile                   582.       9745   16.7 
    ##  8 United States           499.     154952  310.  
    ##  9 Brazil                  471.      94665  201.  
    ## 10 France                  466.      30176   64.8 
    ## 11 Mexico                  427.      48012  112.  
    ## 12 Ecuador                 393.       5808   14.8 
    ## 13 Netherlands             369.       6150   16.6 
    ## 14 Bolivia                 325.       3228    9.95
    ## 15 Canada                  266.       8947   33.7 
    ## 16 Kyrgyzstan              261.       1438    5.51
    ## 17 Colombia                231.      11017   47.8 
    ## 18 Iran                    229.      17617   76.9 
    ## 19 Switzerland             225.       1705    7.58
    ## 20 South Africa            181.       8884   49

EOL
