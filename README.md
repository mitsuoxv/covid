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

Updated: 2022-05-24

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
    ##  1 United States          101255. 82117634            811
    ##  2 India                   53923. 43138393            800
    ##  3 Brazil                  38475. 30741811            799
    ##  4 France                  35042. 28489165            813
    ##  5 Germany                 31958. 26045528            815
    ##  6 United Kingdom          27416. 22234804            811
    ##  7 Russia                  22987. 18297608            796
    ##  8 South Korea             21832. 17967672            823
    ##  9 Italy                   21033. 17247552            820
    ## 10 Turkey                  18924. 15063298            796
    ## 11 Spain                   15071. 12238073            812
    ## 12 Vietnam                 13521. 10708887            792
    ## 13 Argentina               11391.  9135308            802
    ## 14 Japan                   10485.  8618683            822
    ## 15 Netherlands             10006.  8075194            807
    ## 16 Iran                     8839.  7230053            818
    ## 17 Australia                8540.  6857879            803
    ## 18 Colombia                 7667.  6095316            795
    ## 19 Indonesia                7566.  6052764            800
    ## 20 Poland                   7507.  6005596            800

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       709.             570925.            805
    ##  2 Israel                        698.             560718.            803
    ##  3 Austria                       647.             520888.            805
    ##  4 Netherlands                   601.             485142.            807
    ##  5 Switzerland                   592.             480491.            811
    ##  6 France                        541.             439862.            813
    ##  7 Portugal                      521.             417131.            800
    ##  8 Belgium                       491.             397414.            810
    ##  9 Czech Republic                466.             374010.            802
    ## 10 South Korea                   451.             371059.            823
    ## 11 United Kingdom                440.             356622.            811
    ## 12 Slovakia                      412.             327863.            796
    ## 13 Australia                     397.             318738.            803
    ## 14 Germany                       391.             318396.            815
    ## 15 Greece                        388.             310909.            802
    ## 16 Norway                        353.             285645.            809
    ## 17 Italy                         349.             285838.            820
    ## 18 Serbia                        345.             274354.            795
    ## 19 Jordan                        334.             264811.            792
    ## 20 United States                 326.             264697.            811

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4939    62229
    ##  3 Peru                  5.96     213069  3573738
    ##  4 Mexico                5.64     324617  5752441
    ##  5 Syria                 5.64       3150    55879
    ##  6 Somalia               5.13       1361    26521
    ##  7 Egypt                 4.81      24704   513916
    ##  8 Afghanistan           4.28       7698   179716
    ##  9 Ecuador               4.08      35610   872836
    ## 10 Niger                 3.43        310     9031
    ## 11 Bulgaria              3.19      37093  1163413
    ## 12 Myanmar               3.17      19434   613222
    ## 13 Malawi                3.07       2637    85909
    ## 14 Paraguay              2.91      18881   649929
    ## 15 Tunisia               2.75      28628  1041789
    ## 16 Haiti                 2.72        835    30725
    ## 17 Chad                  2.60        193     7415
    ## 18 Indonesia             2.59     156534  6052764
    ## 19 Algeria               2.59       6875   265851
    ## 20 South Africa          2.57     100931  3926652

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7124.     213069   29.9 
    ##  2 Bulgaria               5189.      37093    7.15
    ##  3 Hungary                4653.      46446    9.98
    ##  4 Czech Republic         3844.      40266   10.5 
    ##  5 Slovakia               3681.      20081    5.46
    ##  6 Chile                  3449.      57767   16.7 
    ##  7 Brazil                 3308.     665319  201.  
    ##  8 United States          3203.     993691  310.  
    ##  9 Argentina              3115.     128776   41.3 
    ## 10 Belgium                3045.      31675   10.4 
    ## 11 Poland                 3020.     116268   38.5 
    ## 12 Romania                2990.      65652   22.0 
    ## 13 Paraguay               2961.      18881    6.38
    ## 14 Colombia               2926.     139821   47.8 
    ## 15 Mexico                 2886.     324617  112.  
    ## 16 United Kingdom         2854.     177966   62.3 
    ## 17 Italy                  2750.     165952   60.3 
    ## 18 Tunisia                2704.      28628   10.6 
    ## 19 Greece                 2699.      29690   11   
    ## 20 Russia                 2690.     378426  141.

EOL
