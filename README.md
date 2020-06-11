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

Updated: 2020-06-12

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
    ##  1 United States           19682.  1968331            100
    ##  2 Brazil                   8308.   739503             89
    ##  3 Russia                   5909.   502436             85
    ##  4 India                    3219.   286579             89
    ##  5 United Kingdom           2959.   290147             98
    ##  6 Spain                    2398.   242280            101
    ##  7 Peru                     2395.   203736             85
    ##  8 Italy                    2162.   235763            109
    ##  9 Turkey                   2033.   173036             85
    ## 10 Germany                  1817.   185416            102
    ## 11 Chile                    1705.   148496             87
    ## 12 Iran                     1677.   177938            106
    ## 13 France                   1495.   151145            101
    ## 14 Mexico                   1478.   124301             84
    ## 15 Pakistan                 1372.   119536             87
    ## 16 Saudi Arabia             1261.   112288             89
    ## 17 Bangladesh               1132.    74865             66
    ## 18 Canada                   1061.    96653             91
    ## 19 Belarus                   697.    51066             73
    ## 20 South Africa              651.    55421             85

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            102.                8867.             87
    ##  2 Peru                              80.1               6812.             85
    ##  3 Belarus                           72.0               5273.             73
    ##  4 United States                     63.4               6345.            100
    ##  5 Belgium                           58.9               5726.             97
    ##  6 Spain                             51.6               5210.            101
    ##  7 Sweden                            50.4               4899.             97
    ##  8 Saudi Arabia                      49.0               4364.             89
    ##  9 United Kingdom                    47.5               4654.             98
    ## 10 Russia                            42.0               3571.             85
    ## 11 Switzerland                       41.8               4080.             97
    ## 12 Brazil                            41.3               3677.             89
    ## 13 Portugal                          36.9               3335.             90
    ## 14 Italy                             35.8               3907.            109
    ## 15 Ecuador                           35.2               3005.             85
    ## 16 Canada                            31.5               2870.             91
    ## 17 Netherlands                       29.7               2889.             97
    ## 18 Israel                            27.6               2484.             89
    ## 19 Dominican Republic                26.2               2118.             80
    ## 20 Turkey                            26.1               2224.             85

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.0         130      564
    ##  2 France                 19.4       29257   151145
    ##  3 Belgium                16.2        9629    59569
    ##  4 Italy                  14.5       34114   235763
    ##  5 United Kingdom         14.2       41128   290147
    ##  6 Hungary                13.7         551     4027
    ##  7 Netherlands            12.6        6042    48087
    ##  8 Mexico                 11.8       14649   124301
    ##  9 Spain                  11.2       27136   242280
    ## 10 Sweden                 10.2        4795    46814
    ## 11 Chad                    8.51         72      846
    ## 12 Ecuador                 8.37       3720    44440
    ## 13 Canada                  8.17       7897    96653
    ## 14 Algeria                 6.98        732    10484
    ## 15 Niger                   6.67         65      974
    ## 16 Romania                 6.49       1360    20945
    ## 17 Sudan                   6.09        401     6582
    ## 18 Greece                  5.96        183     3068
    ## 19 Burkina Faso            5.95         53      891
    ## 20 Bulgaria                5.78        167     2889

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                926.        9629   10.4 
    ##  2 United Kingdom         660.       41128   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  565.       34114   60.3 
    ##  5 Sweden                 502.        4795    9.56
    ##  6 France                 452.       29257   64.8 
    ##  7 Netherlands            363.        6042   16.6 
    ##  8 United States          361.      111978  310.  
    ##  9 Ecuador                252.        3720   14.8 
    ## 10 Canada                 234.        7897   33.7 
    ## 11 Switzerland            221.        1674    7.58
    ## 12 Peru                   192.        5738   29.9 
    ## 13 Brazil                 191.       38406  201.  
    ## 14 Chile                  148.        2475   16.7 
    ## 15 Portugal               140.        1495   10.7 
    ## 16 Mexico                 130.       14649  112.  
    ## 17 Iran                   111.        8506   76.9 
    ## 18 Denmark                108.         593    5.48
    ## 19 Germany                107.        8755   81.8 
    ## 20 Austria                 82.0        673    8.20

EOL
