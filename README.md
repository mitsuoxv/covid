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

Updated: 2020-06-22

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
    ##  1 United States           20079.  2208829            110
    ##  2 Brazil                  10432.  1032913             99
    ##  3 Russia                   6153.   584680             95
    ##  4 India                    4145.   410461             99
    ##  5 United Kingdom           2806.   303114            108
    ##  6 Peru                     2608.   247925             95
    ##  7 Chile                    2439.   236748             97
    ##  8 Spain                    2215.   245938            111
    ##  9 Italy                    2001.   238275            119
    ## 10 Turkey                   1961.   186493             95
    ## 11 Pakistan                 1819.   176617             97
    ## 12 Mexico                   1812.   170485             94
    ## 13 Iran                     1745.   202584            116
    ## 14 Germany                  1694.   189822            112
    ## 15 Saudi Arabia             1557.   154233             99
    ## 16 Bangladesh               1430.   108775             76
    ## 17 France                   1391.   154562            111
    ## 18 Canada                    995.   100629            101
    ## 19 South Africa              974.    92681             95
    ## 20 Belarus                   696.    57936             83

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            146.               14137.             97
    ##  2 Peru                              87.2               8290.             95
    ##  3 Belarus                           71.9               5982.             83
    ##  4 United States                     64.7               7120.            110
    ##  5 Saudi Arabia                      60.5               5994.             99
    ##  6 Sweden                            54.7               5865.            107
    ##  7 Belgium                           54.3               5820.            107
    ##  8 Brazil                            51.9               5136.             99
    ##  9 Spain                             47.6               5288.            111
    ## 10 United Kingdom                    45.0               4862.            108
    ## 11 Russia                            43.7               4155.             95
    ## 12 Switzerland                       38.2               4118.            107
    ## 13 Portugal                          36.3               3638.            100
    ## 14 Ecuador                           35.6               3393.             95
    ## 15 Italy                             33.2               3949.            119
    ## 16 Canada                            29.5               2988.            101
    ## 17 Dominican Republic                28.9               2624.             90
    ## 18 Israel                            27.9               2787.             99
    ## 19 Netherlands                       27.7               2974.            107
    ## 20 Bolivia                           27.4               2259.             82

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.5         255      926
    ##  2 France                 19.1       29565   154562
    ##  3 Belgium                16.0        9696    60550
    ##  4 Italy                  14.5       34610   238275
    ##  5 United Kingdom         14.1       42589   303114
    ##  6 Hungary                13.9         570     4094
    ##  7 Netherlands            12.3        6089    49502
    ##  8 Mexico                 12.0       20394   170485
    ##  9 Spain                  11.5       28322   245938
    ## 10 Sweden                  9.02       5053    56043
    ## 11 Chad                    8.62         74      858
    ## 12 Ecuador                 8.37       4199    50183
    ## 13 Canada                  8.29       8346   100629
    ## 14 Algeria                 7.20        837    11631
    ## 15 Niger                   6.47         67     1035
    ## 16 Romania                 6.32       1500    23730
    ## 17 Sudan                   6.07        521     8580
    ## 18 Burkina Faso            5.88         53      901
    ## 19 Greece                  5.84        190     3256
    ## 20 Mali                    5.64        109     1933

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                932.        9696   10.4 
    ##  2 United Kingdom         683.       42589   62.3 
    ##  3 Spain                  609.       28322   46.5 
    ##  4 Italy                  574.       34610   60.3 
    ##  5 Sweden                 529.        5053    9.56
    ##  6 France                 456.       29565   64.8 
    ##  7 United States          383.      118895  310.  
    ##  8 Netherlands            366.        6089   16.6 
    ##  9 Ecuador                284.        4199   14.8 
    ## 10 Chile                  256.        4295   16.7 
    ## 11 Peru                   256.        7660   29.9 
    ## 12 Canada                 248.        8346   33.7 
    ## 13 Brazil                 243.       48954  201.  
    ## 14 Switzerland            222.        1680    7.58
    ## 15 Mexico                 181.       20394  112.  
    ## 16 Portugal               143.        1528   10.7 
    ## 17 Iran                   124.        9507   76.9 
    ## 18 Denmark                109.         600    5.48
    ## 19 Germany                109.        8882   81.8 
    ## 20 Austria                 83.9        688    8.20

EOL
