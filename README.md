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

Updated: 2021-10-07

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
    ##  1 United States           73721. 43569012            591
    ##  2 India                   59320. 33871881            571
    ##  3 Brazil                  37550. 21478546            572
    ##  4 United Kingdom          13691.  7967989            582
    ##  5 Russia                  13514.  7662560            567
    ##  6 Turkey                  12869.  7296879            567
    ##  7 France                  11672.  6816783            584
    ##  8 Iran                     9596.  5651961            589
    ##  9 Argentina                9294.  5260719            566
    ## 10 Colombia                 8753.  4963243            567
    ## 11 Spain                    8520.  4967200            583
    ## 12 Italy                    7929.  4686109            591
    ## 13 Indonesia                7396.  4223094            571
    ## 14 Germany                  7302.  4271734            585
    ## 15 Mexico                   6498.  3684242            567
    ## 16 South Africa             5128.  2907619            567
    ## 17 Poland                   5105.  2914962            571
    ## 18 Philippines              4576.  2613070            571
    ## 19 Ukraine                  4425.  2482518            561
    ## 20 Malaysia                 3983.  2294457            576

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        308.             176362.            573
    ##  2 Czech Republic                283.             161895.            573
    ##  3 United States                 238.             140440.            591
    ##  4 Serbia                        234.             132634.            566
    ##  5 Jordan                        230.             129321.            563
    ##  6 Argentina                     225.             127245.            566
    ##  7 United Kingdom                220.             127798.            582
    ##  8 Sweden                        209.             120924.            578
    ##  9 Netherlands                   209.             120849.            578
    ## 10 Belgium                       207.             120502.            581
    ## 11 Switzerland                   191.             111024.            582
    ## 12 Brazil                        187.             106804.            572
    ## 13 Spain                         183.             106808.            583
    ## 14 Colombia                      183.             103855.            567
    ## 15 France                        180.             105249.            584
    ## 16 Portugal                      176.             100416.            572
    ## 17 Chile                         174.              98991.            569
    ## 18 Turkey                        165.              93785.            567
    ## 19 Austria                       158.              91066.            576
    ## 20 Hungary                       146.              82729.            565

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1748     9234
    ##  2 Peru                 9.15     199502  2179316
    ##  3 Mexico               7.58     279106  3684242
    ##  4 Sudan                7.44       2876    38665
    ##  5 Syria                6.45       2297    35609
    ##  6 Ecuador              6.42      32805   510954
    ##  7 Egypt                5.68      17508   308347
    ##  8 Somalia              5.53       1137    20577
    ##  9 Afghanistan          4.65       7216   155340
    ## 10 China                4.56       5693   124884
    ## 11 Bulgaria             4.17      21320   511666
    ## 12 Myanmar              3.80      17998   473025
    ## 13 Bolivia              3.74      18766   501616
    ## 14 Malawi               3.71       2286    61629
    ## 15 Hungary              3.66      30253   825799
    ## 16 Mali                 3.59        551    15338
    ## 17 Zimbabwe             3.53       4627   131205
    ## 18 Tunisia              3.52      24966   708788
    ## 19 Paraguay             3.52      16203   460061
    ## 20 Chad                 3.44        174     5051

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6671.     199502   29.9 
    ##  2 Hungary                3031.      30253    9.98
    ##  3 Bulgaria               2982.      21320    7.15
    ##  4 Brazil                 2974.     598152  201.  
    ##  5 Czech Republic         2910.      30485   10.5 
    ##  6 Argentina              2788.     115283   41.3 
    ##  7 Colombia               2645.     126425   47.8 
    ##  8 Paraguay               2541.      16203    6.38
    ##  9 Mexico                 2482.     279106  112.  
    ## 10 Belgium                2465.      25640   10.4 
    ## 11 Tunisia                2358.      24966   10.6 
    ## 12 Slovakia               2328.      12697    5.46
    ## 13 United States          2253.     698905  310.  
    ## 14 Chile                  2240.      37506   16.7 
    ## 15 Ecuador                2218.      32805   14.8 
    ## 16 United Kingdom         2200.     137152   62.3 
    ## 17 Italy                  2173.     131118   60.3 
    ## 18 Poland                 1968.      75774   38.5 
    ## 19 Bolivia                1887.      18766    9.95
    ## 20 Spain                  1863.      86621   46.5

EOL
