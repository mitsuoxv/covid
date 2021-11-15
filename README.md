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

Updated: 2021-11-16

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
    ##  1 United States           71841. 46697360            650
    ##  2 India                   56379. 34447536            611
    ##  3 Brazil                  35872. 21953838            612
    ##  4 United Kingdom          15371.  9561103            622
    ##  5 Russia                  15007.  9109094            607
    ##  6 Turkey                  13852.  8408166            607
    ##  7 France                  11316.  7061121            624
    ##  8 Iran                     9599.  6037718            629
    ##  9 Argentina                8755.  5305742            606
    ## 10 Colombia                 8285.  5029335            607
    ## 11 Spain                    8101.  5047156            623
    ## 12 Germany                  8072.  5045076            625
    ## 13 Italy                    7702.  4860061            631
    ## 14 Indonesia                6957.  4251076            611
    ## 15 Mexico                   6272.  3844791            613
    ## 16 Ukraine                  5372.  3228441            601
    ## 17 Poland                   5260.  3214023            611
    ## 18 South Africa             4820.  2925939            607
    ## 19 Philippines              4610.  2816980            611
    ## 20 Malaysia                 4133.  2546309            616

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        297.             181833.            613
    ##  2 Czech Republic                295.             180992.            613
    ##  3 Serbia                        272.             164900.            606
    ##  4 United Kingdom                247.             153349.            622
    ##  5 United States                 232.             150524.            650
    ##  6 Jordan                        231.             139240.            603
    ##  7 Belgium                       230.             142720.            621
    ##  8 Netherlands                   223.             137886.            618
    ##  9 Argentina                     212.             128334.            606
    ## 10 Sweden                        200.             123743.            618
    ## 11 Switzerland                   192.             119399.            622
    ## 12 Austria                       189.             116662.            616
    ## 13 Brazil                        178.             109167.            612
    ## 14 Turkey                        178.             108068.            607
    ## 15 France                        175.             109021.            624
    ## 16 Spain                         174.             108527.            623
    ## 17 Colombia                      173.             105238.            607
    ## 18 Slovakia                      170.             103290.            607
    ## 19 Portugal                      169.             103736.            612
    ## 20 Chile                         169.             103095.            609

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1923     9918
    ##  2 Peru                 9.06     200605  2213548
    ##  3 Mexico               7.57     291089  3844791
    ##  4 Sudan                7.43       3069    41309
    ##  5 Ecuador              6.35      32989   519560
    ##  6 Syria                5.76       2666    46275
    ##  7 Somalia              5.75       1313    22837
    ##  8 Egypt                5.67      19499   343961
    ##  9 Afghanistan          4.66       7293   156552
    ## 10 China                4.48       5697   127260
    ## 11 Bulgaria             4.01      26279   655647
    ## 12 Malawi               3.72       2302    61843
    ## 13 Myanmar              3.69      18929   513262
    ## 14 Bolivia              3.64      19004   522530
    ## 15 Tunisia              3.54      25311   715687
    ## 16 Paraguay             3.54      16335   461912
    ## 17 Zimbabwe             3.52       4697   133438
    ## 18 Mali                 3.51        585    16667
    ## 19 Niger                3.47        232     6692
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6708.     200605   29.9 
    ##  2 Bulgaria               3676.      26279    7.15
    ##  3 Hungary                3223.      32171    9.98
    ##  4 Brazil                 3039.     611222  201.  
    ##  5 Czech Republic         3011.      31541   10.5 
    ##  6 Argentina              2811.     116232   41.3 
    ##  7 Colombia               2673.     127766   47.8 
    ##  8 Mexico                 2588.     291089  112.  
    ##  9 Paraguay               2562.      16335    6.38
    ## 10 Belgium                2530.      26321   10.4 
    ## 11 Slovakia               2493.      13598    5.46
    ## 12 United States          2437.     755950  310.  
    ## 13 Romania                2417.      53069   22.0 
    ## 14 Tunisia                2390.      25311   10.6 
    ## 15 United Kingdom         2292.     142898   62.3 
    ## 16 Chile                  2268.      37975   16.7 
    ## 17 Ecuador                2230.      32989   14.8 
    ## 18 Italy                  2200.     132775   60.3 
    ## 19 Poland                 2049.      78879   38.5 
    ## 20 Bolivia                1910.      19004    9.95

EOL
