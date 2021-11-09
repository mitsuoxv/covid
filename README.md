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

Updated: 2021-11-10

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           71728. 46193234            644
    ##  2 India                   56821. 34377113            605
    ##  3 Brazil                  36106. 21880439            606
    ##  4 United Kingdom          15152.  9333895            616
    ##  5 Russia                  14765.  8873655            601
    ##  6 Turkey                  13743.  8259503            601
    ##  7 France                  11318.  6994575            618
    ##  8 Iran                     9624.  5996155            623
    ##  9 Argentina                8828.  5296781            600
    ## 10 Colombia                 8344.  5015042            601
    ## 11 Spain                    8155.  5032057            617
    ## 12 Germany                  7761.  4804378            619
    ## 13 Italy                    7700.  4812591            625
    ## 14 Indonesia                7023.  4248843            605
    ## 15 Mexico                   6304.  3826786            607
    ## 16 Ukraine                  5222.  3107489            595
    ## 17 Poland                   5165.  3125179            605
    ## 18 South Africa             4865.  2924072            601
    ## 19 Philippines              4637.  2805294            605
    ## 20 Malaysia                 4116.  2510852            610

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        299.             181523.            607
    ##  2 Czech Republic                288.             174536.            607
    ##  3 Serbia                        269.             161661.            600
    ##  4 United Kingdom                243.             149705.            616
    ##  5 United States                 231.             148899.            644
    ##  6 Jordan                        230.             137093.            597
    ##  7 Belgium                       225.             138309.            615
    ##  8 Netherlands                   217.             132942.            612
    ##  9 Argentina                     214.             128117.            600
    ## 10 Sweden                        201.             123180.            612
    ## 11 Switzerland                   191.             117440.            616
    ## 12 Brazil                        180.             108802.            606
    ## 13 Austria                       178.             108395.            610
    ## 14 Turkey                        177.             106158.            601
    ## 15 Spain                         175.             108202.            617
    ## 16 France                        175.             107994.            618
    ## 17 Colombia                      175.             104939.            601
    ## 18 Portugal                      170.             102859.            606
    ## 19 Chile                         169.             102197.            603
    ## 20 Slovakia                      161.              96537.            601

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1909     9883
    ##  2 Peru                 9.08     200438  2207510
    ##  3 Mexico               7.57     289734  3826786
    ##  4 Sudan                7.48       3067    41019
    ##  5 Ecuador              6.35      32989   519386
    ##  6 Syria                5.81       2630    45284
    ##  7 Somalia              5.70       1294    22693
    ##  8 Egypt                5.65      19130   338414
    ##  9 Afghanistan          4.66       7288   156397
    ## 10 China                4.49       5696   126775
    ## 11 Bulgaria             3.98      25408   638048
    ## 12 Malawi               3.72       2302    61818
    ## 13 Myanmar              3.71      18839   507815
    ## 14 Bolivia              3.66      18967   518266
    ## 15 Tunisia              3.54      25281   713352
    ## 16 Paraguay             3.53      16263   461361
    ## 17 Zimbabwe             3.52       4690   133205
    ## 18 Mali                 3.51        576    16407
    ## 19 Hungary              3.45      31521   914586
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6702.     200438   29.9 
    ##  2 Bulgaria               3554.      25408    7.15
    ##  3 Hungary                3158.      31521    9.98
    ##  4 Brazil                 3031.     609447  201.  
    ##  5 Czech Republic         2976.      31173   10.5 
    ##  6 Argentina              2808.     116104   41.3 
    ##  7 Colombia               2669.     127533   47.8 
    ##  8 Mexico                 2576.     289734  112.  
    ##  9 Paraguay               2551.      16263    6.38
    ## 10 Belgium                2519.      26200   10.4 
    ## 11 Slovakia               2441.      13314    5.46
    ## 12 United States          2413.     748615  310.  
    ## 13 Tunisia                2387.      25281   10.6 
    ## 14 Romania                2322.      50996   22.0 
    ## 15 United Kingdom         2275.     141862   62.3 
    ## 16 Chile                  2262.      37879   16.7 
    ## 17 Ecuador                2230.      32989   14.8 
    ## 18 Italy                  2195.     132423   60.3 
    ## 19 Poland                 2025.      77980   38.5 
    ## 20 Bolivia                1907.      18967    9.95

EOL
