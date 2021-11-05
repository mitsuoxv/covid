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

Updated: 2021-11-06

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
    ##  1 United States           71826. 45968940            640
    ##  2 India                   57128. 34333754            601
    ##  3 Brazil                  36272. 21835785            602
    ##  4 United Kingdom          15046.  9208223            612
    ##  5 Russia                  14597.  8714595            597
    ##  6 Turkey                  13652.  8150708            597
    ##  7 France                  11345.  6966140            614
    ##  8 Iran                     9620.  5954962            619
    ##  9 Argentina                8880.  5292549            596
    ## 10 Colombia                 8387.  5007099            597
    ## 11 Spain                    8193.  5022546            613
    ## 12 Italy                    7711.  4788704            621
    ## 13 Germany                  7658.  4709488            615
    ## 14 Indonesia                7066.  4246802            601
    ## 15 Mexico                   6326.  3814453            603
    ## 16 Ukraine                  5132.  3032951            591
    ## 17 Poland                   5119.  3076518            601
    ## 18 South Africa             4896.  2923054            597
    ## 19 Philippines              4651.  2795642            601
    ## 20 Malaysia                 4113.  2492343            606

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        301.             181251.            603
    ##  2 Czech Republic                285.             171931.            603
    ##  3 Serbia                        267.             159106.            596
    ##  4 United Kingdom                241.             147690.            612
    ##  5 United States                 232.             148176.            640
    ##  6 Jordan                        229.             135552.            593
    ##  7 Belgium                       221.             134918.            611
    ##  8 Argentina                     215.             128015.            596
    ##  9 Netherlands                   214.             130177.            608
    ## 10 Sweden                        202.             123094.            608
    ## 11 Switzerland                   190.             116194.            612
    ## 12 Brazil                        180.             108580.            602
    ## 13 Spain                         176.             107998.            613
    ## 14 Colombia                      175.             104773.            597
    ## 15 Turkey                        175.             104759.            597
    ## 16 France                        175.             107555.            614
    ## 17 Austria                       172.             103999.            606
    ## 18 Portugal                      170.             102477.            602
    ## 19 Chile                         170.             101592.            599
    ## 20 Slovakia                      156.              92905.            597

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1901     9831
    ##  2 Peru                 9.09     200326  2203310
    ##  3 Mexico               7.57     288887  3814453
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.87       2593    44191
    ##  7 Egypt                5.64      18832   333840
    ##  8 Somalia              5.53       1238    22369
    ##  9 Afghanistan          4.66       7284   156363
    ## 10 China                4.50       5696   126471
    ## 11 Bulgaria             3.97      24755   623946
    ## 12 Malawi               3.72       2302    61803
    ## 13 Myanmar              3.72      18766   503981
    ## 14 Bolivia              3.68      18942   515373
    ## 15 Tunisia              3.54      25254   712982
    ## 16 Paraguay             3.52      16256   461184
    ## 17 Zimbabwe             3.52       4685   133112
    ## 18 Mali                 3.51        570    16234
    ## 19 Hungary              3.50      31184   892164
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6698.     200326   29.9 
    ##  2 Bulgaria               3463.      24755    7.15
    ##  3 Hungary                3124.      31184    9.98
    ##  4 Brazil                 3024.     608235  201.  
    ##  5 Czech Republic         2953.      30938   10.5 
    ##  6 Argentina              2806.     116029   41.3 
    ##  7 Colombia               2665.     127380   47.8 
    ##  8 Mexico                 2569.     288887  112.  
    ##  9 Paraguay               2550.      16256    6.38
    ## 10 Belgium                2509.      26105   10.4 
    ## 11 Slovakia               2414.      13166    5.46
    ## 12 United States          2399.     744398  310.  
    ## 13 Tunisia                2385.      25254   10.6 
    ## 14 Romania                2281.      50087   22.0 
    ## 15 United Kingdom         2268.     141395   62.3 
    ## 16 Chile                  2257.      37794   16.7 
    ## 17 Ecuador                2228.      32958   14.8 
    ## 18 Italy                  2192.     132283   60.3 
    ## 19 Poland                 2014.      77547   38.5 
    ## 20 Bolivia                1904.      18942    9.95

EOL
