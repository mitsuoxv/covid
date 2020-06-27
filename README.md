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

Updated: 2020-06-28

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
    ##  1 United States           20754.  2407590            116
    ##  2 Brazil                  11695.  1228114            105
    ##  3 Russia                   6213.   627646            101
    ##  4 India                    4846.   508953            105
    ##  5 United Kingdom           2713.   309364            114
    ##  6 Peru                     2658.   268602            101
    ##  7 Chile                    2555.   263360            103
    ##  8 Spain                    2118.   247905            117
    ##  9 Mexico                   2028.   202951            100
    ## 10 Pakistan                 1929.   198883            103
    ## 11 Turkey                   1924.   194511            101
    ## 12 Italy                    1919.   239961            125
    ## 13 Iran                     1783.   217724            122
    ## 14 Saudi Arabia             1662.   174577            105
    ## 15 Germany                  1637.   193243            118
    ## 16 Bangladesh               1590.   130474             82
    ## 17 France                   1333.   156156            117
    ## 18 South Africa             1232.   124590            101
    ## 19 Canada                    958.   102622            107
    ## 20 Colombia                  805.    80599            100

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            153.               15726.            103
    ##  2 Peru                              88.9               8981.            101
    ##  3 Belarus                           70.3               6269.             89
    ##  4 United States                     66.9               7761.            116
    ##  5 Saudi Arabia                      64.6               6784.            105
    ##  6 Sweden                            60.2               6816.            113
    ##  7 Brazil                            58.2               6107.            105
    ##  8 Belgium                           51.9               5874.            113
    ##  9 Spain                             45.5               5331.            117
    ## 10 Russia                            44.2               4461.            101
    ## 11 United Kingdom                    43.5               4962.            114
    ## 12 Switzerland                       36.4               4142.            113
    ## 13 Portugal                          36.0               3828.            106
    ## 14 Ecuador                           35.9               3641.            101
    ## 15 Bolivia                           32.4               2865.             88
    ## 16 Italy                             31.8               3977.            125
    ## 17 Dominican Republic                31.3               3030.             96
    ## 18 Israel                            28.9               3062.            105
    ## 19 Canada                            28.4               3047.            107
    ## 20 Netherlands                       26.5               3004.            113

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.9         294     1093
    ##  2 France                 19.0       29700   156156
    ##  3 Belgium                15.9        9731    61106
    ##  4 Italy                  14.5       34708   239961
    ##  5 United Kingdom         14.0       43414   309364
    ##  6 Hungary                14.0         578     4127
    ##  7 Mexico                 12.3       25060   202951
    ##  8 Netherlands            12.2        6103    50005
    ##  9 Spain                  11.4       28338   247905
    ## 10 Chad                    8.55         74      865
    ## 11 Canada                  8.29       8504   102622
    ## 12 Ecuador                 8.18       4406    53856
    ## 13 Sweden                  8.11       5280    65137
    ## 14 Algeria                 6.98        885    12685
    ## 15 Niger                   6.33         67     1059
    ## 16 Sudan                   6.18        572     9258
    ## 17 Romania                 6.14       1579    25697
    ## 18 Greece                  5.71        191     3343
    ## 19 Burkina Faso            5.67         53      934
    ## 20 Mali                    5.49        113     2060

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                935.        9731   10.4 
    ##  2 United Kingdom         696.       43414   62.3 
    ##  3 Spain                  609.       28338   46.5 
    ##  4 Italy                  575.       34708   60.3 
    ##  5 Sweden                 553.        5280    9.56
    ##  6 France                 459.       29700   64.8 
    ##  7 United States          400.      124161  310.  
    ##  8 Netherlands            367.        6103   16.6 
    ##  9 Chile                  303.        5068   16.7 
    ## 10 Ecuador                298.        4406   14.8 
    ## 11 Peru                   293.        8761   29.9 
    ## 12 Brazil                 273.       54971  201.  
    ## 13 Canada                 253.        8504   33.7 
    ## 14 Mexico                 223.       25060  112.  
    ## 15 Switzerland            222.        1681    7.58
    ## 16 Portugal               146.        1555   10.7 
    ## 17 Iran                   133.       10239   76.9 
    ## 18 Denmark                110.         604    5.48
    ## 19 Germany                109.        8954   81.8 
    ## 20 Bolivia                 91.8        913    9.95

EOL
