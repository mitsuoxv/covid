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

Updated: 2022-04-14

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
    ##  1 United States          103357. 79688115            771
    ##  2 India                   56629. 43038016            760
    ##  3 Brazil                  39738. 30161205            759
    ##  4 France                  34125. 26379012            773
    ##  5 Germany                 29738. 23017079            774
    ##  6 United Kingdom          28118. 21679284            771
    ##  7 Russia                  23850. 18030579            756
    ##  8 South Korea             20218. 15830644            783
    ##  9 Turkey                  19805. 14972502            756
    ## 10 Italy                   19750. 15404809            780
    ## 11 Spain                   15106. 11662214            772
    ## 12 Vietnam                 13661. 10272964            752
    ## 13 Argentina               11882.  9054126            762
    ## 14 Netherlands             10432.  8001830            767
    ## 15 Iran                     9251.  7197505            778
    ## 16 Japan                    9110.  7124030            782
    ## 17 Colombia                 8064.  6088335            755
    ## 18 Indonesia                7943.  6036909            760
    ## 19 Poland                   7870.  5981486            760
    ## 20 Mexico                   7511.  5723214            762

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       736.             563392.            765
    ##  2 Israel                        715.             545845.            763
    ##  3 Austria                       646.             493964.            765
    ##  4 Netherlands                   627.             480735.            767
    ##  5 Switzerland                   608.             468513.            771
    ##  6 France                        527.             407282.            773
    ##  7 Belgium                       492.             379105.            770
    ##  8 Czech Republic                485.             369657.            762
    ##  9 Portugal                      455.             346349.            761
    ## 10 United Kingdom                451.             347712.            771
    ## 11 Slovakia                      426.             322111.            756
    ## 12 South Korea                   418.             326926.            783
    ## 13 Greece                        381.             290535.            762
    ## 14 Norway                        368.             282824.            769
    ## 15 Germany                       364.             281375.            774
    ## 16 Serbia                        359.             271159.            755
    ## 17 Jordan                        352.             264544.            752
    ## 18 Sweden                        340.             260779.            767
    ## 19 United States                 333.             256865.            771
    ## 20 Italy                         327.             255299.            780

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2147    11814
    ##  2 Sudan                 7.94       4929    62057
    ##  3 Peru                  5.98     212507  3551800
    ##  4 Mexico                5.66     323727  5723214
    ##  5 Syria                 5.64       3147    55750
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.79      24522   511977
    ##  8 Afghanistan           4.31       7676   178295
    ##  9 Ecuador               4.10      35508   865263
    ## 10 Niger                 3.48        308     8846
    ## 11 Bulgaria              3.20      36740  1147165
    ## 12 Myanmar               3.17      19434   612460
    ## 13 Malawi                3.07       2628    85707
    ## 14 Paraguay              2.89      18734   648446
    ## 15 Tunisia               2.74      28509  1038668
    ## 16 Haiti                 2.73        835    30586
    ## 17 South Africa          2.68     100116  3733919
    ## 18 Chad                  2.60        192     7378
    ## 19 Algeria               2.59       6874   265730
    ## 20 Honduras              2.58      10888   421268

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7106.     212507   29.9 
    ##  2 Bulgaria               5139.      36740    7.15
    ##  3 Hungary                4592.      45838    9.98
    ##  4 Czech Republic         3812.      39933   10.5 
    ##  5 Slovakia               3601.      19643    5.46
    ##  6 Chile                  3409.      57094   16.7 
    ##  7 Brazil                 3288.     661327  201.  
    ##  8 United States          3154.     978545  310.  
    ##  9 Argentina              3102.     128233   41.3 
    ## 10 Poland                 3006.     115736   38.5 
    ## 11 Belgium                2988.      31079   10.4 
    ## 12 Romania                2971.      65249   22.0 
    ## 13 Paraguay               2938.      18734    6.38
    ## 14 Colombia               2924.     139725   47.8 
    ## 15 Mexico                 2878.     323727  112.  
    ## 16 United Kingdom         2733.     170395   62.3 
    ## 17 Tunisia                2692.      28509   10.6 
    ## 18 Italy                  2669.     161032   60.3 
    ## 19 Russia                 2648.     372512  141.  
    ## 20 Greece                 2570.      28274   11

EOL
