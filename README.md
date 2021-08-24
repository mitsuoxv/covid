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

Updated: 2021-08-25

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
    ##  1 United States           68593. 37588957            548
    ##  2 India                   61505. 32474773            528
    ##  3 Brazil                  38886. 20570891            529
    ##  4 Russia                  12949.  6785374            524
    ##  5 United Kingdom          12105.  6524585            539
    ##  6 France                  11919.  6448367            541
    ##  7 Turkey                  11898.  6234520            524
    ##  8 Argentina                9816.  5133831            523
    ##  9 Colombia                 9331.  4889537            524
    ## 10 Spain                    8878.  4794352            540
    ## 11 Iran                     8637.  4715771            546
    ## 12 Italy                    8191.  4488779            548
    ## 13 Indonesia                7591.  4008166            528
    ## 14 Germany                  7154.  3877612            542
    ## 15 Mexico                   6154.  3225073            524
    ## 16 Poland                   5468.  2887037            528
    ## 17 South Africa             5150.  2698605            524
    ## 18 Ukraine                  4393.  2275863            518
    ## 19 Peru                     4080.  2142153            525
    ## 20 Netherlands              3591.  1921159            535

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                302.             160159.            530
    ##  2 Israel                        257.             136730.            531
    ##  3 Argentina                     237.             124176.            523
    ##  4 Jordan                        237.             123371.            520
    ##  5 United States                 221.             121164.            548
    ##  6 Sweden                        218.             116848.            535
    ##  7 Netherlands                   216.             115420.            535
    ##  8 Belgium                       209.             112333.            538
    ##  9 Colombia                      195.             102313.            524
    ## 10 United Kingdom                194.             104647.            539
    ## 11 Serbia                        194.             101316.            523
    ## 12 Brazil                        193.             102290.            529
    ## 13 Spain                         191.             103091.            540
    ## 14 Chile                         186.              97596.            526
    ## 15 Switzerland                   185.              99676.            539
    ## 16 France                        184.              99560.            541
    ## 17 Portugal                      181.              95593.            529
    ## 18 Hungary                       156.              81267.            522
    ## 19 Austria                       154.              82036.            534
    ## 20 Turkey                        153.              80131.            524

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1420     7539
    ##  2 Peru                 9.24     197879  2142153
    ##  3 Mexico               7.85     253155  3225073
    ##  4 Sudan                7.39       2784    37648
    ##  5 Syria                7.32       1977    27003
    ##  6 Ecuador              6.43      32087   498678
    ##  7 Egypt                5.82      16676   286541
    ##  8 Somalia              5.49        927    16892
    ##  9 Afghanistan          4.64       7083   152660
    ## 10 China                4.62       5676   122744
    ## 11 Bulgaria             4.18      18532   443186
    ## 12 Myanmar              3.86      14622   378377
    ## 13 Bolivia              3.76      18302   486643
    ## 14 Hungary              3.70      30054   811203
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        536    14764
    ## 17 Tunisia              3.52      22609   642788
    ## 18 Malawi               3.49       2082    59624
    ## 19 Zimbabwe             3.49       4293   123001
    ## 20 Chad                 3.49        174     4987

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6616.     197879   29.9 
    ##  2 Hungary                3011.      30054    9.98
    ##  3 Czech Republic         2900.      30385   10.5 
    ##  4 Brazil                 2857.     574527  201.  
    ##  5 Argentina              2669.     110352   41.3 
    ##  6 Colombia               2599.     124216   47.8 
    ##  7 Bulgaria               2592.      18532    7.15
    ##  8 Paraguay               2442.      15571    6.38
    ##  9 Belgium                2436.      25341   10.4 
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2251.     253155  112.  
    ## 12 Chile                  2191.      36688   16.7 
    ## 13 Ecuador                2169.      32087   14.8 
    ## 14 Tunisia                2135.      22609   10.6 
    ## 15 Italy                  2134.     128795   60.3 
    ## 16 United Kingdom         2112.     131680   62.3 
    ## 17 United States          2011.     623900  310.  
    ## 18 Poland                 1956.      75324   38.5 
    ## 19 Bolivia                1840.      18302    9.95
    ## 20 Spain                  1792.      83337   46.5

EOL
