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

Updated: 2021-04-07

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
    ##  1 United States           76221. 30412206            399
    ##  2 Brazil                  33380. 12984956            389
    ##  3 India                   32696. 12686049            388
    ##  4 Russia                  11973.  4597868            384
    ##  5 France                  11863.  4757381            401
    ##  6 United Kingdom          10932.  4362154            399
    ##  7 Turkey                   9191.  3529601            384
    ##  8 Italy                    9017.  3678944            408
    ##  9 Spain                    8278   3311325            400
    ## 10 Germany                  7216.  2900768            402
    ## 11 Colombia                 6370.  2446219            384
    ## 12 Poland                   6331.  2456709            388
    ## 13 Argentina                6249.  2393492            383
    ## 14 Mexico                   5860.  2250458            384
    ## 15 Iran                     4793.  1945964            406
    ## 16 Ukraine                  4680.  1769164            378
    ## 17 Peru                     4110.  1582367            385
    ## 18 South Africa             4042.  1552416            384
    ## 19 Czech Republic           3988.  1555245            390
    ## 20 Indonesia                3974.  1537967            387

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             148458.            390
    ##  2 Israel                        292.             113520.            389
    ##  3 Jordan                        263.              99803.            380
    ##  4 United States                 246.              98030.            399
    ##  5 Serbia                        221.              84600.            383
    ##  6 Belgium                       218.              86798.            398
    ##  7 Sweden                        215.              85098.            395
    ##  8 Switzerland                   199.              79485.            399
    ##  9 Netherlands                   199.              78550.            395
    ## 10 Portugal                      198.              77120.            389
    ## 11 France                        183.              73452.            401
    ## 12 Hungary                       181.              69299.            382
    ## 13 Spain                         178.              71202.            400
    ## 14 United Kingdom                175.              69964.            399
    ## 15 Slovakia                      175.              66984.            383
    ## 16 Austria                       172.              67968.            394
    ## 17 Brazil                        166.              64569.            389
    ## 18 Poland                        164.              63811.            388
    ## 19 Chile                         160.              61661.            386
    ## 20 Argentina                     151.              57893.            383

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6         956     4885
    ##  2 Mexico                9.07     204147  2250458
    ##  3 Syria                 6.78       1323    19526
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.93      12210   205732
    ##  6 Ecuador               5.04      16987   336777
    ##  7 Somalia               4.77        568    11908
    ##  8 China                 4.71       4851   102949
    ##  9 Bolivia               4.48      12324   274934
    ## 10 Afghanistan           4.42       2512    56779
    ## 11 Zimbabwe              4.13       1525    36934
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.86      13786   356859
    ## 14 Mali                  3.73        392    10501
    ## 15 Niger                 3.73        188     5042
    ## 16 Chad                  3.61        166     4595
    ## 17 Guatemala             3.53       6891   195471
    ## 18 Tunisia               3.44       8993   261177
    ## 19 South Africa          3.41      52995  1552416
    ## 20 Nicaragua             3.34        178     5326

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2593.      27169   10.5 
    ##  2 Belgium                2230.      23202   10.4 
    ##  3 Hungary                2214.      22098    9.98
    ##  4 United Kingdom         2035.     126862   62.3 
    ##  5 Bulgaria               1928.      13786    7.15
    ##  6 Slovakia               1850.      10094    5.46
    ##  7 Italy                  1845.     111326   60.3 
    ##  8 Mexico                 1815.     204147  112.  
    ##  9 United States          1779.     551769  310.  
    ## 10 Peru                   1768.      52877   29.9 
    ## 11 Brazil                 1648.     331433  201.  
    ## 12 Spain                  1630.      75783   46.5 
    ## 13 Portugal               1581.      16879   10.7 
    ## 14 France                 1486.      96260   64.8 
    ## 15 Poland                 1430.      55065   38.5 
    ## 16 Chile                  1414.      23677   16.7 
    ## 17 Sweden                 1413.      13498    9.56
    ## 18 Argentina              1359.      56199   41.3 
    ## 19 Colombia               1341.      64094   47.8 
    ## 20 Switzerland            1276.       9677    7.58

EOL
