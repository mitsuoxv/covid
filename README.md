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

Updated: 2021-09-10

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
    ##  1 United States           71192. 40152521            564
    ##  2 India                   60919. 33139981            544
    ##  3 Brazil                  38373. 20913578            545
    ##  4 Russia                  13119.  7084284            540
    ##  5 United Kingdom          12783.  7094596            555
    ##  6 Turkey                  12160.  6566568            540
    ##  7 France                  11966.  6665074            557
    ##  8 Argentina                9669.  5211801            539
    ##  9 Iran                     9272.  5210978            562
    ## 10 Colombia                 9114.  4921410            540
    ## 11 Spain                    8810.  4898258            556
    ## 12 Italy                    8130.  4585423            564
    ## 13 Indonesia                7635.  4153355            544
    ## 14 Germany                  7251.  4046112            558
    ## 15 Mexico                   6387.  3449295            540
    ## 16 Poland                   5316.  2892113            544
    ## 17 South Africa             5253.  2836773            540
    ## 18 Ukraine                  4320.  2306939            534
    ## 19 Peru                     3986.  2156451            541
    ## 20 Philippines              3923.  2134005            544

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                294.             160563.            546
    ##  2 Israel                        284.             155093.            546
    ##  3 Jordan                        234.             125537.            536
    ##  4 Argentina                     234.             126062.            539
    ##  5 United States                 229.             129427.            564
    ##  6 Sweden                        216.             118792.            551
    ##  7 Netherlands                   214.             117848.            551
    ##  8 Belgium                       208.             115453.            554
    ##  9 United Kingdom                205.             113789.            555
    ## 10 Serbia                        201.             108175.            539
    ## 11 Brazil                        191.             103994.            545
    ## 12 Colombia                      191.             102980.            540
    ## 13 Switzerland                   190.             105340.            555
    ## 14 Spain                         189.             105325.            556
    ## 15 France                        185.             102906.            557
    ## 16 Chile                         181.              98059.            542
    ## 17 Portugal                      181.              98419.            545
    ## 18 Turkey                        156.              84399.            540
    ## 19 Austria                       155.              85059.            549
    ## 20 Hungary                       152.              81588.            538

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1534     8181
    ##  2 Peru                 9.21     198568  2156451
    ##  3 Mexico               7.67     264541  3449295
    ##  4 Sudan                7.36       2791    37931
    ##  5 Syria                7.11       2049    28814
    ##  6 Ecuador              6.42      32365   504257
    ##  7 Egypt                5.78      16824   291172
    ##  8 Somalia              5.60       1005    17947
    ##  9 Afghanistan          4.65       7157   153840
    ## 10 China                4.61       5685   123361
    ## 11 Bulgaria             4.14      19335   466671
    ## 12 Myanmar              3.82      16265   425414
    ## 13 Bolivia              3.75      18514   493115
    ## 14 Hungary              3.69      30080   814409
    ## 15 Tanzania             3.66         50     1367
    ## 16 Malawi               3.66       2229    60965
    ## 17 Mali                 3.62        542    14962
    ## 18 Zimbabwe             3.59       4517   125931
    ## 19 Tunisia              3.54      24041   680074
    ## 20 Paraguay             3.49      16008   458977

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6640.     198568   29.9 
    ##  2 Hungary                3013.      30080    9.98
    ##  3 Brazil                 2905.     584171  201.  
    ##  4 Czech Republic         2903.      30413   10.5 
    ##  5 Argentina              2730.     112851   41.3 
    ##  6 Bulgaria               2705.      19335    7.15
    ##  7 Colombia               2624.     125378   47.8 
    ##  8 Paraguay               2511.      16008    6.38
    ##  9 Belgium                2446.      25442   10.4 
    ## 10 Mexico                 2352.     264541  112.  
    ## 11 Slovakia               2302.      12556    5.46
    ## 12 Tunisia                2270.      24041   10.6 
    ## 13 Chile                  2217.      37122   16.7 
    ## 14 Ecuador                2188.      32365   14.8 
    ## 15 Italy                  2150.     129707   60.3 
    ## 16 United Kingdom         2144.     133674   62.3 
    ## 17 United States          2083.     646131  310.  
    ## 18 Poland                 1959.      75409   38.5 
    ## 19 Bolivia                1861.      18514    9.95
    ## 20 Spain                  1831.      85147   46.5

EOL
