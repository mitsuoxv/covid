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

Updated: 2021-02-05

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
    ##  1 United States           77204. 26172274            339
    ##  2 India                   32997. 10790183            327
    ##  3 Brazil                  28217.  9283418            329
    ##  4 Russia                  12129.  3917918            323
    ##  5 United Kingdom          11455.  3871829            338
    ##  6 France                   9406.  3198030            340
    ##  7 Spain                    8480.  2883465            340
    ##  8 Turkey                   7743.  2501079            323
    ##  9 Italy                    7446.  2583790            347
    ## 10 Germany                  6604.  2252001            341
    ## 11 Colombia                 6546.  2114597            323
    ## 12 Argentina                5998.  1943548            324
    ## 13 Mexico                   5802.  1874092            323
    ## 14 Poland                   4689.  1533511            327
    ## 15 South Africa             4515.  1463016            324
    ## 16 Iran                     4169.  1438286            345
    ## 17 Ukraine                  3887.  1232246            317
    ## 18 Peru                     3548.  1149764            324
    ## 19 Indonesia                3399.  1111671            327
    ## 20 Czech Republic           3080.  1013352            329

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                294.              96731.            329
    ##  2 Israel                        268.              87788.            328
    ##  3 United States                 249.              84363.            339
    ##  4 Portugal                      212.              69403.            328
    ##  5 Switzerland                   205.              69377.            338
    ##  6 Belgium                       204.              68864.            337
    ##  7 United Kingdom                184.              62100.            338
    ##  8 Spain                         182.              62002.            340
    ##  9 Sweden                        182.              60791.            334
    ## 10 Netherlands                   178.              59431.            334
    ## 11 Serbia                        169.              54574.            322
    ## 12 Jordan                        162.              51579.            319
    ## 13 Austria                       152.              50570.            333
    ## 14 Slovakia                      146.              47095.            323
    ## 15 France                        145.              49376.            340
    ## 16 Argentina                     145.              47010.            324
    ## 17 Brazil                        140.              46162.            329
    ## 18 Colombia                      137.              44248.            323
    ## 19 Chile                         135.              43988.            325
    ## 20 Italy                         123.              42820.            347

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2126
    ##  2 Mexico               8.51     159533  1874092
    ##  3 Syria                6.57        933    14202
    ##  4 Sudan                6.19       1830    29577
    ##  5 Ecuador              5.92      14949   252390
    ##  6 Egypt                5.65       9460   167525
    ##  7 China                4.77       4829   101143
    ##  8 Bolivia              4.77      10513   220426
    ##  9 Afghanistan          4.36       2407    55231
    ## 10 Bulgaria             4.17       9218   221266
    ## 11 Tanzania             4.13         21      509
    ## 12 Mali                 4.10        333     8119
    ## 13 Iran                 4.05      58189  1438286
    ## 14 Zimbabwe             3.74       1269    33964
    ## 15 Greece               3.68       5878   159866
    ## 16 Peru                 3.60      41354  1149764
    ## 17 Niger                3.57        163     4565
    ## 18 Guatemala            3.56       5736   160966
    ## 19 Chad                 3.54        121     3419
    ## 20 Italy                3.48      89820  2583790

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2039.      21216   10.4 
    ##  2 United Kingdom         1754.     109335   62.3 
    ##  3 Czech Republic         1606.      16826   10.5 
    ##  4 Italy                  1489.      89820   60.3 
    ##  5 United States          1429.     443256  310.  
    ##  6 Mexico                 1418.     159533  112.  
    ##  7 Peru                   1383.      41354   29.9 
    ##  8 Spain                  1298.      60370   46.5 
    ##  9 Bulgaria               1289.       9218    7.15
    ## 10 Hungary                1286.      12832    9.98
    ## 11 Sweden                 1249.      11939    9.56
    ## 12 Portugal               1242.      13257   10.7 
    ## 13 France                 1192.      77193   64.8 
    ## 14 Argentina              1171.      48426   41.3 
    ## 15 Switzerland            1156.       8767    7.58
    ## 16 Colombia               1142.      54576   47.8 
    ## 17 Brazil                 1125.     226309  201.  
    ## 18 Chile                  1109.      18576   16.7 
    ## 19 Bolivia                1057.      10513    9.95
    ## 20 Ecuador                1011.      14949   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
