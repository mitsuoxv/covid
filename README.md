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

Updated: 2021-04-23

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
    ##  1 United States           75823. 31466876            415
    ##  2 India                   39433. 15930965            404
    ##  3 Brazil                  34674. 14043076            405
    ##  4 France                  12689.  5291461            417
    ##  5 Russia                  11840.  4736121            400
    ##  6 Turkey                  11116   4446591            400
    ##  7 United Kingdom          10592.  4395707            415
    ##  8 Italy                    9209.  3904899            424
    ##  9 Spain                    8284.  3446072            416
    ## 10 Germany                  7698.  3217710            418
    ## 11 Argentina                6876.  2743620            399
    ## 12 Poland                   6760.  2731256            404
    ## 13 Colombia                 6710.  2684101            400
    ## 14 Mexico                   5778.  2311172            400
    ## 15 Iran                     5478.  2311813            422
    ## 16 Ukraine                  5051.  1990353            394
    ## 17 Peru                     4287.  1719088            401
    ## 18 Indonesia                4021.  1620569            403
    ## 19 Czech Republic           3972.  1612832            406
    ## 20 South Africa             3924.  1569935            400

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             153955.            406
    ##  2 Israel                        281.             113893.            405
    ##  3 Jordan                        274.             108535.            396
    ##  4 United States                 244.             101430.            415
    ##  5 Sweden                        235.              96730.            411
    ##  6 Serbia                        229.              91329.            399
    ##  7 Belgium                       223.              92297.            414
    ##  8 Netherlands                   208.              85686.            411
    ##  9 Switzerland                   203.              84315.            415
    ## 10 France                        196.              81698.            417
    ## 11 Portugal                      192.              77956.            405
    ## 12 Hungary                       192.              76234.            398
    ## 13 Spain                         178.              74100.            416
    ## 14 Austria                       177.              72692.            410
    ## 15 Poland                        176.              70942.            404
    ## 16 Slovakia                      174.              69322.            399
    ## 17 Brazil                        172.              69830.            405
    ## 18 United Kingdom                170.              70502.            415
    ## 19 Chile                         170.              68158.            402
    ## 20 Argentina                     166.              66362.            399

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.2        1148     5964
    ##  2 Mexico                9.22     213048  2311172
    ##  3 Syria                 6.87       1483    21584
    ##  4 Sudan                 6.81       2289    33599
    ##  5 Egypt                 5.88      12866   218902
    ##  6 Somalia               5.12        689    13459
    ##  7 Ecuador               4.91      17804   362843
    ##  8 China                 4.70       4856   103382
    ##  9 Afghanistan           4.39       2561    58312
    ## 10 Bolivia               4.35      12695   291675
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1555    37980
    ## 13 Bulgaria              3.97      15618   392913
    ## 14 Niger                 3.72        191     5141
    ## 15 Chad                  3.57        169     4731
    ## 16 South Africa          3.44      53940  1569935
    ## 17 Tunisia               3.42       9993   291833
    ## 18 Hungary               3.42      26001   760967
    ## 19 Mali                  3.38        451    13336
    ## 20 Guatemala             3.38       7309   216329

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2748.      28787   10.5 
    ##  2 Hungary                2605.      26001    9.98
    ##  3 Belgium                2294.      23867   10.4 
    ##  4 Bulgaria               2185.      15618    7.15
    ##  5 Slovakia               2082.      11357    5.46
    ##  6 United Kingdom         2042.     127327   62.3 
    ##  7 Italy                  1956.     117997   60.3 
    ##  8 Peru                   1938.      57954   29.9 
    ##  9 Mexico                 1894.     213048  112.  
    ## 10 Brazil                 1880.     378003  201.  
    ## 11 United States          1815.     563224  310.  
    ## 12 Poland                 1667.      64168   38.5 
    ## 13 Spain                  1664.      77364   46.5 
    ## 14 Portugal               1588.      16952   10.7 
    ## 15 France                 1563.     101230   64.8 
    ## 16 Chile                  1514.      25353   16.7 
    ## 17 Sweden                 1451.      13863    9.56
    ## 18 Colombia               1448.      69177   47.8 
    ## 19 Argentina              1446.      59792   41.3 
    ## 20 Jordan                 1316.       8429    6.41

EOL
