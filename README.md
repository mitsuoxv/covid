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

Updated: 2022-05-07

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
    ##  1 United States          101832. 80854843            794
    ##  2 India                   55038. 43094938            783
    ##  3 Brazil                  39006. 30502501            782
    ##  4 France                  35191. 28012023            796
    ##  5 Germany                 31598. 25215210            798
    ##  6 United Kingdom          27837. 22102987            794
    ##  7 Russia                  23385. 18216719            779
    ##  8 South Korea             21668. 17464782            806
    ##  9 Italy                   20775. 16682626            803
    ## 10 Turkey                  19305. 15038495            779
    ## 11 Spain                   15036. 11953481            795
    ## 12 Vietnam                 13763. 10666751            775
    ## 13 Argentina               11571.  9083673            785
    ## 14 Netherlands             10196.  8054728            790
    ## 15 Japan                    9938.  8000280            805
    ## 16 Iran                     9018.  7223828            801
    ## 17 Colombia                 7831.  6092667            778
    ## 18 Australia                7790.  6122957            786
    ## 19 Indonesia                7724.  6047986            783
    ## 20 Poland                   7662.  5999517            783

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       722.             569098.            788
    ##  2 Israel                        707.             555708.            786
    ##  3 Austria                       651.             513032.            788
    ##  4 Netherlands                   613.             483913.            790
    ##  5 Switzerland                   601.             477383.            794
    ##  6 France                        543.             432495.            796
    ##  7 Belgium                       496.             392996.            793
    ##  8 Czech Republic                476.             373360.            785
    ##  9 Portugal                      468.             367194.            784
    ## 10 South Korea                   447.             360674.            806
    ## 11 United Kingdom                446.             354507.            794
    ## 12 Slovakia                      420.             327115.            779
    ## 13 Greece                        388.             304432.            785
    ## 14 Germany                       386.             308246.            798
    ## 15 Australia                     362.             284580.            786
    ## 16 Norway                        359.             284975.            793
    ## 17 Serbia                        352.             273490.            778
    ## 18 Italy                         344.             276476.            803
    ## 19 Jordan                        342.             264702.            775
    ## 20 Sweden                        332.             261942.            790

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4933    62135
    ##  3 Peru                  5.97     212891  3567863
    ##  4 Mexico                5.65     324334  5739680
    ##  5 Syria                 5.64       3150    55833
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24641   513790
    ##  8 Afghanistan           4.30       7684   178905
    ##  9 Ecuador               4.09      35598   869956
    ## 10 Niger                 3.45        309     8957
    ## 11 Bulgaria              3.19      36965  1158793
    ## 12 Myanmar               3.17      19434   612965
    ## 13 Malawi                3.07       2634    85797
    ## 14 Paraguay              2.91      18870   649455
    ## 15 Tunisia               2.74      28566  1040712
    ## 16 Haiti                 2.72        835    30703
    ## 17 South Africa          2.63     100471  3818125
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265786
    ## 20 Indonesia             2.59     156357  6047986

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7118.     212891   29.9 
    ##  2 Bulgaria               5171.      36965    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3838.      40203   10.5 
    ##  5 Slovakia               3659.      19961    5.46
    ##  6 Chile                  3439.      57597   16.7 
    ##  7 Brazil                 3301.     663759  201.  
    ##  8 United States          3189.     989435  310.  
    ##  9 Argentina              3112.     128653   41.3 
    ## 10 Belgium                3033.      31552   10.4 
    ## 11 Poland                 3016.     116124   38.5 
    ## 12 Romania                2985.      65540   22.0 
    ## 13 Paraguay               2960.      18870    6.38
    ## 14 Colombia               2925.     139797   47.8 
    ## 15 Mexico                 2884.     324334  112.  
    ## 16 United Kingdom         2823.     175984   62.3 
    ## 17 Italy                  2721.     164179   60.3 
    ## 18 Tunisia                2698.      28566   10.6 
    ## 19 Russia                 2677.     376696  141.  
    ## 20 Greece                 2665       29315   11

EOL
