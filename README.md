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

Updated: 2021-10-28

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
    ##  1 United States           71725. 45258928            631
    ##  2 India                   57797. 34215653            592
    ##  3 Brazil                  36653. 21735560            593
    ##  4 United Kingdom          14682.  8853231            603
    ##  5 Russia                  14205.  8352601            588
    ##  6 Turkey                  13451.  7909111            588
    ##  7 France                  11424.  6911563            605
    ##  8 Iran                     9635.  5877456            610
    ##  9 Argentina                8997.  5281585            587
    ## 10 Colombia                 8491.  4992586            588
    ## 11 Spain                    8285.  5004144            604
    ## 12 Italy                    7758.  4747773            612
    ## 13 Germany                  7436.  4506415            606
    ## 14 Indonesia                7165.  4241809            592
    ## 15 Mexico                   6436.  3784448            588
    ## 16 Poland                   5051.  2990509            592
    ## 17 South Africa             4966.  2920109            588
    ## 18 Ukraine                  4855.  2825733            582
    ## 19 Philippines              4672.  2765672            592
    ## 20 Malaysia                 4091.  2442224            597

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        303.             180183.            594
    ##  2 Czech Republic                280.             166271.            594
    ##  3 Serbia                        258.             151393.            587
    ##  4 United Kingdom                235.             141996.            603
    ##  5 United States                 231.             145887.            631
    ##  6 Jordan                        228.             133408.            584
    ##  7 Argentina                     218.             127750.            587
    ##  8 Belgium                       213.             128227.            602
    ##  9 Netherlands                   210.             125780.            599
    ## 10 Sweden                        204.             122257.            599
    ## 11 Switzerland                   189.             113909.            603
    ## 12 Brazil                        182.             108082.            593
    ## 13 Spain                         178.             107602.            604
    ## 14 Colombia                      178.             104469.            588
    ## 15 France                        176.             106712.            605
    ## 16 Turkey                        173.             101654.            588
    ## 17 Portugal                      172.             101750.            593
    ## 18 Chile                         170.             100595.            590
    ## 19 Austria                       164.              97687.            597
    ## 20 Hungary                       146.              85688.            586

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.1        1858     9711
    ##  2 Peru                 9.11     200083  2196259
    ##  3 Mexico               7.57     286496  3784448
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32953   515659
    ##  6 Syria                6.00       2526    42076
    ##  7 Egypt                5.63      18375   326379
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.65       7262   156071
    ## 10 China                4.53       5696   125686
    ## 11 Bulgaria             4.03      23440   582122
    ## 12 Myanmar              3.74      18603   496901
    ## 13 Malawi               3.72       2296    61766
    ## 14 Bolivia              3.70      18903   510470
    ## 15 Hungary              3.58      30647   855339
    ## 16 Tunisia              3.54      25213   712013
    ## 17 Paraguay             3.52      16232   460754
    ## 18 Zimbabwe             3.52       4674   132724
    ## 19 Mali                 3.52        559    15880
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6690.     200083   29.9 
    ##  2 Bulgaria               3279.      23440    7.15
    ##  3 Hungary                3070.      30647    9.98
    ##  4 Brazil                 3012.     605804  201.  
    ##  5 Czech Republic         2927.      30667   10.5 
    ##  6 Argentina              2802.     115851   41.3 
    ##  7 Colombia               2660.     127099   47.8 
    ##  8 Mexico                 2547.     286496  112.  
    ##  9 Paraguay               2546.      16232    6.38
    ## 10 Belgium                2491.      25914   10.4 
    ## 11 Tunisia                2381.      25213   10.6 
    ## 12 Slovakia               2375.      12957    5.46
    ## 13 United States          2361.     732512  310.  
    ## 14 Chile                  2251.      37691   16.7 
    ## 15 United Kingdom         2243.     139834   62.3 
    ## 16 Ecuador                2228.      32953   14.8 
    ## 17 Italy                  2186.     131904   60.3 
    ## 18 Romania                2095.      46015   22.0 
    ## 19 Poland                 1991.      76672   38.5 
    ## 20 Bolivia                1900.      18903    9.95

EOL
