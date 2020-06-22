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

Updated: 2020-06-23

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
    ##  1 United States           20190.  2241178            111
    ##  2 Brazil                  10675.  1067579            100
    ##  3 Russia                   6168.   592280             96
    ##  4 India                    4252.   425282            100
    ##  5 United Kingdom           2791.   304335            109
    ##  6 Peru                     2617.   251338             96
    ##  7 Chile                    2471.   242355             98
    ##  8 Spain                    2198.   246272            112
    ##  9 Italy                    1986.   238499            120
    ## 10 Turkey                   1953.   187685             96
    ## 11 Pakistan                 1846.   181088             98
    ## 12 Mexico                   1843.   175202             95
    ## 13 Iran                     1751.   204952            117
    ## 14 Germany                  1683.   190359            113
    ## 15 Saudi Arabia             1575.   157612            100
    ## 16 Bangladesh               1457.   112306             77
    ## 17 France                   1378.   154567            112
    ## 18 South Africa             1012.    97302             96
    ## 19 Canada                    989.   101019            102
    ## 20 Belarus                   695.    58505             84

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            148.               14472.             98
    ##  2 Peru                              87.5               8404.             96
    ##  3 Belarus                           71.7               6041.             84
    ##  4 United States                     65.1               7224.            111
    ##  5 Saudi Arabia                      61.2               6125.            100
    ##  6 Sweden                            54.2               5865.            108
    ##  7 Belgium                           53.8               5820.            108
    ##  8 Brazil                            53.1               5309.            100
    ##  9 Spain                             47.3               5295.            112
    ## 10 United Kingdom                    44.8               4881.            109
    ## 11 Russia                            43.8               4209.             96
    ## 12 Switzerland                       37.9               4118.            108
    ## 13 Portugal                          36.2               3666.            101
    ## 14 Ecuador                           35.6               3424.             96
    ## 15 Italy                             32.9               3953.            120
    ## 16 Dominican Republic                29.6               2716.             91
    ## 17 Canada                            29.4               2999.            102
    ## 18 Bolivia                           28.3               2364.             83
    ## 19 Israel                            27.8               2808.            100
    ## 20 Netherlands                       27.5               2979.            108

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.2         257      945
    ##  2 France                 19.1       29571   154567
    ##  3 Belgium                16.0        9696    60550
    ##  4 Italy                  14.5       34634   238499
    ##  5 United Kingdom         14.0       42632   304335
    ##  6 Hungary                13.9         572     4102
    ##  7 Netherlands            12.3        6090    49593
    ##  8 Mexico                 11.9       20781   175202
    ##  9 Spain                  11.5       28323   246272
    ## 10 Sweden                  9.02       5053    56043
    ## 11 Chad                    8.62         74      858
    ## 12 Ecuador                 8.34       4223    50640
    ## 13 Canada                  8.33       8410   101019
    ## 14 Algeria                 7.18        845    11771
    ## 15 Niger                   6.47         67     1036
    ## 16 Romania                 6.29       1512    24045
    ## 17 Sudan                   6.07        521     8580
    ## 18 Burkina Faso            5.88         53      901
    ## 19 Greece                  5.82        190     3266
    ## 20 Mali                    5.66        111     1961

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                932.        9696   10.4 
    ##  2 United Kingdom         684.       42632   62.3 
    ##  3 Spain                  609.       28323   46.5 
    ##  4 Italy                  574.       34634   60.3 
    ##  5 Sweden                 529.        5053    9.56
    ##  6 France                 457.       29571   64.8 
    ##  7 United States          385.      119453  310.  
    ##  8 Netherlands            366.        6090   16.6 
    ##  9 Ecuador                286.        4223   14.8 
    ## 10 Chile                  267.        4479   16.7 
    ## 11 Peru                   263.        7861   29.9 
    ## 12 Canada                 250.        8410   33.7 
    ## 13 Brazil                 249.       49976  201.  
    ## 14 Switzerland            222.        1680    7.58
    ## 15 Mexico                 185.       20781  112.  
    ## 16 Portugal               143.        1530   10.7 
    ## 17 Iran                   125.        9623   76.9 
    ## 18 Denmark                109.         600    5.48
    ## 19 Germany                109.        8885   81.8 
    ## 20 Austria                 84.1        690    8.20

EOL
