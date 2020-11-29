WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2020-11-29

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

## Read data from WHO

WHO offers [Data Table in its Dashboard](https://covid19.who.int/table).
I use the data from
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

I also use the data, like area name and population, from
<https://countrycode.org/>.

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/). One exception
is “West Europe”, which I make by combining “Western”, “Northern” and
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           47099. 12763997            271
    ##  2 India                   36104.  9351109            259
    ##  3 Brazil                  23771.  6204220            261
    ##  4 Russia                   8794.  2242633            255
    ##  5 France                   7931.  2157332            272
    ##  6 Spain                    6008.  1628208            271
    ##  7 United Kingdom           5886.  1589305            270
    ##  8 Italy                    5513.  1538217            279
    ##  9 Argentina                5466.  1399431            256
    ## 10 Colombia                 5021.  1280487            255
    ## 11 Mexico                   4229.  1078594            255
    ## 12 Germany                  3765.  1028089            273
    ## 13 Peru                     3735.   956347            256
    ## 14 Poland                   3700.   958416            259
    ## 15 Iran                     3329.   922397            277
    ## 16 South Africa             3054.   781941            256
    ## 17 Ukraine                  2850.   709701            249
    ## 18 Chile                    2129.   547223            257
    ## 19 Belgium                  2121.   570733            269
    ## 20 Iraq                     2112.   547215            259

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               54862.            269
    ##  2 Czech Republic               189.               49254.            261
    ##  3 Israel                       174.               45172.            260
    ##  4 Switzerland                  154.               41817.            271
    ##  5 United States                152.               41143.            271
    ##  6 Argentina                    132.               33849.            256
    ##  7 Spain                        129.               35011.            271
    ##  8 Jordan                       129.               32402.            251
    ##  9 Chile                        127.               32677.            257
    ## 10 Peru                         125.               31977.            256
    ## 11 Austria                      124.               32847.            265
    ## 12 France                       122.               33308.            272
    ## 13 Brazil                       118.               30851.            261
    ## 14 Netherlands                  114.               30534.            267
    ## 15 Colombia                     105.               26794.            255
    ## 16 Portugal                     103.               26774.            260
    ## 17 Poland                        96.1              24894.            259
    ## 18 Sweden                        95.2              25443.            267
    ## 19 United Kingdom                94.4              25491.            270
    ## 20 Italy                         91.4              25492.            279

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         605     2078
    ##  2 Mexico                  9.66     104242  1078594
    ##  3 Sudan                   7.20       1215    16864
    ##  4 Ecuador                 7.05      13358   189534
    ##  5 Bolivia                 6.19       8939   144390
    ##  6 Chad                    6.07        101     1663
    ##  7 Egypt                   5.75       6608   114832
    ##  8 Syria                   5.29        404     7635
    ##  9 Iran                    5.11      47095   922397
    ## 10 China                   5.09       4749    93225
    ## 11 Niger                   4.76         70     1472
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.80       1740    45839
    ## 14 Peru                    3.74      35785   956347
    ## 15 United Kingdom          3.62      57551  1589305
    ## 16 Italy                   3.49      53677  1538217
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.42       4141   121132
    ## 19 Canada                  3.34      11799   353097
    ## 20 Tunisia                 3.31       3106    93770

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1571.      16339   10.4 
    ##  2 Peru                   1197.      35785   29.9 
    ##  3 Spain                   960.      44668   46.5 
    ##  4 Mexico                  927.     104242  112.  
    ##  5 United Kingdom          923.      57551   62.3 
    ##  6 Argentina               918.      37941   41.3 
    ##  7 Chile                   912.      15278   16.7 
    ##  8 Ecuador                 903.      13358   14.8 
    ##  9 Bolivia                 899.       8939    9.95
    ## 10 Italy                   890.      53677   60.3 
    ## 11 Brazil                  853.     171460  201.  
    ## 12 United States           843.     261460  310.  
    ## 13 France                  796.      51554   64.8 
    ## 14 Czech Republic          761.       7967   10.5 
    ## 15 Colombia                754.      36019   47.8 
    ## 16 Sweden                  699.       6681    9.56
    ## 17 Iran                    612.      47095   76.9 
    ## 18 Switzerland             559.       4236    7.58
    ## 19 Netherlands             556.       9254   16.6 
    ## 20 Bulgaria                515.       3680    7.15

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
