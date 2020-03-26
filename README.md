WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest death rate areas](#highest-death-rate-areas)

Updated: 2020-03-26

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
“speed\_since\_100”, which is per day average newly confirmed cases
since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           2355.     51914             22
    ##  2 Italy                   2227.     69176             31
    ##  3 Spain                   1720.     39673             23
    ##  4 Germany                 1309.     31554             24
    ##  5 China                   1255.     81848             65
    ##  6 France                   949.     22025             23
    ##  7 Iran                     881.     24811             28
    ##  8 United Kingdom           398.      8081             20
    ##  9 Netherlands              286.      5560             19
    ## 10 South Korea              258.      9137             35
    ## 11 Turkey                   240.      1872              7
    ## 12 Belgium                  219.      4269             19
    ## 13 Brazil                   189.      2201             11
    ## 14 Portugal                 188.      2362             12
    ## 15 Australia                143.      2252             15
    ## 16 Ecuador                  128.      1049              7
    ## 17 Canada                   123.      1739             13
    ## 18 Czech Republic            98.3     1394             13
    ## 19 Malaysia                  94.2     1624             16
    ## 20 Pakistan                  89.3      991              9

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million. Highest
“speed\_std\_since\_100”, which is per day growth of cumulative cases
per 1 million since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        37.0                853.              23
    ##  2 Italy                        36.9               1146.              31
    ##  3 Belgium                      21.0                410.              19
    ##  4 Portugal                     17.6                221.              12
    ##  5 Netherlands                  17.2                334.              19
    ##  6 Germany                      16.0                386.              24
    ##  7 France                       14.7                340.              23
    ##  8 Iran                         11.5                323.              28
    ##  9 Czech Republic                9.38               133.              13
    ## 10 Ecuador                       8.63                70.9              7
    ## 11 United States                 7.59               167.              22
    ## 12 Australia                     6.63               105.              15
    ## 13 United Kingdom                6.39               130.              20
    ## 14 South Korea                   5.33               189.              35
    ## 15 Chile                         5.08                55.1              9
    ## 16 Greece                        4.26                67.5             11
    ## 17 Canada                        3.66                51.6             13
    ## 18 Malaysia                      3.33                57.4             16
    ## 19 Turkey                        3.09                24.1              7
    ## 20 Romania                       2.65                34.7             11

## Highest death rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “death rate”, which is cumulative deaths per
100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           death_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Italy                9.86       6820    69176
    ##  2 Iraq                 8.54         27      316
    ##  3 Indonesia            8.02         55      686
    ##  4 Iran                 7.79       1934    24811
    ##  5 Spain                6.80       2696    39673
    ##  6 Algeria              6.44         17      264
    ##  7 Philippines          6.34         35      552
    ##  8 United Kingdom       5.22        422     8081
    ##  9 France               4.99       1100    22025
    ## 10 Egypt                4.98         20      402
    ## 11 Netherlands          4.96        276     5560
    ## 12 China                4.02       3287    81848
    ## 13 Japan                3.60         43     1193
    ## 14 Belgium              2.86        122     4269
    ## 15 Greece               2.69         20      743
    ## 16 Ecuador              2.57         27     1049
    ## 17 Turkey               2.35         44     1872
    ## 18 Brazil               2.09         46     2201
    ## 19 Romania              1.44         11      762
    ## 20 Canada               1.44         25     1739

EOL
