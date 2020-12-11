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

Updated: 2020-12-12

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
    ##  1 United States           53532. 15203208            284
    ##  2 India                   36017.  9796769            272
    ##  3 Brazil                  24556.  6728452            274
    ##  4 Russia                   9692.  2597711            268
    ##  5 France                   8061.  2297425            285
    ##  6 United Kingdom           6317.  1787787            283
    ##  7 Italy                    6120.  1787147            292
    ##  8 Spain                    6056.  1720056            284
    ##  9 Argentina                5484.  1475222            269
    ## 10 Colombia                 5194.  1392133            268
    ## 11 Mexico                   4497.  1205229            268
    ## 12 Germany                  4447.  1272078            286
    ## 13 Poland                   4051.  1102096            272
    ## 14 Iran                     3734.  1083023            290
    ## 15 Peru                     3633.   977312            269
    ## 16 Turkey                   3485.   934229            268
    ## 17 Ukraine                  3329.   872228            262
    ## 18 South Africa             3110.   836764            269
    ## 19 Indonesia                2202.   598933            272
    ## 20 Belgium                  2129.   600397            282

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       205.              57714.            282
    ##  2 Czech Republic                198.              54334.            274
    ##  3 Israel                        175.              47698.            273
    ##  4 United States                 173.              49006.            284
    ##  5 Switzerland                   171.              48439.            284
    ##  6 Jordan                        150.              39506.            264
    ##  7 Austria                       136.              37912.            278
    ##  8 Argentina                     133.              35682.            269
    ##  9 Spain                         130.              36986.            284
    ## 10 Serbia                        127.              33932.            267
    ## 11 Netherlands                   126.              35150.            280
    ## 12 Chile                         125.              33824.            270
    ## 13 France                        124.              35471.            285
    ## 14 Brazil                        122.              33458.            274
    ## 15 Peru                          121.              32678.            269
    ## 16 Sweden                        117.              32726.            279
    ## 17 Portugal                      115.              31398.            273
    ## 18 Colombia                      109.              29130.            268
    ## 19 Poland                        105.              28626.            272
    ## 20 Hungary                       102.              27169.            266

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2085
    ##  2 Mexico                  9.26     111655  1205229
    ##  3 Ecuador                 6.91      13850   200379
    ##  4 Sudan                   6.44       1319    20468
    ##  5 Bolivia                 6.16       9004   146060
    ##  6 Chad                    5.87        102     1739
    ##  7 Egypt                   5.70       6854   120147
    ##  8 Syria                   5.42        476     8787
    ##  9 China                   5.02       4755    94749
    ## 10 Iran                    4.75      51496  1083023
    ## 11 Niger                   4.15         77     1856
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.98       1939    48753
    ## 14 Peru                    3.73      36455   977312
    ## 15 United Kingdom          3.53      63082  1787787
    ## 16 Italy                   3.50      62626  1787147
    ## 17 Tunisia                 3.49       3758   107814
    ## 18 Nicaragua               3.44        162     4709
    ## 19 Guatemala               3.40       4345   127786
    ## 20 Mali                    3.30        184     5576

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1701.      17692   10.4 
    ##  2 Peru                   1219.      36455   29.9 
    ##  3 Italy                  1038.      62626   60.3 
    ##  4 Spain                  1018.      47344   46.5 
    ##  5 United Kingdom         1012.      63082   62.3 
    ##  6 Mexico                  993.     111655  112.  
    ##  7 Argentina               973.      40222   41.3 
    ##  8 Chile                   942.      15774   16.7 
    ##  9 Ecuador                 936.      13850   14.8 
    ## 10 United States           926.     287384  310.  
    ## 11 Bolivia                 905.       9004    9.95
    ## 12 Czech Republic          892.       9341   10.5 
    ## 13 Brazil                  890.     178995  201.  
    ## 14 France                  873.      56572   64.8 
    ## 15 Colombia                802.      38308   47.8 
    ## 16 Sweden                  770.       7354    9.56
    ## 17 Bulgaria                756.       5405    7.15
    ## 18 Switzerland             696.       5273    7.58
    ## 19 Iran                    669.      51496   76.9 
    ## 20 Hungary                 663.       6622    9.98

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
