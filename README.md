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

Updated: 2021-09-17

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
    ##  1 United States           72205. 41229421            571
    ##  2 India                   60521. 33347325            551
    ##  3 Brazil                  38079. 21019830            552
    ##  4 Russia                  13189.  7214520            547
    ##  5 United Kingdom          13012.  7312687            562
    ##  6 Turkey                  12319.  6738890            547
    ##  7 France                  11914.  6719404            564
    ##  8 Argentina                9578.  5229848            546
    ##  9 Iran                     9420.  5360387            569
    ## 10 Colombia                 9018.  4932998            547
    ## 11 Spain                    8743.  4922249            563
    ## 12 Italy                    8087.  4618040            571
    ## 13 Indonesia                7583.  4178164            551
    ## 14 Germany                  7283.  4114856            565
    ## 15 Mexico                   6451.  3528972            547
    ## 16 Poland                   5256.  2895947            551
    ## 17 South Africa             5245.  2869201            547
    ## 18 Ukraine                  4309.  2331540            541
    ## 19 Philippines              4143.  2283011            551
    ## 20 Peru                     3946.  2162294            548

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        294.             162783.            553
    ##  2 Czech Republic                291.             160832.            553
    ##  3 United States                 233.             132898.            571
    ##  4 Jordan                        233.             126336.            543
    ##  5 Argentina                     232.             126498.            546
    ##  6 Sweden                        214.             119588.            558
    ##  7 Netherlands                   213.             118775.            558
    ##  8 Serbia                        209.             114163.            546
    ##  9 United Kingdom                209.             117287.            562
    ## 10 Belgium                       208.             116804.            561
    ## 11 Switzerland                   191.             107533.            562
    ## 12 Brazil                        189.             104523.            552
    ## 13 Colombia                      189.             103222.            547
    ## 14 Spain                         188.             105841.            563
    ## 15 France                        184.             103745.            564
    ## 16 Portugal                      180.              99133.            552
    ## 17 Chile                         179.              98243.            549
    ## 18 Turkey                        158.              86614.            547
    ## 19 Austria                       156.              86822.            556
    ## 20 Hungary                       150.              81815.            545

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1612     8527
    ##  2 Peru                 9.20     198840  2162294
    ##  3 Mexico               7.62     269016  3528972
    ##  4 Sudan                7.46       2833    37995
    ##  5 Syria                7.01       2090    29805
    ##  6 Ecuador              6.43      32491   505628
    ##  7 Egypt                5.75      16895   293951
    ##  8 Somalia              5.56       1032    18568
    ##  9 Afghanistan          4.65       7183   154361
    ## 10 China                4.59       5688   123808
    ## 11 Bulgaria             4.15      19809   477161
    ## 12 Myanmar              3.82      16784   438951
    ## 13 Bolivia              3.75      18603   495612
    ## 14 Hungary              3.69      30118   816680
    ## 15 Malawi               3.67       2246    61207
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        543    15003
    ## 18 Zimbabwe             3.58       4551   127083
    ## 19 Paraguay             3.51      16114   459391
    ## 20 Tunisia              3.50      24337   696279

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6649.     198840   29.9 
    ##  2 Hungary                3017.      30118    9.98
    ##  3 Brazil                 2923.     587797  201.  
    ##  4 Czech Republic         2904.      30422   10.5 
    ##  5 Bulgaria               2771.      19809    7.15
    ##  6 Argentina              2753.     113816   41.3 
    ##  7 Colombia               2631.     125713   47.8 
    ##  8 Paraguay               2527.      16114    6.38
    ##  9 Belgium                2450.      25486   10.4 
    ## 10 Mexico                 2392.     269016  112.  
    ## 11 Slovakia               2304.      12566    5.46
    ## 12 Tunisia                2298.      24337   10.6 
    ## 13 Chile                  2225.      37261   16.7 
    ## 14 Ecuador                2197.      32491   14.8 
    ## 15 United Kingdom         2160.     134647   62.3 
    ## 16 Italy                  2156.     130100   60.3 
    ## 17 United States          2125.     659336  310.  
    ## 18 Poland                 1960.      75464   38.5 
    ## 19 Bolivia                1870.      18603    9.95
    ## 20 Spain                  1841.      85638   46.5

EOL
