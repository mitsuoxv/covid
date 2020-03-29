WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-03-30

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
    ##  1 United States            3970.   103321             26
    ##  2 Spain                    2672.    72248             27
    ##  3 Italy                    2639.    92472             35
    ##  4 Germany                  1872.    52547             28
    ##  5 France                   1369.    37145             27
    ##  6 China                    1190.    82356             69
    ##  7 Iran                     1102.    35408             32
    ##  8 United Kingdom            707.    17093             24
    ##  9 Turkey                    656.     7402             11
    ## 10 Netherlands               419.     9762             23
    ## 11 Belgium                   392.     9134             23
    ## 12 Portugal                  316.     5170             16
    ## 13 Canada                    272.     4757             17
    ## 14 South Korea               243.     9583             39
    ## 15 Brazil                    220.     3417             15
    ## 16 Australia                 203.     3966             19
    ## 17 Ecuador                   152.     1823             11
    ## 18 Czech Republic            150.     2663             17
    ## 19 Chile                     135.     1909             13
    ## 20 Russia                    126.     1534             11

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        57.4               1554.              27
    ##  2 Italy                        43.7               1533.              35
    ##  3 Belgium                      37.7                878.              23
    ##  4 Portugal                     29.6                484.              16
    ##  5 Netherlands                  25.2                586.              23
    ##  6 Germany                      22.9                642.              28
    ##  7 France                       21.1                574.              27
    ##  8 Iran                         14.3                460.              32
    ##  9 Czech Republic               14.3                254.              17
    ## 10 United States                12.8                333.              26
    ## 11 United Kingdom               11.3                274.              24
    ## 12 Ecuador                      10.3                123.              11
    ## 13 Australia                     9.43               184.              19
    ## 14 Turkey                        8.43                95.1             11
    ## 15 Canada                        8.07               141.              17
    ## 16 Chile                         8.05               114.              13
    ## 17 Greece                        5.05                96.5             15
    ## 18 South Korea                   5.02               198.              39
    ## 19 Romania                       4.03                66.1             15
    ## 20 Malaysia                      3.90                82.1             20

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Italy                  10.8       10023    92472
    ##  2 Indonesia               8.83        102     1155
    ##  3 Iraq                    8.30         42      506
    ##  4 Spain                   7.88       5690    72248
    ##  5 Iran                    7.11       2517    35408
    ##  6 Netherlands             6.55        639     9762
    ##  7 Algeria                 6.36         26      409
    ##  8 Philippines             6.33         68     1075
    ##  9 Egypt                   6.25         36      576
    ## 10 France                  6.22       2311    37145
    ## 11 United Kingdom          5.96       1019    17093
    ## 12 Morocco                 5.95         26      437
    ## 13 China                   4.01       3306    82356
    ## 14 Belgium                 3.86        353     9134
    ## 15 Japan                   3.07         52     1693
    ## 16 Greece                  3.02         32     1061
    ## 17 Brazil                  2.69         92     3417
    ## 18 Ecuador                 2.63         48     1823
    ## 19 India                   2.55         25      979
    ## 20 Argentina               2.46         17      690

EOL
