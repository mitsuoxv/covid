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

Updated: 2022-01-13

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
    ##  1 United States           90194. 61332277            680
    ##  2 India                   53917. 36070510            669
    ##  3 Brazil                  33670. 22558695            670
    ##  4 United Kingdom          21729. 14732598            678
    ##  5 France                  17956. 12246358            682
    ##  6 Russia                  16093. 10702150            665
    ##  7 Turkey                  15213. 10117063            665
    ##  8 Italy                   11284.  7774863            689
    ##  9 Germany                 11218.  7661811            683
    ## 10 Spain                   11148.  7592243            681
    ## 11 Argentina                9637.  6399196            664
    ## 12 Iran                     9040.  6210298            687
    ## 13 Colombia                 8057.  5357767            665
    ## 14 Indonesia                6380.  4268097            669
    ## 15 Poland                   6350.  4248559            669
    ## 16 Mexico                   6214.  4169942            671
    ## 17 Ukraine                  5640.  3716988            659
    ## 18 South Africa             5314.  3534131            665
    ## 19 Netherlands              5030.  3400076            676
    ## 20 Philippines              4524.  3026473            669

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                363.             243481.            671
    ##  2 United Kingdom                349.             236295.            678
    ##  3 Israel                        328.             220205.            672
    ##  4 Belgium                       327.             221844.            679
    ##  5 Switzerland                   303.             206380.            680
    ##  6 Netherlands                   302.             204270.            676
    ##  7 United States                 291.             197698.            680
    ##  8 Serbia                        282.             186966.            664
    ##  9 France                        277.             189079.            682
    ## 10 Denmark                       272.             183497.            674
    ## 11 Jordan                        256.             169422.            661
    ## 12 Austria                       246.             165662.            674
    ## 13 Spain                         240.             163253.            681
    ## 14 Slovakia                      240.             159425.            665
    ## 15 Portugal                      237.             158617.            670
    ## 16 Argentina                     233.             154782.            664
    ## 17 Sweden                        230.             155641.            676
    ## 18 Greece                        212.             142565             671
    ## 19 Hungary                       198.             131124.            663
    ## 20 Turkey                        196.             130032.            665

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1987    10220
    ##  2 Peru                 8.50     203097  2388289
    ##  3 Mexico               7.21     300573  4169942
    ##  4 Sudan                6.84       3358    49096
    ##  5 Ecuador              5.92      33713   569184
    ##  6 Syria                5.80       2933    50552
    ##  7 Egypt                5.58      22014   394740
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.65       7374   158452
    ## 10 China                4.23       5699   134711
    ## 11 Bulgaria             4.00      31761   794240
    ## 12 Myanmar              3.62      19297   532553
    ## 13 Niger                3.50        285     8150
    ## 14 Paraguay             3.48      16684   479971
    ## 15 Tunisia              3.43      25707   749832
    ## 16 Indonesia            3.38     144150  4268097
    ## 17 Romania              3.18      59070  1857502
    ## 18 El Salvador          3.12       3827   122628
    ## 19 Hungary              3.06      40083  1308877
    ## 20 Malawi               3.00       2427    80867

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6791.     203097   29.9 
    ##  2 Bulgaria               4443.      31761    7.15
    ##  3 Hungary                4016.      40083    9.98
    ##  4 Czech Republic         3505.      36722   10.5 
    ##  5 Slovakia               3131.      17081    5.46
    ##  6 Brazil                 3083.     620091  201.  
    ##  7 Argentina              2843.     117543   41.3 
    ##  8 Belgium                2743.      28539   10.4 
    ##  9 Colombia               2728.     130395   47.8 
    ## 10 Romania                2690.      59070   22.0 
    ## 11 United States          2687.     833519  310.  
    ## 12 Mexico                 2672.     300573  112.  
    ## 13 Poland                 2622.     100938   38.5 
    ## 14 Paraguay               2617.      16684    6.38
    ## 15 Tunisia                2428.      25707   10.6 
    ## 16 United Kingdom         2416.     150609   62.3 
    ## 17 Chile                  2346.      39289   16.7 
    ## 18 Italy                  2313.     139559   60.3 
    ## 19 Ecuador                2279.      33713   14.8 
    ## 20 Russia                 2263.     318432  141.

EOL
