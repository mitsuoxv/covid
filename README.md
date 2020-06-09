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

Updated: 2020-06-10

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
    ##  1 United States           19729.  1933560             98
    ##  2 Brazil                   7950.   691758             87
    ##  3 Russia                   5845.   485253             83
    ##  4 India                    3063.   266598             87
    ##  5 United Kingdom           2993.   287403             96
    ##  6 Spain                    2440.   241717             99
    ##  7 Peru                     2366.   196515             83
    ##  8 Italy                    2198.   235278            107
    ##  9 Turkey                   2059.   171121             83
    ## 10 Germany                  1844.   184543            100
    ## 11 Iran                     1670.   173832            104
    ## 12 Chile                    1632.   138846             85
    ## 13 France                   1517.   150413             99
    ## 14 Mexico                   1427.   117103             82
    ## 15 Pakistan                 1272.   108317             85
    ## 16 Saudi Arabia             1209.   105283             87
    ## 17 Canada                   1074.    95699             89
    ## 18 Bangladesh               1068.    68504             64
    ## 19 Belarus                   694.    49453             71
    ## 20 Belgium                   624.    59348             95

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             97.4               8291.             85
    ##  2 Peru                              79.1               6571.             83
    ##  3 Belarus                           71.7               5106.             71
    ##  4 United States                     63.6               6233.             98
    ##  5 Belgium                           59.9               5705.             95
    ##  6 Spain                             52.5               5198.             99
    ##  7 Sweden                            49.6               4723.             95
    ##  8 United Kingdom                    48.0               4610.             96
    ##  9 Saudi Arabia                      47.0               4092.             87
    ## 10 Switzerland                       42.6               4075.             95
    ## 11 Russia                            41.5               3449.             83
    ## 12 Brazil                            39.5               3440.             87
    ## 13 Portugal                          37.0               3268.             88
    ## 14 Italy                             36.4               3899.            107
    ## 15 Ecuador                           35.2               2933.             83
    ## 16 Canada                            31.9               2842.             89
    ## 17 Netherlands                       30.1               2868.             95
    ## 18 Israel                            27.7               2436.             87
    ## 19 Turkey                            26.5               2199.             83
    ## 20 Dominican Republic                25.9               2049.             78

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  22.6         113      500
    ##  2 France                 19.4       29149   150413
    ##  3 Belgium                16.2        9609    59348
    ##  4 Italy                  14.4       33964   235278
    ##  5 United Kingdom         14.1       40597   287403
    ##  6 Hungary                13.7         548     4014
    ##  7 Netherlands            12.6        6016    47739
    ##  8 Mexico                 11.7       13699   117103
    ##  9 Spain                  11.2       27136   241717
    ## 10 Sweden                 10.4        4694    45133
    ## 11 Ecuador                 8.40       3642    43378
    ## 12 Chad                    8.34         70      839
    ## 13 Canada                  8.15       7800    95699
    ## 14 Algeria                 6.97        715    10265
    ## 15 Niger                   6.68         65      973
    ## 16 Romania                 6.47       1334    20604
    ## 17 Greece                  5.97        182     3049
    ## 18 Sudan                   5.96        372     6244
    ## 19 Burkina Faso            5.96         53      890
    ## 20 Mali                    5.95         92     1547

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                924.        9609   10.4 
    ##  2 United Kingdom         651.       40597   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  563.       33964   60.3 
    ##  5 Sweden                 491.        4694    9.56
    ##  6 France                 450.       29149   64.8 
    ##  7 Netherlands            361.        6016   16.6 
    ##  8 United States          355.      110220  310.  
    ##  9 Ecuador                246.        3642   14.8 
    ## 10 Canada                 232.        7800   33.7 
    ## 11 Switzerland            219.        1660    7.58
    ## 12 Peru                   183.        5465   29.9 
    ## 13 Brazil                 181.       36455  201.  
    ## 14 Portugal               139.        1485   10.7 
    ## 15 Chile                  135.        2264   16.7 
    ## 16 Mexico                 122.       13699  112.  
    ## 17 Iran                   109.        8351   76.9 
    ## 18 Denmark                108.         593    5.48
    ## 19 Germany                106.        8711   81.8 
    ## 20 Austria                 81.9        672    8.20

EOL
