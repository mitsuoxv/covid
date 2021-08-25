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

Updated: 2021-08-26

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
    ##  1 United States           68882. 37816239            549
    ##  2 India                   61460. 32512366            529
    ##  3 Brazil                  38837. 20583994            530
    ##  4 Russia                  12961.  6804910            525
    ##  5 United Kingdom          12139.  6555204            540
    ##  6 France                  11938.  6470371            542
    ##  7 Turkey                  11911.  6253711            525
    ##  8 Argentina                9809.  5139966            524
    ##  9 Colombia                 9318.  4892235            525
    ## 10 Spain                    8880.  4804424            541
    ## 11 Iran                     8695.  4756394            547
    ## 12 Italy                    8187.  4494857            549
    ## 13 Indonesia                7577.  4008166            529
    ## 14 Germany                  7162.  3889173            543
    ## 15 Mexico                   6155.  3231616            525
    ## 16 Poland                   5458.  2887270            529
    ## 17 South Africa             5160.  2708951            525
    ## 18 Ukraine                  4386.  2276590            519
    ## 19 Peru                     4073.  2142565            526
    ## 20 Netherlands              3589.  1923596            536

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                302.             160184.            531
    ##  2 Israel                        260.             138026.            531
    ##  3 Argentina                     237.             124324.            524
    ##  4 Jordan                        237.             123530.            521
    ##  5 United States                 222.             121896.            549
    ##  6 Sweden                        219.             117138.            536
    ##  7 Netherlands                   216.             115566.            536
    ##  8 Belgium                       209.             112488.            539
    ##  9 Colombia                      195.             102369.            525
    ## 10 United Kingdom                195.             105138.            540
    ## 11 Serbia                        194.             101618.            524
    ## 12 Brazil                        193.             102355.            530
    ## 13 Spain                         191.             103308.            541
    ## 14 Switzerland                   185.             100070.            540
    ## 15 Chile                         185.              97619.            527
    ## 16 France                        184.              99900.            542
    ## 17 Portugal                      181.              95804.            530
    ## 18 Hungary                       155.              81280.            523
    ## 19 Austria                       154.              82160.            535
    ## 20 Turkey                        153.              80378.            525

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1424     7580
    ##  2 Peru                 9.24     197921  2142565
    ##  3 Mexico               7.85     253526  3231616
    ##  4 Sudan                7.39       2784    37662
    ##  5 Syria                7.31       1981    27115
    ##  6 Ecuador              6.43      32092   498728
    ##  7 Egypt                5.82      16683   286735
    ##  8 Somalia              5.49        927    16892
    ##  9 Afghanistan          4.64       7090   152722
    ## 10 China                4.62       5677   122777
    ## 11 Bulgaria             4.17      18565   445097
    ## 12 Myanmar              3.86      14622   378377
    ## 13 Bolivia              3.76      18313   487131
    ## 14 Hungary              3.70      30055   811337
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        536    14779
    ## 17 Tunisia              3.53      22714   644072
    ## 18 Malawi               3.51       2098    59787
    ## 19 Zimbabwe             3.50       4320   123320
    ## 20 Chad                 3.49        174     4987

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6618.     197921   29.9 
    ##  2 Hungary                3011.      30055    9.98
    ##  3 Czech Republic         2901.      30387   10.5 
    ##  4 Brazil                 2858.     574848  201.  
    ##  5 Argentina              2675.     110609   41.3 
    ##  6 Colombia               2601.     124315   47.8 
    ##  7 Bulgaria               2597.      18565    7.15
    ##  8 Paraguay               2446.      15593    6.38
    ##  9 Belgium                2436.      25342   10.4 
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2254.     253526  112.  
    ## 12 Chile                  2192.      36701   16.7 
    ## 13 Ecuador                2170.      32092   14.8 
    ## 14 Tunisia                2145.      22714   10.6 
    ## 15 Italy                  2135.     128855   60.3 
    ## 16 United Kingdom         2115.     131854   62.3 
    ## 17 United States          2015.     625046  310.  
    ## 18 Poland                 1957.      75329   38.5 
    ## 19 Bolivia                1841.      18313    9.95
    ## 20 Spain                  1796.      83527   46.5

EOL
