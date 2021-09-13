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

Updated: 2021-09-14

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
    ##  1 United States           71612. 40675578            568
    ##  2 India                   60701. 33264175            548
    ##  3 Brazil                  38231. 20989164            549
    ##  4 Russia                  13158.  7158248            544
    ##  5 United Kingdom          12927.  7226280            559
    ##  6 Turkey                  12239.  6658251            544
    ##  7 France                  11947.  6702450            561
    ##  8 Argentina                9621.  5224534            543
    ##  9 Iran                     9356.  5295786            566
    ## 10 Colombia                 9060.  4928578            544
    ## 11 Spain                    8755.  4903021            560
    ## 12 Italy                    8110.  4606413            568
    ## 13 Indonesia                7605.  4167511            548
    ## 14 Germany                  7265.  4083151            562
    ## 15 Mexico                   6446.  3506743            544
    ## 16 Poland                   5281.  2893919            548
    ## 17 South Africa             5254.  2858195            544
    ## 18 Ukraine                  4308.  2317824            538
    ## 19 Philippines              4064.  2227367            548
    ## 20 Peru                     3964.  2160327            545

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                292.             160683.            550
    ##  2 Israel                        291.             159950.            550
    ##  3 Jordan                        233.             126014.            540
    ##  4 Argentina                     233.             126370.            543
    ##  5 United States                 231.             131113.            568
    ##  6 Sweden                        215.             119091.            555
    ##  7 Netherlands                   213.             118409.            555
    ##  8 Belgium                       208.             115882.            558
    ##  9 United Kingdom                207.             115902.            559
    ## 10 Serbia                        205.             111222.            543
    ## 11 Brazil                        190.             104370.            549
    ## 12 Switzerland                   190.             106130.            559
    ## 13 Colombia                      190.             103130.            544
    ## 14 Spain                         188.             105428.            560
    ## 15 France                        184.             103483.            561
    ## 16 Portugal                      180.              98874.            549
    ## 17 Chile                         180.              98174.            546
    ## 18 Turkey                        157.              85577.            544
    ## 19 Austria                       156.              86124.            553
    ## 20 Hungary                       151.              81708.            542

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1584     8414
    ##  2 Peru                 9.20     198728  2160327
    ##  3 Mexico               7.63     267524  3506743
    ##  4 Sudan                7.45       2829    37951
    ##  5 Syria                7.04       2077    29498
    ##  6 Ecuador              6.42      32444   505262
    ##  7 Egypt                5.76      16871   292957
    ##  8 Somalia              5.57       1023    18373
    ##  9 Afghanistan          4.65       7169   154094
    ## 10 China                4.60       5687   123544
    ## 11 Bulgaria             4.14      19522   471272
    ## 12 Myanmar              3.83      16530   431833
    ## 13 Bolivia              3.76      18582   494664
    ## 14 Hungary              3.69      30098   815605
    ## 15 Malawi               3.66       2238    61113
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        543    14984
    ## 18 Zimbabwe             3.59       4538   126269
    ## 19 Tunisia              3.54      24244   685799
    ## 20 Paraguay             3.51      16097   459257

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6645.     198728   29.9 
    ##  2 Hungary                3015.      30098    9.98
    ##  3 Brazil                 2917.     586558  201.  
    ##  4 Czech Republic         2903.      30414   10.5 
    ##  5 Argentina              2743.     113402   41.3 
    ##  6 Bulgaria               2731.      19522    7.15
    ##  7 Colombia               2628.     125592   47.8 
    ##  8 Paraguay               2525.      16097    6.38
    ##  9 Belgium                2447.      25454   10.4 
    ## 10 Mexico                 2379.     267524  112.  
    ## 11 Slovakia               2302.      12560    5.46
    ## 12 Tunisia                2290.      24244   10.6 
    ## 13 Chile                  2223.      37232   16.7 
    ## 14 Ecuador                2194.      32444   14.8 
    ## 15 Italy                  2153.     129919   60.3 
    ## 16 United Kingdom         2152.     134200   62.3 
    ## 17 United States          2105.     653099  310.  
    ## 18 Poland                 1959.      75425   38.5 
    ## 19 Bolivia                1868.      18582    9.95
    ## 20 Spain                  1832.      85218   46.5

EOL
