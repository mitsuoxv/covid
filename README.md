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

Updated: 2021-09-01

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
    ##  1 United States           69668. 38666040            555
    ##  2 India                   61250. 32768880            535
    ##  3 Brazil                  38697. 20741815            536
    ##  4 Russia                  13030.  6918965            531
    ##  5 United Kingdom          12376.  6757654            546
    ##  6 Turkey                  11989.  6366438            531
    ##  7 France                  11965.  6557097            548
    ##  8 Argentina                9761.  5173531            530
    ##  9 Colombia                 9238.  4905258            531
    ## 10 Iran                     8970.  4960744            553
    ## 11 Spain                    8861.  4847298            547
    ## 12 Italy                    8170.  4534499            555
    ## 13 Indonesia                7644.  4089801            535
    ## 14 Germany                  7182.  3942856            549
    ## 15 Mexico                   6282.  3335700            531
    ## 16 Poland                   5399.  2888670            535
    ## 17 South Africa             5217.  2770575            531
    ## 18 Ukraine                  4355.  2286296            525
    ## 19 Peru                     4040.  2149227            532
    ## 20 Philippines              3694.  1976202            535

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                298.             160289.            537
    ##  2 Israel                        270.             144774.            537
    ##  3 Argentina                     236.             125136.            530
    ##  4 Jordan                        236.             124278.            527
    ##  5 United States                 225.             124636.            555
    ##  6 Sweden                        217.             117562.            542
    ##  7 Netherlands                   215.             116476.            542
    ##  8 Belgium                       209.             113699.            545
    ##  9 United Kingdom                199.             108385.            546
    ## 10 Serbia                        195.             103467.            530
    ## 11 Colombia                      193.             102642.            531
    ## 12 Brazil                        192.             103140.            536
    ## 13 Spain                         191.             104230.            547
    ## 14 Switzerland                   187.             102042.            546
    ## 15 France                        185.             101239.            548
    ## 16 Chile                         184.              97831.            533
    ## 17 Portugal                      181.              97042.            536
    ## 18 Turkey                        154.              81826.            531
    ## 19 Hungary                       154.              81380.            529
    ## 20 Austria                       154.              83194.            541

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1469     7829
    ##  2 Peru                 9.22     198209  2149227
    ##  3 Mexico               7.74     258165  3335700
    ##  4 Sudan                7.40       2791    37709
    ##  5 Syria                7.22       2007    27779
    ##  6 Ecuador              6.43      32232   501140
    ##  7 Egypt                5.80      16727   288162
    ##  8 Somalia              5.57        969    17399
    ##  9 Afghanistan          4.65       7118   153220
    ## 10 China                4.62       5682   123043
    ## 11 Bulgaria             4.15      18840   453689
    ## 12 Myanmar              3.85      15389   399282
    ## 13 Bolivia              3.76      18411   490056
    ## 14 Hungary              3.70      30058   812337
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.62        539    14874
    ## 17 Malawi               3.59       2168    60386
    ## 18 Zimbabwe             3.54       4416   124581
    ## 19 Tunisia              3.54      23430   662752
    ## 20 Chad                 3.48        174     4993

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6628.     198209   29.9 
    ##  2 Hungary                3011.      30058    9.98
    ##  3 Czech Republic         2902.      30404   10.5 
    ##  4 Brazil                 2881.     579308  201.  
    ##  5 Argentina              2694.     111383   41.3 
    ##  6 Bulgaria               2635.      18840    7.15
    ##  7 Colombia               2612.     124811   47.8 
    ##  8 Paraguay               2466.      15723    6.38
    ##  9 Belgium                2439.      25374   10.4 
    ## 10 Slovakia               2300.      12548    5.46
    ## 11 Mexico                 2295.     258165  112.  
    ## 12 Tunisia                2213.      23430   10.6 
    ## 13 Chile                  2205.      36923   16.7 
    ## 14 Ecuador                2179.      32232   14.8 
    ## 15 Italy                  2140.     129146   60.3 
    ## 16 United Kingdom         2125.     132485   62.3 
    ## 17 United States          2040.     632983  310.  
    ## 18 Poland                 1957.      75345   38.5 
    ## 19 Bolivia                1851.      18411    9.95
    ## 20 Spain                  1809.      84146   46.5

EOL
