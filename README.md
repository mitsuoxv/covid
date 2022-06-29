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

Updated: 2022-06-30

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
    ##  1 United States          101555. 86118591            848
    ##  2 India                   51892. 43433345            837
    ##  3 Brazil                  38433. 32130316            836
    ##  4 France                  35178. 29901085            850
    ##  5 Germany                 32920. 28048190            852
    ##  6 United Kingdom          26724. 22661994            848
    ##  7 Russia                  22121. 18427133            833
    ##  8 Italy                   21404. 18343422            857
    ##  9 South Korea             21337. 18349756            860
    ## 10 Turkey                  18123. 15096696            833
    ## 11 Spain                   14999. 12734038            849
    ## 12 Vietnam                 12961. 10744854            829
    ## 13 Argentina               11165.  9367172            839
    ## 14 Japan                   10807.  9283083            859
    ## 15 Netherlands              9682.  8171396            844
    ## 16 Australia                9587.  8053002            840
    ## 17 Iran                     8464.  7237156            855
    ## 18 Colombia                 7393.  6151354            832
    ## 19 Indonesia                7271.  6086212            837
    ## 20 Poland                   7186.  6014404            837

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        701.             589140.            840
    ##  2 Denmark                       686.             577547.            842
    ##  3 Austria                       644.             542020.            842
    ##  4 Switzerland                   582.             493586.            848
    ##  5 Netherlands                   582.             490922.            844
    ##  6 Portugal                      576.             482429.            837
    ##  7 France                        543.             461662.            850
    ##  8 Belgium                       480.             406154.            847
    ##  9 Czech Republic                447.             375294.            839
    ## 10 Australia                     446.             374284.            840
    ## 11 South Korea                   441.             378950.            860
    ## 12 United Kingdom                429.             363473.            848
    ## 13 Germany                       402.             342878.            852
    ## 14 Slovakia                      395.             329129.            833
    ## 15 Greece                        395.             331354.            839
    ## 16 Italy                         355.             303999.            857
    ## 17 Norway                        341.             288479.            846
    ## 18 Serbia                        332.             276058.            832
    ## 19 United States                 327.             277593.            848
    ## 20 Spain                         323.             273815.            849

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.91       4951    62624
    ##  3 Peru                 5.90     213475  3617629
    ##  4 Syria                5.63       3150    55925
    ##  5 Mexico               5.46     325596  5965958
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24723   514088
    ##  8 Afghanistan          4.23       7722   182352
    ##  9 Ecuador              3.96      35705   901739
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37249  1171235
    ## 12 Myanmar              3.17      19434   613583
    ## 13 Malawi               3.06       2645    86410
    ## 14 Paraguay             2.89      18963   655532
    ## 15 Tunisia              2.73      28691  1052180
    ## 16 Haiti                2.67        837    31301
    ## 17 Chad                 2.60        193     7425
    ## 18 Algeria              2.58       6875   266049
    ## 19 Indonesia            2.58     156731  6086212
    ## 20 Honduras             2.55      10905   426879

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7138.     213475   29.9 
    ##  2 Bulgaria               5211.      37249    7.15
    ##  3 Hungary                4673.      46647    9.98
    ##  4 Czech Republic         3848.      40316   10.5 
    ##  5 Slovakia               3693.      20146    5.46
    ##  6 Chile                  3491.      58459   16.7 
    ##  7 Brazil                 3334.     670532  201.  
    ##  8 United States          3244.    1006416  310.  
    ##  9 Argentina              3122.     129070   41.3 
    ## 10 Belgium                3067.      31903   10.4 
    ## 11 Poland                 3024      116424   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2974.      18963    6.38
    ## 14 Colombia               2929.     139970   47.8 
    ## 15 Mexico                 2895.     325596  112.  
    ## 16 United Kingdom         2889.     180128   62.3 
    ## 17 Italy                  2788.     168234   60.3 
    ## 18 Greece                 2746       30206   11   
    ## 19 Tunisia                2710.      28691   10.6 
    ## 20 Russia                 2708.     381056  141.

EOL
