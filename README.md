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

Updated: 2021-02-04

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
    ##  1 United States           77087. 26055512            338
    ##  2 India                   33059. 10777284            326
    ##  3 Brazil                  28138.  9229322            328
    ##  4 Russia                  12115.  3901204            322
    ##  5 United Kingdom          11432.  3852627            337
    ##  6 France                   9357.  3172126            339
    ##  7 Spain                    7979.  2705001            339
    ##  8 Turkey                   7742.  2492977            322
    ##  9 Italy                    7429.  2570608            346
    ## 10 Germany                  6581.  2237790            340
    ## 11 Colombia                 6535.  2104506            322
    ## 12 Argentina                6017.  1943548            323
    ## 13 Mexico                   5806.  1869708            322
    ## 14 Poland                   4684.  1527016            326
    ## 15 South Africa             4517.  1458958            323
    ## 16 Iran                     4161.  1431416            344
    ## 17 Ukraine                  3883.  1227164            316
    ## 18 Peru                     3537.  1142716            323
    ## 19 Indonesia                3373.  1099687            326
    ## 20 Czech Republic           3060.  1003657            328

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                292.              95805.            328
    ##  2 Israel                        268.              87788.            327
    ##  3 United States                 248.              83987.            338
    ##  4 Portugal                      210.              68552.            327
    ##  5 Switzerland                   205.              69140.            337
    ##  6 Belgium                       204.              68564.            336
    ##  7 United Kingdom                183.              61792.            337
    ##  8 Sweden                        181.              60340.            333
    ##  9 Netherlands                   178.              59190.            333
    ## 10 Spain                         172.              58165.            339
    ## 11 Serbia                        169.              54311.            321
    ## 12 Jordan                        162.              51380.            318
    ## 13 Austria                       152.              50364.            332
    ## 14 Argentina                     146.              47010.            323
    ## 15 Slovakia                      145.              46714.            322
    ## 16 France                        144.              48976.            339
    ## 17 Brazil                        140.              45893.            328
    ## 18 Colombia                      137.              44037.            322
    ## 19 Chile                         135.              43832.            324
    ## 20 Italy                         123.              42602.            346

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2126
    ##  2 Mexico               8.51     159100  1869708
    ##  3 Syria                6.57        929    14142
    ##  4 Sudan                6.19       1829    29536
    ##  5 Ecuador              5.94      14915   251279
    ##  6 Egypt                5.63       9407   167013
    ##  7 Bolivia              4.78      10439   218299
    ##  8 China                4.78       4828   101092
    ##  9 Afghanistan          4.36       2406    55174
    ## 10 Bulgaria             4.16       9178   220547
    ## 11 Tanzania             4.13         21      509
    ## 12 Mali                 4.11        333     8111
    ## 13 Iran                 4.06      58110  1431416
    ## 14 Zimbabwe             3.71       1254    33814
    ## 15 Greece               3.69       5851   158716
    ## 16 Peru                 3.60      41181  1142716
    ## 17 Niger                3.56        162     4548
    ## 18 Guatemala            3.56       5709   160299
    ## 19 Chad                 3.55        121     3404
    ## 20 Italy                3.48      89344  2570608

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2035.      21173   10.4 
    ##  2 United Kingdom         1732.     108013   62.3 
    ##  3 Czech Republic         1592.      16683   10.5 
    ##  4 Italy                  1481.      89344   60.3 
    ##  5 United States          1418.     439830  310.  
    ##  6 Mexico                 1415.     159100  112.  
    ##  7 Peru                   1377.      41181   29.9 
    ##  8 Bulgaria               1284.       9178    7.15
    ##  9 Hungary                1276.      12739    9.98
    ## 10 Spain                  1243.      57806   46.5 
    ## 11 Sweden                 1236.      11815    9.56
    ## 12 Portugal               1219.      13017   10.7 
    ## 13 France                 1186.      76840   64.8 
    ## 14 Argentina              1171.      48426   41.3 
    ## 15 Switzerland            1151.       8725    7.58
    ## 16 Colombia               1136.      54272   47.8 
    ## 17 Brazil                 1119.     225099  201.  
    ## 18 Chile                  1108.      18559   16.7 
    ## 19 Bolivia                1049.      10439    9.95
    ## 20 Ecuador                1008.      14915   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
