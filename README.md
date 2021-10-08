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

Updated: 2021-10-09

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
    ##  1 United States           73848. 43792254            593
    ##  2 India                   59189. 33915569            573
    ##  3 Brazil                  37486. 21516967            574
    ##  4 United Kingdom          13778.  8046394            584
    ##  5 Russia                  13563.  7717356            569
    ##  6 Turkey                  12930.  7357336            569
    ##  7 France                  11648.  6825921            586
    ##  8 Iran                     9601.  5674083            591
    ##  9 Argentina                9266.  5263219            568
    ## 10 Colombia                 8727.  4965847            569
    ## 11 Spain                    8498.  4971310            585
    ## 12 Italy                    7913.  4692274            593
    ## 13 Indonesia                7375.  4225871            573
    ## 14 Germany                  7315.  4293807            587
    ## 15 Mexico                   6502.  3699621            569
    ## 16 South Africa             5114.  2909757            569
    ## 17 Poland                   5094.  2918863            573
    ## 18 Philippines              4595.  2632881            573
    ## 19 Ukraine                  4465.  2514005            563
    ## 20 Malaysia                 4003.  2313727            578

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        308.             176975.            575
    ##  2 Czech Republic                282.             162091.            575
    ##  3 United States                 238.             141159.            593
    ##  4 Serbia                        237.             134558.            568
    ##  5 Jordan                        229.             129527.            565
    ##  6 Argentina                     224.             127306.            568
    ##  7 United Kingdom                221.             129055.            584
    ##  8 Netherlands                   209.             121128.            580
    ##  9 Sweden                        209.             121086.            580
    ## 10 Belgium                       208.             120993.            583
    ## 11 Switzerland                   191.             111316.            584
    ## 12 Brazil                        186.             106995.            574
    ## 13 Spain                         183.             106896.            585
    ## 14 Colombia                      183.             103910.            569
    ## 15 France                        180.             105390.            586
    ## 16 Portugal                      175.             100531.            574
    ## 17 Chile                         174.              99089.            571
    ## 18 Turkey                        166.              94562.            569
    ## 19 Austria                       159.              91671.            578
    ## 20 Hungary                       146.              82890.            567

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1765     9299
    ##  2 Peru                 9.15     199559  2181183
    ##  3 Sudan                7.62       2951    38746
    ##  4 Mexico               7.58     280610  3699621
    ##  5 Syria                6.42       2306    35898
    ##  6 Ecuador              6.42      32819   511317
    ##  7 Egypt                5.68      17545   309135
    ##  8 Somalia              5.51       1152    20900
    ##  9 Afghanistan          4.65       7221   155429
    ## 10 China                4.56       5693   124954
    ## 11 Bulgaria             4.16      21505   516510
    ## 12 Myanmar              3.80      18068   475885
    ## 13 Bolivia              3.74      18775   502550
    ## 14 Malawi               3.71       2287    61648
    ## 15 Hungary              3.66      30275   827410
    ## 16 Mali                 3.59        552    15395
    ## 17 Tunisia              3.52      24971   709001
    ## 18 Paraguay             3.52      16205   460113
    ## 19 Zimbabwe             3.52       4631   131523
    ## 20 Chad                 3.44        174     5053

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6673.     199559   29.9 
    ##  2 Hungary                3033.      30275    9.98
    ##  3 Bulgaria               3008.      21505    7.15
    ##  4 Brazil                 2980.     599359  201.  
    ##  5 Czech Republic         2911.      30496   10.5 
    ##  6 Argentina              2791.     115379   41.3 
    ##  7 Colombia               2647.     126487   47.8 
    ##  8 Paraguay               2542.      16205    6.38
    ##  9 Mexico                 2495.     280610  112.  
    ## 10 Belgium                2467.      25665   10.4 
    ## 11 Tunisia                2358.      24971   10.6 
    ## 12 Slovakia               2332.      12720    5.46
    ## 13 United States          2268.     703599  310.  
    ## 14 Chile                  2241.      37533   16.7 
    ## 15 Ecuador                2219.      32819   14.8 
    ## 16 United Kingdom         2204.     137417   62.3 
    ## 17 Italy                  2174.     131198   60.3 
    ## 18 Poland                 1970.      75834   38.5 
    ## 19 Bolivia                1887.      18775    9.95
    ## 20 Spain                  1864.      86701   46.5

EOL
