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

Updated: 2021-10-14

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
    ##  1 United States           71628. 44194808            617
    ##  2 India                   58826. 34001743            578
    ##  3 Brazil                  37276. 21582738            579
    ##  4 United Kingdom          13975.  8231441            589
    ##  5 Russia                  13696.  7861681            574
    ##  6 Turkey                  13082.  7508975            574
    ##  7 France                  11581.  6844684            591
    ##  8 Iran                     9613.  5729785            596
    ##  9 Argentina                9190.  5266275            573
    ## 10 Colombia                 8664.  4973325            574
    ## 11 Spain                    8436.  4977449            590
    ## 12 Italy                    7867.  4704318            598
    ## 13 Indonesia                7320.  4231046            578
    ## 14 Germany                  7314.  4330258            592
    ## 15 Mexico                   6490.  3725242            574
    ## 16 South Africa             5075.  2912938            574
    ## 17 Poland                   5066.  2928065            578
    ## 18 Philippines              4642.  2683372            578
    ## 19 Ukraine                  4539.  2578394            568
    ## 20 Malaysia                 4037.  2353579            583

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             178153.            580
    ##  2 Czech Republic                281.             162804.            580
    ##  3 Serbia                        242.             138573.            573
    ##  4 United States                 231.             142457.            617
    ##  5 Jordan                        229.             130476.            570
    ##  6 United Kingdom                224.             132023.            589
    ##  7 Argentina                     222.             127379.            573
    ##  8 Netherlands                   208.             121916.            585
    ##  9 Belgium                       207.             121984.            588
    ## 10 Sweden                        207.             121345.            585
    ## 11 Switzerland                   190.             111863.            589
    ## 12 Brazil                        185.             107322.            579
    ## 13 Spain                         181.             107028.            590
    ## 14 Colombia                      181.             104066.            574
    ## 15 France                        179.             105679.            591
    ## 16 Portugal                      174.             100820.            579
    ## 17 Chile                         172.              99364.            576
    ## 18 Turkey                        168.              96511.            574
    ## 19 Austria                       159.              92652.            583
    ## 20 Hungary                       145.              83222.            572

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1787     9412
    ##  2 Peru                 9.14     199703  2184676
    ##  3 Sudan                7.61       2976    39119
    ##  4 Mexico               7.58     282227  3725242
    ##  5 Ecuador              6.41      32836   512044
    ##  6 Syria                6.29       2358    37509
    ##  7 Egypt                5.66      17765   314116
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7230   155599
    ## 10 China                4.55       5695   125115
    ## 11 Bulgaria             4.15      21906   527802
    ## 12 Myanmar              3.78      18188   481230
    ## 13 Bolivia              3.73      18803   504121
    ## 14 Malawi               3.72       2292    61694
    ## 15 Hungary              3.65      30330   830725
    ## 16 Mali                 3.57        554    15512
    ## 17 Tunisia              3.53      25046   710096
    ## 18 Paraguay             3.52      16207   460218
    ## 19 Zimbabwe             3.52       4645   132016
    ## 20 Chad                 3.44        174     5063

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6677.     199703   29.9 
    ##  2 Bulgaria               3064.      21906    7.15
    ##  3 Hungary                3038.      30330    9.98
    ##  4 Brazil                 2990.     601213  201.  
    ##  5 Czech Republic         2913.      30518   10.5 
    ##  6 Argentina              2793.     115491   41.3 
    ##  7 Colombia               2650.     126655   47.8 
    ##  8 Paraguay               2542.      16207    6.38
    ##  9 Mexico                 2509.     282227  112.  
    ## 10 Belgium                2472.      25713   10.4 
    ## 11 Tunisia                2365.      25046   10.6 
    ## 12 Slovakia               2341.      12772    5.46
    ## 13 United States          2291.     710757  310.  
    ## 14 Chile                  2244.      37574   16.7 
    ## 15 Ecuador                2220.      32836   14.8 
    ## 16 United Kingdom         2212.     137944   62.3 
    ## 17 Italy                  2177.     131384   60.3 
    ## 18 Poland                 1973.      75958   38.5 
    ## 19 Bolivia                1890.      18803    9.95
    ## 20 Spain                  1867.      86827   46.5

EOL
