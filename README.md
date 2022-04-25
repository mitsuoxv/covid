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

Updated: 2022-04-26

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
    ##  1 United States          102394. 80174978            783
    ##  2 India                   55777. 43060086            772
    ##  3 Brazil                  39359. 30345654            771
    ##  4 France                  35028. 27497092            785
    ##  5 Germany                 30750. 24200596            787
    ##  6 United Kingdom          28012. 21933210            783
    ##  7 Russia                  23626. 18144788            768
    ##  8 South Korea             21295. 16929564            795
    ##  9 Italy                   20374. 16136057            792
    ## 10 Turkey                  19555. 15018547            768
    ## 11 Spain                   15033. 11786036            784
    ## 12 Vietnam                 13826. 10563502            764
    ## 13 Argentina               11721.  9072230            774
    ## 14 Netherlands             10315.  8035603            779
    ## 15 Japan                    9647.  7660012            794
    ## 16 Colombia                 7941.  6091094            767
    ## 17 Indonesia                7829.  6044150            772
    ## 18 Poland                   7761.  5991464            772
    ## 19 Mexico                   7407.  5733514            774
    ## 20 Australia                7083.  5489341            775

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       730.             567108.            777
    ##  2 Israel                        712.             552013.            775
    ##  3 Austria                       651.             506124.            777
    ##  4 Netherlands                   620.             482764.            779
    ##  5 Switzerland                   603.             472217.            783
    ##  6 France                        541.             424545.            785
    ##  7 Belgium                       494.             386022.            782
    ##  8 Czech Republic                480.             371911.            774
    ##  9 Portugal                      459.             355165.            773
    ## 10 United Kingdom                449.             351784.            783
    ## 11 South Korea                   440.             349621.            795
    ## 12 Slovakia                      424.             325422.            768
    ## 13 Greece                        385.             297960.            774
    ## 14 Germany                       376.             295843.            787
    ## 15 Norway                        364.             283996.            781
    ## 16 Serbia                        355.             272525.            767
    ## 17 Italy                         338.             267417.            792
    ## 18 Sweden                        336.             261450.            779
    ## 19 United States                 330.             258435.            783
    ## 20 Australia                     329.             255131.            775

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Peru                  5.98     212736  3560095
    ##  2 Mexico                5.65     324117  5733514
    ##  3 Ecuador               4.10      35543   867170
    ##  4 Niger                 3.47        309     8914
    ##  5 Bulgaria              3.20      36854  1153129
    ##  6 Myanmar               3.17      19434   612749
    ##  7 Malawi                3.07       2633    85747
    ##  8 Paraguay              2.90      18795   649034
    ##  9 Haiti                 2.73        835    30615
    ## 10 South Africa          2.67     100303  3762911
    ## 11 Chad                  2.61        193     7396
    ## 12 Algeria               2.59       6875   265767
    ## 13 Indonesia             2.58     156100  6044150
    ## 14 Honduras              2.58      10893   422469
    ## 15 El Salvador           2.55       4127   162089
    ## 16 Sri Lanka             2.49      16502   663160
    ## 17 Hungary               2.43      46101  1894278
    ## 18 Bolivia               2.42      21906   904212
    ## 19 Mali                  2.38        731    30727
    ## 20 Tanzania              2.37        803    33864

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7113.     212736   29.9 
    ##  2 Bulgaria               5155.      36854    7.15
    ##  3 Hungary                4618.      46101    9.98
    ##  4 Czech Republic         3826.      40083   10.5 
    ##  5 Slovakia               3639.      19852    5.46
    ##  6 Chile                  3426.      57375   16.7 
    ##  7 Brazil                 3295.     662610  201.  
    ##  8 United States          3171.     983872  310.  
    ##  9 Argentina              3109.     128542   41.3 
    ## 10 Poland                 3012.     115948   38.5 
    ## 11 Belgium                3011.      31319   10.4 
    ## 12 Romania                2979.      65427   22.0 
    ## 13 Paraguay               2948.      18795    6.38
    ## 14 Colombia               2925.     139771   47.8 
    ## 15 Mexico                 2882.     324117  112.  
    ## 16 United Kingdom         2780.     173352   62.3 
    ## 17 Italy                  2696.     162688   60.3 
    ## 18 Russia                 2666.     375061  141.  
    ## 19 Greece                 2624.      28867   11   
    ## 20 Ecuador                2403.      35543   14.8

EOL
