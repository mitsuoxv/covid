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

Updated: 2021-12-02

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
    ##  1 United States           75489. 48162401            638
    ##  2 India                   55178. 34596776            627
    ##  3 Brazil                  35167. 22084749            628
    ##  4 United Kingdom          16032. 10228776            638
    ##  5 Russia                  15521.  9669718            623
    ##  6 Turkey                  14118.  8795588            623
    ##  7 France                  11627.  7441114            640
    ##  8 Iran                     9484.  6117445            645
    ##  9 Germany                  9210.  5903999            641
    ## 10 Argentina                8566.  5328416            622
    ## 11 Colombia                 8134.  5067348            623
    ## 12 Spain                    8081.  5164185            639
    ## 13 Italy                    7772.  5028547            647
    ## 14 Indonesia                6789.  4256687            627
    ## 15 Mexico                   6176.  3884566            629
    ## 16 Poland                   5692.  3569137            627
    ## 17 Ukraine                  5592.  3450341            617
    ## 18 South Africa             4764.  2968052            623
    ## 19 Philippines              4518.  2832734            627
    ## 20 Netherlands              4169.  2643176            634

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                330.             207339.            629
    ##  2 Israel                        290.             182724.            629
    ##  3 Serbia                        275.             170847.            622
    ##  4 Belgium                       266.             169762.            637
    ##  5 United Kingdom                257.             164058.            638
    ##  6 Netherlands                   250.             158797.            634
    ##  7 United States                 243.             155246.            638
    ##  8 Jordan                        241.             148889.            619
    ##  9 Austria                       223.             141153.            632
    ## 10 Switzerland                   209.             133217.            638
    ## 11 Argentina                     207.             128883.            622
    ## 12 Slovakia                      203.             126419.            623
    ## 13 Sweden                        199.             126085.            634
    ## 14 Turkey                        181.             113048.            623
    ## 15 Hungary                       180.             111627.            621
    ## 16 France                        180.             114888.            640
    ## 17 Brazil                        175.             109818.            628
    ## 18 Spain                         174.             111044.            639
    ## 19 Portugal                      171.             107461.            628
    ## 20 Colombia                      170.             106034.            623

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1950    10004
    ##  2 Peru                 9.00     201144  2234970
    ##  3 Mexico               7.57     293950  3884566
    ##  4 Sudan                7.31       3159    43229
    ##  5 Ecuador              6.31      33250   526870
    ##  6 Somalia              5.77       1327    23016
    ##  7 Egypt                5.71      20474   358578
    ##  8 Syria                5.71       2749    48170
    ##  9 Afghanistan          4.65       7308   157289
    ## 10 China                4.45       5697   127938
    ## 11 Bulgaria             4.09      28453   695057
    ## 12 Malawi               3.72       2306    61916
    ## 13 Niger                3.70        259     7007
    ## 14 Myanmar              3.66      19104   522402
    ## 15 Bolivia              3.57      19171   537559
    ## 16 Paraguay             3.56      16469   463001
    ## 17 Tunisia              3.54      25373   717572
    ## 18 Zimbabwe             3.50       4707   134652
    ## 19 Mali                 3.48        606    17435
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6726.     201144   29.9 
    ##  2 Bulgaria               3980.      28453    7.15
    ##  3 Hungary                3478.      34713    9.98
    ##  4 Czech Republic         3168.      33186   10.5 
    ##  5 Brazil                 3055.     614376  201.  
    ##  6 Argentina              2819.     116554   41.3 
    ##  7 Colombia               2688.     128473   47.8 
    ##  8 Slovakia               2659.      14503    5.46
    ##  9 Mexico                 2614.     293950  112.  
    ## 10 Belgium                2597.      27015   10.4 
    ## 11 Paraguay               2583.      16469    6.38
    ## 12 Romania                2574.      56529   22.0 
    ## 13 United States          2498.     774868  310.  
    ## 14 Tunisia                2396.      25373   10.6 
    ## 15 United Kingdom         2325.     144969   62.3 
    ## 16 Chile                  2290.      38346   16.7 
    ## 17 Ecuador                2248.      33250   14.8 
    ## 18 Italy                  2218.     133828   60.3 
    ## 19 Poland                 2186.      84153   38.5 
    ## 20 Russia                 1965.     276419  141.

EOL
