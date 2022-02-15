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

Updated: 2022-02-16

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
    ##  1 United States          107924. 77057812            714
    ##  2 India                   60729. 42692943            703
    ##  3 Brazil                  39034. 27479963            704
    ##  4 France                  29507. 21127104            716
    ##  5 United Kingdom          25697. 18348033            714
    ##  6 Russia                  20716. 14480596            699
    ##  7 Turkey                  18575. 12984062            699
    ##  8 Germany                 17546. 12580343            717
    ##  9 Italy                   16783. 12134451            723
    ## 10 Spain                   14927. 10672906            715
    ## 11 Argentina               12532.  8747601            698
    ## 12 Iran                     9480.  6835221            721
    ## 13 Colombia                 8612.  6020095            699
    ## 14 Netherlands              8154.  5789483            710
    ## 15 Poland                   7734.  5437257            703
    ## 16 Mexico                   7507.  5292706            705
    ## 17 Indonesia                6972.  4901328            703
    ## 18 Ukraine                  6598.  4572417            693
    ## 19 Japan                    5484.  3975779            725
    ## 20 South Africa             5211.  3642905            699

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        666.             470216.            706
    ##  2 Denmark                       607.             429773.            708
    ##  3 Netherlands                   490.             347821.            710
    ##  4 Switzerland                   476.             339791.            714
    ##  5 Belgium                       465.             331399.            713
    ##  6 Czech Republic                463.             326745.            705
    ##  7 France                        456.             326195.            716
    ##  8 United Kingdom                412.             294282.            714
    ##  9 Portugal                      412.             289783.            704
    ## 10 Austria                       398.             281912.            708
    ## 11 Serbia                        360.             251610.            698
    ## 12 Sweden                        353.             250875.            710
    ## 13 United States                 348.             248387.            714
    ## 14 Jordan                        335.             232629.            695
    ## 15 Slovakia                      333.             232552.            699
    ## 16 Spain                         321.             229495.            715
    ## 17 Argentina                     303.             211585.            698
    ## 18 Norway                        290.             206771.            712
    ## 19 Greece                        283.             199496.            705
    ## 20 Italy                         278.             201100.            723

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2107    11679
    ##  2 Sudan                 6.38       3820    59903
    ##  3 Peru                  6.05     208381  3445680
    ##  4 Mexico                5.91     312819  5292706
    ##  5 Syria                 5.73       3032    52881
    ##  6 Egypt                 5.12      23409   457081
    ##  7 Somalia               5.11       1340    26203
    ##  8 Afghanistan           4.38       7501   171076
    ##  9 Ecuador               4.38      35036   799140
    ## 10 China                 3.76       5708   151845
    ## 11 Myanmar               3.52      19311   548357
    ## 12 Niger                 3.48        303     8712
    ## 13 Bulgaria              3.32      34591  1042954
    ## 14 Malawi                3.06       2598    85033
    ## 15 Indonesia             2.97     145455  4901328
    ## 16 Paraguay              2.87      17905   624475
    ## 17 Tunisia               2.80      27145   968393
    ## 18 El Salvador           2.71       4002   147786
    ## 19 Haiti                 2.70        807    29907
    ## 20 South Africa          2.67      97250  3642905

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6968.     208381   29.9 
    ##  2 Bulgaria               4839.      34591    7.15
    ##  3 Hungary                4283.      42754    9.98
    ##  4 Czech Republic         3622.      37946   10.5 
    ##  5 Slovakia               3322.      18123    5.46
    ##  6 Brazil                 3174.     638362  201.  
    ##  7 Argentina              3008.     124349   41.3 
    ##  8 United States          2941.     912508  310.  
    ##  9 Colombia               2869.     137115   47.8 
    ## 10 Belgium                2857.      29724   10.4 
    ## 11 Poland                 2819.     108515   38.5 
    ## 12 Romania                2809.      61676   22.0 
    ## 13 Paraguay               2808.      17905    6.38
    ## 14 Mexico                 2781.     312819  112.  
    ## 15 Tunisia                2564.      27145   10.6 
    ## 16 United Kingdom         2560.     159605   62.3 
    ## 17 Italy                  2507.     151296   60.3 
    ## 18 Chile                  2428.      40666   16.7 
    ## 19 Russia                 2428.     341635  141.  
    ## 20 Ecuador                2369.      35036   14.8

EOL
