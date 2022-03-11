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

Updated: 2022-03-12

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
    ##  1 United States          106635. 78697006            738
    ##  2 India                   59125. 42984261            727
    ##  3 Brazil                  40100. 29193268            728
    ##  4 France                  30561. 22614907            740
    ##  5 United Kingdom          26366. 19457980            738
    ##  6 Russia                  23848. 17242043            723
    ##  7 Germany                 22615. 16757658            741
    ##  8 Turkey                  20038. 14487482            723
    ##  9 Italy                   17690. 13214498            747
    ## 10 Spain                   15161. 11204125            739
    ## 11 Argentina               12412.  8961595            722
    ## 12 Iran                     9548.  7113591            745
    ## 13 Netherlands              9518.  6986628            734
    ## 14 Colombia                 8401.  6074155            723
    ## 15 Indonesia                8066.  5864010            727
    ## 16 Poland                   7978.  5799996            727
    ## 17 South Korea              7763.  5822626            750
    ## 18 Mexico                   7659.  5583773            729
    ## 19 Japan                    7489.  5609096            749
    ## 20 Vietnam                  7316.  5260495            719

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       728.             533011.            732
    ##  2 Israel                        690.             503811.            730
    ##  3 Netherlands                   572.             419743.            734
    ##  4 Switzerland                   541.             399280.            738
    ##  5 Austria                       508.             371806.            732
    ##  6 Czech Republic                481.             350361.            729
    ##  7 Belgium                       473.             348906.            737
    ##  8 France                        472.             349166.            740
    ##  9 Portugal                      435.             316623.            728
    ## 10 United Kingdom                423.             312084.            738
    ## 11 Slovakia                      395.             285322.            723
    ## 12 Serbia                        365.             263444.            722
    ## 13 Norway                        363.             267742.            737
    ## 14 Jordan                        359.             258257.            719
    ## 15 Sweden                        351.             257966.            734
    ## 16 United States                 344.             253671.            738
    ## 17 Spain                         326.             240918.            739
    ## 18 Greece                        322.             234851.            729
    ## 19 Argentina                     300.             216761.            722
    ## 20 Italy                         293.             218999.            747

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2139    11783
    ##  2 Sudan                 7.89       4865    61655
    ##  3 Peru                  5.99     211301  3530004
    ##  4 Mexico                5.74     320410  5583773
    ##  5 Syria                 5.63       3105    55193
    ##  6 Somalia               5.15       1359    26400
    ##  7 Egypt                 4.91      24257   493658
    ##  8 Afghanistan           4.35       7636   175525
    ##  9 Ecuador               4.19      35316   843760
    ## 10 Niger                 3.50        307     8774
    ## 11 Bulgaria              3.25      36028  1109581
    ## 12 Myanmar               3.21      19403   604219
    ## 13 Malawi                3.07       2620    85476
    ## 14 Paraguay              2.87      18510   645020
    ## 15 Tunisia               2.75      28009  1018447
    ## 16 Haiti                 2.72        827    30433
    ## 17 South Africa          2.70      99681  3690291
    ## 18 El Salvador           2.62       4093   156364
    ## 19 Chad                  2.62        190     7260
    ## 20 Honduras              2.61      10812   414714

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7065.     211301   29.9 
    ##  2 Bulgaria               5040.      36028    7.15
    ##  3 Hungary                4473.      44653    9.98
    ##  4 Czech Republic         3732.      39100   10.5 
    ##  5 Slovakia               3455.      18847    5.46
    ##  6 Brazil                 3250.     653498  201.  
    ##  7 United States          3085.     956994  310.  
    ##  8 Argentina              3072.     127009   41.3 
    ##  9 Poland                 2943.     113307   38.5 
    ## 10 Romania                2925.      64226   22.0 
    ## 11 Belgium                2920.      30380   10.4 
    ## 12 Colombia               2913.     139189   47.8 
    ## 13 Paraguay               2903.      18510    6.38
    ## 14 Mexico                 2849.     320410  112.  
    ## 15 Tunisia                2645.      28009   10.6 
    ## 16 United Kingdom         2608.     162624   62.3 
    ## 17 Chile                  2599.      43527   16.7 
    ## 18 Italy                  2594.     156493   60.3 
    ## 19 Russia                 2556.     359585  141.  
    ## 20 Greece                 2402.      26424   11

EOL
