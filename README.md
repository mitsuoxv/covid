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

Updated: 2020-07-11

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
    ##  1 United States           23552.  3038325            129
    ##  2 Brazil                  14517.  1713160            118
    ##  3 India                    6726.   793802            118
    ##  4 Russia                   6261.   713936            114
    ##  5 Peru                     2744.   312911            114
    ##  6 Chile                    2638.   306216            116
    ##  7 Mexico                   2433.   275003            113
    ##  8 United Kingdom           2264.   287625            127
    ##  9 Pakistan                 2098.   243596            116
    ## 10 South Africa             2090.   238339            114
    ## 11 Spain                    1946.   253056            130
    ## 12 Saudi Arabia             1892.   223327            118
    ## 13 Iran                     1854.   250458            135
    ## 14 Bangladesh               1846.   175494             95
    ## 15 Turkey                   1840.   209962            114
    ## 16 Italy                    1755.   242363            138
    ## 17 Germany                  1512.   198178            131
    ## 18 France                   1235.   160783            130
    ## 19 Colombia                 1137.   128638            113
    ## 20 Canada                    886.   106434            120

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               18285.            116
    ##  2 Peru                              91.7              10463.            114
    ##  3 United States                     75.9               9794.            129
    ##  4 Saudi Arabia                      73.5               8679.            118
    ##  5 Brazil                            72.2               8519.            118
    ##  6 Belarus                           65.0               6651.            102
    ##  7 Sweden                            61.6               7779.            126
    ##  8 Belgium                           47.4               5980.            126
    ##  9 Russia                            44.5               5074.            114
    ## 10 Bolivia                           42.7               4321.            101
    ## 11 South Africa                      42.6               4864.            114
    ## 12 Spain                             41.8               5441.            130
    ## 13 Israel                            38.9               4610.            118
    ## 14 Ecuador                           38.5               4396.            114
    ## 15 Dominican Republic                37.9               4152.            109
    ## 16 United Kingdom                    36.3               4613.            127
    ## 17 Portugal                          35.6               4241.            119
    ## 18 Switzerland                       33.8               4287.            126
    ## 19 Kazakhstan                        33.6               3569.            106
    ## 20 Honduras                          31.4               3252.            103

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.5         352     1328
    ##  2 France                 18.6       29886   160783
    ##  3 Belgium                15.7        9781    62210
    ##  4 United Kingdom         15.5       44602   287625
    ##  5 Italy                  14.4       34926   242363
    ##  6 Hungary                14.0         591     4220
    ##  7 Netherlands            12.1        6128    50743
    ##  8 Mexico                 11.9       32796   275003
    ##  9 Spain                  11.2       28401   253056
    ## 10 Chad                    8.48         74      873
    ## 11 Canada                  8.21       8737   106434
    ## 12 Ecuador                 7.60       4939    65018
    ## 13 Sweden                  7.40       5500    74333
    ## 14 Sudan                   6.36        649    10204
    ## 15 Niger                   6.20         68     1097
    ## 16 Romania                 5.96       1834    30789
    ## 17 Algeria                 5.55        988    17808
    ## 18 China                   5.44       4648    85445
    ## 19 Burkina Faso            5.27         53     1005
    ## 20 Greece                  5.26        193     3672

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9781   10.4 
    ##  2 United Kingdom          715.      44602   62.3 
    ##  3 Spain                   611.      28401   46.5 
    ##  4 Italy                   579.      34926   60.3 
    ##  5 Sweden                  576.       5500    9.56
    ##  6 France                  461.      29886   64.8 
    ##  7 United States           425.     131884  310.  
    ##  8 Chile                   399.       6682   16.7 
    ##  9 Peru                    372.      11133   29.9 
    ## 10 Netherlands             368.       6128   16.6 
    ## 11 Brazil                  338.      67964  201.  
    ## 12 Ecuador                 334.       4939   14.8 
    ## 13 Mexico                  292.      32796  112.  
    ## 14 Canada                  259.       8737   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Iran                    160.      12305   76.9 
    ## 17 Bolivia                 159.       1577    9.95
    ## 18 Portugal                154.       1644   10.7 
    ## 19 Denmark                 111.        609    5.48
    ## 20 Germany                 111.       9054   81.8

EOL
