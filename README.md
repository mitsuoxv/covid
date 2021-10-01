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

Updated: 2021-10-02

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
    ##  1 United States           73322. 42966938            586
    ##  2 India                   59658. 33766707            566
    ##  3 Brazil                  37741. 21399546            567
    ##  4 United Kingdom          13530.  7807040            577
    ##  5 Russia                  13408.  7535548            562
    ##  6 Turkey                  12729.  7154070            562
    ##  7 France                  11743.  6799222            579
    ##  8 Iran                     9567.  5587040            584
    ##  9 Argentina                9367.  5255261            561
    ## 10 Colombia                 8818.  4955848            562
    ## 11 Spain                    8580.  4959091            578
    ## 12 Italy                    7973.  4672355            586
    ## 13 Indonesia                7450.  4216728            566
    ## 14 Germany                  7306.  4237619            580
    ## 15 Mexico                   6504.  3655395            562
    ## 16 South Africa             5165.  2902672            562
    ## 17 Poland                   5138.  2908432            566
    ## 18 Philippines              4505.  2549966            566
    ## 19 Ukraine                  4380.  2435413            556
    ## 20 Malaysia                 3933.  2245695            571

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             174467.            568
    ##  2 Czech Republic                284.             161551.            568
    ##  3 United States                 236.             138499.            586
    ##  4 Jordan                        230.             128435.            558
    ##  5 Serbia                        229.             128252.            561
    ##  6 Argentina                     227.             127113.            561
    ##  7 United Kingdom                217.             125216.            577
    ##  8 Sweden                        211.             120647.            573
    ##  9 Netherlands                   210.             120339.            573
    ## 10 Belgium                       208.             119673.            576
    ## 11 Switzerland                   191.             110382.            577
    ## 12 Brazil                        188.             106411.            567
    ## 13 Colombia                      185.             103701.            562
    ## 14 Spain                         184.             106633.            578
    ## 15 France                        181.             104977.            579
    ## 16 Portugal                      177.             100157.            567
    ## 17 Chile                         175.              98783.            564
    ## 18 Turkey                        164.              91950.            562
    ## 19 Austria                       158.              90115.            571
    ## 20 Hungary                       147.              82487.            560

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1721     9067
    ##  2 Peru                 9.17     199367  2175305
    ##  3 Mexico               7.58     276973  3655395
    ##  4 Sudan                7.42       2842    38283
    ##  5 Syria                6.60       2238    33933
    ##  6 Ecuador              6.43      32762   509238
    ##  7 Egypt                5.69      17294   303783
    ##  8 Somalia              5.56       1111    19980
    ##  9 Afghanistan          4.64       7206   155191
    ## 10 China                4.56       5691   124673
    ## 11 Bulgaria             4.16      20882   502162
    ## 12 Myanmar              3.82      17789   465922
    ## 13 Bolivia              3.74      18726   500090
    ## 14 Malawi               3.71       2282    61580
    ## 15 Hungary              3.67      30199   823384
    ## 16 Mali                 3.60        548    15220
    ## 17 Zimbabwe             3.53       4623   130820
    ## 18 Paraguay             3.52      16195   459948
    ## 19 Tunisia              3.52      24868   706803
    ## 20 Chad                 3.45        174     5040

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6666.     199367   29.9 
    ##  2 Hungary                3025.      30199    9.98
    ##  3 Brazil                 2964.     596122  201.  
    ##  4 Bulgaria               2921.      20882    7.15
    ##  5 Czech Republic         2909.      30475   10.5 
    ##  6 Argentina              2785.     115130   41.3 
    ##  7 Colombia               2642.     126261   47.8 
    ##  8 Paraguay               2540.      16195    6.38
    ##  9 Mexico                 2463.     276973  112.  
    ## 10 Belgium                2461.      25602   10.4 
    ## 11 Tunisia                2348.      24868   10.6 
    ## 12 Slovakia               2319.      12649    5.46
    ## 13 Chile                  2237.      37468   16.7 
    ## 14 United States          2218.     688099  310.  
    ## 15 Ecuador                2215.      32762   14.8 
    ## 16 United Kingdom         2192.     136662   62.3 
    ## 17 Italy                  2170.     130921   60.3 
    ## 18 Poland                 1965.      75666   38.5 
    ## 19 Bolivia                1882.      18726    9.95
    ## 20 Spain                  1858.      86415   46.5

EOL
