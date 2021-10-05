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

Updated: 2021-10-06

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
    ##  1 United States           73561. 43401318            590
    ##  2 India                   59391. 33853048            570
    ##  3 Brazil                  37597. 21468121            571
    ##  4 United Kingdom          13657.  7934940            581
    ##  5 Russia                  13493.  7637427            566
    ##  6 Turkey                  12839.  7267077            566
    ##  7 France                  11684.  6812172            583
    ##  8 Iran                     9589.  5638735            588
    ##  9 Argentina                9309.  5259738            565
    ## 10 Colombia                 8767.  4962054            566
    ## 11 Spain                    8531.  4965400            582
    ## 12 Italy                    7938.  4683646            590
    ## 13 Indonesia                7406.  4221610            570
    ## 14 Germany                  7295.  4260187            584
    ## 15 Mexico                   6505.  3681960            566
    ## 16 South Africa             5136.  2906851            566
    ## 17 Poland                   5110.  2912876            570
    ## 18 Philippines              4568.  2604040            570
    ## 19 Ukraine                  4410.  2469856            560
    ## 20 Malaysia                 3975.  2285640            575

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        308.             175999.            572
    ##  2 Czech Republic                283.             161790.            572
    ##  3 United States                 237.             139899.            590
    ##  4 Serbia                        233.             131655.            565
    ##  5 Jordan                        230.             129155.            562
    ##  6 Argentina                     225.             127221.            565
    ##  7 United Kingdom                219.             127268.            581
    ##  8 Netherlands                   209.             120736.            577
    ##  9 Sweden                        209.             120727.            577
    ## 10 Belgium                       207.             120336.            580
    ## 11 Switzerland                   191.             111024.            581
    ## 12 Brazil                        187.             106752.            571
    ## 13 Spain                         183.             106769.            582
    ## 14 Colombia                      183.             103830.            566
    ## 15 France                        180.             105177.            583
    ## 16 Portugal                      176.             100347.            571
    ## 17 Chile                         174.              98961.            568
    ## 18 Turkey                        165.              93402.            566
    ## 19 Austria                       158.              90923.            575
    ## 20 Hungary                       147.              82666.            564

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1743     9214
    ##  2 Peru                 9.16     199485  2178939
    ##  3 Mexico               7.57     278803  3681960
    ##  4 Sudan                7.44       2876    38632
    ##  5 Syria                6.48       2287    35266
    ##  6 Ecuador              6.42      32791   510619
    ##  7 Egypt                5.68      17469   307569
    ##  8 Somalia              5.53       1137    20577
    ##  9 Afghanistan          4.64       7214   155309
    ## 10 China                4.56       5693   124843
    ## 11 Bulgaria             4.17      21216   508800
    ## 12 Myanmar              3.81      17957   471308
    ## 13 Bolivia              3.74      18764   501362
    ## 14 Malawi               3.71       2284    61619
    ## 15 Hungary              3.67      30246   825170
    ## 16 Mali                 3.59        550    15304
    ## 17 Zimbabwe             3.53       4627   131205
    ## 18 Paraguay             3.52      16201   460041
    ## 19 Tunisia              3.52      24934   708203
    ## 20 Chad                 3.45        174     5049

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6670.     199485   29.9 
    ##  2 Hungary                3030.      30246    9.98
    ##  3 Brazil                 2973.     597948  201.  
    ##  4 Bulgaria               2968.      21216    7.15
    ##  5 Czech Republic         2910.      30483   10.5 
    ##  6 Argentina              2788.     115245   41.3 
    ##  7 Colombia               2645.     126401   47.8 
    ##  8 Paraguay               2541.      16201    6.38
    ##  9 Mexico                 2479.     278803  112.  
    ## 10 Belgium                2464.      25632   10.4 
    ## 11 Tunisia                2355.      24934   10.6 
    ## 12 Slovakia               2326.      12690    5.46
    ## 13 United States          2246.     696732  310.  
    ## 14 Chile                  2239.      37500   16.7 
    ## 15 Ecuador                2217.      32791   14.8 
    ## 16 United Kingdom         2197.     136986   62.3 
    ## 17 Italy                  2172.     131068   60.3 
    ## 18 Poland                 1967.      75741   38.5 
    ## 19 Bolivia                1886.      18764    9.95
    ## 20 Spain                  1861.      86527   46.5

EOL
