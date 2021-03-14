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

Updated: 2021-03-15

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
    ##  1 United States           77296. 29063401            376
    ##  2 India                   31120. 11359048            365
    ##  3 Brazil                  31047. 11363380            366
    ##  4 Russia                  12162.  4390608            361
    ##  5 United Kingdom          11313.  4253824            376
    ##  6 France                  10518.  3975989            378
    ##  7 Spain                    8445.  3183704            377
    ##  8 Italy                    8316.  3201838            385
    ##  9 Turkey                   7939.  2866012            361
    ## 10 Germany                  6779.  2569245            379
    ## 11 Colombia                 6356.  2294617            361
    ## 12 Argentina                6089.  2192025            360
    ## 13 Mexico                   5977.  2157771            361
    ## 14 Poland                   5223.  1906632            365
    ## 15 Iran                     4541.  1739360            383
    ## 16 South Africa             4257.  1528414            359
    ## 17 Ukraine                  4114.  1460756            355
    ## 18 Indonesia                3876.  1414741            365
    ## 19 Peru                     3874.  1402610            362
    ## 20 Czech Republic           3812.  1399078            367

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                364.             133551.            367
    ##  2 Israel                        300.             109635.            366
    ##  3 United States                 249.              93683.            376
    ##  4 Portugal                      208.              76219.            366
    ##  5 Belgium                       206.              77412.            375
    ##  6 Jordan                        205.              73200.            357
    ##  7 Sweden                        200.              74564.            372
    ##  8 Switzerland                   199.              74920.            376
    ##  9 Serbia                        194.              69716.            360
    ## 10 Netherlands                   186.              69163.            372
    ## 11 Spain                         182.              68458.            377
    ## 12 United Kingdom                181.              68227.            376
    ## 13 Slovakia                      172.              61870.            360
    ## 14 France                        162.              61388.            378
    ## 15 Austria                       160.              59477.            371
    ## 16 Brazil                        154.              56505.            366
    ## 17 Argentina                     147.              53020.            360
    ## 18 Chile                         146.              52870.            363
    ## 19 Hungary                       144.              51742.            359
    ## 20 Italy                         138.              53063.            385

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               24.6         684     2775
    ##  2 Mexico               8.98     193851  2157771
    ##  3 Syria                6.67       1094    16401
    ##  4 Sudan                6.28       1940    30873
    ##  5 Egypt                5.92      11256   190280
    ##  6 Ecuador              5.39      16215   300666
    ##  7 China                4.74       4849   102333
    ##  8 Bolivia              4.61      11903   258324
    ##  9 Afghanistan          4.39       2457    55985
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.12       1501    36471
    ## 12 Mali                 4.06        360     8862
    ## 13 Bulgaria             4.04      11234   277878
    ## 14 Somalia              3.90        349     8946
    ## 15 Niger                3.73        181     4857
    ## 16 Guatemala            3.60       6546   181974
    ## 17 Chad                 3.57        153     4288
    ## 18 Iran                 3.52      61142  1739360
    ## 19 Peru                 3.47      48664  1402610
    ## 20 Tunisia              3.46       8359   241257

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2217.      23226   10.5 
    ##  2 Belgium                2155.      22421   10.4 
    ##  3 United Kingdom         2012.     125464   62.3 
    ##  4 Mexico                 1724.     193851  112.  
    ##  5 United States          1703.     528456  310.  
    ##  6 Hungary                1698.      16952    9.98
    ##  7 Italy                  1688.     101881   60.3 
    ##  8 Peru                   1627.      48664   29.9 
    ##  9 Bulgaria               1571.      11234    7.15
    ## 10 Slovakia               1563.       8528    5.46
    ## 11 Portugal               1561.      16669   10.7 
    ## 12 Spain                  1554.      72258   46.5 
    ## 13 France                 1386.      89800   64.8 
    ## 14 Sweden                 1376.      13146    9.56
    ## 15 Brazil                 1368.     275105  201.  
    ## 16 Argentina              1298.      53646   41.3 
    ## 17 Chile                  1288.      21574   16.7 
    ## 18 Colombia               1275.      60950   47.8 
    ## 19 Switzerland            1235.       9359    7.58
    ## 20 Poland                 1225.      47178   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
