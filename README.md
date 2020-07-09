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

Updated: 2020-07-10

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

    ## `summarise()` regrouping output by 'publish_date' (override with `.groups` argument)

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           23231.  2973695            128
    ##  2 Brazil                  14260.  1668589            117
    ##  3 India                    6557.   767296            117
    ##  4 Russia                   6258    707301            113
    ##  5 Peru                     2736.   309278            113
    ##  6 Chile                    2634.   303083            115
    ##  7 Mexico                   2392.   268008            112
    ##  8 United Kingdom           2277.   286983            126
    ##  9 Pakistan                 2093.   240848            115
    ## 10 South Africa             1987.   224665            113
    ## 11 Spain                    1957.   252513            129
    ## 12 Saudi Arabia             1881.   220144            117
    ## 13 Iran                     1853.   248379            134
    ## 14 Turkey                   1847.   208938            113
    ## 15 Bangladesh               1830.   172134             94
    ## 16 Italy                    1767.   242149            137
    ## 17 Germany                  1520.   197783            130
    ## 18 France                   1241.   160279            129
    ## 19 Colombia                 1111.   124494            112
    ## 20 Canada                    891    106167            119

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               18098.            115
    ##  2 Peru                              91.5              10341.            113
    ##  3 United States                     74.9               9585.            128
    ##  4 Saudi Arabia                      73.1               8555.            117
    ##  5 Brazil                            70.9               8297.            117
    ##  6 Belarus                           65.5               6631.            101
    ##  7 Sweden                            61.7               7729.            125
    ##  8 Belgium                           47.8               5980.            125
    ##  9 Russia                            44.5               5027.            113
    ## 10 Spain                             42.1               5430.            129
    ## 11 Bolivia                           41.7               4176.            100
    ## 12 South Africa                      40.6               4585             113
    ## 13 Ecuador                           37.7               4276.            113
    ## 14 Israel                            37.6               4425.            117
    ## 15 Dominican Republic                37.1               4030.            108
    ## 16 United Kingdom                    36.5               4603.            126
    ## 17 Portugal                          35.5               4202.            118
    ## 18 Switzerland                       34.0               4276.            125
    ## 19 Kazakhstan                        32.8               3456.            105
    ## 20 Honduras                          31.1               3183.            102

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.5         352     1328
    ##  2 France                 18.6       29873   160279
    ##  3 Belgium                15.7        9778    62210
    ##  4 United Kingdom         15.5       44517   286983
    ##  5 Italy                  14.4       34914   242149
    ##  6 Hungary                14.0         589     4210
    ##  7 Netherlands            12.1        6126    50691
    ##  8 Mexico                 11.9       32014   268008
    ##  9 Spain                  11.2       28396   252513
    ## 10 Chad                    8.48         74      873
    ## 11 Canada                  8.20       8711   106167
    ## 12 Ecuador                 7.70       4873    63245
    ## 13 Sweden                  7.42       5482    73858
    ## 14 Sudan                   6.31        636    10084
    ## 15 Niger                   6.20         68     1097
    ## 16 Romania                 6.02       1817    30175
    ## 17 Algeria                 5.64        978    17348
    ## 18 Angola                  5.56         22      396
    ## 19 China                   5.44       4648    85399
    ## 20 Greece                  5.33        193     3622

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9778   10.4 
    ##  2 United Kingdom          714.      44517   62.3 
    ##  3 Spain                   611.      28396   46.5 
    ##  4 Italy                   579.      34914   60.3 
    ##  5 Sweden                  574.       5482    9.56
    ##  6 France                  461.      29873   64.8 
    ##  7 United States           422.     130893  310.  
    ##  8 Chile                   393.       6573   16.7 
    ##  9 Netherlands             368.       6126   16.6 
    ## 10 Peru                    366.      10952   29.9 
    ## 11 Brazil                  332.      66741  201.  
    ## 12 Ecuador                 329.       4873   14.8 
    ## 13 Mexico                  285.      32014  112.  
    ## 14 Canada                  259.       8711   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Iran                    157.      12084   76.9 
    ## 17 Bolivia                 154.       1530    9.95
    ## 18 Portugal                153.       1631   10.7 
    ## 19 Denmark                 111.        609    5.48
    ## 20 Germany                 111.       9048   81.8

EOL
