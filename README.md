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

Updated: 2021-01-22

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
    ##  1 United States           73960. 24037236            325
    ##  2 India                   33900. 10610883            313
    ##  3 Brazil                  27218.  8573864            315
    ##  4 Russia                  11831.  3655839            309
    ##  5 United Kingdom          10820.  3505758            324
    ##  6 France                   8946.  2916577            326
    ##  7 Spain                    7399.  2412318            326
    ##  8 Italy                    7249.  2414166            333
    ##  9 Germany                  6386.  2088400            327
    ## 10 Colombia                 6275.  1939071            309
    ## 11 Argentina                5869.  1819569            310
    ## 12 Mexico                   5399.  1668396            309
    ## 13 Turkey                   5151.  1591878            309
    ## 14 Poland                   4657.  1457755            313
    ## 15 South Africa             4417.  1369426            310
    ## 16 Iran                     4073.  1348316            331
    ## 17 Ukraine                  3886.  1177621            303
    ## 18 Peru                     3462.  1073214            310
    ## 19 Indonesia                3003.   939948            313
    ## 20 Czech Republic           2912.   917359            315

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                278.              87568.            315
    ##  2 Israel                        246.              77394.            314
    ##  3 United States                 238.              77481.            325
    ##  4 Switzerland                   204.              66276.            325
    ##  5 Belgium                       204.              65775.            323
    ##  6 Sweden                        176.              56297.            320
    ##  7 Netherlands                   174.              55699.            320
    ##  8 United Kingdom                174.              56228.            324
    ##  9 Portugal                      173.              54478.            314
    ## 10 Serbia                        167.              51389.            308
    ## 11 Jordan                        162.              49540.            305
    ## 12 Spain                         159.              51871.            326
    ## 13 Austria                       151.              48151.            319
    ## 14 Argentina                     142.              44011.            310
    ## 15 France                        138.              45031.            326
    ## 16 Slovakia                      137.              42391.            309
    ## 17 Brazil                        135.              42634.            315
    ## 18 Colombia                      131.              40575.            309
    ## 19 Chile                         131.              40650.            311
    ## 20 Poland                        121.              37864.            313

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         613     2119
    ##  2 Mexico               8.56     142832  1668396
    ##  3 Syria                6.44        858    13313
    ##  4 Ecuador              6.16      14437   234315
    ##  5 Sudan                6.05       1707    28233
    ##  6 Egypt                5.50       8747   158963
    ##  7 Bolivia              5.09       9722   191090
    ##  8 China                4.84       4808    99414
    ##  9 Afghanistan          4.34       2363    54403
    ## 10 Iran                 4.23      57057  1348316
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.05       8651   213409
    ## 13 Mali                 4.03        318     7897
    ## 14 Chad                 3.78        114     3012
    ## 15 Greece               3.70       5545   149973
    ## 16 Peru                 3.64      39044  1073214
    ## 17 Guatemala            3.53       5343   151324
    ## 18 Italy                3.47      83681  2414166
    ## 19 Niger                3.46        147     4249
    ## 20 Nicaragua            3.39        168     4953

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1978.      20572   10.4 
    ##  2 United Kingdom         1496.      93290   62.3 
    ##  3 Czech Republic         1429.      14973   10.5 
    ##  4 Italy                  1387.      83681   60.3 
    ##  5 Peru                   1306.      39044   29.9 
    ##  6 United States          1284.     398435  310.  
    ##  7 Mexico                 1270.     142832  112.  
    ##  8 Bulgaria               1210.       8651    7.15
    ##  9 Spain                  1175.      54637   46.5 
    ## 10 Hungary                1173.      11713    9.98
    ## 11 Sweden                 1130.      10797    9.56
    ## 12 Argentina              1114.      46066   41.3 
    ## 13 France                 1100.      71261   64.8 
    ## 14 Switzerland            1080.       8191    7.58
    ## 15 Brazil                 1052.     211491  201.  
    ## 16 Chile                  1051.      17594   16.7 
    ## 17 Colombia               1034.      49402   47.8 
    ## 18 Bolivia                 977.       9722    9.95
    ## 19 Ecuador                 976.      14437   14.8 
    ## 20 Poland                  898.      34561   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
