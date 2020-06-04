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

Updated: 2020-06-05

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

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           19603.  1823220             93
    ##  2 Brazil                   6771.   555383             82
    ##  3 Russia                   5653.   441108             78
    ##  4 United Kingdom           3074.   279860             91
    ##  5 India                    2644.   216919             82
    ##  6 Spain                    2555.   240326             94
    ##  7 Italy                    2291.   233836            102
    ##  8 Peru                     2240.   174884             78
    ##  9 Turkey                   2131.   166422             78
    ## 10 Germany                  1922.   182764             95
    ## 11 Iran                     1622.   160696             99
    ## 12 France                   1575.   148263             94
    ## 13 Chile                    1418.   113628             80
    ## 14 Mexico                   1262.    97326             77
    ## 15 Saudi Arabia             1111.    91182             82
    ## 16 Canada                   1102.    92748             84
    ## 17 Pakistan                 1063.    85264             80
    ## 18 Bangladesh                932.    55140             59
    ## 19 Belarus                   681.    45116             66
    ## 20 Belgium                   651.    58685             90

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             84.7               6785.             80
    ##  2 Peru                              74.9               5848.             78
    ##  3 Belarus                           70.3               4658.             66
    ##  4 United States                     63.2               5877.             93
    ##  5 Belgium                           62.6               5641.             90
    ##  6 Spain                             54.9               5168.             94
    ##  7 United Kingdom                    49.3               4489.             91
    ##  8 Sweden                            47.3               4270.             90
    ##  9 Switzerland                       44.9               4064.             90
    ## 10 Saudi Arabia                      43.2               3544.             82
    ## 11 Russia                            40.2               3135.             78
    ## 12 Italy                             38.0               3875.            102
    ## 13 Portugal                          37.4               3115.             83
    ## 14 Ecuador                           35.4               2770.             78
    ## 15 Brazil                            33.7               2762.             82
    ## 16 Canada                            32.7               2754.             84
    ## 17 Netherlands                       31.1               2808.             90
    ## 18 Israel                            28.3               2341.             82
    ## 19 Turkey                            27.4               2139.             78
    ## 20 Dominican Republic                24.8               1836.             73

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  22.7          96      423
    ##  2 France                 19.5       28964   148263
    ##  3 Belgium                16.2        9522    58685
    ##  4 Italy                  14.4       33601   233836
    ##  5 United Kingdom         14.2       39728   279860
    ##  6 Hungary                13.6         534     3931
    ##  7 Netherlands            12.8        5977    46733
    ##  8 Spain                  11.6       27940   240326
    ##  9 Sweden                 11.1        4542    40803
    ## 10 Mexico                 10.9       10637    97326
    ## 11 Ecuador                 8.51       3486    40966
    ## 12 Chad                    8.05         66      820
    ## 13 Canada                  7.99       7414    92748
    ## 14 Algeria                 6.91        673     9733
    ## 15 Niger                   6.76         65      961
    ## 16 Romania                 6.55       1288    19669
    ## 17 Greece                  6.09        179     2937
    ## 18 Indonesia               6.01       1698    28233
    ## 19 Burkina Faso            6.00         53      884
    ## 20 United States           5.82     106051  1823220

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                915.        9522   10.4 
    ##  2 United Kingdom         637.       39728   62.3 
    ##  3 Spain                  601.       27940   46.5 
    ##  4 Italy                  557.       33601   60.3 
    ##  5 Sweden                 475.        4542    9.56
    ##  6 France                 447.       28964   64.8 
    ##  7 Netherlands            359.        5977   16.6 
    ##  8 United States          342.      106051  310.  
    ##  9 Ecuador                236.        3486   14.8 
    ## 10 Canada                 220.        7414   33.7 
    ## 11 Switzerland            219.        1659    7.58
    ## 12 Peru                   159.        4767   29.9 
    ## 13 Brazil                 155.       31199  201.  
    ## 14 Portugal               136.        1447   10.7 
    ## 15 Denmark                106.         580    5.48
    ## 16 Germany                105.        8581   81.8 
    ## 17 Iran                   104.        8012   76.9 
    ## 18 Mexico                  94.6      10637  112.  
    ## 19 Austria                 81.7        670    8.20
    ## 20 Chile                   76.1       1275   16.7

EOL
