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

Updated: 2022-04-27

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
    ##  1 United States          102303. 80205437            784
    ##  2 India                   55708. 43062569            773
    ##  3 Brazil                  39313. 30349463            772
    ##  4 France                  35001. 27511076            786
    ##  5 Germany                 30885. 24337394            788
    ##  6 United Kingdom          28033. 21978202            784
    ##  7 Russia                  23604. 18151895            769
    ##  8 South Korea             21369. 17009865            796
    ##  9 Italy                   20380. 16161339            793
    ## 10 Turkey                  19533. 15021151            769
    ## 11 Spain                   15014. 11786036            785
    ## 12 Vietnam                 13819. 10571772            765
    ## 13 Argentina               11706.  9072230            775
    ## 14 Netherlands             10308.  8040607            780
    ## 15 Japan                    9671.  7688507            795
    ## 16 Iran                     9124.  7217117            791
    ## 17 Colombia                 7931.  6091343            768
    ## 18 Indonesia                7820.  6045043            773
    ## 19 Poland                   7753.  5992820            773
    ## 20 Mexico                   7398.  5733785            775

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       729.             567287.            778
    ##  2 Israel                        712.             552625.            776
    ##  3 Austria                       651.             506561.            778
    ##  4 Netherlands                   619.             483064.            780
    ##  5 Switzerland                   602.             472217.            784
    ##  6 France                        540.             424761.            786
    ##  7 Belgium                       495.             387976.            783
    ##  8 Czech Republic                480.             372127.            775
    ##  9 Portugal                      459.             355165.            774
    ## 10 United Kingdom                450.             352506.            784
    ## 11 South Korea                   441.             351279.            796
    ## 12 Slovakia                      423.             325678.            769
    ## 13 Greece                        385.             298725.            775
    ## 14 Germany                       378.             297515.            788
    ## 15 Norway                        363.             284205.            782
    ## 16 Serbia                        355.             272620.            768
    ## 17 Jordan                        346.             264667.            765
    ## 18 Italy                         338.             267836.            793
    ## 19 Sweden                        335.             261450.            780
    ## 20 Australia                     330.             256229.            776

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11818
    ##  2 Sudan                 7.94       4931    62117
    ##  3 Peru                  5.97     212742  3560876
    ##  4 Mexico                5.65     324129  5733785
    ##  5 Syria                 5.65       3150    55799
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.79      24606   513468
    ##  8 Afghanistan           4.30       7683   178745
    ##  9 Ecuador               4.10      35581   868285
    ## 10 Niger                 3.47        309     8916
    ## 11 Bulgaria              3.20      36856  1153506
    ## 12 Myanmar               3.17      19434   612785
    ## 13 Malawi                3.07       2633    85747
    ## 14 Paraguay              2.90      18795   649034
    ## 15 Tunisia               2.74      28533  1039532
    ## 16 Haiti                 2.72        835    30649
    ## 17 South Africa          2.66     100333  3764865
    ## 18 Chad                  2.60        193     7411
    ## 19 Algeria               2.59       6875   265771
    ## 20 Indonesia             2.58     156163  6045043

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7113.     212742   29.9 
    ##  2 Bulgaria               5156.      36856    7.15
    ##  3 Hungary                4622.      46133    9.98
    ##  4 Czech Republic         3828.      40102   10.5 
    ##  5 Slovakia               3641.      19862    5.46
    ##  6 Chile                  3426.      57376   16.7 
    ##  7 Brazil                 3295.     662646  201.  
    ##  8 United States          3172.     983989  310.  
    ##  9 Argentina              3109.     128542   41.3 
    ## 10 Belgium                3017.      31382   10.4 
    ## 11 Poland                 3012.     115977   38.5 
    ## 12 Romania                2980.      65428   22.0 
    ## 13 Paraguay               2948.      18795    6.38
    ## 14 Colombia               2925.     139778   47.8 
    ## 15 Mexico                 2882.     324129  112.  
    ## 16 United Kingdom         2786.     173693   62.3 
    ## 17 Italy                  2698.     162781   60.3 
    ## 18 Tunisia                2695.      28533   10.6 
    ## 19 Russia                 2667.     375237  141.  
    ## 20 Greece                 2630.      28933   11

EOL
