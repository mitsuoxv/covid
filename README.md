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

Updated: 2020-07-09

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
    ##  1 United States           23018.  2923432            127
    ##  2 Brazil                  13993.  1623284            116
    ##  3 India                    6399.   742417            116
    ##  4 Russia                   6256.   700792            112
    ##  5 Peru                     2728.   305703            112
    ##  6 Chile                    2639.   301019            114
    ##  7 Mexico                   2357.   261750            111
    ##  8 United Kingdom           2290.   286353            125
    ##  9 Pakistan                 2082.   237489            114
    ## 10 Spain                    1969.   252130            128
    ## 11 South Africa             1926.   215855            112
    ## 12 Saudi Arabia             1871.   217108            116
    ## 13 Turkey                   1855.   207897            112
    ## 14 Iran                     1846.   245688            133
    ## 15 Bangladesh               1812.   168645             93
    ## 16 Italy                    1778.   241956            136
    ## 17 Germany                  1529.   197341            129
    ## 18 France                   1248.   159909            128
    ## 19 Colombia                 1083.   120281            111
    ## 20 Canada                    897.   105935            118

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               17975.            114
    ##  2 Peru                              91.2              10222.            112
    ##  3 United States                     74.2               9423.            127
    ##  4 Saudi Arabia                      72.7               8437.            116
    ##  5 Brazil                            69.6               8072.            116
    ##  6 Belarus                           65.9               6608.            100
    ##  7 Sweden                            61.8               7675.            124
    ##  8 Belgium                           48.1               5972.            124
    ##  9 Russia                            44.5               4981.            112
    ## 10 Spain                             42.3               5421.            128
    ## 11 Bolivia                           41.0               4072.             99
    ## 12 South Africa                      39.3               4405.            112
    ## 13 Ecuador                           38.1               4276.            112
    ## 14 United Kingdom                    36.7               4593.            125
    ## 15 Dominican Republic                36.3               3912.            107
    ## 16 Israel                            36.3               4234.            116
    ## 17 Portugal                          35.5               4160.            117
    ## 18 Switzerland                       34.1               4259.            124
    ## 19 Kazakhstan                        31.9               3328.            104
    ## 20 Honduras                          30.4               3087.            101

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.7         349     1307
    ##  2 France                 18.7       29843   159909
    ##  3 Belgium                15.7        9776    62123
    ##  4 United Kingdom         15.5       44391   286353
    ##  5 Italy                  14.4       34899   241956
    ##  6 Hungary                14.0         589     4210
    ##  7 Netherlands            12.1        6123    50639
    ##  8 Mexico                 11.9       31119   261750
    ##  9 Spain                  11.3       28392   252130
    ## 10 Chad                    8.48         74      873
    ## 11 Canada                  8.21       8693   105935
    ## 12 Ecuador                 7.70       4873    63245
    ## 13 Sweden                  7.43       5447    73344
    ## 14 Sudan                   6.22        622     9997
    ## 15 Niger                   6.22         68     1094
    ## 16 Romania                 6.07       1799    29620
    ## 17 Algeria                 5.73        968    16879
    ## 18 China                   5.44       4648    85366
    ## 19 Angola                  5.44         21      386
    ## 20 Greece                  5.38        193     3589

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9776   10.4 
    ##  2 United Kingdom          712.      44391   62.3 
    ##  3 Spain                   611.      28392   46.5 
    ##  4 Italy                   578.      34899   60.3 
    ##  5 Sweden                  570.       5447    9.56
    ##  6 France                  461.      29843   64.8 
    ##  7 United States           419.     129963  310.  
    ##  8 Chile                   384.       6434   16.7 
    ##  9 Netherlands             368.       6123   16.6 
    ## 10 Peru                    360.      10772   29.9 
    ## 11 Ecuador                 329.       4873   14.8 
    ## 12 Brazil                  326.      65487  201.  
    ## 13 Mexico                  277.      31119  112.  
    ## 14 Canada                  258.       8693   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Iran                    155.      11931   76.9 
    ## 17 Portugal                153.       1629   10.7 
    ## 18 Bolivia                 148.       1476    9.95
    ## 19 Denmark                 111.        609    5.48
    ## 20 Germany                 110.       9036   81.8

EOL
