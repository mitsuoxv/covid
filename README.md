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

Updated: 2021-12-11

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
    ##  1 United States           76108. 49241986            647
    ##  2 India                   54520. 34674744            636
    ##  3 Brazil                  34800. 22167781            637
    ##  4 United Kingdom          16477. 10660985            647
    ##  5 Russia                  15754.  9956679            632
    ##  6 Turkey                  14216.  8984407            632
    ##  7 France                  12122.  7867391            649
    ##  8 Germany                  9882.  6423520            650
    ##  9 Iran                     9400.  6147872            654
    ## 10 Argentina                8475.  5348123            631
    ## 11 Spain                    8137.  5273178            648
    ## 12 Colombia                 8048.  5086381            632
    ## 13 Italy                    7873.  5164780            656
    ## 14 Indonesia                6696.  4258752            636
    ## 15 Mexico                   6126.  3908534            638
    ## 16 Poland                   5951.  3785036            636
    ## 17 Ukraine                  5661.  3543684            626
    ## 18 South Africa             4895.  3093452            632
    ## 19 Philippines              4459.  2835996            636
    ## 20 Netherlands              4399.  2828655            643

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                346.             220765.            638
    ##  2 Israel                        288.             183456.            638
    ##  3 Belgium                       285.             184036.            646
    ##  4 Serbia                        274.             172966.            631
    ##  5 Netherlands                   264.             169940.            643
    ##  6 United Kingdom                264.             170990.            647
    ##  7 Jordan                        247.             155038.            628
    ##  8 United States                 245.             158726.            647
    ##  9 Austria                       231.             148133.            641
    ## 10 Switzerland                   224.             144637.            647
    ## 11 Slovakia                      222.             140076.            632
    ## 12 Argentina                     205.             129359.            631
    ## 13 Sweden                        200.             128304.            643
    ## 14 Hungary                       188.             118506.            630
    ## 15 France                        187.             121470.            649
    ## 16 Turkey                        183.             115475.            632
    ## 17 Spain                         175.             113387.            648
    ## 18 Portugal                      174.             110649.            637
    ## 19 Brazil                        173.             110231.            637
    ## 20 Colombia                      168.             106432.            632

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1957    10047
    ##  2 Peru                 8.96     201490  2248447
    ##  3 Mexico               7.57     295894  3908534
    ##  4 Sudan                7.20       3208    44529
    ##  5 Ecuador              6.32      33488   530126
    ##  6 Somalia              5.77       1331    23051
    ##  7 Syria                5.71       2793    48901
    ##  8 Egypt                5.71      20877   365831
    ##  9 Afghanistan          4.64       7321   157858
    ## 10 China                4.42       5697   128776
    ## 11 Bulgaria             4.13      29382   711364
    ## 12 Niger                3.72        265     7131
    ## 13 Malawi               3.72       2307    62088
    ## 14 Myanmar              3.64      19162   525750
    ## 15 Paraguay             3.56      16488   463552
    ## 16 Tunisia              3.54      25413   718866
    ## 17 Bolivia              3.52      19276   547892
    ## 18 Mali                 3.39        622    18330
    ## 19 Indonesia            3.38     143923  4258752
    ## 20 Romania              3.21      57434  1790571

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6737.     201490   29.9 
    ##  2 Bulgaria               4110.      29382    7.15
    ##  3 Hungary                3649.      36429    9.98
    ##  4 Czech Republic         3269.      34242   10.5 
    ##  5 Brazil                 3064.     616251  201.  
    ##  6 Argentina              2823.     116708   41.3 
    ##  7 Slovakia               2793.      15236    5.46
    ##  8 Colombia               2698.     128929   47.8 
    ##  9 Belgium                2640.      27463   10.4 
    ## 10 Mexico                 2631.     295894  112.  
    ## 11 Romania                2615.      57434   22.0 
    ## 12 Paraguay               2586.      16488    6.38
    ## 13 United States          2537.     787135  310.  
    ## 14 Tunisia                2400.      25413   10.6 
    ## 15 United Kingdom         2344.     146135   62.3 
    ## 16 Chile                  2305.      38600   16.7 
    ## 17 Poland                 2284.      87928   38.5 
    ## 18 Ecuador                2264.      33488   14.8 
    ## 19 Italy                  2230.     134551   60.3 
    ## 20 Russia                 2041.     287180  141.

EOL
