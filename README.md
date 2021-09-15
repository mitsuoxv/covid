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

Updated: 2021-09-16

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
    ##  1 United States           72046. 41066110            570
    ##  2 India                   60576. 33316755            550
    ##  3 Brazil                  38124. 21006424            551
    ##  4 Russia                  13177.  7194926            546
    ##  5 United Kingdom          12982.  7282814            561
    ##  6 Turkey                  12290.  6710666            546
    ##  7 France                  11919.  6710718            563
    ##  8 Argentina                9590.  5226831            545
    ##  9 Iran                     9402.  5340656            568
    ## 10 Colombia                 9032.  4931563            546
    ## 11 Spain                    8752.  4918526            562
    ## 12 Italy                    8093.  4613214            570
    ## 13 Indonesia                7596.  4178164            550
    ## 14 Germany                  7273.  4101931            564
    ## 15 Mexico                   6439.  3516043            546
    ## 16 Poland                   5264.  2895223            550
    ## 17 South Africa             5246.  2864534            546
    ## 18 Ukraine                  4307.  2325796            540
    ## 19 Philippines              4120.  2266066            550
    ## 20 Peru                     3951.  2161358            547

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        295.             162768.            552
    ##  2 Czech Republic                291.             160782.            552
    ##  3 Jordan                        233.             126184.            542
    ##  4 United States                 232.             132372.            570
    ##  5 Argentina                     232.             126425.            545
    ##  6 Sweden                        214.             119473.            557
    ##  7 Netherlands                   213.             118634.            557
    ##  8 United Kingdom                208.             116808.            561
    ##  9 Belgium                       208.             116515.            560
    ## 10 Serbia                        208.             113125.            545
    ## 11 Switzerland                   191.             107190.            561
    ## 12 Brazil                        190.             104456.            551
    ## 13 Colombia                      189.             103192.            546
    ## 14 Spain                         188.             105761.            562
    ## 15 France                        184.             103611.            563
    ## 16 Portugal                      180.              99016.            551
    ## 17 Chile                         179.              98220.            548
    ## 18 Turkey                        158.              86251.            546
    ## 19 Austria                       156.              86500.            555
    ## 20 Hungary                       150.              81769.            544

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1600     8452
    ##  2 Peru                 9.20     198799  2161358
    ##  3 Mexico               7.62     267969  3516043
    ##  4 Sudan                7.45       2829    37951
    ##  5 Syria                7.03       2083    29648
    ##  6 Ecuador              6.42      32448   505278
    ##  7 Egypt                5.75      16885   293448
    ##  8 Somalia              5.56       1032    18568
    ##  9 Afghanistan          4.65       7174   154283
    ## 10 China                4.60       5688   123722
    ## 11 Bulgaria             4.15      19744   475299
    ## 12 Myanmar              3.82      16693   436527
    ## 13 Bolivia              3.75      18595   495272
    ## 14 Hungary              3.69      30114   816222
    ## 15 Malawi               3.67       2244    61171
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        543    14992
    ## 18 Zimbabwe             3.59       4550   126817
    ## 19 Paraguay             3.51      16109   459340
    ## 20 Tunisia              3.49      24274   695406

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6647.     198799   29.9 
    ##  2 Hungary                3017.      30114    9.98
    ##  3 Brazil                 2919.     587066  201.  
    ##  4 Czech Republic         2903.      30417   10.5 
    ##  5 Bulgaria               2762.      19744    7.15
    ##  6 Argentina              2749.     113640   41.3 
    ##  7 Colombia               2630.     125687   47.8 
    ##  8 Paraguay               2527.      16109    6.38
    ##  9 Belgium                2449.      25477   10.4 
    ## 10 Mexico                 2383.     267969  112.  
    ## 11 Slovakia               2304.      12566    5.46
    ## 12 Tunisia                2292.      24274   10.6 
    ## 13 Chile                  2225.      37253   16.7 
    ## 14 Ecuador                2194.      32448   14.8 
    ## 15 United Kingdom         2156.     134446   62.3 
    ## 16 Italy                  2155.     130027   60.3 
    ## 17 United States          2118.     657114  310.  
    ## 18 Poland                 1960.      75454   38.5 
    ## 19 Bolivia                1869.      18595    9.95
    ## 20 Spain                  1840.      85548   46.5

EOL
