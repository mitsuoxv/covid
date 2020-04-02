WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-02

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
    ##  1 United States            5624.   163199             29
    ##  2 Spain                    3143.    94417             30
    ##  3 Italy                    2781.   105792             38
    ##  4 Germany                  2169.    67366             31
    ##  5 France                   1710.    51477             30
    ##  6 Iran                     1270.    44606             35
    ##  7 China                    1144.    82631             72
    ##  8 Turkey                    953.    13531             14
    ##  9 United Kingdom            927.    25154             27
    ## 10 Belgium                   487.    12775             26
    ## 11 Netherlands               480.    12595             26
    ## 12 Portugal                  386.     7443             19
    ## 13 Canada                    378.     7695             20
    ## 14 Brazil                    248.     4579             18
    ## 15 South Korea               233.     9887             42
    ## 16 Australia                 209.     4707             22
    ## 17 Chile                     161.     2738             16
    ## 18 Czech Republic            160.     3308             20
    ## 19 Russia                    156.     2337             14
    ## 20 Ecuador                   149.     2240             14

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        67.6               2030.              30
    ##  2 Belgium                      46.8               1228.              26
    ##  3 Italy                        46.1               1753.              38
    ##  4 Portugal                     36.1                697.              19
    ##  5 Netherlands                  28.8                757.              26
    ##  6 Germany                      26.5                824.              31
    ##  7 France                       26.4                795.              30
    ##  8 United States                18.1                526.              29
    ##  9 Iran                         16.5                580.              35
    ## 10 Czech Republic               15.2                316.              20
    ## 11 United Kingdom               14.9                403.              27
    ## 12 Turkey                       12.2                174.              14
    ## 13 Canada                       11.2                228.              20
    ## 14 Ecuador                      10.1                151.              14
    ## 15 Australia                     9.71               219.              22
    ## 16 Chile                         9.64               163.              16
    ## 17 Greece                        5.48               119.              18
    ## 18 Romania                       5.37               102.              18
    ## 19 South Korea                   4.81               204.              42
    ## 20 Malaysia                      4.07                97.8             23

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  11.7       12430   105792
    ##  2 Indonesia               8.90        136     1528
    ##  3 Spain                   8.67       8189    94417
    ##  4 Netherlands             8.25       1039    12595
    ##  5 Iraq                    7.20         50      694
    ##  6 United Kingdom          7.11       1789    25154
    ##  7 France                  6.83       3514    51477
    ##  8 Iran                    6.50       2898    44606
    ##  9 Egypt                   6.48         46      710
    ## 10 Algeria                 5.99         35      584
    ## 11 Morocco                 5.64         36      638
    ## 12 Belgium                 5.52        705    12775
    ## 13 Burkina Faso            5.36         14      261
    ## 14 Philippines             4.22         88     2084
    ## 15 China                   4.02       3321    82631
    ## 16 Greece                  3.73         49     1314
    ## 17 Brazil                  3.47        159     4579
    ## 18 Ecuador                 3.35         75     2240
    ## 19 Romania                 3.07         69     2245
    ## 20 Japan                   2.62         57     2178

EOL
