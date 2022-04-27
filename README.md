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

Updated: 2022-04-28

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
    ##  1 United States          102255. 80270473            785
    ##  2 India                   55640. 43065496            774
    ##  3 Brazil                  39270. 30355919            773
    ##  4 France                  35064. 27595685            787
    ##  5 Germany                 31025. 24479055            789
    ##  6 United Kingdom          28019. 21994813            785
    ##  7 Russia                  23584. 18159600            770
    ##  8 South Korea             21438. 17086626            797
    ##  9 Italy                   20392. 16191323            794
    ## 10 Turkey                  19511. 15023662            770
    ## 11 Spain                   15055. 11833457            786
    ## 12 Vietnam                 13864. 10620203            766
    ## 13 Argentina               11691.  9072230            776
    ## 14 Netherlands             10297.  8042469            781
    ## 15 Japan                    9706.  7725765            796
    ## 16 Iran                     9114.  7218424            792
    ## 17 Colombia                 7921.  6091551            769
    ## 18 Indonesia                7811.  6045660            774
    ## 19 Poland                   7744.  5993861            774
    ## 20 Mexico                   7389.  5733925            776

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       729.             567558.            779
    ##  2 Israel                        712.             553089.            777
    ##  3 Austria                       651.             507145.            779
    ##  4 Netherlands                   619.             483176.            781
    ##  5 Switzerland                   605.             475201.            785
    ##  6 France                        541.             426067.            787
    ##  7 Belgium                       495.             387976.            784
    ##  8 Czech Republic                480.             372322.            776
    ##  9 Portugal                      461.             357353.            775
    ## 10 United Kingdom                449.             352772.            785
    ## 11 South Korea                   443.             352864.            797
    ## 12 Slovakia                      423.             325934.            770
    ## 13 Greece                        386.             299172.            776
    ## 14 Germany                       379.             299247.            789
    ## 15 Norway                        363.             284315.            783
    ## 16 Serbia                        355.             272754.            769
    ## 17 Jordan                        345.             264667.            766
    ## 18 Italy                         338.             268333.            794
    ## 19 Sweden                        335.             261450.            781
    ## 20 Australia                     333.             258934.            777

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11818
    ##  2 Sudan                 7.94       4931    62117
    ##  3 Peru                  5.97     212761  3561677
    ##  4 Mexico                5.65     324134  5733925
    ##  5 Syria                 5.64       3150    55803
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.79      24606   513468
    ##  8 Afghanistan           4.30       7683   178769
    ##  9 Ecuador               4.10      35581   868285
    ## 10 Niger                 3.46        309     8921
    ## 11 Bulgaria              3.19      36879  1154646
    ## 12 Myanmar               3.17      19434   612785
    ## 13 Malawi                3.07       2633    85752
    ## 14 Paraguay              2.90      18795   649034
    ## 15 Tunisia               2.74      28550  1040193
    ## 16 Haiti                 2.72        835    30649
    ## 17 South Africa          2.66     100348  3769927
    ## 18 Chad                  2.60        193     7411
    ## 19 Algeria               2.59       6875   265772
    ## 20 Indonesia             2.58     156199  6045660

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7114.     212761   29.9 
    ##  2 Bulgaria               5159.      36879    7.15
    ##  3 Hungary                4625.      46162    9.98
    ##  4 Czech Republic         3829.      40114   10.5 
    ##  5 Slovakia               3643.      19873    5.46
    ##  6 Chile                  3427.      57387   16.7 
    ##  7 Brazil                 3295.     662722  201.  
    ##  8 United States          3173.     984272  310.  
    ##  9 Argentina              3109.     128542   41.3 
    ## 10 Belgium                3017.      31382   10.4 
    ## 11 Poland                 3013.     115998   38.5 
    ## 12 Romania                2980.      65430   22.0 
    ## 13 Paraguay               2948.      18795    6.38
    ## 14 Colombia               2925.     139780   47.8 
    ## 15 Mexico                 2882.     324134  112.  
    ## 16 United Kingdom         2793.     174144   62.3 
    ## 17 Italy                  2700.     162927   60.3 
    ## 18 Tunisia                2696.      28550   10.6 
    ## 19 Russia                 2668.     375400  141.  
    ## 20 Greece                 2634.      28976   11

EOL
