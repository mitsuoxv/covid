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

Updated: 2021-03-16

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
    ##  1 United States           77230. 29115662            377
    ##  2 Brazil                  31170. 11439558            367
    ##  3 India                   31107. 11385339            366
    ##  4 Russia                  12154.  4400045            362
    ##  5 United Kingdom          11295.  4258442            377
    ##  6 France                  10559.  4002129            379
    ##  7 Spain                    8422.  3183704            378
    ##  8 Italy                    8350.  3223142            386
    ##  9 Turkey                   7954.  2879390            362
    ## 10 Germany                  6778.  2575849            380
    ## 11 Colombia                 6351.  2299082            362
    ## 12 Argentina                6082.  2195722            361
    ## 13 Mexico                   5977.  2163875            362
    ## 14 Poland                   5239.  1917527            366
    ## 15 Iran                     4549.  1746953            384
    ## 16 South Africa             4248.  1529420            360
    ## 17 Ukraine                  4122.  1467548            356
    ## 18 Peru                     3878.  1407963            363
    ## 19 Indonesia                3878.  1419455            366
    ## 20 Czech Republic           3811.  1402420            368

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                364.             133870.            368
    ##  2 Israel                        299.             109635.            367
    ##  3 United States                 249.              93851.            377
    ##  4 Jordan                        208.              74457.            358
    ##  5 Portugal                      208.              76270.            367
    ##  6 Belgium                       207.              77697.            376
    ##  7 Sweden                        200.              74564.            373
    ##  8 Switzerland                   199.              74920.            377
    ##  9 Serbia                        195.              70291.            361
    ## 10 Netherlands                   186.              69522.            373
    ## 11 United Kingdom                181.              68301.            377
    ## 12 Spain                         181.              68458.            378
    ## 13 Slovakia                      172.              61954.            361
    ## 14 France                        163.              61791.            379
    ## 15 Austria                       161.              59801.            372
    ## 16 Brazil                        155.              56884.            367
    ## 17 Argentina                     147.              53110.            361
    ## 18 Chile                         146.              53212.            364
    ## 19 Hungary                       146.              52514.            360
    ## 20 Italy                         138.              53416.            386

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               24.3         690     2840
    ##  2 Mexico               8.99     194490  2163875
    ##  3 Syria                6.67       1099    16478
    ##  4 Sudan                6.28       1940    30873
    ##  5 Egypt                5.92      11300   190924
    ##  6 Ecuador              5.37      16236   302221
    ##  7 China                4.74       4849   102363
    ##  8 Bolivia              4.61      11944   259004
    ##  9 Afghanistan          4.39       2459    55985
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.12       1503    36484
    ## 12 Mali                 4.06        360     8862
    ## 13 Bulgaria             4.05      11285   278557
    ## 14 Somalia              3.99        367     9190
    ## 15 Niger                3.74        182     4860
    ## 16 Guatemala            3.60       6568   182679
    ## 17 Chad                 3.57        154     4309
    ## 18 Iran                 3.50      61230  1746953
    ## 19 Peru                 3.47      48841  1407963
    ## 20 Tunisia              3.47       8389   241834

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2232.      23379   10.5 
    ##  2 Belgium                2157.      22441   10.4 
    ##  3 United Kingdom         2013.     125516   62.3 
    ##  4 Mexico                 1729.     194490  112.  
    ##  5 Hungary                1711.      17083    9.98
    ##  6 United States          1707.     529529  310.  
    ##  7 Italy                  1693.     102145   60.3 
    ##  8 Peru                   1633.      48841   29.9 
    ##  9 Bulgaria               1579.      11285    7.15
    ## 10 Slovakia               1577.       8605    5.46
    ## 11 Portugal               1563.      16684   10.7 
    ## 12 Spain                  1554.      72258   46.5 
    ## 13 France                 1389.      89932   64.8 
    ## 14 Brazil                 1378.     277102  201.  
    ## 15 Sweden                 1376.      13146    9.56
    ## 16 Argentina              1298.      53670   41.3 
    ## 17 Chile                  1294.      21674   16.7 
    ## 18 Colombia               1277.      61046   47.8 
    ## 19 Switzerland            1235.       9359    7.58
    ## 20 Poland                 1226.      47206   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
