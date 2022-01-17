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

Updated: 2022-01-18

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
    ##  1 United States           94482. 64720612            685
    ##  2 India                   55460. 37380253            674
    ##  3 Brazil                  34038. 22975723            675
    ##  4 United Kingdom          22280. 15217284            683
    ##  5 France                  20115. 13819182            687
    ##  6 Russia                  16170. 10834260            670
    ##  7 Turkey                  15606. 10456273            670
    ##  8 Italy                   12546.  8706915            694
    ##  9 Germany                 11628.  8000122            688
    ## 10 Spain                   11560.  7930529            686
    ## 11 Argentina               10605.  7094865            669
    ## 12 Iran                     8990.  6221033            692
    ## 13 Colombia                 8226.  5511479            670
    ## 14 Mexico                   6434.  4349182            676
    ## 15 Poland                   6415.  4323482            674
    ## 16 Indonesia                6339.  4272421            674
    ## 17 Ukraine                  5662.  3759530            664
    ## 18 South Africa             5312.  3559230            670
    ## 19 Netherlands              5241.  3568999            681
    ## 20 Philippines              4756.  3205396            674

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                368.             248546.            676
    ##  2 Israel                        360.             243679.            677
    ##  3 United Kingdom                357.             244068.            683
    ##  4 Belgium                       339.             231734.            684
    ##  5 Switzerland                   320.             218877.            685
    ##  6 Netherlands                   315.             214419.            681
    ##  7 France                        311.             213363.            687
    ##  8 United States                 305.             208619.            685
    ##  9 Denmark                       304.             206274.            679
    ## 10 Serbia                        292.             195565.            669
    ## 11 Portugal                      262.             176562.            675
    ## 12 Austria                       259.             175953.            679
    ## 13 Jordan                        258.             171836.            666
    ## 14 Argentina                     257.             171609.            669
    ## 15 Spain                         249.             170527.            686
    ## 16 Slovakia                      241.             161443.            670
    ## 17 Sweden                        240.             163288.            681
    ## 18 Greece                        223.             150989.            676
    ## 19 Italy                         208.             144297.            694
    ## 20 Hungary                       202.             135066.            668

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.2        1990    10352
    ##  2 Peru                 7.94     203376  2562534
    ##  3 Mexico               6.93     301334  4349182
    ##  4 Sudan                6.54       3388    51802
    ##  5 Syria                5.81       2947    50710
    ##  6 Ecuador              5.67      34206   602942
    ##  7 Egypt                5.54      22148   400076
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.65       7379   158737
    ## 10 China                4.19       5700   136027
    ## 11 Bulgaria             3.91      32086   820608
    ## 12 Myanmar              3.62      19302   533144
    ## 13 Niger                3.48        292     8386
    ## 14 Indonesia            3.37     144174  4272421
    ## 15 Paraguay             3.36      16720   497336
    ## 16 Tunisia              3.27      25803   788012
    ## 17 Romania              3.11      59240  1903428
    ## 18 El Salvador          3.10       3834   123577
    ## 19 Hungary              3.00      40507  1348233
    ## 20 Malawi               2.98       2466    82719

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6800.     203376   29.9 
    ##  2 Bulgaria               4488.      32086    7.15
    ##  3 Hungary                4058.      40507    9.98
    ##  4 Czech Republic         3520.      36874   10.5 
    ##  5 Slovakia               3181.      17352    5.46
    ##  6 Brazil                 3088.     620971  201.  
    ##  7 Argentina              2855.     118040   41.3 
    ##  8 Belgium                2750.      28612   10.4 
    ##  9 Colombia               2738.     130860   47.8 
    ## 10 United States          2720.     843718  310.  
    ## 11 Romania                2698.      59240   22.0 
    ## 12 Mexico                 2679.     301334  112.  
    ## 13 Poland                 2657.     102309   38.5 
    ## 14 Paraguay               2622.      16720    6.38
    ## 15 United Kingdom         2438.     151987   62.3 
    ## 16 Tunisia                2437.      25803   10.6 
    ## 17 Chile                  2352.      39394   16.7 
    ## 18 Italy                  2338.     141104   60.3 
    ## 19 Ecuador                2313.      34206   14.8 
    ## 20 Russia                 2288.     321990  141.

EOL
