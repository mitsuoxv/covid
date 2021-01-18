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

Updated: 2021-01-19

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
    ##  1 United States           73157. 23556676            322
    ##  2 India                   34102. 10571773            310
    ##  3 Brazil                  27099.  8455059            312
    ##  4 Russia                  11735.  3591066            306
    ##  5 United Kingdom          10579.  3395963            321
    ##  6 France                   8865.  2863613            323
    ##  7 Italy                    7216.  2381277            330
    ##  8 Spain                    6848.  2211967            323
    ##  9 Germany                  6298.  2040659            324
    ## 10 Colombia                 6179.  1891034            306
    ## 11 Argentina                5837.  1791979            307
    ## 12 Mexico                   5327.  1630258            306
    ## 13 Turkey                   5139.  1572763            306
    ## 14 Poland                   4641.  1438914            310
    ## 15 South Africa             4358.  1337926            307
    ## 16 Iran                     4056.  1330411            328
    ## 17 Ukraine                  3879.  1163716            300
    ## 18 Peru                     3454.  1060567            307
    ## 19 Indonesia                2928.   907929            310
    ## 20 Netherlands              2878.   912554            317

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                273.              85133.            312
    ##  2 Israel                        238.              74081.            311
    ##  3 United States                 236.              75932.            322
    ##  4 Belgium                       204.              65254.            320
    ##  5 Switzerland                   202.              65003.            322
    ##  6 Netherlands                   173.              54825.            317
    ##  7 Sweden                        173.              54781.            317
    ##  8 United Kingdom                170.              54467.            321
    ##  9 Serbia                        166.              50720.            305
    ## 10 Portugal                      166.              51499.            311
    ## 11 Jordan                        162.              49088.            302
    ## 12 Austria                       151.              47668.            316
    ## 13 Spain                         147.              47563.            323
    ## 14 Argentina                     141.              43344.            307
    ## 15 France                        137.              44213.            323
    ## 16 Brazil                        135.              42043.            312
    ## 17 Slovakia                      134.              41134.            306
    ## 18 Chile                         130.              39998.            308
    ## 19 Colombia                      129.              39570.            306
    ## 20 Poland                        121.              37374.            310

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         613     2116
    ##  2 Mexico               8.60     140241  1630258
    ##  3 Syria                6.38        832    13036
    ##  4 Ecuador              6.20      14316   230808
    ##  5 Sudan                6.10       1603    26279
    ##  6 Egypt                5.49       8583   156397
    ##  7 Bolivia              5.17       9596   185680
    ##  8 China                4.86       4804    98794
    ##  9 Afghanistan          4.33       2343    54062
    ## 10 Iran                 4.27      56803  1330411
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.00       8483   211813
    ## 13 Mali                 3.95        310     7839
    ## 14 Chad                 3.83        111     2895
    ## 15 Greece               3.68       5469   148607
    ## 16 Peru                 3.66      38770  1060567
    ## 17 Guatemala            3.53       5254   148888
    ## 18 Italy                3.45      82177  2381277
    ## 19 Nicaragua            3.40        167     4916
    ## 20 Niger                3.37        140     4156

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1964.      20435   10.4 
    ##  2 United Kingdom         1432.      89261   62.3 
    ##  3 Czech Republic         1379.      14449   10.5 
    ##  4 Italy                  1362.      82177   60.3 
    ##  5 Peru                   1296.      38770   29.9 
    ##  6 United States          1266.     392641  310.  
    ##  7 Mexico                 1247.     140241  112.  
    ##  8 Bulgaria               1187.       8483    7.15
    ##  9 Hungary                1143.      11409    9.98
    ## 10 Spain                  1141.      53079   46.5 
    ## 11 Argentina              1096.      45295   41.3 
    ## 12 Sweden                 1080.      10323    9.56
    ## 13 France                 1079.      69894   64.8 
    ## 14 Switzerland            1046.       7930    7.58
    ## 15 Chile                  1044.      17477   16.7 
    ## 16 Brazil                 1041.     209296  201.  
    ## 17 Colombia               1010.      48256   47.8 
    ## 18 Ecuador                 968.      14316   14.8 
    ## 19 Bolivia                 965.       9596    9.95
    ## 20 Poland                  868.      33407   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
