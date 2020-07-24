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

Updated: 2020-07-25

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
    ##  1 United States           27538.  3938094            143
    ##  2 Brazil                  16874.  2227514            132
    ##  3 India                    9756.  1287945            132
    ##  4 Russia                   6255.   800849            128
    ##  5 South Africa             3187    408052            128
    ##  6 Peru                     2863.   366550            128
    ##  7 Mexico                   2852.   362274            127
    ##  8 Chile                    2605.   338759            130
    ##  9 United Kingdom           2107.   297150            141
    ## 10 Pakistan                 2079.   270400            130
    ## 11 Bangladesh               1982.   216110            109
    ## 12 Saudi Arabia             1972.   260394            132
    ## 13 Iran                     1905.   284034            149
    ## 14 Spain                    1875.   270166            144
    ## 15 Turkey                   1743.   223315            128
    ## 16 Colombia                 1719.   218428            127
    ## 17 Italy                    1613.   245338            152
    ## 18 Germany                  1407.   204183            145
    ## 19 France                   1167.   168291            144
    ## 20 Argentina                1125.   141900            126

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               20229.            130
    ##  2 Peru                              95.7              12256.            128
    ##  3 United States                     88.8              12694.            143
    ##  4 Brazil                            83.9              11076.            132
    ##  5 Saudi Arabia                      76.6              10120.            132
    ##  6 South Africa                      65.0               8328.            128
    ##  7 Belarus                           59.2               6886.            116
    ##  8 Sweden                            58.8               8242.            140
    ##  9 Bolivia                           56.0               6447.            115
    ## 10 Israel                            55.8               7393.            132
    ## 11 Kyrgyzstan                        48.7               5672.            116
    ## 12 Dominican Republic                47.5               5865.            123
    ## 13 Russia                            44.5               5692.            128
    ## 14 Belgium                           44.4               6225.            140
    ## 15 Kazakhstan                        42.6               5116.            120
    ## 16 Ecuador                           41.2               5284.            128
    ## 17 Spain                             40.3               5809.            144
    ## 18 Honduras                          38.5               4519.            117
    ## 19 Colombia                          36.0               4571.            127
    ## 20 Portugal                          34.7               4625.            133

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.9         462     1658
    ##  2 France                 17.9       30069   168291
    ##  3 United Kingdom         15.3       45554   297150
    ##  4 Belgium                15.2        9812    64754
    ##  5 Italy                  14.3       35092   245338
    ##  6 Hungary                13.6         596     4398
    ##  7 Netherlands            11.7        6139    52404
    ##  8 Mexico                 11.4       41190   362274
    ##  9 Spain                  10.5       28429   270166
    ## 10 Chad                    8.20         75      915
    ## 11 Canada                  7.90       8870   112240
    ## 12 Sweden                  7.21       5676    78763
    ## 13 Ecuador                 6.96       5439    78148
    ## 14 Sudan                   6.33        715    11302
    ## 15 Niger                   6.14         69     1124
    ## 16 Syria                   5.99         35      584
    ## 17 China                   5.38       4656    86500
    ## 18 Iran                    5.31      15074   284034
    ## 19 Romania                 5.15       2126    41275
    ## 20 Switzerland             4.99       1693    33913

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 943.       9812   10.4 
    ##  2 United Kingdom          731.      45554   62.3 
    ##  3 Spain                   611.      28429   46.5 
    ##  4 Sweden                  594.       5676    9.56
    ##  5 Peru                    584.      17455   29.9 
    ##  6 Italy                   582.      35092   60.3 
    ##  7 Chile                   528.       8838   16.7 
    ##  8 France                  464.      30069   64.8 
    ##  9 United States           460.     142553  310.  
    ## 10 Brazil                  412.      82771  201.  
    ## 11 Netherlands             369.       6139   16.6 
    ## 12 Ecuador                 368.       5439   14.8 
    ## 13 Mexico                  366.      41190  112.  
    ## 14 Canada                  263.       8870   33.7 
    ## 15 Bolivia                 234.       2328    9.95
    ## 16 Switzerland             223.       1693    7.58
    ## 17 Kyrgyzstan              220.       1211    5.51
    ## 18 Iran                    196.      15074   76.9 
    ## 19 Portugal                160.       1705   10.7 
    ## 20 Colombia                154.       7373   47.8

EOL
