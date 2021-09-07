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

Updated: 2021-09-08

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
    ##  1 United States           70810. 39795201            562
    ##  2 India                   60994. 33058843            542
    ##  3 Brazil                  38473. 20890779            543
    ##  4 Russia                  13100.  7047880            538
    ##  5 United Kingdom          12692.  7018931            553
    ##  6 Turkey                  12117.  6519016            538
    ##  7 France                  11971.  6644114            555
    ##  8 Argentina                9690.  5203802            537
    ##  9 Iran                     9209.  5156986            560
    ## 10 Colombia                 9142.  4918649            538
    ## 11 Spain                    8822.  4887394            554
    ## 12 Italy                    8140.  4574787            562
    ## 13 Indonesia                7626.  4133433            542
    ## 14 Germany                  7225.  4017116            556
    ## 15 Mexico                   6372.  3428384            538
    ## 16 Poland                   5334.  2891071            542
    ## 17 South Africa             5249.  2824063            538
    ## 18 Ukraine                  4324.  2300504            532
    ## 19 Peru                     3998.  2155034            539
    ## 20 Philippines              3880.  2103331            542

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                295.             160471.            544
    ##  2 Israel                        279.             151971.            544
    ##  3 Jordan                        234.             125228.            534
    ##  4 Argentina                     234.             125868.            537
    ##  5 United States                 228.             128275.            562
    ##  6 Sweden                        215.             118307.            549
    ##  7 Netherlands                   214.             117534.            549
    ##  8 Belgium                       208.             115030.            552
    ##  9 United Kingdom                204.             112576.            553
    ## 10 Serbia                        199.             106718.            537
    ## 11 Brazil                        191.             103881.            543
    ## 12 Colombia                      191.             102922.            538
    ## 13 Spain                         190.             105092.            554
    ## 14 Switzerland                   189.             104499.            553
    ## 15 France                        185.             102583.            555
    ## 16 Chile                         182.              98022.            540
    ## 17 Portugal                      181.              98137.            543
    ## 18 Turkey                        156.              83788.            538
    ## 19 Austria                       155.              84571.            547
    ## 20 Hungary                       152.              81529.            536

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1530     8142
    ##  2 Peru                 9.21     198488  2155034
    ##  3 Mexico               7.68     263140  3428384
    ##  4 Sudan                7.37       2791    37875
    ##  5 Syria                7.13       2044    28678
    ##  6 Ecuador              6.42      32351   503767
    ##  7 Egypt                5.79      16801   290395
    ##  8 Somalia              5.60       1005    17947
    ##  9 Afghanistan          4.65       7144   153626
    ## 10 China                4.61       5685   123285
    ## 11 Bulgaria             4.14      19149   462710
    ## 12 Myanmar              3.82      15985   417971
    ## 13 Bolivia              3.76      18512   492680
    ## 14 Hungary              3.70      30074   813818
    ## 15 Tanzania             3.66         50     1367
    ## 16 Malawi               3.64       2217    60852
    ## 17 Mali                 3.62        539    14910
    ## 18 Zimbabwe             3.58       4493   125671
    ## 19 Tunisia              3.53      23846   675191
    ## 20 Paraguay             3.49      15995   458884

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6637.     198488   29.9 
    ##  2 Hungary                3013.      30074    9.98
    ##  3 Czech Republic         2903.      30408   10.5 
    ##  4 Brazil                 2902.     583628  201.  
    ##  5 Argentina              2721.     112511   41.3 
    ##  6 Bulgaria               2679.      19149    7.15
    ##  7 Colombia               2621.     125278   47.8 
    ##  8 Paraguay               2509.      15995    6.38
    ##  9 Belgium                2444.      25421   10.4 
    ## 10 Mexico                 2340.     263140  112.  
    ## 11 Slovakia               2301.      12552    5.46
    ## 12 Tunisia                2252.      23846   10.6 
    ## 13 Chile                  2216.      37108   16.7 
    ## 14 Ecuador                2187.      32351   14.8 
    ## 15 Italy                  2147.     129567   60.3 
    ## 16 United Kingdom         2138.     133274   62.3 
    ## 17 United States          2075.     643757  310.  
    ## 18 Poland                 1958.      75392   38.5 
    ## 19 Bolivia                1861.      18512    9.95
    ## 20 Spain                  1826.      84928   46.5

EOL
