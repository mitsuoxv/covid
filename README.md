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

Updated: 2020-06-25

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
    ##  1 United States           20311.  2295272            113
    ##  2 Brazil                  10847.  1106470            102
    ##  3 Russia                   6191.   606881             98
    ##  4 India                    4471.   456183            102
    ##  5 United Kingdom           2758.   306214            111
    ##  6 Peru                     2626.   257447             98
    ##  7 Chile                    2506.   250767            100
    ##  8 Spain                    2163.   246752            114
    ##  9 Italy                    1957.   238833            122
    ## 10 Turkey                   1939.   190165             98
    ## 11 Mexico                   1907.   185122             97
    ## 12 Pakistan                 1887.   188926            100
    ## 13 Iran                     1763.   209970            119
    ## 14 Germany                  1664.   191449            115
    ## 15 Saudi Arabia             1608.   164144            102
    ## 16 Bangladesh               1507.   119198             79
    ## 17 France                   1360.   155256            114
    ## 18 South Africa             1082.   106108             98
    ## 19 Canada                    976.   101637            104
    ## 20 Colombia                  733.    71183             97

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            150.               14974.            100
    ##  2 Peru                              87.8               8608.             98
    ##  3 Belarus                           71.2               6142.             86
    ##  4 United States                     65.5               7399.            113
    ##  5 Saudi Arabia                      62.5               6379.            102
    ##  6 Sweden                            57.7               6366.            110
    ##  7 Brazil                            53.9               5502.            102
    ##  8 Belgium                           53.0               5845.            110
    ##  9 Spain                             46.5               5306.            114
    ## 10 United Kingdom                    44.2               4911.            111
    ## 11 Russia                            44.0               4313.             98
    ## 12 Switzerland                       37.2               4122.            110
    ## 13 Portugal                          36.0               3722.            103
    ## 14 Ecuador                           35.5               3492.             98
    ## 15 Italy                             32.4               3958.            122
    ## 16 Dominican Republic                30.3               2844.             93
    ## 17 Bolivia                           30.0               2563.             85
    ## 18 Canada                            29.0               3018.            104
    ## 19 Israel                            28.0               2877.            102
    ## 20 Netherlands                       27.1               2987.            110

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.3         262      996
    ##  2 France                 19.1       29648   155256
    ##  3 Belgium                16.0        9713    60810
    ##  4 Italy                  14.5       34675   238833
    ##  5 United Kingdom         14.0       42927   306214
    ##  6 Hungary                14.0         573     4107
    ##  7 Netherlands            12.3        6095    49722
    ##  8 Mexico                 12.2       22584   185122
    ##  9 Spain                  11.5       28325   246752
    ## 10 Chad                    8.60         74      860
    ## 11 Sweden                  8.48       5161    60837
    ## 12 Canada                  8.30       8436   101637
    ## 13 Ecuador                 8.28       4274    51643
    ## 14 Algeria                 7.13        861    12076
    ## 15 Niger                   6.37         67     1051
    ## 16 Romania                 6.28       1539    24505
    ## 17 Sudan                   6.14        540     8791
    ## 18 Burkina Faso            5.87         53      903
    ## 19 Greece                  5.75        190     3302
    ## 20 Mali                    5.61        111     1978

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                934.        9713   10.4 
    ##  2 United Kingdom         689.       42927   62.3 
    ##  3 Spain                  609.       28325   46.5 
    ##  4 Italy                  575.       34675   60.3 
    ##  5 Sweden                 540.        5161    9.56
    ##  6 France                 458.       29648   64.8 
    ##  7 United States          387.      120171  310.  
    ##  8 Netherlands            366.        6095   16.6 
    ##  9 Ecuador                289.        4274   14.8 
    ## 10 Peru                   275.        8223   29.9 
    ## 11 Chile                  269.        4505   16.7 
    ## 12 Brazil                 255.       51271  201.  
    ## 13 Canada                 250.        8436   33.7 
    ## 14 Switzerland            221.        1679    7.58
    ## 15 Mexico                 201.       22584  112.  
    ## 16 Portugal               144.        1540   10.7 
    ## 17 Iran                   128.        9863   76.9 
    ## 18 Denmark                110.         603    5.48
    ## 19 Germany                109.        8914   81.8 
    ## 20 Austria                 84.5        693    8.20

EOL
