WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-06-17

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
    ##  1 United States           69210. 33151678            479
    ##  2 India                   64560. 29633105            459
    ##  3 Brazil                  37940. 17452612            460
    ##  4 France                  11945.  5638116            472
    ##  5 Turkey                  11740.  5342028            455
    ##  6 Russia                  11538.  5249990            455
    ##  7 United Kingdom           9747.  4581010            470
    ##  8 Argentina                9131.  4145482            454
    ##  9 Italy                    8866.  4247032            479
    ## 10 Colombia                 8302.  3777600            455
    ## 11 Spain                    7951.  3745199            471
    ## 12 Germany                  7859.  3717625            473
    ## 13 Iran                     6393.  3049648            477
    ## 14 Poland                   6270.  2878061            459
    ## 15 Mexico                   5396.  2455351            455
    ## 16 Ukraine                  4958.  2226037            449
    ## 17 Peru                     4395.  2004252            456
    ## 18 Indonesia                4221.  1937652            459
    ## 19 South Africa             3870.  1761066            455
    ## 20 Czech Republic           3613.  1665526            461

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                345.             158985.            461
    ##  2 Jordan                        258.             116180.            451
    ##  3 Israel                        248.             114187.            461
    ##  4 Sweden                        244.             113504.            466
    ##  5 United States                 223.             106861.            479
    ##  6 Argentina                     221.             100270.            454
    ##  7 Belgium                       221.             103536.            469
    ##  8 Netherlands                   216.             100608.            466
    ##  9 Serbia                        214.              97367.            454
    ## 10 Switzerland                   196.              92054.            470
    ## 11 Chile                         194.              88809.            457
    ## 12 Brazil                        189.              86784.            460
    ## 13 France                        184.              87050.            472
    ## 14 Hungary                       178.              80866.            453
    ## 15 Portugal                      175.              80465.            460
    ## 16 Colombia                      174.              79046.            455
    ## 17 Spain                         171.              80532.            471
    ## 18 Austria                       169.              78584.            465
    ## 19 Poland                        163.              74755.            459
    ## 20 Slovakia                      158.              71705.            454

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1350     6864
    ##  2 Peru                  9.43     188921  2004252
    ##  3 Mexico                9.37     230187  2455351
    ##  4 Sudan                 7.53       2732    36304
    ##  5 Syria                 7.31       1821    24904
    ##  6 Egypt                 5.72      15691   274404
    ##  7 Somalia               5.23        775    14823
    ##  8 Ecuador               4.79      21061   439374
    ##  9 China                 4.55       5306   116665
    ## 10 Bulgaria              4.26      17932   420654
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.06       1637    40318
    ## 13 Afghanistan           3.95       3683    93288
    ## 14 Sierra Leone          3.91        174     4449
    ## 15 Bolivia               3.81      15614   409706
    ## 16 Hungary               3.70      29860   807209
    ## 17 Tunisia               3.67      13656   372221
    ## 18 Mali                  3.64        523    14357
    ## 19 Niger                 3.52        192     5452
    ## 20 Chad                  3.52        174     4943

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6317.     188921   29.9 
    ##  2 Hungary                2991.      29860    9.98
    ##  3 Czech Republic         2888.      30254   10.5 
    ##  4 Bulgaria               2508.      17932    7.15
    ##  5 Brazil                 2428.     488228  201.  
    ##  6 Belgium                2413.      25099   10.4 
    ##  7 Slovakia               2283.      12456    5.46
    ##  8 Italy                  2106.     127101   60.3 
    ##  9 Argentina              2081.      86029   41.3 
    ## 10 United Kingdom         2052.     127917   62.3 
    ## 11 Mexico                 2047.     230187  112.  
    ## 12 Colombia               2016.      96366   47.8 
    ## 13 Poland                 1940.      74688   38.5 
    ## 14 United States          1918.     594888  310.  
    ## 15 Chile                  1843.      30865   16.7 
    ## 16 Spain                  1733.      80579   46.5 
    ## 17 Paraguay               1718.      10954    6.38
    ## 18 France                 1693.     109640   64.8 
    ## 19 Portugal               1597.      17049   10.7 
    ## 20 Bolivia                1570.      15614    9.95

EOL
