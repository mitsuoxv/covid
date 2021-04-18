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

Updated: 2021-04-19

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
    ##  1 United States           76035. 31250635            411
    ##  2 India                   36970. 14788109            400
    ##  3 Brazil                  34495. 13832455            401
    ##  4 France                  12538.  5178513            413
    ##  5 Russia                  11874.  4702101            396
    ##  6 United Kingdom          10671.  4385942            411
    ##  7 Turkey                  10638.  4212645            396
    ##  8 Italy                    9184.  3857443            420
    ##  9 Spain                    8244.  3396685            412
    ## 10 Germany                  7590.  3142262            414
    ## 11 Argentina                6730.  2658628            395
    ## 12 Poland                   6720.  2688025            400
    ## 13 Colombia                 6614.  2619422            396
    ## 14 Mexico                   5808.  2299939            396
    ## 15 Iran                     5300.  2215445            418
    ## 16 Ukraine                  4991.  1946510            390
    ## 17 Peru                     4254.  1689051            397
    ## 18 Indonesia                4009.  1599763            399
    ## 19 Czech Republic           3981.  1600347            402
    ## 20 South Africa             3953.  1565680            396

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                380.             152763.            402
    ##  2 Israel                        284.             113806.            401
    ##  3 Jordan                        272.             106673.            392
    ##  4 United States                 245.             100733.            411
    ##  5 Sweden                        231.              94197.            407
    ##  6 Serbia                        228.              89900.            395
    ##  7 Belgium                       222.              91031.            410
    ##  8 Netherlands                   206.              83829.            407
    ##  9 Switzerland                   202.              83037.            411
    ## 10 Portugal                      194.              77736.            401
    ## 11 France                        194.              79954.            413
    ## 12 Hungary                       191.              75186.            394
    ## 13 Spain                         177.              73038.            412
    ## 14 Austria                       177.              71676.            406
    ## 15 Poland                        175.              69819.            400
    ## 16 Slovakia                      174.              68923.            395
    ## 17 Brazil                        172.              68783.            401
    ## 18 United Kingdom                171.              70346.            411
    ## 19 Chile                         168.              66721.            398
    ## 20 Argentina                     163.              64306.            395

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1120     5774
    ##  2 Mexico                9.20     211693  2299939
    ##  3 Syria                 6.84       1437    21004
    ##  4 Sudan                 6.69       2208    33022
    ##  5 Egypt                 5.89      12694   215484
    ##  6 Somalia               5.11        656    12837
    ##  7 Ecuador               4.93      17641   358157
    ##  8 China                 4.70       4856   103273
    ##  9 Bolivia               4.39      12625   287360
    ## 10 Afghanistan           4.39       2539    57793
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.12       1552    37669
    ## 13 Bulgaria              3.92      15138   385963
    ## 14 Niger                 3.72        190     5114
    ## 15 Chad                  3.58        168     4691
    ## 16 South Africa          3.43      53711  1565680
    ## 17 Tunisia               3.42       9717   283976
    ## 18 Guatemala             3.39       7190   212307
    ## 19 Hungary               3.36      25184   750508
    ## 20 Malawi                3.35       1138    33934

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2713.      28426   10.5 
    ##  2 Hungary                2523.      25184    9.98
    ##  3 Belgium                2280.      23718   10.4 
    ##  4 Bulgaria               2118.      15138    7.15
    ##  5 United Kingdom         2041.     127260   62.3 
    ##  6 Slovakia               2036.      11106    5.46
    ##  7 Italy                  1934.     116676   60.3 
    ##  8 Peru                   1888.      56454   29.9 
    ##  9 Mexico                 1882.     211693  112.  
    ## 10 Brazil                 1834.     368749  201.  
    ## 11 United States          1808.     560858  310.  
    ## 12 Spain                  1653.      76882   46.5 
    ## 13 Poland                 1611.      62032   38.5 
    ## 14 Portugal               1586.      16937   10.7 
    ## 15 France                 1543.      99921   64.8 
    ## 16 Chile                  1496.      25055   16.7 
    ## 17 Sweden                 1443.      13788    9.56
    ## 18 Argentina              1429.      59084   41.3 
    ## 19 Colombia               1414.      67564   47.8 
    ## 20 Switzerland            1295.       9815    7.58

EOL
