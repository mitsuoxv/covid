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

Updated: 2021-11-03

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
    ##  1 United States           71708. 45678478            637
    ##  2 India                   57351. 34296237            598
    ##  3 Brazil                  36412. 21810855            599
    ##  4 United Kingdom          14938.  9097315            609
    ##  5 Russia                  14466.  8593200            594
    ##  6 Turkey                  13572.  8061666            594
    ##  7 France                  11367.  6945613            611
    ##  8 Iran                     9634.  5934495            616
    ##  9 Argentina                8919.  5288807            593
    ## 10 Colombia                 8421.  5002387            594
    ## 11 Spain                    8215.  5011149            610
    ## 12 Italy                    7726.  4774783            618
    ## 13 Germany                  7546.  4618021            612
    ## 14 Indonesia                7099.  4245373            598
    ## 15 Mexico                   6345.  3807211            600
    ## 16 Poland                   5075.  3034668            598
    ## 17 Ukraine                  5026.  2955693            588
    ## 18 South Africa             4919.  2922222            594
    ## 19 Philippines              4666.  2790375            598
    ## 20 Malaysia                 4106.  2476268            603

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        301.             180633.            600
    ##  2 Czech Republic                282.             169272.            600
    ##  3 Serbia                        264.             156388.            593
    ##  4 United Kingdom                240.             145911.            609
    ##  5 United States                 231.             147239.            637
    ##  6 Jordan                        229.             134954.            590
    ##  7 Argentina                     216.             127924.            593
    ##  8 Belgium                       215.             130794.            608
    ##  9 Netherlands                   212.             128552.            605
    ## 10 Sweden                        203.             122819.            605
    ## 11 Switzerland                   189.             115211.            609
    ## 12 Brazil                        181.             108456.            599
    ## 13 Spain                         177.             107753.            610
    ## 14 Colombia                      176.             104674.            594
    ## 15 France                        176.             107238.            611
    ## 16 Turkey                        174.             103615.            594
    ## 17 Portugal                      171.             102205.            599
    ## 18 Chile                         170.             101322.            596
    ## 19 Austria                       168.             101521.            603
    ## 20 Slovakia                      151.              89444.            594

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1890     9799
    ##  2 Peru                 9.09     200246  2201796
    ##  3 Mexico               7.57     288365  3807211
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.90       2576    43666
    ##  7 Egypt                5.64      18711   331968
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.66       7281   156284
    ## 10 China                4.52       5696   126155
    ## 11 Bulgaria             3.99      24309   608499
    ## 12 Myanmar              3.74      18714   500950
    ## 13 Malawi               3.72       2302    61800
    ## 14 Bolivia              3.68      18928   513810
    ## 15 Tunisia              3.54      25244   712776
    ## 16 Hungary              3.53      30920   876497
    ## 17 Paraguay             3.52      16247   461041
    ## 18 Zimbabwe             3.52       4679   133007
    ## 19 Mali                 3.51        565    16099
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6696.     200246   29.9 
    ##  2 Bulgaria               3400.      24309    7.15
    ##  3 Hungary                3098.      30920    9.98
    ##  4 Brazil                 3022.     607824  201.  
    ##  5 Czech Republic         2941.      30807   10.5 
    ##  6 Argentina              2805.     115950   41.3 
    ##  7 Colombia               2663.     127281   47.8 
    ##  8 Mexico                 2564.     288365  112.  
    ##  9 Paraguay               2548.      16247    6.38
    ## 10 Belgium                2499.      25994   10.4 
    ## 11 Slovakia               2397.      13076    5.46
    ## 12 United States          2386.     740366  310.  
    ## 13 Tunisia                2384.      25244   10.6 
    ## 14 United Kingdom         2256.     140672   62.3 
    ## 15 Chile                  2256.      37777   16.7 
    ## 16 Ecuador                2228.      32958   14.8 
    ## 17 Romania                2216.      48664   22.0 
    ## 18 Italy                  2190.     132120   60.3 
    ## 19 Poland                 2001.      77021   38.5 
    ## 20 Bolivia                1903.      18928    9.95

EOL
