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

Updated: 2022-02-02

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
    ##  1 United States          105044. 73531094            700
    ##  2 India                   60188. 41469499            689
    ##  3 Brazil                  36737. 25348797            690
    ##  4 France                  26557. 18643094            702
    ##  5 United Kingdom          24702. 17315897            701
    ##  6 Russia                  17499. 11986913            685
    ##  7 Turkey                  16962. 11618991            685
    ##  8 Italy                   15491. 10983116            709
    ##  9 Spain                   14210.  9961253            701
    ## 10 Germany                 14194.  9978146            703
    ## 11 Argentina               12186.  8335184            684
    ## 12 Iran                     9014.  6373174            707
    ## 13 Colombia                 8572.  5871977            685
    ## 14 Poland                   7148.  4925270            689
    ## 15 Mexico                   7135.  4930069            691
    ## 16 Netherlands              6368.  4432484            696
    ## 17 Indonesia                6341.  4369391            689
    ## 18 Ukraine                  6031.  4095263            679
    ## 19 South Africa             5263.  3605222            685
    ## 20 Philippines              5167.  3560202            689

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        574.             397162.            692
    ##  2 Denmark                       458.             317755.            694
    ##  3 Belgium                       434.             303301.            699
    ##  4 Czech Republic                420.             290481.            691
    ##  5 Switzerland                   417.             291717.            700
    ##  6 France                        410.             287842.            702
    ##  7 United Kingdom                396.             277728.            701
    ##  8 Netherlands                   383.             266295.            696
    ##  9 Portugal                      358.             247265.            690
    ## 10 United States                 339.             237019.            700
    ## 11 Serbia                        334.             228432.            684
    ## 12 Austria                       327.             227019.            694
    ## 13 Sweden                        311.             216668.            696
    ## 14 Spain                         306.             214193.            701
    ## 15 Argentina                     295.             201610.            684
    ## 16 Jordan                        281.             191243.            681
    ## 17 Slovakia                      274.             187495.            685
    ## 18 Italy                         257.             182019.            709
    ## 19 Greece                        255.             176429.            691
    ## 20 Hungary                       229.             156565.            683

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2012    11061
    ##  2 Peru                 6.37     205505  3224406
    ##  3 Mexico               6.20     305893  4930069
    ##  4 Sudan                5.91       3442    58208
    ##  5 Syria                5.81       2989    51402
    ##  6 Egypt                5.31      22635   425911
    ##  7 Somalia              5.12       1335    26067
    ##  8 Ecuador              4.87      34442   707224
    ##  9 Afghanistan          4.56       7414   162750
    ## 10 China                4.09       5700   139205
    ## 11 Myanmar              3.61      19310   535532
    ## 12 Bulgaria             3.50      33318   951965
    ## 13 Niger                3.45        298     8649
    ## 14 Indonesia            3.30     144348  4369391
    ## 15 Malawi               3.03       2561    84475
    ## 16 Haiti                3.00        876    29217
    ## 17 Paraguay             2.99      17260   576809
    ## 18 El Salvador          2.91       3899   134155
    ## 19 Tunisia              2.89      26288   909813
    ## 20 Russia               2.77     332012 11986913

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6871.     205505   29.9 
    ##  2 Bulgaria               4661.      33318    7.15
    ##  3 Hungary                4155.      41471    9.98
    ##  4 Czech Republic         3555.      37243   10.5 
    ##  5 Slovakia               3272.      17850    5.46
    ##  6 Brazil                 3117.     626854  201.  
    ##  7 Argentina              2926.     120988   41.3 
    ##  8 United States          2823.     875755  310.  
    ##  9 Colombia               2806.     134079   47.8 
    ## 10 Belgium                2793.      29052   10.4 
    ## 11 Poland                 2739.     105434   38.5 
    ## 12 Romania                2733.      60025   22.0 
    ## 13 Mexico                 2720.     305893  112.  
    ## 14 Paraguay               2707.      17260    6.38
    ## 15 United Kingdom         2498.     155754   62.3 
    ## 16 Tunisia                2483.      26288   10.6 
    ## 17 Italy                  2428.     146498   60.3 
    ## 18 Chile                  2372.      39721   16.7 
    ## 19 Russia                 2360.     332012  141.  
    ## 20 Ecuador                2329.      34442   14.8

EOL
