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

Updated: 2021-04-21

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
    ##  1 United States           75908. 31350025            413
    ##  2 India                   38112. 15321089            402
    ##  3 Brazil                  34598. 13943071            403
    ##  4 France                  12565.  5214493            415
    ##  5 Russia                  11856.  4718854            398
    ##  6 Turkey                  10863.  4323596            398
    ##  7 United Kingdom          10631.  4390787            413
    ##  8 Italy                    9192.  3878994            422
    ##  9 Spain                    8281.  3428354            414
    ## 10 Germany                  7604.  3163308            416
    ## 11 Argentina                6786.  2694014            397
    ## 12 Poland                   6728.  2704571            402
    ## 13 Colombia                 6665.  2652947            398
    ## 14 Mexico                   5793.  2305602            398
    ## 15 Iran                     5384.  2261435            420
    ## 16 Ukraine                  5005.  1961956            392
    ## 17 Peru                     4272.  1704757            399
    ## 18 Indonesia                4013.  1609300            401
    ## 19 Czech Republic           3975.  1606030            404
    ## 20 South Africa             3938.  1567513            398

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             153306.            404
    ##  2 Israel                        282.             113832.            403
    ##  3 Jordan                        273.             107612.            394
    ##  4 United States                 245.             101053.            413
    ##  5 Sweden                        230.              94197.            409
    ##  6 Serbia                        228.              90536.            397
    ##  7 Belgium                       222.              91476.            412
    ##  8 Netherlands                   207.              84767.            409
    ##  9 Switzerland                   203.              83682.            413
    ## 10 France                        194.              80510.            415
    ## 11 Portugal                      193.              77859.            403
    ## 12 Hungary                       191.              75619.            396
    ## 13 Spain                         178.              73719.            414
    ## 14 Austria                       177.              72157.            408
    ## 15 Poland                        175.              70249.            402
    ## 16 Slovakia                      174.              69058.            397
    ## 17 Brazil                        172.              69333.            403
    ## 18 United Kingdom                171.              70423.            413
    ## 19 Chile                         169.              67557.            400
    ## 20 Argentina                     164.              65162.            397

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.3        1133     5862
    ##  2 Mexico                9.21     212339  2305602
    ##  3 Syria                 6.84       1456    21279
    ##  4 Sudan                 6.70       2216    33083
    ##  5 Egypt                 5.88      12778   217186
    ##  6 Somalia               5.11        656    12837
    ##  7 Ecuador               4.91      17703   360563
    ##  8 China                 4.70       4856   103340
    ##  9 Afghanistan           4.39       2549    58037
    ## 10 Bolivia               4.38      12648   289066
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1553    37859
    ## 13 Bulgaria              3.96      15412   388815
    ## 14 Niger                 3.72        191     5137
    ## 15 Chad                  3.59        169     4708
    ## 16 South Africa          3.43      53757  1567513
    ## 17 Tunisia               3.42       9825   287061
    ## 18 Guatemala             3.40       7241   213049
    ## 19 Hungary               3.39      25580   754833
    ## 20 Peru                  3.36      57230  1704757

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2734.      28640   10.5 
    ##  2 Hungary                2563.      25580    9.98
    ##  3 Belgium                2286.      23782   10.4 
    ##  4 Bulgaria               2156.      15412    7.15
    ##  5 Slovakia               2061.      11244    5.46
    ##  6 United Kingdom         2041.     127274   62.3 
    ##  7 Italy                  1943.     117243   60.3 
    ##  8 Peru                   1914.      57230   29.9 
    ##  9 Mexico                 1888.     212339  112.  
    ## 10 Brazil                 1856.     373335  201.  
    ## 11 United States          1811.     561921  310.  
    ## 12 Spain                  1658.      77102   46.5 
    ## 13 Poland                 1629.      62734   38.5 
    ## 14 Portugal               1587.      16946   10.7 
    ## 15 France                 1552.     100536   64.8 
    ## 16 Chile                  1509.      25277   16.7 
    ## 17 Sweden                 1443.      13788    9.56
    ## 18 Argentina              1433.      59228   41.3 
    ## 19 Colombia               1430.      68328   47.8 
    ## 20 Jordan                 1297.       8308    6.41

EOL
