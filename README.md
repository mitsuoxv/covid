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

Updated: 2020-12-11

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
    ##    area          speed_since_100 cum_conf days_since_100
    ##    <chr>                   <dbl>    <dbl>          <int>
    ##  1 United States          52905. 14972356            283
    ##  2 India                  36042.  9767371            271
    ##  3 Brazil                 24450.  6674999            273
    ##  4 Argentina               5484.  1469919            268
    ##  5 Colombia                5185.  1384610            267
    ##  6 Mexico                  4469.  1193255            267
    ##  7 Iran                    3711.  1072620            289
    ##  8 Peru                    3644.   976621            268
    ##  9 Indonesia               2187.   592900            271
    ## 10 Iraq                    2102.   569873            271
    ## 11 Chile                   2099.   564778            269
    ## 12 Bangladesh              1944.   484104            249
    ## 13 Philippines             1638.   444164            271
    ## 14 Pakistan                1583.   426142            269
    ## 15 Canada                  1571.   429035            273
    ## 16 Morocco                 1470.   388184            264
    ## 17 Saudi Arabia            1320.   359274            272
    ## 18 Nepal                   1126.   244433            217
    ## 19 Jordan                   951.   250219            263
    ## 20 Ecuador                  743.   199228            268

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 United States                    171.               48262.            283
    ##  2 Jordan                           148.               39053.            263
    ##  3 Argentina                        133.               35554.            268
    ##  4 Chile                            125.               33725.            269
    ##  5 Peru                             122.               32655.            268
    ##  6 Brazil                           122.               33192.            273
    ##  7 Colombia                         109.               28973.            267
    ##  8 Iraq                              70.9              19206.            271
    ##  9 Libya                             69.8              13700.            196
    ## 10 Dominican Republic                58.2              15285.            262
    ## 11 Bolivia                           57.7              14662.            254
    ## 12 Paraguay                          56.3              14025.            249
    ## 13 Honduras                          54.8              14040.            256
    ## 14 Saudi Arabia                      51.3              13962.            272
    ## 15 Ecuador                           50.2              13470.            268
    ## 16 Iran                              48.2              13944.            289
    ## 17 Canada                            46.6              12739.            273
    ## 18 Morocco                           46.5              12274.            264
    ## 19 Mexico                            39.7              10610.            267
    ## 20 Nepal                             38.9               8443.            217

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.1         607     2083
    ##  2 Mexico               9.29     110874  1193255
    ##  3 Ecuador              6.93      13814   199228
    ##  4 Sudan                6.51       1307    20084
    ##  5 Bolivia              6.17       9002   145846
    ##  6 Egypt                5.71       6832   119702
    ##  7 Syria                5.36        465     8675
    ##  8 China                5.03       4755    94618
    ##  9 Iran                 4.77      51212  1072620
    ## 10 Afghanistan          3.96       1921    48540
    ## 11 Peru                 3.73      36401   976621
    ## 12 Tunisia              3.48       3717   106856
    ## 13 Nicaragua            3.44        162     4709
    ## 14 Guatemala            3.39       4311   127127
    ## 15 Australia            3.24        908    27993
    ## 16 Indonesia            3.06      18171   592900
    ## 17 Canada               3.00      12867   429035
    ## 18 El Salvador          2.88       1174    40741
    ## 19 Chile                2.78      15690   564778
    ## 20 Colombia             2.76      38158  1384610

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area               deaths_per_1m cum_deaths pop_mil
    ##    <chr>                      <dbl>      <dbl>   <dbl>
    ##  1 Peru                       1217.      36401   29.9 
    ##  2 Mexico                      986.     110874  112.  
    ##  3 Argentina                   968.      40009   41.3 
    ##  4 Chile                       937.      15690   16.7 
    ##  5 Ecuador                     934.      13814   14.8 
    ##  6 United States               915.     283994  310.  
    ##  7 Bolivia                     905.       9002    9.95
    ##  8 Brazil                      886.     178159  201.  
    ##  9 Colombia                    798.      38158   47.8 
    ## 10 Iran                        666.      51212   76.9 
    ## 11 Jordan                      500.       3206    6.41
    ## 12 Iraq                        421.      12501   29.7 
    ## 13 Canada                      382.      12867   33.7 
    ## 14 Honduras                    369.       2952    7.99
    ## 15 Tunisia                     351.       3717   10.6 
    ## 16 Guatemala                   318.       4311   13.6 
    ## 17 Paraguay                    296.       1887    6.38
    ## 18 Dominican Republic          239.       2350    9.82
    ## 19 Saudi Arabia                233.       6002   25.7 
    ## 20 Morocco                     203.       6427   31.6

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
