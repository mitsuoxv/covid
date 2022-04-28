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

Updated: 2022-04-29

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
    ##  1 United States          102205. 80333602            786
    ##  2 India                   55573. 43068799            775
    ##  3 Brazil                  39248. 30378061            774
    ##  4 France                  35106. 27663396            788
    ##  5 Germany                 31151. 24609159            790
    ##  6 United Kingdom          28005. 22011924            786
    ##  7 Russia                  23563. 18167281            771
    ##  8 South Korea             21484. 17144065            798
    ##  9 Italy                   20478. 16279754            795
    ## 10 Turkey                  19489. 15026141            771
    ## 11 Spain                   15036  11833457            787
    ## 12 Vietnam                 13861. 10631516            767
    ## 13 Argentina               11676.  9072230            777
    ## 14 Netherlands             10284.  8042469            782
    ## 15 Japan                    9751.  7771536            797
    ## 16 Iran                     9104.  7219433            793
    ## 17 Colombia                 7911.  6091753            770
    ## 18 Indonesia                7801.  6046072            775
    ## 19 Poland                   7735.  5994818            775
    ## 20 Mexico                   7381.  5735115            777

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       728.             567778.            780
    ##  2 Israel                        711.             553423.            778
    ##  3 Austria                       651.             508008.            780
    ##  4 Netherlands                   618.             483176.            782
    ##  5 Switzerland                   605.             475201.            786
    ##  6 France                        542.             427113.            788
    ##  7 Belgium                       494.             387976.            785
    ##  8 Czech Republic                479.             372479.            777
    ##  9 Portugal                      462.             358581.            776
    ## 10 United Kingdom                449.             353047.            786
    ## 11 South Korea                   444.             354051.            798
    ## 12 Slovakia                      423.             326140.            771
    ## 13 Greece                        386.             300217.            777
    ## 14 Germany                       381.             300837.            790
    ## 15 Norway                        363.             284413.            784
    ## 16 Serbia                        354.             272879.            770
    ## 17 Jordan                        345.             264667.            767
    ## 18 Italy                         339.             269799.            795
    ## 19 Australia                     335.             260700.            778
    ## 20 Sweden                        334.             261450.            782

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11818
    ##  2 Sudan                 7.94       4931    62117
    ##  3 Peru                  5.97     212769  3562300
    ##  4 Mexico                5.65     324173  5735115
    ##  5 Syria                 5.64       3150    55807
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.79      24606   513468
    ##  8 Afghanistan           4.30       7683   178769
    ##  9 Ecuador               4.10      35581   868570
    ## 10 Niger                 3.46        309     8924
    ## 11 Bulgaria              3.19      36887  1155387
    ## 12 Myanmar               3.17      19434   612802
    ## 13 Malawi                3.07       2633    85761
    ## 14 Paraguay              2.90      18795   649034
    ## 15 Tunisia               2.74      28550  1040193
    ## 16 Haiti                 2.72        835    30655
    ## 17 South Africa          2.66     100351  3776298
    ## 18 Chad                  2.60        193     7411
    ## 19 Algeria               2.59       6875   265773
    ## 20 Indonesia             2.58     156217  6046072

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7114.     212769   29.9 
    ##  2 Bulgaria               5160.      36887    7.15
    ##  3 Hungary                4627.      46189    9.98
    ##  4 Czech Republic         3830.      40123   10.5 
    ##  5 Slovakia               3644.      19879    5.46
    ##  6 Chile                  3432.      57468   16.7 
    ##  7 Brazil                 3296.     662866  201.  
    ##  8 United States          3174.     984686  310.  
    ##  9 Argentina              3109.     128542   41.3 
    ## 10 Belgium                3017.      31382   10.4 
    ## 11 Poland                 3014.     116022   38.5 
    ## 12 Romania                2981.      65456   22.0 
    ## 13 Paraguay               2948.      18795    6.38
    ## 14 Colombia               2925.     139783   47.8 
    ## 15 Mexico                 2882.     324173  112.  
    ## 16 United Kingdom         2798.     174448   62.3 
    ## 17 Italy                  2703.     163113   60.3 
    ## 18 Tunisia                2696.      28550   10.6 
    ## 19 Russia                 2669.     375566  141.  
    ## 20 Greece                 2638.      29022   11

EOL
