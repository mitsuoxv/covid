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

Updated: 2021-11-05

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
    ##  1 United States           71814. 45889496            639
    ##  2 India                   57202. 34321025            600
    ##  3 Brazil                  36308. 21821124            601
    ##  4 United Kingdom          15011.  9171664            611
    ##  5 Russia                  14553.  8673860            596
    ##  6 Turkey                  13626.  8121226            596
    ##  7 France                  11349.  6956857            613
    ##  8 Iran                     9636.  5954962            618
    ##  9 Argentina                8893.  5291285            595
    ## 10 Colombia                 8398.  5005402            596
    ## 11 Spain                    8201.  5019255            612
    ## 12 Italy                    7714.  4782802            620
    ## 13 Germany                  7610.  4672368            614
    ## 14 Indonesia                7078.  4246802            600
    ## 15 Mexico                   6332.  3811793            602
    ## 16 Poland                   5101.  3060613            600
    ## 17 Ukraine                  5096.  3006463            590
    ## 18 South Africa             4904.  2922735            596
    ## 19 Philippines              4656.  2793898            600
    ## 20 Malaysia                 4110.  2486630            605

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        301.             181180.            602
    ##  2 Czech Republic                284.             171125.            602
    ##  3 Serbia                        266.             158272.            595
    ##  4 United Kingdom                241.             147103.            611
    ##  5 United States                 231.             147920.            639
    ##  6 Jordan                        229.             135552.            592
    ##  7 Belgium                       220.             133938.            610
    ##  8 Argentina                     215.             127984.            595
    ##  9 Netherlands                   213.             129563.            607
    ## 10 Sweden                        203.             123005.            607
    ## 11 Switzerland                   190.             115810.            611
    ## 12 Brazil                        181.             108507.            601
    ## 13 Spain                         176.             107927.            612
    ## 14 Colombia                      176.             104737.            596
    ## 15 France                        175.             107411.            613
    ## 16 Turkey                        175.             104380.            596
    ## 17 Portugal                      170.             102348.            601
    ## 18 Austria                       170.             102917.            605
    ## 19 Chile                         170.             101480.            598
    ## 20 Slovakia                      154.              91657.            596

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1897     9810
    ##  2 Peru                 9.09     200300  2202671
    ##  3 Mexico               7.57     288733  3811793
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.87       2593    44191
    ##  7 Egypt                5.64      18832   333840
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.66       7284   156323
    ## 10 China                4.51       5696   126384
    ## 11 Bulgaria             3.97      24589   619284
    ## 12 Myanmar              3.73      18744   502979
    ## 13 Malawi               3.72       2302    61803
    ## 14 Bolivia              3.68      18936   514679
    ## 15 Tunisia              3.54      25254   712982
    ## 16 Paraguay             3.52      16250   461132
    ## 17 Zimbabwe             3.52       4684   133091
    ## 18 Mali                 3.51        569    16196
    ## 19 Hungary              3.51      31101   885360
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6697.     200300   29.9 
    ##  2 Bulgaria               3440.      24589    7.15
    ##  3 Hungary                3116.      31101    9.98
    ##  4 Brazil                 3024.     608071  201.  
    ##  5 Czech Republic         2947.      30878   10.5 
    ##  6 Argentina              2806.     116010   41.3 
    ##  7 Colombia               2665.     127348   47.8 
    ##  8 Mexico                 2567.     288733  112.  
    ##  9 Paraguay               2549.      16250    6.38
    ## 10 Belgium                2507.      26083   10.4 
    ## 11 Slovakia               2410.      13146    5.46
    ## 12 United States          2395.     743140  310.  
    ## 13 Tunisia                2385.      25254   10.6 
    ## 14 United Kingdom         2264.     141181   62.3 
    ## 15 Romania                2259.      49604   22.0 
    ## 16 Chile                  2257.      37790   16.7 
    ## 17 Ecuador                2228.      32958   14.8 
    ## 18 Italy                  2191.     132224   60.3 
    ## 19 Poland                 2010.      77395   38.5 
    ## 20 Bolivia                1904.      18936    9.95

EOL
