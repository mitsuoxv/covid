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

Updated: 2022-03-18

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
    ##  1 United States          106037. 78891488            744
    ##  2 India                   58665. 43001477            733
    ##  3 Brazil                  40098. 29432157            734
    ##  4 France                  30892. 23045477            746
    ##  5 United Kingdom          26762. 19911159            744
    ##  6 Germany                 24083. 17990141            747
    ##  7 Russia                  23984. 17484257            729
    ##  8 Turkey                  20058. 14622137            729
    ##  9 Italy                   18012. 13563466            753
    ## 10 Spain                   15140. 11279099            745
    ## 11 Argentina               12343.  8985836            728
    ## 12 South Korea             10913.  8250592            756
    ## 13 Netherlands              9901.  7327235            740
    ## 14 Iran                     9498.  7133139            751
    ## 15 Vietnam                  9407.  6820458            725
    ## 16 Colombia                 8337.  6077861            729
    ## 17 Indonesia                8102.  5939082            733
    ## 18 Poland                   7999.  5863414            733
    ## 19 Japan                    7830.  5911813            755
    ## 20 Mexico                   7638.  5613870            735

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       736.             543040.            738
    ##  2 Israel                        691.             508585.            736
    ##  3 Netherlands                   595.             440206.            740
    ##  4 Switzerland                   566.             421073.            744
    ##  5 Austria                       548.             404717.            738
    ##  6 Czech Republic                483.             354733.            735
    ##  7 France                        477.             355814.            746
    ##  8 Belgium                       477.             354108.            743
    ##  9 Portugal                      436.             319690.            734
    ## 10 United Kingdom                429.             319353.            744
    ## 11 Slovakia                      404.             294898.            729
    ## 12 Norway                        367.             272183.            742
    ## 13 Serbia                        364.             265164.            728
    ## 14 Jordan                        362.             262238.            725
    ## 15 Sweden                        350.             258696.            740
    ## 16 United States                 342.             254298.            744
    ## 17 Greece                        335.             246237.            735
    ## 18 Spain                         326.             242530.            745
    ## 19 Argentina                     299.             217347.            728
    ## 20 Italy                         299.             224783.            753

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2140    11797
    ##  2 Sudan                 7.91       4888    61775
    ##  3 Peru                  5.98     211619  3537488
    ##  4 Mexico                5.72     321375  5613870
    ##  5 Syria                 5.63       3120    55460
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.90      24277   495373
    ##  8 Afghanistan           4.33       7651   176743
    ##  9 Ecuador               4.16      35348   849699
    ## 10 Niger                 3.51        308     8786
    ## 11 Bulgaria              3.24      36222  1119474
    ## 12 Myanmar               3.20      19417   607399
    ## 13 Malawi                3.07       2624    85526
    ## 14 Paraguay              2.87      18552   646283
    ## 15 Tunisia               2.73      28065  1029762
    ## 16 Haiti                 2.71        827    30478
    ## 17 South Africa          2.70      99767  3698803
    ## 18 El Salvador           2.62       4104   156364
    ## 19 Chad                  2.61        190     7269
    ## 20 Honduras              2.60      10842   417201

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7076.     211619   29.9 
    ##  2 Bulgaria               5067.      36222    7.15
    ##  3 Hungary                4498.      44895    9.98
    ##  4 Czech Republic         3749.      39271   10.5 
    ##  5 Slovakia               3490.      19040    5.46
    ##  6 Brazil                 3260.     655585  201.  
    ##  7 United States          3095.     960194  310.  
    ##  8 Argentina              3080.     127334   41.3 
    ##  9 Poland                 2961.     113980   38.5 
    ## 10 Romania                2938.      64518   22.0 
    ## 11 Belgium                2931.      30492   10.4 
    ## 12 Colombia               2916.     139335   47.8 
    ## 13 Paraguay               2910.      18552    6.38
    ## 14 Mexico                 2857.     321375  112.  
    ## 15 Tunisia                2650.      28065   10.6 
    ## 16 Chile                  2631.      44062   16.7 
    ## 17 United Kingdom         2618.     163248   62.3 
    ## 18 Italy                  2607.     157314   60.3 
    ## 19 Russia                 2580.     363039  141.  
    ## 20 Greece                 2430       26730   11

EOL
