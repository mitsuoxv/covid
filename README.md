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

Updated: 2021-11-02

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
    ##  1 United States           71753. 45635708            636
    ##  2 India                   57430. 34285814            597
    ##  3 Brazil                  36461. 21804094            598
    ##  4 United Kingdom          14897.  9057633            608
    ##  5 Russia                  14425.  8554192            593
    ##  6 Turkey                  13546.  8032988            593
    ##  7 France                  11383.  6943779            610
    ##  8 Iran                     9633.  5924638            615
    ##  9 Argentina                8934.  5288807            592
    ## 10 Colombia                 8433.  5000677            593
    ## 11 Spain                    8228.  5011149            609
    ## 12 Italy                    7734.  4771965            617
    ## 13 Germany                  7540.  4607208            611
    ## 14 Indonesia                7110.  4244761            597
    ## 15 Mexico                   6353.  3805765            599
    ## 16 Poland                   5075.  3030151            597
    ## 17 Ukraine                  5002.  2936238            587
    ## 18 South Africa             4927.  2922116            593
    ## 19 Philippines              4669.  2787276            597
    ## 20 Malaysia                 4106.  2471642            602

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        301.             180534.            599
    ##  2 Czech Republic                281.             168543.            599
    ##  3 Serbia                        263.             155585.            592
    ##  4 United Kingdom                239.             145274.            608
    ##  5 United States                 231.             147101.            636
    ##  6 Jordan                        229.             134623.            589
    ##  7 Argentina                     216.             127924.            592
    ##  8 Belgium                       215.             130794.            607
    ##  9 Netherlands                   212.             128090.            604
    ## 10 Sweden                        203.             122596.            604
    ## 11 Switzerland                   188.             114615.            608
    ## 12 Brazil                        181.             108422.            598
    ## 13 Spain                         177.             107753.            609
    ## 14 Colombia                      176.             104639.            593
    ## 15 France                        176.             107209.            610
    ## 16 Turkey                        174.             103246.            593
    ## 17 Portugal                      171.             102159.            598
    ## 18 Chile                         170.             101218.            595
    ## 19 Austria                       168.             100915.            602
    ## 20 Slovakia                      150.              89025.            593

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1889     9791
    ##  2 Peru                 9.10     200217  2200908
    ##  3 Mexico               7.57     288276  3805765
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.91       2566    43404
    ##  7 Egypt                5.63      18651   331017
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.66       7280   156250
    ## 10 China                4.52       5696   126078
    ## 11 Bulgaria             3.98      23999   602492
    ## 12 Myanmar              3.74      18697   500073
    ## 13 Malawi               3.72       2301    61796
    ## 14 Bolivia              3.68      18925   513584
    ## 15 Tunisia              3.54      25241   712747
    ## 16 Hungary              3.53      30881   874630
    ## 17 Paraguay             3.52      16246   461006
    ## 18 Zimbabwe             3.52       4678   132977
    ## 19 Mali                 3.50        563    16074
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6695.     200217   29.9 
    ##  2 Bulgaria               3357.      23999    7.15
    ##  3 Hungary                3094.      30881    9.98
    ##  4 Brazil                 3022.     607694  201.  
    ##  5 Czech Republic         2938.      30775   10.5 
    ##  6 Argentina              2805.     115950   41.3 
    ##  7 Colombia               2663.     127258   47.8 
    ##  8 Mexico                 2563.     288276  112.  
    ##  9 Paraguay               2548.      16246    6.38
    ## 10 Belgium                2499.      25994   10.4 
    ## 11 Slovakia               2391.      13045    5.46
    ## 12 United States          2385.     739856  310.  
    ## 13 Tunisia                2384.      25241   10.6 
    ## 14 United Kingdom         2256.     140632   62.3 
    ## 15 Chile                  2255.      37757   16.7 
    ## 16 Ecuador                2228.      32958   14.8 
    ## 17 Italy                  2189.     132100   60.3 
    ## 18 Romania                2189.      48073   22.0 
    ## 19 Poland                 2000.      77012   38.5 
    ## 20 Bolivia                1903.      18925    9.95

EOL
