WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
-   [Save data](#save-data)

Updated: 2021-02-01

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
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76646. 25676612            335
    ##  2 India                   33270. 10746183            323
    ##  3 Brazil                  28057.  9118513            325
    ##  4 Russia                  12070.  3850439            319
    ##  5 United Kingdom          11208.  3743738            334
    ##  6 France                   9304.  3126351            336
    ##  7 Spain                    8050.  2705001            336
    ##  8 Turkey                   7745.  2470901            319
    ##  9 Italy                    7410.  2541783            343
    ## 10 Germany                  6576.  2216363            337
    ## 11 Colombia                 6513.  2077633            319
    ## 12 Argentina                5985.  1915362            320
    ## 13 Mexico                   5774.  1841893            319
    ## 14 Poland                   4685.  1513385            323
    ## 15 South Africa             4528.  1449236            320
    ## 16 Iran                     4140.  1411731            341
    ## 17 Ukraine                  3896.  1219455            313
    ## 18 Peru                     3518.  1125875            320
    ## 19 Indonesia                3301.  1066313            323
    ## 20 Czech Republic           3030.   984774            325

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                289.              94003.            325
    ##  2 Israel                        267.              86653.            324
    ##  3 United States                 247.              82766.            335
    ##  4 Portugal                      206.              66600.            324
    ##  5 Switzerland                   205.              68429.            334
    ##  6 Belgium                       204.              68042.            333
    ##  7 United Kingdom                180.              60045.            334
    ##  8 Sweden                        180.              59331.            330
    ##  9 Netherlands                   177.              58563.            330
    ## 10 Spain                         173.              58165.            336
    ## 11 Serbia                        169.              53629.            318
    ## 12 Jordan                        161.              50830.            315
    ## 13 Austria                       152.              49956.            329
    ## 14 Argentina                     145.              46328.            320
    ## 15 France                        144.              48270.            336
    ## 16 Slovakia                      144.              45814.            319
    ## 17 Brazil                        140.              45342.            325
    ## 18 Colombia                      136.              43474.            319
    ## 19 Chile                         134.              43167.            321
    ## 20 Italy                         123.              42124.            343

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2124
    ##  2 Mexico               8.50     156579  1841893
    ##  3 Syria                6.54        916    13998
    ##  4 Sudan                6.14       1804    29380
    ##  5 Ecuador              5.95      14851   249779
    ##  6 Egypt                5.60       9263   165418
    ##  7 Bolivia              4.79      10226   213392
    ##  8 China                4.78       4823   100877
    ##  9 Afghanistan          4.36       2400    55023
    ## 10 Bulgaria             4.13       9028   218618
    ## 11 Tanzania             4.13         21      509
    ## 12 Iran                 4.10      57889  1411731
    ## 13 Mali                 4.09        330     8069
    ## 14 Greece               3.69       5779   156473
    ## 15 Peru                 3.61      40686  1125875
    ## 16 Zimbabwe             3.59       1193    33271
    ## 17 Guatemala            3.53       5618   159118
    ## 18 Chad                 3.53        118     3347
    ## 19 Niger                3.52        159     4516
    ## 20 Italy                3.47      88279  2541783

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2025.      21066   10.4 
    ##  2 United Kingdom         1654.     103126   62.3 
    ##  3 Czech Republic         1557.      16308   10.5 
    ##  4 Italy                  1463.      88279   60.3 
    ##  5 United States          1396.     433173  310.  
    ##  6 Mexico                 1392.     156579  112.  
    ##  7 Peru                   1360.      40686   29.9 
    ##  8 Bulgaria               1263.       9028    7.15
    ##  9 Hungary                1255.      12524    9.98
    ## 10 Spain                  1243.      57806   46.5 
    ## 11 Sweden                 1213.      11591    9.56
    ## 12 France                 1165.      75466   64.8 
    ## 13 Argentina              1156.      47775   41.3 
    ## 14 Portugal               1141.      12179   10.7 
    ## 15 Switzerland            1135.       8601    7.58
    ## 16 Colombia               1115.      53284   47.8 
    ## 17 Brazil                 1107.     222666  201.  
    ## 18 Chile                  1095.      18339   16.7 
    ## 19 Bolivia                1028.      10226    9.95
    ## 20 Ecuador                1004.      14851   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
