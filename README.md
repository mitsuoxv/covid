WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-03

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

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           17784.  1067127             60
    ##  2 Spain                    3526.   215216             61
    ##  3 United Kingdom           3058.   177458             58
    ##  4 Italy                    3004.   207428             69
    ##  5 Russia                   2753.   124054             45
    ##  6 Turkey                   2716.   122392             45
    ##  7 Germany                  2606.   161703             62
    ##  8 France                   2107.   128722             61
    ##  9 Brazil                   1740.    85380             49
    ## 10 Iran                     1447.    95646             66
    ## 11 Canada                   1049.    53657             51
    ## 12 Belgium                   858.    49032             57
    ## 13 Peru                      818.    36976             45
    ## 14 China                     817.    84388            103
    ## 15 India                     760.    37336             49
    ## 16 Netherlands               696.    39791             57
    ## 17 Ecuador                   582.    26336             45
    ## 18 Portugal                  505.    25351             50
    ## 19 Saudi Arabia              490.    24097             49
    ## 20 Mexico                    434.    19224             44

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      82.5                4713.             57
    ##  2 Spain                        75.8                4628.             61
    ##  3 United States                57.3                3440.             60
    ##  4 Italy                        49.8                3438.             69
    ##  5 United Kingdom               49.0                2846.             58
    ##  6 Portugal                     47.3                2375.             50
    ##  7 Netherlands                  41.8                2391.             57
    ##  8 Ecuador                      39.3                1781.             45
    ##  9 Turkey                       34.9                1573.             45
    ## 10 France                       32.5                1987.             61
    ## 11 Germany                      31.9                1977.             62
    ## 12 Canada                       31.2                1593.             51
    ## 13 Peru                         27.4                1236.             45
    ## 14 Chile                        21.4                1016.             47
    ## 15 Russia                       19.6                 882.             45
    ## 16 Saudi Arabia                 19.0                 936.             49
    ## 17 Iran                         18.8                1243.             66
    ## 18 Czech Republic               14.3                 739.             51
    ## 19 Romania                      11.6                 572.             49
    ## 20 Brazil                        8.65                425.             49

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.1       24560   128722
    ##  2 Belgium                15.7        7703    49032
    ##  3 United Kingdom         15.5       27510   177458
    ##  4 Italy                  13.6       28236   207428
    ##  5 Netherlands            12.3        4893    39791
    ##  6 Spain                  11.5       24824   215216
    ##  7 Algeria                10.9         453     4154
    ##  8 Mexico                  9.67       1859    19224
    ##  9 Indonesia               7.58        800    10551
    ## 10 Brazil                  6.91       5901    85380
    ## 11 Egypt                   6.89        406     5895
    ## 12 Burkina Faso            6.78         44      649
    ## 13 Sudan                   6.75         36      533
    ## 14 Philippines             6.60        579     8772
    ## 15 Iran                    6.37       6091    95646
    ## 16 Canada                  6.01       3223    53657
    ## 17 Romania                 5.92        744    12567
    ## 18 China                   5.50       4643    84388
    ## 19 Greece                  5.40        140     2591
    ## 20 United States           5.38      57406  1067127

EOL
