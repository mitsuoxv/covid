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

Updated: 2020-06-03

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

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           19599.  1783638             91
    ##  2 Brazil                   6434.   514849             80
    ##  3 Russia                   5574.   423741             76
    ##  4 United Kingdom           3104.   276336             89
    ##  5 Spain                    2608.   240010             92
    ##  6 India                    2482.   198706             80
    ##  7 Italy                    2331.   233197            100
    ##  8 Turkey                   2166.   164769             76
    ##  9 Peru                     2162.   164476             76
    ## 10 Germany                  1956.   182028             93
    ## 11 France                   1615.   148775             92
    ## 12 Iran                     1591.   154445             97
    ## 13 Chile                    1346.   105159             78
    ## 14 Mexico                   1207.    90664             75
    ## 15 Canada                   1112.    91351             82
    ## 16 Saudi Arabia             1088.    87142             80
    ## 17 Pakistan                  977.    76398             78
    ## 18 Bangladesh                867.    49534             57
    ## 19 Belgium                   664.    58517             88
    ## 20 China                     629.    84597            134

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Chile                         80.4               6279.             78
    ##  2 Peru                          72.3               5500.             76
    ##  3 Belgium                       63.8               5625.             88
    ##  4 United States                 63.2               5749.             91
    ##  5 Spain                         56.1               5161.             92
    ##  6 United Kingdom                49.8               4432.             89
    ##  7 Saudi Arabia                  42.3               3387.             80
    ##  8 Russia                        39.6               3012.             76
    ##  9 Italy                         38.6               3865.            100
    ## 10 Portugal                      37.7               3063.             81
    ## 11 Ecuador                       34.6               2643.             76
    ## 12 Canada                        33.0               2712.             82
    ## 13 Brazil                        32.0               2560.             80
    ## 14 Netherlands                   31.7               2796.             88
    ## 15 Turkey                        27.8               2118.             76
    ## 16 France                        24.9               2297.             92
    ## 17 Germany                       23.9               2225.             93
    ## 18 Iran                          20.7               2008.             97
    ## 19 Kazakhstan                    11.0                754.             68
    ## 20 Romania                       11.0                883.             80

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.7          85      358
    ##  2 France                 19.3       28776   148775
    ##  3 Belgium                16.2        9486    58517
    ##  4 Italy                  14.4       33475   233197
    ##  5 United Kingdom         14.1       39045   276336
    ##  6 Netherlands            12.8        5962    46545
    ##  7 Spain                  12.4       29858   240010
    ##  8 Mexico                 11.0        9930    90664
    ##  9 Ecuador                 8.59       3358    39098
    ## 10 Chad                    8.35         66      790
    ## 11 Canada                  8.00       7305    91351
    ## 12 Algeria                 6.95        661     9513
    ## 13 Niger                   6.68         64      958
    ## 14 Romania                 6.59       1279    19398
    ## 15 Indonesia               6.09       1641    26940
    ## 16 Burkina Faso            6.00         53      883
    ## 17 Greece                  6.00        175     2917
    ## 18 Mali                    5.93         78     1315
    ## 19 United States           5.84     104247  1783638
    ## 20 Sudan                   5.76        298     5173

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                912.        9486    10.4
    ##  2 Spain                  642.       29858    46.5
    ##  3 United Kingdom         626.       39045    62.3
    ##  4 Italy                  555.       33475    60.3
    ##  5 France                 444.       28776    64.8
    ##  6 Netherlands            358.        5962    16.6
    ##  7 United States          336.      104247   310. 
    ##  8 Ecuador                227.        3358    14.8
    ##  9 Canada                 217.        7305    33.7
    ## 10 Peru                   151.        4506    29.9
    ## 11 Brazil                 146.       29314   201. 
    ## 12 Portugal               133.        1424    10.7
    ## 13 Germany                104.        8522    81.8
    ## 14 Iran                   102.        7878    76.9
    ## 15 Mexico                  88.3       9930   112. 
    ## 16 Chile                   66.5       1113    16.7
    ## 17 Turkey                  58.6       4563    77.8
    ## 18 Romania                 58.2       1279    22.0
    ## 19 Russia                  35.8       5037   141. 
    ## 20 Czech Republic          30.6        321    10.5

EOL
