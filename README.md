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

Updated: 2022-03-05

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
    ##  1 United States          107290. 78428884            731
    ##  2 India                   59655. 42951556            720
    ##  3 Brazil                  40003. 28842160            721
    ##  4 France                  30325. 22228657            733
    ##  5 United Kingdom          26094. 19074700            731
    ##  6 Russia                  23429. 16775024            716
    ##  7 Germany                 21092. 15481890            734
    ##  8 Turkey                  19908. 14254654            716
    ##  9 Italy                   17446. 12910506            740
    ## 10 Spain                   15134. 11078028            732
    ## 11 Argentina               12477.  8921536            715
    ## 12 Iran                     9585.  7073747            738
    ## 13 Netherlands              8947.  6504886            727
    ## 14 Colombia                 8473.  6067023            716
    ## 15 Poland                   7946.  5721316            720
    ## 16 Indonesia                7908.  5693702            720
    ## 17 Mexico                   7665.  5534086            722
    ## 18 Japan                    7022.  5210263            742
    ## 19 Ukraine                  6848.  4862459            710
    ## 20 Vietnam                  5457.  3885631            712

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       705.             511280.            725
    ##  2 Israel                        688.             497588.            723
    ##  3 Netherlands                   538.             390801.            727
    ##  4 Switzerland                   515.             376317.            731
    ##  5 Czech Republic                478.             345231.            722
    ##  6 Belgium                       471.             344010.            730
    ##  7 Austria                       470.             341081.            725
    ##  8 France                        468.             343202.            733
    ##  9 Portugal                      428.             308607.            721
    ## 10 United Kingdom                419.             305937.            731
    ## 11 Slovakia                      382.             273764.            716
    ## 12 Serbia                        365.             261316.            715
    ## 13 Jordan                        359.             255690.            712
    ## 14 Sweden                        353.             256798.            727
    ## 15 Norway                        352.             256809.            729
    ## 16 United States                 346.             252806.            731
    ## 17 Spain                         325.             238207.            732
    ## 18 Greece                        311.             224565.            722
    ## 19 Argentina                     302.             215792.            715
    ## 20 Italy                         289.             213961.            740

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2135    11771
    ##  2 Sudan                 6.35       3912    61569
    ##  3 Peru                  5.99     210851  3520604
    ##  4 Mexico                5.76     318835  5534086
    ##  5 Syria                 5.63       3082    54744
    ##  6 Somalia               5.12       1348    26351
    ##  7 Egypt                 4.96      24132   486381
    ##  8 Afghanistan           4.37       7619   174214
    ##  9 Ecuador               4.23      35249   833291
    ## 10 Niger                 3.50        307     8760
    ## 11 Myanmar               3.26      19379   593958
    ## 12 Bulgaria              3.25      35716  1097298
    ## 13 Malawi                3.07       2617    85383
    ## 14 Paraguay              2.87      18422   642573
    ## 15 Tunisia               2.78      27857  1000518
    ## 16 South Africa          2.70      99499  3679539
    ## 17 Haiti                 2.70        820    30375
    ## 18 Indonesia             2.63     149596  5693702
    ## 19 Chad                  2.62        190     7257
    ## 20 El Salvador           2.61       4081   156364

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7050.     210851   29.9 
    ##  2 Bulgaria               4996.      35716    7.15
    ##  3 Hungary                4437.      44286    9.98
    ##  4 Czech Republic         3707.      38837   10.5 
    ##  5 Slovakia               3415.      18631    5.46
    ##  6 Brazil                 3232.     650000  201.  
    ##  7 Argentina              3061.     126531   41.3 
    ##  8 United States          3055.     947625  310.  
    ##  9 Poland                 2918.     112336   38.5 
    ## 10 Belgium                2907.      30244   10.4 
    ## 11 Colombia               2906.     138899   47.8 
    ## 12 Romania                2905.      63782   22.0 
    ## 13 Paraguay               2889.      18422    6.38
    ## 14 Mexico                 2835.     318835  112.  
    ## 15 Tunisia                2631.      27857   10.6 
    ## 16 United Kingdom         2597.     161898   62.3 
    ## 17 Italy                  2575.     155399   60.3 
    ## 18 Chile                  2549.      42683   16.7 
    ## 19 Russia                 2522.     354787  141.  
    ## 20 Ecuador                2383.      35249   14.8

EOL
