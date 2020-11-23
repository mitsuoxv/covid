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

Updated: 2020-11-24

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
    ##  1 United States           45009. 11972556            266
    ##  2 India                   35983.  9139865            254
    ##  3 Brazil                  23643.  6052786            256
    ##  4 Russia                   8457.  2114502            250
    ##  5 France                   7874.  2102510            267
    ##  6 Spain                    5852.  1556730            266
    ##  7 United Kingdom           5705.  1512049            265
    ##  8 Argentina                5443.  1366182            251
    ##  9 Italy                    5141.  1408868            274
    ## 10 Colombia                 4962.  1240493            250
    ## 11 Mexico                   4130.  1032688            250
    ## 12 Peru                     3777.   948081            251
    ## 13 Germany                  3466.   929133            268
    ## 14 Poland                   3391.   861331            254
    ## 15 Iran                     3141.   854361            272
    ## 16 South Africa             3058.   767679            251
    ## 17 Ukraine                  2605.   635689            244
    ## 18 Chile                    2145.   540640            252
    ## 19 Belgium                  2116.   558683            264
    ## 20 Iraq                     2107.   535321            254

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               53704.            264
    ##  2 Czech Republic               184.               46990.            256
    ##  3 Israel                       174.               44510.            256
    ##  4 United States                145.               38592.            266
    ##  5 Switzerland                  144.               38185.            266
    ##  6 Argentina                    132.               33045.            251
    ##  7 Chile                        128.               32284.            252
    ##  8 Peru                         126.               31701.            251
    ##  9 Spain                        126.               33474.            266
    ## 10 France                       122.               32462.            267
    ## 11 Brazil                       118.               30098.            256
    ## 12 Jordan                       116.               28629.            246
    ## 13 Austria                      115.               29997.            260
    ## 14 Netherlands                  111.               29081.            262
    ## 15 Colombia                     104.               25957.            250
    ## 16 Portugal                      95.7              24425.            255
    ## 17 United Kingdom                91.5              24252.            265
    ## 18 Poland                        88.1              22372.            254
    ## 19 Italy                         85.2              23349.            274
    ## 20 Sweden                        83.5              21798.            261

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         605     2073
    ##  2 Mexico                  9.82     101373  1032688
    ##  3 Sudan                   7.46       1197    16052
    ##  4 Ecuador                 7.11      13201   185643
    ##  5 Bolivia                 6.19       8904   143922
    ##  6 Chad                    6.15        101     1642
    ##  7 Egypt                   5.79       6548   113027
    ##  8 Iran                    5.24      44802   854361
    ##  9 Syria                   5.20        376     7225
    ## 10 China                   5.12       4749    92733
    ## 11 Niger                   5.12         70     1368
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.77       1687    44706
    ## 14 Peru                    3.75      35549   948081
    ## 15 United Kingdom          3.62      54751  1512049
    ## 16 Italy                   3.54      49823  1408868
    ## 17 Canada                  3.50      11406   325711
    ## 18 Nicaragua               3.47        159     4583
    ## 19 Guatemala               3.44       4076   118629
    ## 20 Mali                    3.41        145     4255

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1501.      15618   10.4 
    ##  2 Peru                   1189.      35549   29.9 
    ##  3 Spain                   916.      42619   46.5 
    ##  4 Mexico                  901.     101373  112.  
    ##  5 Chile                   900.      15069   16.7 
    ##  6 Bolivia                 895.       8904    9.95
    ##  7 Argentina               895.      37002   41.3 
    ##  8 Ecuador                 893.      13201   14.8 
    ##  9 United Kingdom          878.      54751   62.3 
    ## 10 Brazil                  840.     168989  201.  
    ## 11 Italy                   826.      49823   60.3 
    ## 12 United States           819.     253931  310.  
    ## 13 France                  747.      48384   64.8 
    ## 14 Colombia                735.      35104   47.8 
    ## 15 Czech Republic          687.       7196   10.5 
    ## 16 Sweden                  670.       6406    9.56
    ## 17 Iran                    582.      44802   76.9 
    ## 18 Netherlands             533.       8879   16.6 
    ## 19 Switzerland             471.       3567    7.58
    ## 20 Romania                 458.      10047   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
