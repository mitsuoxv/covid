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

Updated: 2021-11-24

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
    ##  1 United States           75293. 47434791            630
    ##  2 India                   55778. 34526480            619
    ##  3 Brazil                  35512. 22017276            620
    ##  4 United Kingdom          15698.  9889930            630
    ##  5 Russia                  15286.  9400835            615
    ##  6 Turkey                  13978.  8596410            615
    ##  7 France                  11378.  7191102            632
    ##  8 Iran                     9549.  6082865            637
    ##  9 Argentina                8657.  5315348            614
    ## 10 Germany                  8579.  5430911            633
    ## 11 Colombia                 8208.  5048061            615
    ## 12 Spain                    8077.  5096539            631
    ## 13 Italy                    7718.  4932091            639
    ## 14 Indonesia                6872.  4253992            619
    ## 15 Mexico                   6221.  3863362            621
    ## 16 Ukraine                  5506.  3353136            609
    ## 17 Poland                   5457.  3377698            619
    ## 18 South Africa             4764.  2930174            615
    ## 19 Philippines              4567.  2826853            619
    ## 20 Malaysia                 4153.  2591486            624

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                310.             192637.            621
    ##  2 Israel                        294.             182390.            621
    ##  3 Serbia                        274.             168258.            614
    ##  4 United Kingdom                252.             158624.            630
    ##  5 Belgium                       248.             156067.            629
    ##  6 United States                 243.             152901.            630
    ##  7 Netherlands                   237.             148110.            626
    ##  8 Jordan                        235.             143462.            611
    ##  9 Argentina                     209.             128566.            614
    ## 10 Austria                       209.             130147.            624
    ## 11 Switzerland                   199.             125510.            630
    ## 12 Sweden                        199.             124699.            626
    ## 13 Slovakia                      185.             113918.            615
    ## 14 Turkey                        180.             110488.            615
    ## 15 Brazil                        177.             109482.            620
    ## 16 France                        176.             111028.            632
    ## 17 Spain                         174.             109589.            631
    ## 18 Colombia                      172.             105630.            615
    ## 19 Portugal                      170.             105260.            620
    ## 20 Chile                         169.             104219.            617

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1939     9961
    ##  2 Peru                 9.03     200866  2224344
    ##  3 Mexico               7.57     292471  3863362
    ##  4 Sudan                7.43       3114    41890
    ##  5 Ecuador              6.32      33125   524353
    ##  6 Somalia              5.76       1324    22969
    ##  7 Syria                5.72       2709    47331
    ##  8 Egypt                5.69      19991   351267
    ##  9 Afghanistan          4.65       7303   156961
    ## 10 China                4.47       5697   127537
    ## 11 Bulgaria             4.06      27507   676750
    ## 12 Malawi               3.72       2304    61863
    ## 13 Myanmar              3.67      19034   518471
    ## 14 Bolivia              3.60      19068   529486
    ## 15 Niger                3.59        246     6851
    ## 16 Paraguay             3.54      16360   462283
    ## 17 Tunisia              3.54      25347   716298
    ## 18 Zimbabwe             3.52       4699   133674
    ## 19 Mali                 3.50        594    16964
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6716.     200866   29.9 
    ##  2 Bulgaria               3848.      27507    7.15
    ##  3 Hungary                3340.      33343    9.98
    ##  4 Czech Republic         3084.      32304   10.5 
    ##  5 Brazil                 3046.     612659  201.  
    ##  6 Argentina              2815.     116377   41.3 
    ##  7 Colombia               2680.     128093   47.8 
    ##  8 Mexico                 2600.     292471  112.  
    ##  9 Paraguay               2566.      16360    6.38
    ## 10 Slovakia               2564.      13985    5.46
    ## 11 Belgium                2564.      26669   10.4 
    ## 12 Romania                2510.      55113   22.0 
    ## 13 United States          2473.     767278  310.  
    ## 14 Tunisia                2394.      25347   10.6 
    ## 15 United Kingdom         2309.     143972   62.3 
    ## 16 Chile                  2278.      38149   16.7 
    ## 17 Ecuador                2240.      33125   14.8 
    ## 18 Italy                  2208.     133247   60.3 
    ## 19 Poland                 2110.      81228   38.5 
    ## 20 Bolivia                1917.      19068    9.95

EOL
