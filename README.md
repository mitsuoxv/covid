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

Updated: 2022-01-28

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
    ##  1 United States          103327. 71812665            695
    ##  2 India                   59023. 40371500            684
    ##  3 Brazil                  35491. 24311317            685
    ##  4 France                  24753. 17252793            697
    ##  5 United Kingdom          23303. 16149323            693
    ##  6 Russia                  16771. 11404617            680
    ##  7 Turkey                  16422. 11167036            680
    ##  8 Italy                   14749. 10383561            704
    ##  9 Spain                   13691.  9529320            696
    ## 10 Germany                 13236.  9238931            698
    ## 11 Argentina               11843.  8041520            679
    ## 12 Iran                     8945.  6279410            702
    ## 13 Colombia                 8501.  5780910            680
    ## 14 Mexico                   6896.  4730669            686
    ## 15 Poland                   6865.  4695435            684
    ## 16 Indonesia                6300.  4309270            684
    ## 17 Netherlands              5886.  4067075            691
    ## 18 Ukraine                  5855.  3946202            674
    ## 19 South Africa             5280.  3590399            680
    ## 20 Philippines              5081.  3475293            684

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        515.             353476.            687
    ##  2 Belgium                       407.             282557.            694
    ##  3 Denmark                       405.             279270.            689
    ##  4 Czech Republic                402.             275757.            686
    ##  5 Switzerland                   387.             268830.            695
    ##  6 France                        382.             266377.            697
    ##  7 United Kingdom                374.             259017.            693
    ##  8 Netherlands                   354.             244342.            691
    ##  9 United States                 333.             231480.            695
    ## 10 Portugal                      325.             222726.            685
    ## 11 Serbia                        321.             217691.            679
    ## 12 Austria                       300.             206624.            689
    ## 13 Sweden                        299.             206520.            691
    ## 14 Spain                         294.             204905.            696
    ## 15 Argentina                     286.             194506.            679
    ## 16 Jordan                        272.             183729.            676
    ## 17 Slovakia                      258.             175551.            680
    ## 18 Greece                        245.             168020.            686
    ## 19 Italy                         244.             172083.            704
    ## 20 Hungary                       220.             149318.            678

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.4        2003    10888
    ##  2 Peru                 6.77     204587  3020756
    ##  3 Mexico               6.42     303776  4730669
    ##  4 Sudan                5.99       3422    57106
    ##  5 Syria                5.82       2977    51124
    ##  6 Somalia              5.49       1335    24322
    ##  7 Egypt                5.41      22460   415468
    ##  8 Ecuador              4.97      34362   691898
    ##  9 Afghanistan          4.61       7401   160708
    ## 10 China                4.13       5700   138019
    ## 11 Myanmar              3.61      19310   534671
    ## 12 Bulgaria             3.61      32939   913592
    ## 13 Niger                3.45        297     8616
    ## 14 Indonesia            3.35     144261  4309270
    ## 15 Paraguay             3.11      17054   548252
    ## 16 El Salvador          3.04       3866   127012
    ## 17 Malawi               3.02       2537    84105
    ## 18 Tunisia              2.98      26096   876245
    ## 19 Russia               2.88     328770 11404617
    ## 20 Romania              2.87      59726  2083151

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6841.     204587   29.9 
    ##  2 Bulgaria               4608.      32939    7.15
    ##  3 Hungary                4123.      41151    9.98
    ##  4 Czech Republic         3543.      37114   10.5 
    ##  5 Slovakia               3255.      17755    5.46
    ##  6 Brazil                 3102.     623843  201.  
    ##  7 Argentina              2895.     119703   41.3 
    ##  8 United States          2792.     866039  310.  
    ##  9 Belgium                2778.      28902   10.4 
    ## 10 Colombia               2778.     132737   47.8 
    ## 11 Romania                2720.      59726   22.0 
    ## 12 Poland                 2718.     104636   38.5 
    ## 13 Mexico                 2701.     303776  112.  
    ## 14 Paraguay               2675.      17054    6.38
    ## 15 United Kingdom         2481.     154702   62.3 
    ## 16 Tunisia                2464.      26096   10.6 
    ## 17 Italy                  2399.     144770   60.3 
    ## 18 Chile                  2362.      39547   16.7 
    ## 19 Russia                 2337.     328770  141.  
    ## 20 Ecuador                2323.      34362   14.8

EOL
