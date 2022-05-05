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

Updated: 2022-05-06

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
    ##  1 United States          101839. 80758644            793
    ##  2 India                   55104. 43091393            782
    ##  3 Brazil                  39030. 30482429            781
    ##  4 France                  35182. 27969820            795
    ##  5 Germany                 31531. 25130137            797
    ##  6 United Kingdom          27857. 22090527            793
    ##  7 Russia                  23407. 18211178            778
    ##  8 South Korea             21662. 17438068            805
    ##  9 Italy                   20740. 16633911            802
    ## 10 Turkey                  19328. 15037242            778
    ## 11 Spain                   15055. 11953481            794
    ## 12 Vietnam                 13776. 10662446            774
    ## 13 Argentina               11586.  9083673            784
    ## 14 Netherlands             10209.  8054728            789
    ## 15 Japan                    9924.  7978912            804
    ## 16 Iran                     9030.  7223828            800
    ## 17 Colombia                 7841.  6092667            777
    ## 18 Indonesia                7734.  6047741            782
    ## 19 Australia                7731.  6069037            785
    ## 20 Poland                   7671.  5998909            782

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       723.             568939.            787
    ##  2 Israel                        708.             555538.            785
    ##  3 Austria                       651.             512390.            787
    ##  4 Netherlands                   613.             483913.            789
    ##  5 Switzerland                   602.             477383.            793
    ##  6 France                        543.             431844.            795
    ##  7 Belgium                       494.             391356.            792
    ##  8 Czech Republic                476.             373271.            784
    ##  9 Portugal                      467.             365882.            783
    ## 10 South Korea                   447.             360122.            805
    ## 11 United Kingdom                447.             354308.            793
    ## 12 Slovakia                      420.             327022.            778
    ## 13 Greece                        388.             303960.            784
    ## 14 Germany                       385.             307206.            797
    ## 15 Norway                        360.             284908.            792
    ## 16 Australia                     359.             282074.            785
    ## 17 Serbia                        352.             273408.            777
    ## 18 Italy                         344.             275668.            802
    ## 19 Jordan                        342.             264702.            774
    ## 20 Sweden                        332.             261715.            789

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4933    62135
    ##  3 Peru                  5.97     212877  3567171
    ##  4 Mexico                5.65     324334  5739680
    ##  5 Syria                 5.64       3150    55833
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24641   513790
    ##  8 Afghanistan           4.30       7684   178905
    ##  9 Ecuador               4.09      35598   869903
    ## 10 Niger                 3.45        309     8954
    ## 11 Bulgaria              3.19      36953  1158354
    ## 12 Myanmar               3.17      19434   612965
    ## 13 Malawi                3.07       2634    85795
    ## 14 Paraguay              2.91      18870   649455
    ## 15 Tunisia               2.74      28566  1040712
    ## 16 Haiti                 2.72        835    30703
    ## 17 South Africa          2.64     100407  3808368
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265782
    ## 20 Indonesia             2.59     156340  6047741

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7118.     212877   29.9 
    ##  2 Bulgaria               5169.      36953    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3837.      40194   10.5 
    ##  5 Slovakia               3658.      19952    5.46
    ##  6 Chile                  3438.      57580   16.7 
    ##  7 Brazil                 3300.     663694  201.  
    ##  8 United States          3187.     988595  310.  
    ##  9 Argentina              3112.     128653   41.3 
    ## 10 Belgium                3027.      31494   10.4 
    ## 11 Poland                 3016.     116099   38.5 
    ## 12 Romania                2984.      65519   22.0 
    ## 13 Paraguay               2960.      18870    6.38
    ## 14 Colombia               2925.     139797   47.8 
    ## 15 Mexico                 2884.     324334  112.  
    ## 16 United Kingdom         2816.     175546   62.3 
    ## 17 Italy                  2719.     164041   60.3 
    ## 18 Tunisia                2698.      28566   10.6 
    ## 19 Russia                 2676.     376560  141.  
    ## 20 Greece                 2662.      29284   11

EOL
