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

Updated: 2022-01-11

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
    ##  1 United States           87224. 59138083            678
    ##  2 India                   53535. 35707727            667
    ##  3 Brazil                  33682. 22499525            668
    ##  4 United Kingdom          21413. 14475196            676
    ##  5 France                  17388. 11823789            680
    ##  6 Russia                  16088. 10666679            663
    ##  7 Turkey                  15049.  9977561            663
    ##  8 Germany                 11065.  7535691            681
    ##  9 Italy                   10825.  7436939            687
    ## 10 Spain                   10552.  7164907            679
    ## 11 Argentina                9422.  6237525            662
    ## 12 Iran                     9060.  6205997            685
    ## 13 Colombia                 7994.  5300032            663
    ## 14 Indonesia                6397.  4266649            667
    ## 15 Poland                   6328.  4220984            667
    ## 16 Mexico                   6149.  4113789            669
    ## 17 Ukraine                  5638.  3704442            657
    ## 18 South Africa             5318.  3526054            663
    ## 19 Netherlands              4960.  3343146            674
    ## 20 Philippines              4446.  2965447            667

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                361.             241592.            669
    ##  2 United Kingdom                343.             232166.            676
    ##  3 Belgium                       317.             214523.            677
    ##  4 Israel                        307.             205720.            670
    ##  5 Netherlands                   298.             200850.            674
    ##  6 Switzerland                   287.             194772.            678
    ##  7 United States                 281.             190625.            678
    ##  8 Serbia                        278.             183883.            662
    ##  9 France                        268.             182555.            680
    ## 10 Denmark                       263.             176784.            672
    ## 11 Jordan                        256.             168529.            659
    ## 12 Austria                       242.             162932.            672
    ## 13 Slovakia                      239.             158353.            663
    ## 14 Portugal                      230.             153601.            668
    ## 15 Argentina                     228.             150872.            662
    ## 16 Spain                         227.             154064.            679
    ## 17 Sweden                        220.             148249.            674
    ## 18 Greece                        205.             137056             669
    ## 19 Hungary                       197.             129995.            661
    ## 20 Turkey                        193.             128239.            663

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1986    10197
    ##  2 Peru                 8.61     203019  2358685
    ##  3 Mexico               7.30     300303  4113789
    ##  4 Sudan                6.91       3340    48355
    ##  5 Ecuador              5.97      33706   564238
    ##  6 Syria                5.79       2926    50502
    ##  7 Egypt                5.59      21964   392857
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.66       7373   158381
    ## 10 China                4.25       5699   134152
    ## 11 Bulgaria             4.04      31556   780417
    ## 12 Myanmar              3.63      19291   532062
    ## 13 Paraguay             3.50      16670   475686
    ## 14 Niger                3.50        280     8006
    ## 15 Tunisia              3.45      25665   743838
    ## 16 Indonesia            3.38     144136  4266649
    ## 17 Romania              3.20      59011  1844537
    ## 18 El Salvador          3.13       3827   122234
    ## 19 Hungary              3.08      39947  1297612
    ## 20 Malawi               3.02       2413    79987

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6788.     203019   29.9 
    ##  2 Bulgaria               4414.      31556    7.15
    ##  3 Hungary                4002.      39947    9.98
    ##  4 Czech Republic         3496.      36624   10.5 
    ##  5 Slovakia               3114.      16989    5.46
    ##  6 Brazil                 3083.     619937  201.  
    ##  7 Argentina              2841.     117465   41.3 
    ##  8 Belgium                2736.      28459   10.4 
    ##  9 Colombia               2726.     130288   47.8 
    ## 10 Romania                2687.      59011   22.0 
    ## 11 United States          2676.     830334  310.  
    ## 12 Mexico                 2670.     300303  112.  
    ## 13 Paraguay               2615.      16670    6.38
    ## 14 Poland                 2591.      99761   38.5 
    ## 15 Tunisia                2424.      25665   10.6 
    ## 16 United Kingdom         2408.     150154   62.3 
    ## 17 Chile                  2345.      39272   16.7 
    ## 18 Italy                  2304.     139038   60.3 
    ## 19 Ecuador                2279.      33706   14.8 
    ## 20 Russia                 2252.     316904  141.

EOL
