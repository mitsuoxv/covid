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

Updated: 2022-05-04

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
    ##  1 United States          101895. 80598784            791
    ##  2 India                   55237. 43084913            780
    ##  3 Brazil                  39094. 30454499            779
    ##  4 France                  35140. 27865809            793
    ##  5 Germany                 31355  24927339            795
    ##  6 United Kingdom          27861. 22038344            791
    ##  7 Russia                  23455. 18201074            776
    ##  8 South Korea             21602. 17346753            803
    ##  9 Italy                   20655. 16523859            800
    ## 10 Turkey                  19375. 15034917            776
    ## 11 Spain                   15020. 11896152            792
    ## 12 Vietnam                 13804. 10656649            772
    ## 13 Argentina               11616.  9083673            782
    ## 14 Netherlands             10230.  8051301            787
    ## 15 Japan                    9882.  7925130            802
    ## 16 Iran                     9050.  7221653            798
    ## 17 Colombia                 7861.  6092667            775
    ## 18 Indonesia                7753.  6047315            780
    ## 19 Poland                   7689.  5997825            780
    ## 20 Australia                7417.  5807319            783

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       724.             568582.            785
    ##  2 Israel                        709.             555006.            783
    ##  3 Austria                       651.             511029.            785
    ##  4 Netherlands                   615.             483707.            787
    ##  5 Switzerland                   601.             475201.            791
    ##  6 France                        543.             430238.            793
    ##  7 Belgium                       495.             391356.            790
    ##  8 Czech Republic                477.             373023.            782
    ##  9 Portugal                      465.             363331.            781
    ## 10 United Kingdom                447.             353471.            791
    ## 11 South Korea                   446.             358236.            803
    ## 12 Slovakia                      421.             326784.            776
    ## 13 Greece                        387.             302844.            782
    ## 14 Germany                       383.             304727.            795
    ## 15 Norway                        361.             284704.            789
    ## 16 Serbia                        353.             273265.            775
    ## 17 Australia                     345.             269910.            783
    ## 18 Jordan                        343.             264667.            772
    ## 19 Italy                         342.             273844.            800
    ## 20 Sweden                        333.             261715.            787

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4931    62117
    ##  3 Peru                  5.97     212841  3565839
    ##  4 Mexico                5.65     324350  5740080
    ##  5 Syria                 5.64       3150    55816
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.79      24606   513468
    ##  8 Afghanistan           4.30       7683   178879
    ##  9 Ecuador               4.09      35598   869696
    ## 10 Niger                 3.46        309     8924
    ## 11 Bulgaria              3.19      36920  1157199
    ## 12 Myanmar               3.17      19434   612914
    ## 13 Malawi                3.07       2634    85788
    ## 14 Paraguay              2.91      18870   649455
    ## 15 Tunisia               2.74      28550  1040193
    ## 16 Haiti                 2.72        835    30697
    ## 17 South Africa          2.64     100370  3798413
    ## 18 Chad                  2.60        193     7412
    ## 19 Algeria               2.59       6875   265782
    ## 20 Indonesia             2.58     156305  6047315

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7117.     212841   29.9 
    ##  2 Bulgaria               5165.      36920    7.15
    ##  3 Hungary                4635.      46266    9.98
    ##  4 Czech Republic         3835.      40175   10.5 
    ##  5 Slovakia               3655.      19938    5.46
    ##  6 Chile                  3436.      57541   16.7 
    ##  7 Brazil                 3299.     663513  201.  
    ##  8 United States          3180.     986437  310.  
    ##  9 Argentina              3112.     128653   41.3 
    ## 10 Belgium                3027.      31494   10.4 
    ## 11 Poland                 3015.     116069   38.5 
    ## 12 Romania                2983.      65496   22.0 
    ## 13 Paraguay               2960.      18870    6.38
    ## 14 Colombia               2925.     139797   47.8 
    ## 15 Mexico                 2884.     324350  112.  
    ## 16 United Kingdom         2805.     174912   62.3 
    ## 17 Italy                  2714.     163736   60.3 
    ## 18 Tunisia                2696.      28550   10.6 
    ## 19 Russia                 2674.     376292  141.  
    ## 20 Greece                 2655       29205   11

EOL
