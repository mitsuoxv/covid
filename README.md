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

Updated: 2020-06-13

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
    ##  1 United States           19688.  1988646            101
    ##  2 Brazil                   8581.   772416             90
    ##  3 Russia                   5945.   511423             86
    ##  4 India                    3305.   297535             90
    ##  5 United Kingdom           2942.   291413             99
    ##  6 Peru                     2426.   208823             86
    ##  7 Spain                    2378.   242707            102
    ##  8 Italy                    2146.   236142            110
    ##  9 Turkey                   2021.   174023             86
    ## 10 Germany                  1801.   185674            103
    ## 11 Chile                    1749.   154092             88
    ## 12 Iran                     1683.   180176            107
    ## 13 Mexico                   1518.   129184             85
    ## 14 France                   1483.   151503            102
    ## 15 Pakistan                 1424.   125521             88
    ## 16 Saudi Arabia             1288.   116021             90
    ## 17 Bangladesh               1163.    78052             67
    ## 18 Canada                   1054.    97125             92
    ## 19 Belarus                   698.    51816             74
    ## 20 South Africa              680.    58568             86

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            104.                9201.             88
    ##  2 Peru                              81.1               6982.             86
    ##  3 Belarus                           72.1               5350.             74
    ##  4 United States                     63.5               6410.            101
    ##  5 Belgium                           58.5               5740.             98
    ##  6 Sweden                            51.4               5053.             98
    ##  7 Spain                             51.1               5219.            102
    ##  8 Saudi Arabia                      50.1               4509.             90
    ##  9 United Kingdom                    47.2               4674.             99
    ## 10 Brazil                            42.7               3841.             90
    ## 11 Russia                            42.3               3635.             86
    ## 12 Switzerland                       41.4               4084.             98
    ## 13 Portugal                          36.8               3364.             91
    ## 14 Italy                             35.6               3914.            110
    ## 15 Ecuador                           34.8               3005.             86
    ## 16 Canada                            31.3               2884.             92
    ## 17 Netherlands                       29.5               2899.             98
    ## 18 Israel                            27.6               2510.             90
    ## 19 Dominican Republic                26.6               2182.             81
    ## 20 Turkey                            26.0               2237.             86

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.0         137      595
    ##  2 France                 19.3       29284   151503
    ##  3 Belgium                16.1        9636    59711
    ##  4 Italy                  14.5       34167   236142
    ##  5 United Kingdom         14.2       41279   291413
    ##  6 Hungary                13.7         553     4039
    ##  7 Netherlands            12.5        6044    48251
    ##  8 Mexico                 11.9       15357   129184
    ##  9 Spain                  11.2       27136   242707
    ## 10 Sweden                  9.97       4814    48288
    ## 11 Chad                    8.49         72      848
    ## 12 Ecuador                 8.37       3720    44440
    ## 13 Canada                  8.20       7960    97125
    ## 14 Algeria                 7.00        741    10589
    ## 15 Niger                   6.67         65      974
    ## 16 Romania                 6.46       1369    21182
    ## 17 Sudan                   6.14        413     6730
    ## 18 Burkina Faso            5.95         53      891
    ## 19 Greece                  5.93        183     3088
    ## 20 United States           5.67     112810  1988646

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                926.        9636   10.4 
    ##  2 United Kingdom         662.       41279   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  566.       34167   60.3 
    ##  5 Sweden                 504.        4814    9.56
    ##  6 France                 452.       29284   64.8 
    ##  7 United States          364.      112810  310.  
    ##  8 Netherlands            363.        6044   16.6 
    ##  9 Ecuador                252.        3720   14.8 
    ## 10 Canada                 236.        7960   33.7 
    ## 11 Switzerland            221.        1674    7.58
    ## 12 Peru                   197.        5903   29.9 
    ## 13 Brazil                 197.       39680  201.  
    ## 14 Chile                  158.        2648   16.7 
    ## 15 Portugal               141.        1504   10.7 
    ## 16 Mexico                 137.       15357  112.  
    ## 17 Iran                   112.        8584   76.9 
    ## 18 Denmark                108.         593    5.48
    ## 19 Germany                107.        8763   81.8 
    ## 20 Austria                 82.1        674    8.20

EOL
