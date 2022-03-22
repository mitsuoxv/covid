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

Updated: 2022-03-23

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
    ##  1 United States          105494. 79015226            749
    ##  2 India                   58280. 43010971            738
    ##  3 Brazil                  40095. 29630484            739
    ##  4 France                  31214. 23442023            751
    ##  5 United Kingdom          27129. 20319438            749
    ##  6 Germany                 25258. 18994411            752
    ##  7 Russia                  24029. 17637795            734
    ##  8 Turkey                  20038. 14707959            734
    ##  9 Italy                   18331. 13895188            758
    ## 10 Spain                   15172. 11378784            750
    ## 11 South Korea             13057.  9936540            761
    ## 12 Argentina               12294.  9011367            733
    ## 13 Vietnam                 11082.  8089761            730
    ## 14 Netherlands             10125.  7543318            745
    ## 15 Iran                     9447.  7142289            756
    ## 16 Colombia                 8285.  6081131            734
    ## 17 Indonesia                8096.  5974646            738
    ## 18 Japan                    8068.  6131791            760
    ## 19 Poland                   8002.  5905463            738
    ## 20 Mexico                   7614.  5634829            740

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       739.             548893.            743
    ##  2 Israel                        695.             515316.            741
    ##  3 Netherlands                   608.             453188.            745
    ##  4 Switzerland                   584.             437210.            749
    ##  5 Austria                       580.             431235.            743
    ##  6 Czech Republic                484.             358022.            740
    ##  7 France                        482.             361936.            751
    ##  8 Belgium                       479.             358449.            748
    ##  9 United Kingdom                435.             325901.            749
    ## 10 Portugal                      433.             319690.            739
    ## 11 Slovakia                      411.             301823.            734
    ## 12 Norway                        369.             275389.            747
    ## 13 Serbia                        364.             266507.            733
    ## 14 Jordan                        361.             263663.            730
    ## 15 Sweden                        348.             259074.            745
    ## 16 Greece                        345.             255653.            740
    ## 17 United States                 340.             254697.            749
    ## 18 Spain                         326.             244674.            750
    ## 19 Germany                       309.             232199.            752
    ## 20 Italy                         304.             230280.            758

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2142    11801
    ##  2 Sudan                 7.92       4898    61853
    ##  3 Peru                  5.98     211865  3541397
    ##  4 Mexico                5.72     322092  5634829
    ##  5 Syria                 5.63       3127    55577
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.86      24361   500889
    ##  8 Afghanistan           4.32       7654   177191
    ##  9 Ecuador               4.15      35410   853850
    ## 10 Niger                 3.50        308     8794
    ## 11 Bulgaria              3.23      36330  1126146
    ## 12 Myanmar               3.19      19425   609288
    ## 13 Malawi                3.07       2626    85563
    ## 14 Paraguay              2.87      18586   647099
    ## 15 Tunisia               2.73      28065  1029762
    ## 16 Haiti                 2.71        827    30509
    ## 17 South Africa          2.70      99890  3704784
    ## 18 Chad                  2.61        190     7288
    ## 19 Honduras              2.60      10857   418300
    ## 20 Algeria               2.59       6872   265562

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7084.     211865   29.9 
    ##  2 Bulgaria               5082.      36330    7.15
    ##  3 Hungary                4522.      45143    9.98
    ##  4 Czech Republic         3763.      39418   10.5 
    ##  5 Slovakia               3513.      19161    5.46
    ##  6 Chile                  3342.      55965   16.7 
    ##  7 Brazil                 3268.     657205  201.  
    ##  8 United States          3109.     964473  310.  
    ##  9 Argentina              3086.     127599   41.3 
    ## 10 Poland                 2970.     114355   38.5 
    ## 11 Romania                2946.      64697   22.0 
    ## 12 Belgium                2939.      30575   10.4 
    ## 13 Colombia               2918.     139452   47.8 
    ## 14 Paraguay               2915.      18586    6.38
    ## 15 Mexico                 2864.     322092  112.  
    ## 16 Tunisia                2650.      28065   10.6 
    ## 17 United Kingdom         2625.     163679   62.3 
    ## 18 Italy                  2617.     157904   60.3 
    ## 19 Russia                 2597.     365373  141.  
    ## 20 Greece                 2454.      26995   11

EOL
