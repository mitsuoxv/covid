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

Updated: 2022-05-03

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
    ##  1 United States          101968. 80554757            790
    ##  2 India                   55305. 43082345            779
    ##  3 Brazil                  39136. 30448236            778
    ##  4 France                  35176. 27859566            792
    ##  5 Germany                 31252. 24813817            794
    ##  6 United Kingdom          27896. 22038344            790
    ##  7 Russia                  23478. 18195608            775
    ##  8 South Korea             21566. 17295733            802
    ##  9 Italy                   20657. 16504791            799
    ## 10 Turkey                  19398. 15033573            775
    ## 11 Spain                   15039. 11896152            791
    ## 12 Vietnam                 13818. 10653526            771
    ## 13 Argentina               11631.  9083673            781
    ## 14 Netherlands             10238.  8047132            786
    ## 15 Japan                    9865.  7901933            801
    ## 16 Iran                     9061.  7221653            797
    ## 17 Colombia                 7872.  6092667            774
    ## 18 Indonesia                7763.  6047208            779
    ## 19 Poland                   7698.  5996935            779
    ## 20 Australia                7364.  5758854            782

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       725.             568440.            784
    ##  2 Israel                        709.             554702.            782
    ##  3 Austria                       651.             510537.            784
    ##  4 Netherlands                   615.             483456.            786
    ##  5 Switzerland                   602.             475201.            790
    ##  6 France                        543.             430141.            792
    ##  7 Belgium                       494.             389931.            789
    ##  8 Czech Republic                477.             372862.            781
    ##  9 Portugal                      463.             360978.            780
    ## 10 United Kingdom                447.             353471.            790
    ## 11 South Korea                   445.             357183.            802
    ## 12 Slovakia                      421.             326644.            775
    ## 13 Greece                        387.             302602.            781
    ## 14 Germany                       382.             303339.            794
    ## 15 Norway                        361.             284572.            788
    ## 16 Serbia                        353.             273211.            774
    ## 17 Jordan                        343.             264667.            771
    ## 18 Italy                         342.             273528.            799
    ## 19 Australia                     342.             267658.            782
    ## 20 Sweden                        333.             261715.            786

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4931    62117
    ##  3 Peru                  5.97     212824  3565253
    ##  4 Mexico                5.65     324334  5739680
    ##  5 Syria                 5.64       3150    55816
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.79      24606   513468
    ##  8 Afghanistan           4.30       7683   178879
    ##  9 Ecuador               4.09      35588   869124
    ## 10 Niger                 3.46        309     8924
    ## 11 Bulgaria              3.19      36918  1156971
    ## 12 Myanmar               3.17      19434   612900
    ## 13 Malawi                3.07       2634    85788
    ## 14 Paraguay              2.91      18870   649455
    ## 15 Tunisia               2.74      28550  1040193
    ## 16 Haiti                 2.72        835    30655
    ## 17 South Africa          2.66     100351  3776298
    ## 18 Chad                  2.60        193     7411
    ## 19 Algeria               2.59       6875   265782
    ## 20 Indonesia             2.58     156287  6047208

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7116.     212824   29.9 
    ##  2 Bulgaria               5164.      36918    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3834.      40164   10.5 
    ##  5 Slovakia               3654.      19931    5.46
    ##  6 Chile                  3436.      57539   16.7 
    ##  7 Brazil                 3299.     663497  201.  
    ##  8 United States          3179.     986298  310.  
    ##  9 Argentina              3112.     128653   41.3 
    ## 10 Belgium                3022.      31439   10.4 
    ## 11 Poland                 3015.     116059   38.5 
    ## 12 Romania                2982.      65493   22.0 
    ## 13 Paraguay               2960.      18870    6.38
    ## 14 Colombia               2925.     139797   47.8 
    ## 15 Mexico                 2884.     324334  112.  
    ## 16 United Kingdom         2805.     174912   62.3 
    ## 17 Italy                  2711.     163612   60.3 
    ## 18 Tunisia                2696.      28550   10.6 
    ## 19 Russia                 2674.     376167  141.  
    ## 20 Greece                 2652.      29175   11

EOL
