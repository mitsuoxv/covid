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

Updated: 2020-11-28

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
    ##  1 United States           46081. 12441925            270
    ##  2 India                   36084.  9309787            258
    ##  3 Brazil                  23717.  6166606            260
    ##  4 Russia                   8722.  2215533            254
    ##  5 France                   7914.  2144917            271
    ##  6 Spain                    5990.  1617355            270
    ##  7 United Kingdom           5853   1574566            269
    ##  8 Argentina                5452.  1390388            255
    ##  9 Italy                    5431.  1509875            278
    ## 10 Colombia                 5003.  1270991            254
    ## 11 Mexico                   4214.  1070487            254
    ## 12 Peru                     3742.   954459            255
    ## 13 Germany                  3700.  1006394            272
    ## 14 Poland                   3647.   941112            258
    ## 15 Iran                     3291.   908346            276
    ## 16 South Africa             3053.   778571            255
    ## 17 Ukraine                  2796.   693407            248
    ## 18 Chile                    2131.   545662            256
    ## 19 Belgium                  2117.   567436            268
    ## 20 Iraq                     2111.   544670            258

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               54545.            268
    ##  2 Czech Republic               188.               48828.            260
    ##  3 Israel                       174.               45172.            259
    ##  4 Switzerland                  153.               41251.            270
    ##  5 United States                149.               40105.            270
    ##  6 Argentina                    132.               33630.            255
    ##  7 Spain                        129.               34777.            270
    ##  8 Chile                        127.               32584.            256
    ##  9 Jordan                       127.               31687.            250
    ## 10 Peru                         125.               31914.            255
    ## 11 France                       122.               33117.            271
    ## 12 Austria                      122.               32260.            264
    ## 13 Brazil                       118.               30664.            260
    ## 14 Netherlands                  113.               30190.            266
    ## 15 Colombia                     105.               26595.            254
    ## 16 Portugal                     101.               26264.            259
    ## 17 Poland                        94.7              24444.            258
    ## 18 United Kingdom                93.9              25254.            269
    ## 19 Sweden                        92.9              24734.            266
    ## 20 Italy                         90.0              25023.            278

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         605     2078
    ##  2 Mexico                  9.68     103597  1070487
    ##  3 Sudan                   7.20       1215    16864
    ##  4 Ecuador                 7.08      13316   188138
    ##  5 Bolivia                 6.19       8933   144276
    ##  6 Chad                    6.08        101     1661
    ##  7 Egypt                   5.76       6596   114475
    ##  8 Syria                   5.29        399     7542
    ##  9 Iran                    5.14      46689   908346
    ## 10 China                   5.10       4749    93113
    ## 11 Niger                   4.85         70     1443
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.80       1737    45716
    ## 14 Peru                    3.74      35727   954459
    ## 15 United Kingdom          3.62      57031  1574566
    ## 16 Italy                   3.50      52850  1509875
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.42       4133   120685
    ## 19 Canada                  3.37      11710   347466
    ## 20 Mali                    3.29        148     4505

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1559.      16219   10.4 
    ##  2 Peru                   1195.      35727   29.9 
    ##  3 Spain                   954.      44374   46.5 
    ##  4 Mexico                  921.     103597  112.  
    ##  5 United Kingdom          915.      57031   62.3 
    ##  6 Argentina               912.      37714   41.3 
    ##  7 Chile                   910.      15235   16.7 
    ##  8 Ecuador                 900.      13316   14.8 
    ##  9 Bolivia                 898.       8933    9.95
    ## 10 Italy                   876.      52850   60.3 
    ## 11 Brazil                  849.     170769  201.  
    ## 12 United States           831.     257825  310.  
    ## 13 France                  781.      50598   64.8 
    ## 14 Colombia                750.      35860   47.8 
    ## 15 Czech Republic          743.       7779   10.5 
    ## 16 Sweden                  693.       6622    9.56
    ## 17 Iran                    607.      46689   76.9 
    ## 18 Netherlands             551.       9171   16.6 
    ## 19 Switzerland             540.       4095    7.58
    ## 20 Bulgaria                494.       3529    7.15

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
