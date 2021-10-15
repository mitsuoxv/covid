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

Updated: 2021-10-16

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
    ##  1 United States           71742. 44408612            619
    ##  2 India                   58685. 34037592            580
    ##  3 Brazil                  37174. 21597949            581
    ##  4 United Kingdom          14073.  8317443            591
    ##  5 Russia                  13759.  7925176            576
    ##  6 Turkey                  13144.  7570932            576
    ##  7 France                  11559.  6854885            593
    ##  8 Iran                     9622.  5754047            598
    ##  9 Argentina                9163.  5268653            575
    ## 10 Colombia                 8638.  4975656            576
    ## 11 Spain                    8416.  4982138            592
    ## 12 Italy                    7849.  4709753            600
    ## 13 Germany                  7330.  4354158            594
    ## 14 Indonesia                7297.  4232099            580
    ## 15 Mexico                   6491.  3738749            576
    ## 16 South Africa             5060.  2914827            576
    ## 17 Poland                   5058.  2933834            580
    ## 18 Philippines              4652.  2698232            580
    ## 19 Ukraine                  4580.  2610899            570
    ## 20 Malaysia                 4050.  2369613            585

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             178571.            582
    ##  2 Czech Republic                280.             162846.            582
    ##  3 Serbia                        244.             140409.            575
    ##  4 United States                 231.             143146.            619
    ##  5 Jordan                        228.             130676.            572
    ##  6 United Kingdom                226.             133403.            591
    ##  7 Argentina                     222.             127437.            575
    ##  8 Netherlands                   208.             122357.            587
    ##  9 Belgium                       208.             122678.            590
    ## 10 Sweden                        207.             121523.            587
    ## 11 Switzerland                   190.             112129.            591
    ## 12 Brazil                        185.             107397.            581
    ## 13 Spain                         181.             107129.            592
    ## 14 Colombia                      181.             104115.            576
    ## 15 France                        178.             105837.            593
    ## 16 Portugal                      174.             100971.            581
    ## 17 Chile                         172.              99479.            578
    ## 18 Turkey                        169.              97308.            576
    ## 19 Austria                       159.              93253.            585
    ## 20 Hungary                       145.              83462.            574

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1793     9467
    ##  2 Peru                 9.14     199746  2186246
    ##  3 Mexico               7.57     283193  3738749
    ##  4 Sudan                7.55       2976    39416
    ##  5 Ecuador              6.41      32848   512071
    ##  6 Syria                6.26       2366    37794
    ##  7 Egypt                5.65      17806   314977
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7238   155682
    ## 10 China                4.55       5695   125162
    ## 11 Bulgaria             4.14      22102   534312
    ## 12 Myanmar              3.77      18255   484317
    ## 13 Bolivia              3.72      18811   505157
    ## 14 Malawi               3.71       2292    61702
    ## 15 Hungary              3.64      30351   833115
    ## 16 Mali                 3.57        555    15565
    ## 17 Tunisia              3.53      25053   710322
    ## 18 Paraguay             3.52      16207   460277
    ## 19 Zimbabwe             3.52       4655   132251
    ## 20 Chad                 3.44        174     5065

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6679.     199746   29.9 
    ##  2 Bulgaria               3092.      22102    7.15
    ##  3 Hungary                3041.      30351    9.98
    ##  4 Brazil                 2991.     601574  201.  
    ##  5 Czech Republic         2914.      30528   10.5 
    ##  6 Argentina              2796.     115582   41.3 
    ##  7 Colombia               2652.     126726   47.8 
    ##  8 Paraguay               2542.      16207    6.38
    ##  9 Mexico                 2518.     283193  112.  
    ## 10 Belgium                2474.      25732   10.4 
    ## 11 Tunisia                2366.      25053   10.6 
    ## 12 Slovakia               2349.      12816    5.46
    ## 13 United States          2305.     715179  310.  
    ## 14 Chile                  2244.      37583   16.7 
    ## 15 Ecuador                2221.      32848   14.8 
    ## 16 United Kingdom         2217.     138237   62.3 
    ## 17 Italy                  2179.     131461   60.3 
    ## 18 Poland                 1976.      76067   38.5 
    ## 19 Bolivia                1891.      18811    9.95
    ## 20 Romania                1873.      41130   22.0

EOL
