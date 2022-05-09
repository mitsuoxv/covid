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

Updated: 2022-05-10

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
    ##  1 United States          101658. 81021753            797
    ##  2 India                   54841. 43105401            786
    ##  3 Brazil                  38928. 30558530            785
    ##  4 France                  35190. 28116842            799
    ##  5 Germany                 31585. 25299300            801
    ##  6 United Kingdom          27746. 22114038            797
    ##  7 Russia                  23315. 18232696            782
    ##  8 South Korea             21712. 17564999            809
    ##  9 Italy                   20842. 16798998            806
    ## 10 Turkey                  19237. 15043379            782
    ## 11 Spain                   15049. 12009059            798
    ## 12 Vietnam                 13722. 10676184            778
    ## 13 Argentina               11550.  9101319            788
    ## 14 Netherlands             10161.  8057700            793
    ## 15 Japan                   10024.  8099533            808
    ## 16 Iran                     8986.  7225189            804
    ## 17 Australia                7814.  6165105            789
    ## 18 Colombia                 7802.  6093645            781
    ## 19 Indonesia                7695.  6048431            786
    ## 20 Poland                   7634.  6000600            786

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       720.             569532.            791
    ##  2 Israel                        706.             556701.            789
    ##  3 Austria                       651.             514681.            791
    ##  4 Netherlands                   610.             484091.            793
    ##  5 Switzerland                   599.             477383.            797
    ##  6 France                        543.             434114.            799
    ##  7 Belgium                       494.             392996.            796
    ##  8 Czech Republic                474.             373471.            788
    ##  9 Portugal                      468.             368671.            787
    ## 10 South Korea                   448.             362743.            809
    ## 11 United Kingdom                445.             354685.            797
    ## 12 Slovakia                      418.             327257.            782
    ## 13 Greece                        388.             305616.            788
    ## 14 Germany                       386.             309274.            801
    ## 15 Australia                     363.             286539.            789
    ## 16 Norway                        358.             284975.            796
    ## 17 Serbia                        350.             273658.            781
    ## 18 Italy                         345.             278404.            806
    ## 19 Jordan                        340.             264702.            778
    ## 20 Sweden                        330.             261942.            793

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4935    62149
    ##  3 Peru                  5.97     212933  3569326
    ##  4 Mexico                5.65     324334  5739680
    ##  5 Syria                 5.64       3150    55847
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.80      24669   513846
    ##  8 Afghanistan           4.29       7684   178981
    ##  9 Ecuador               4.09      35598   870238
    ## 10 Niger                 3.44        309     8986
    ## 11 Bulgaria              3.19      36973  1159301
    ## 12 Myanmar               3.17      19434   613053
    ## 13 Malawi                3.07       2634    85811
    ## 14 Paraguay              2.90      18872   649718
    ## 15 Tunisia               2.74      28566  1040712
    ## 16 Haiti                 2.72        835    30703
    ## 17 South Africa          2.62     100523  3841388
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265798
    ## 20 Indonesia             2.59     156381  6048431

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7120.     212933   29.9 
    ##  2 Bulgaria               5172.      36973    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3839.      40220   10.5 
    ##  5 Slovakia               3663.      19984    5.46
    ##  6 Chile                  3442.      57637   16.7 
    ##  7 Brazil                 3302.     664126  201.  
    ##  8 United States          3192.     990260  310.  
    ##  9 Argentina              3114.     128729   41.3 
    ## 10 Belgium                3033.      31552   10.4 
    ## 11 Poland                 3017.     116138   38.5 
    ## 12 Romania                2986.      65562   22.0 
    ## 13 Paraguay               2960.      18872    6.38
    ## 14 Colombia               2925.     139809   47.8 
    ## 15 Mexico                 2884.     324334  112.  
    ## 16 United Kingdom         2826.     176212   62.3 
    ## 17 Italy                  2726.     164489   60.3 
    ## 18 Tunisia                2698.      28566   10.6 
    ## 19 Russia                 2680.     377049  141.  
    ## 20 Greece                 2672       29392   11

EOL
