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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-01

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          101639. 86291417            849
    ##  2 India                   51852. 43452164            838
    ##  3 Brazil                  38479. 32206954            837
    ##  4 France                  35283. 30025809            851
    ##  5 Germany                 33037. 28180861            853
    ##  6 United Kingdom          26735. 22697889            849
    ##  7 Russia                  22098. 18430239            834
    ##  8 Italy                   21490. 18438877            858
    ##  9 South Korea             21323. 18359341            861
    ## 10 Turkey                  18133. 15123331            834
    ## 11 Spain                   14981. 12734038            850
    ## 12 Vietnam                 12946. 10745631            830
    ## 13 Argentina               11151.  9367172            840
    ## 14 Japan                   10794.  9283083            860
    ## 15 Netherlands              9678.  8177667            845
    ## 16 Australia                9617.  8087651            841
    ## 17 Iran                     8455.  7237597            856
    ## 18 Colombia                 7384.  6151354            833
    ## 19 Indonesia                7265.  6088460            838
    ## 20 Poland                   7178.  6014992            838

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        702.             590674.            841
    ##  2 Denmark                       686.             577972.            843
    ##  3 Austria                       645.             543543.            843
    ##  4 Netherlands                   581.             491299.            845
    ##  5 Switzerland                   581.             493586.            849
    ##  6 Portugal                      577.             483408.            838
    ##  7 France                        545.             463587.            851
    ##  8 Belgium                       479.             406154.            848
    ##  9 Australia                     447.             375894.            841
    ## 10 Czech Republic                447.             375405.            840
    ## 11 South Korea                   440.             379148.            861
    ## 12 United Kingdom                429.             364049.            849
    ## 13 Germany                       404.             344500.            853
    ## 14 Greece                        396.             332819.            840
    ## 15 Slovakia                      395.             329242.            834
    ## 16 Italy                         356.             305581.            858
    ## 17 Norway                        341.             288736.            847
    ## 18 Serbia                        332.             276178.            833
    ## 19 United States                 328.             278150.            849
    ## 20 Spain                         322.             273815.            850

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.91       4951    62624
    ##  3 Peru                 5.90     213483  3620801
    ##  4 Syria                5.63       3150    55926
    ##  5 Mexico               5.44     325638  5986917
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24723   514088
    ##  8 Afghanistan          4.23       7722   182430
    ##  9 Ecuador              3.94      35720   906740
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37251  1171767
    ## 12 Myanmar              3.17      19434   613596
    ## 13 Malawi               3.06       2645    86410
    ## 14 Paraguay             2.89      18963   655532
    ## 15 Tunisia              2.73      28691  1052180
    ## 16 Haiti                2.65        837    31550
    ## 17 Chad                 2.60        193     7425
    ## 18 Algeria              2.58       6875   266062
    ## 19 Indonesia            2.57     156737  6088460
    ## 20 Honduras             2.55      10905   426879

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7138.     213483   29.9 
    ##  2 Bulgaria               5211.      37251    7.15
    ##  3 Hungary                4673.      46647    9.98
    ##  4 Czech Republic         3848.      40316   10.5 
    ##  5 Slovakia               3693.      20147    5.46
    ##  6 Chile                  3491.      58467   16.7 
    ##  7 Brazil                 3336.     670848  201.  
    ##  8 United States          3246.    1007061  310.  
    ##  9 Argentina              3122.     129070   41.3 
    ## 10 Belgium                3067.      31903   10.4 
    ## 11 Poland                 3024      116424   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2974.      18963    6.38
    ## 14 Colombia               2929.     139970   47.8 
    ## 15 Mexico                 2895.     325638  112.  
    ## 16 United Kingdom         2891.     180245   62.3 
    ## 17 Italy                  2789.     168294   60.3 
    ## 18 Greece                 2747.      30218   11   
    ## 19 Tunisia                2710.      28691   10.6 
    ## 20 Russia                 2709.     381112  141.

EOL
