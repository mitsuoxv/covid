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

Updated: 2021-12-01

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
    ##  1 United States           75268. 47945945            637
    ##  2 India                   55252. 34587822            626
    ##  3 Brazil                  35217. 22080906            627
    ##  4 United Kingdom          15995. 10189063            637
    ##  5 Russia                  15493.  9636881            622
    ##  6 Turkey                  14100.  8770372            622
    ##  7 France                  11571.  7394153            639
    ##  8 Iran                     9492.  6113192            644
    ##  9 Germany                  9120.  5836813            640
    ## 10 Argentina                8577.  5326448            621
    ## 11 Colombia                 8144.  5065373            622
    ## 12 Spain                    8078.  5153924            638
    ## 13 Italy                    7764.  5015790            646
    ## 14 Indonesia                6799.  4256409            626
    ## 15 Mexico                   6184.  3883842            628
    ## 16 Poland                   5655.  3540061            626
    ## 17 Ukraine                  5582.  3438381            616
    ## 18 South Africa             4765.  2963679            622
    ## 19 Philippines              4524.  2832375            626
    ## 20 Malaysia                 4164.  2627903            631

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                327.             205235.            628
    ##  2 Israel                        291.             182632.            628
    ##  3 Serbia                        275.             170538.            621
    ##  4 Belgium                       264.             168170.            636
    ##  5 United Kingdom                257.             163421.            637
    ##  6 Netherlands                   249.             157466.            633
    ##  7 United States                 243.             154548.            637
    ##  8 Jordan                        240.             148112.            618
    ##  9 Austria                       222.             140151.            631
    ## 10 Argentina                     207.             128835.            621
    ## 11 Switzerland                   207.             132115.            637
    ## 12 Slovakia                      200.             124672.            622
    ## 13 Sweden                        198.             125456.            633
    ## 14 Turkey                        181.             112724.            622
    ## 15 France                        179.             114163.            639
    ## 16 Hungary                       178.             110510.            620
    ## 17 Brazil                        175.             109799.            627
    ## 18 Spain                         174.             110823.            638
    ## 19 Portugal                      171.             107188.            627
    ## 20 Colombia                      170.             105992.            622

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1949     9995
    ##  2 Peru                 9.00     201108  2234075
    ##  3 Mexico               7.57     293897  3883842
    ##  4 Sudan                7.33       3159    43084
    ##  5 Ecuador              6.31      33219   526615
    ##  6 Somalia              5.77       1327    23016
    ##  7 Syria                5.71       2744    48068
    ##  8 Egypt                5.71      20412   357629
    ##  9 Afghanistan          4.65       7308   157260
    ## 10 China                4.46       5697   127814
    ## 11 Bulgaria             4.09      28325   692376
    ## 12 Malawi               3.72       2305    61901
    ## 13 Niger                3.69        258     6989
    ## 14 Myanmar              3.66      19104   522402
    ## 15 Bolivia              3.57      19161   536472
    ## 16 Paraguay             3.56      16463   462956
    ## 17 Tunisia              3.54      25365   717309
    ## 18 Zimbabwe             3.51       4706   134226
    ## 19 Mali                 3.49        605    17340
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6724.     201108   29.9 
    ##  2 Bulgaria               3962.      28325    7.15
    ##  3 Hungary                3458.      34521    9.98
    ##  4 Czech Republic         3157.      33069   10.5 
    ##  5 Brazil                 3055.     614278  201.  
    ##  6 Argentina              2819.     116529   41.3 
    ##  7 Colombia               2688.     128437   47.8 
    ##  8 Slovakia               2643.      14418    5.46
    ##  9 Mexico                 2613.     293897  112.  
    ## 10 Belgium                2592.      26966   10.4 
    ## 11 Paraguay               2582.      16463    6.38
    ## 12 Romania                2568.      56382   22.0 
    ## 13 United States          2492.     773083  310.  
    ## 14 Tunisia                2395.      25365   10.6 
    ## 15 United Kingdom         2323.     144810   62.3 
    ## 16 Chile                  2290.      38343   16.7 
    ## 17 Ecuador                2246.      33219   14.8 
    ## 18 Italy                  2216.     133739   60.3 
    ## 19 Poland                 2171.      83583   38.5 
    ## 20 Russia                 1956.     275193  141.

EOL
