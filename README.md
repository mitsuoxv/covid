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

Updated: 2021-09-18

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
    ##  1 United States           72369. 41395425            572
    ##  2 India                   60474. 33381728            552
    ##  3 Brazil                  38037. 21034610            553
    ##  4 Russia                  13201.  7234425            548
    ##  5 United Kingdom          13035.  7339013            563
    ##  6 Turkey                  12348.  6767008            548
    ##  7 France                  11906.  6727094            565
    ##  8 Argentina                9565.  5232358            547
    ##  9 Iran                     9436.  5378408            570
    ## 10 Colombia                 9004.  4934568            548
    ## 11 Spain                    8734.  4926324            564
    ## 12 Italy                    8082.  4623155            572
    ## 13 Indonesia                7582.  4185144            552
    ## 14 Germany                  7289.  4125878            566
    ## 15 Mexico                   6464.  3542189            548
    ## 16 Poland                   5247.  2896599            552
    ## 17 South Africa             5243.  2873415            548
    ## 18 Ukraine                  4314.  2338164            542
    ## 19 Philippines              4174.  2304192            552
    ## 20 Peru                     3940.  2163312            549

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        297.             164392.            554
    ##  2 Czech Republic                290.             160885.            554
    ##  3 United States                 233.             133433.            572
    ##  4 Jordan                        233.             126510.            544
    ##  5 Argentina                     231.             126559.            547
    ##  6 Sweden                        214.             119714.            559
    ##  7 Netherlands                   213.             118901.            559
    ##  8 Serbia                        211.             115198.            547
    ##  9 United Kingdom                209.             117710.            563
    ## 10 Belgium                       208.             117031.            562
    ## 11 Switzerland                   192.             107832.            563
    ## 12 Brazil                        189.             104596.            553
    ## 13 Colombia                      188.             103255.            548
    ## 14 Spain                         188.             105929.            564
    ## 15 France                        184.             103864.            565
    ## 16 Portugal                      179.              99233.            553
    ## 17 Chile                         179.              98278.            550
    ## 18 Turkey                        159.              86975.            548
    ## 19 Austria                       156.              87100.            557
    ## 20 Hungary                       150.              81863.            546

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1612     8527
    ##  2 Peru                 9.19     198860  2163312
    ##  3 Mexico               7.62     269913  3542189
    ##  4 Sudan                7.46       2833    37995
    ##  5 Syria                7.00       2097    29974
    ##  6 Ecuador              6.44      32559   505860
    ##  7 Egypt                5.74      16908   294482
    ##  8 Somalia              5.53       1041    18820
    ##  9 Afghanistan          4.65       7186   154487
    ## 10 China                4.59       5688   123904
    ## 11 Bulgaria             4.15      19876   478885
    ## 12 Myanmar              3.83      16944   442928
    ## 13 Bolivia              3.75      18616   496032
    ## 14 Hungary              3.69      30123   817159
    ## 15 Malawi               3.68       2251    61250
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.63        545    15021
    ## 18 Zimbabwe             3.58       4560   127368
    ## 19 Tunisia              3.54      24244   685799
    ## 20 Paraguay             3.51      16118   459461

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6649.     198860   29.9 
    ##  2 Hungary                3018.      30123    9.98
    ##  3 Brazil                 2927.     588597  201.  
    ##  4 Czech Republic         2904.      30427   10.5 
    ##  5 Bulgaria               2780.      19876    7.15
    ##  6 Argentina              2757.     113969   41.3 
    ##  7 Colombia               2631.     125753   47.8 
    ##  8 Paraguay               2528.      16118    6.38
    ##  9 Belgium                2451.      25494   10.4 
    ## 10 Mexico                 2400.     269913  112.  
    ## 11 Slovakia               2304.      12569    5.46
    ## 12 Tunisia                2290.      24244   10.6 
    ## 13 Chile                  2227.      37293   16.7 
    ## 14 Ecuador                2201.      32559   14.8 
    ## 15 United Kingdom         2162.     134805   62.3 
    ## 16 Italy                  2157.     130167   60.3 
    ## 17 United States          2138.     663141  310.  
    ## 18 Poland                 1960.      75473   38.5 
    ## 19 Bolivia                1871.      18616    9.95
    ## 20 Spain                  1844.      85739   46.5

EOL
