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

Updated: 2021-09-21

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
    ##  1 United States           72550. 41716516            575
    ##  2 India                   60321. 33478419            555
    ##  3 Brazil                  38184. 21230325            556
    ##  4 Russia                  13239.  7294672            551
    ##  5 United Kingdom          13127.  7429750            566
    ##  6 Turkey                  12427.  6847259            551
    ##  7 France                  11877.  6746220            568
    ##  8 Argentina                9525.  5238610            550
    ##  9 Iran                     9467.  5424835            573
    ## 10 Colombia                 8964.  4939251            551
    ## 11 Spain                    8694.  4929546            567
    ## 12 Italy                    8063.  4636111            575
    ## 13 Indonesia                7554.  4192695            555
    ## 14 Germany                  7286.  4145852            569
    ## 15 Mexico                   6469.  3564694            551
    ## 16 South Africa             5231.  2882630            551
    ## 17 Poland                   5222.  2898299            555
    ## 18 Ukraine                  4313.  2350646            545
    ## 19 Philippines              4264.  2366749            555
    ## 20 Peru                     3924.  2166419            552

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        300.             166980.            557
    ##  2 Czech Republic                289.             160974.            557
    ##  3 United States                 234.             134468.            575
    ##  4 Jordan                        232.             126985.            547
    ##  5 Argentina                     230.             126710.            550
    ##  6 Serbia                        214.             117863.            550
    ##  7 Sweden                        213.             119819.            562
    ##  8 Netherlands                   212.             119250.            562
    ##  9 United Kingdom                211.             119165.            566
    ## 10 Belgium                       208.             117256.            565
    ## 11 Switzerland                   191.             108108.            566
    ## 12 Brazil                        190.             105569.            556
    ## 13 Colombia                      188.             103353.            551
    ## 14 Spain                         187.             105998.            567
    ## 15 France                        183.             104159.            568
    ## 16 Portugal                      179.              99480.            556
    ## 17 Chile                         178.              98377.            553
    ## 18 Turkey                        160.              88006.            551
    ## 19 Austria                       157.              87833.            560
    ## 20 Hungary                       149.              81971.            549

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1643     8667
    ##  2 Peru                 9.18     198976  2166419
    ##  3 Mexico               7.61     271303  3564694
    ##  4 Sudan                7.45       2835    38041
    ##  5 Syria                6.95       2120    30519
    ##  6 Ecuador              6.44      32559   505860
    ##  7 Egypt                5.72      16970   296929
    ##  8 Somalia              5.59       1063    19004
    ##  9 Afghanistan          4.66       7199   154585
    ## 10 China                4.58       5689   124102
    ## 11 Bulgaria             4.15      20028   482186
    ## 12 Myanmar              3.82      17129   448158
    ## 13 Bolivia              3.75      18654   496950
    ## 14 Malawi               3.68       2261    61363
    ## 15 Hungary              3.68      30136   818231
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        545    15069
    ## 18 Zimbabwe             3.57       4567   127938
    ## 19 Paraguay             3.51      16126   459622
    ## 20 Tunisia              3.50      24527   700400

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6653.     198976   29.9 
    ##  2 Hungary                3019.      30136    9.98
    ##  3 Brazil                 2936.     590508  201.  
    ##  4 Czech Republic         2905.      30431   10.5 
    ##  5 Bulgaria               2802.      20028    7.15
    ##  6 Argentina              2766.     114367   41.3 
    ##  7 Colombia               2634.     125860   47.8 
    ##  8 Paraguay               2529.      16126    6.38
    ##  9 Belgium                2451.      25497   10.4 
    ## 10 Mexico                 2412.     271303  112.  
    ## 11 Tunisia                2316.      24527   10.6 
    ## 12 Slovakia               2305.      12573    5.46
    ## 13 Chile                  2231.      37359   16.7 
    ## 14 Ecuador                2201.      32559   14.8 
    ## 15 United Kingdom         2169.     135203   62.3 
    ## 16 Italy                  2160.     130310   60.3 
    ## 17 United States          2151.     667244  310.  
    ## 18 Poland                 1961.      75488   38.5 
    ## 19 Bolivia                1875.      18654    9.95
    ## 20 Spain                  1845.      85783   46.5

EOL
