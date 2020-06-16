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

Updated: 2020-06-17

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
    ##  1 United States           19805.  2079592            105
    ##  2 Brazil                   9229.   867624             94
    ##  3 Russia                   6059.   545458             90
    ##  4 India                    3649.   343091             94
    ##  5 United Kingdom           2881    296861            103
    ##  6 Peru                     2551.   229736             90
    ##  7 Spain                    2302.   244109            106
    ##  8 Italy                    2080.   237290            114
    ##  9 Turkey                   1996    179831             90
    ## 10 Chile                    1949.   179436             92
    ## 11 Germany                  1745.   186839            107
    ## 12 Iran                     1709.   189876            111
    ## 13 Mexico                   1649.   146837             89
    ## 14 Pakistan                 1617.   148921             92
    ## 15 France                   1440.   152819            106
    ## 16 Saudi Arabia             1404.   132048             94
    ## 17 Bangladesh               1275.    90619             71
    ## 18 Canada                   1028.    98787             96
    ## 19 South Africa              816.    73533             90
    ## 20 Belarus                   699.    54680             78

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            116.               10715.             92
    ##  2 Peru                              85.3               7682.             90
    ##  3 Belarus                           72.2               5646.             78
    ##  4 United States                     63.8               6703.            105
    ##  5 Belgium                           56.5               5777.            102
    ##  6 Saudi Arabia                      54.6               5132.             94
    ##  7 Sweden                            53.6               5482.            102
    ##  8 Spain                             49.5               5249.            106
    ##  9 United Kingdom                    46.2               4761.            103
    ## 10 Brazil                            45.9               4314.             94
    ## 11 Russia                            43.1               3877.             90
    ## 12 Switzerland                       39.9               4096.            102
    ## 13 Portugal                          36.4               3469.             95
    ## 14 Ecuador                           35.4               3199.             90
    ## 15 Italy                             34.5               3933.            114
    ## 16 Canada                            30.5               2933.             96
    ## 17 Netherlands                       28.7               2931.            102
    ## 18 Dominican Republic                27.6               2369.             85
    ## 19 Israel                            27.4               2600.             94
    ## 20 Turkey                            25.7               2311.             90

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  24.6         209      848
    ##  2 France                 19.2       29373   152819
    ##  3 Belgium                16.1        9661    60100
    ##  4 Italy                  14.5       34371   237290
    ##  5 United Kingdom         14.1       41736   296861
    ##  6 Hungary                13.9         565     4077
    ##  7 Netherlands            12.4        6059    48783
    ##  8 Mexico                 11.7       17141   146837
    ##  9 Spain                  11.1       27136   244109
    ## 10 Sweden                  9.34       4891    52383
    ## 11 Chad                    8.59         73      850
    ## 12 Ecuador                 8.30       3929    47322
    ## 13 Canada                  8.25       8146    98787
    ## 14 Algeria                 7.04        777    11031
    ## 15 Niger                   6.73         66      980
    ## 16 Romania                 6.44       1427    22165
    ## 17 Sudan                   6.29        468     7435
    ## 18 Burkina Faso            5.93         53      894
    ## 19 Greece                  5.87        184     3134
    ## 20 Indonesia               5.59       2198    39294

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                929.        9661   10.4 
    ##  2 United Kingdom         669.       41736   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  570.       34371   60.3 
    ##  5 Sweden                 512.        4891    9.56
    ##  6 France                 454.       29373   64.8 
    ##  7 United States          372.      115484  310.  
    ##  8 Netherlands            364.        6059   16.6 
    ##  9 Ecuador                266.        3929   14.8 
    ## 10 Canada                 242.        8146   33.7 
    ## 11 Peru                   224.        6688   29.9 
    ## 12 Switzerland            221.        1676    7.58
    ## 13 Brazil                 215.       43332  201.  
    ## 14 Chile                  201.        3362   16.7 
    ## 15 Mexico                 152.       17141  112.  
    ## 16 Portugal               142.        1520   10.7 
    ## 17 Iran                   116.        8950   76.9 
    ## 18 Denmark                109.         598    5.48
    ## 19 Germany                108.        8800   81.8 
    ## 20 Austria                 82.6        678    8.20

EOL
