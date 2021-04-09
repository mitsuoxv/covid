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

Updated: 2021-04-10

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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
    ##  1 United States           76158. 30615849            402
    ##  2 Brazil                  33656. 13193205            392
    ##  3 India                   33403. 13060542            391
    ##  4 France                  12035.  4862115            404
    ##  5 Russia                  11948.  4623984            387
    ##  6 United Kingdom          10871.  4370325            402
    ##  7 Turkey                   9534.  3689866            387
    ##  8 Italy                    9045.  3717602            411
    ##  9 Spain                    8279.  3336637            403
    ## 10 Germany                  7299.  2956316            405
    ## 11 Poland                   6465.  2528006            391
    ## 12 Colombia                 6407   2479617            387
    ## 13 Argentina                6347.  2450068            386
    ## 14 Mexico                   5844.  2261879            387
    ## 15 Iran                     4907.  2006934            409
    ## 16 Ukraine                  4786.  1823674            381
    ## 17 Peru                     4144.  1607898            388
    ## 18 South Africa             4018.  1554975            387
    ## 19 Czech Republic           4003.  1573153            393
    ## 20 Indonesia                3981.  1552880            390

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             150167.            393
    ##  2 Israel                        290.             113631.            392
    ##  3 Jordan                        267.             102302.            383
    ##  4 United States                 245.              98687.            402
    ##  5 Sweden                        223.              88912.            398
    ##  6 Serbia                        223.              86185.            386
    ##  7 Belgium                       219.              87769.            401
    ##  8 Switzerland                   201.              80757.            402
    ##  9 Netherlands                   200.              79732.            398
    ## 10 Portugal                      197.              77335.            392
    ## 11 France                        186.              75069.            404
    ## 12 Hungary                       184.              70709.            385
    ## 13 Spain                         178.              71746.            403
    ## 14 Slovakia                      175.              67716.            386
    ## 15 United Kingdom                174.              70095.            402
    ## 16 Austria                       174.              68960.            397
    ## 17 Poland                        168.              65662.            391
    ## 18 Brazil                        167.              65604.            392
    ## 19 Chile                         161.              62776.            389
    ## 20 Argentina                     154.              59262.            386

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1005     5137
    ##  2 Mexico                9.09     205598  2261879
    ##  3 Syria                 6.80       1352    19883
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.92      12323   208082
    ##  6 Ecuador               5.01      17115   341619
    ##  7 Somalia               4.93        605    12271
    ##  8 China                 4.71       4851   103034
    ##  9 Bolivia               4.46      12385   277966
    ## 10 Afghanistan           4.42       2521    57019
    ## 11 Zimbabwe              4.13       1532    37052
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.86      14170   367376
    ## 14 Niger                 3.72        188     5052
    ## 15 Chad                  3.62        167     4616
    ## 16 Mali                  3.57        402    11254
    ## 17 Guatemala             3.48       6955   199964
    ## 18 Tunisia               3.42       9136   266827
    ## 19 South Africa          3.42      53173  1554975
    ## 20 Peru                  3.34      53725  1607898

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2636.      27617   10.5 
    ##  2 Hungary                2301.      22966    9.98
    ##  3 Belgium                2244.      23348   10.4 
    ##  4 United Kingdom         2037.     126980   62.3 
    ##  5 Bulgaria               1982.      14170    7.15
    ##  6 Slovakia               1909.      10411    5.46
    ##  7 Italy                  1870.     112861   60.3 
    ##  8 Mexico                 1828.     205598  112.  
    ##  9 Peru                   1796.      53725   29.9 
    ## 10 United States          1785.     553801  310.  
    ## 11 Brazil                 1695.     340776  201.  
    ## 12 Spain                  1638.      76179   46.5 
    ## 13 Portugal               1583.      16899   10.7 
    ## 14 France                 1504.      97430   64.8 
    ## 15 Poland                 1492.      57427   38.5 
    ## 16 Chile                  1432.      23979   16.7 
    ## 17 Sweden                 1423.      13595    9.56
    ## 18 Argentina              1375.      56832   41.3 
    ## 19 Colombia               1355.      64767   47.8 
    ## 20 Switzerland            1285.       9738    7.58

EOL
