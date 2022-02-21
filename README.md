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

Updated: 2022-02-22

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
    ##  1 United States          107957. 77729481            720
    ##  2 India                   60421. 42838524            709
    ##  3 Brazil                  39672. 28167587            710
    ##  4 France                  29982. 21646866            722
    ##  5 United Kingdom          25841. 18605756            720
    ##  6 Russia                  22018. 15522756            705
    ##  7 Turkey                  19154. 13503594            705
    ##  8 Germany                 18862. 13636993            723
    ##  9 Italy                   17105. 12469975            729
    ## 10 Spain                   14949. 10778608            721
    ## 11 Argentina               12539.  8827504            704
    ## 12 Iran                     9549.  6942452            727
    ## 13 Colombia                 8572.  6043661            705
    ## 14 Netherlands              8495.  6082555            716
    ## 15 Poland                   7847.  5563446            709
    ## 16 Mexico                   7606.  5407711            711
    ## 17 Indonesia                7379.  5231923            709
    ## 18 Ukraine                  6773.  4734333            699
    ## 19 Japan                    6135.  4484753            731
    ## 20 South Africa             5189.  3658547            705

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        679.             483121.            712
    ##  2 Denmark                       658.             470104.            714
    ##  3 Netherlands                   510.             365428.            716
    ##  4 Switzerland                   486.             349961.            720
    ##  5 Czech Republic                471.             335086.            711
    ##  6 Belgium                       467.             335886.            719
    ##  7 France                        463.             334220.            722
    ##  8 Austria                       424.             302871.            714
    ##  9 Portugal                      420.             298556.            710
    ## 10 United Kingdom                414.             298416.            720
    ## 11 Serbia                        364.             256386.            704
    ## 12 Sweden                        354.             253546.            716
    ## 13 Slovakia                      354.             249503.            705
    ## 14 Jordan                        350.             245183.            701
    ## 15 United States                 348.             250552.            720
    ## 16 Spain                         321.             231768.            721
    ## 17 Norway                        315.             226541.            718
    ## 18 Argentina                     303.             213518.            704
    ## 19 Greece                        294.             208993.            711
    ## 20 Italy                         283.             206661.            729

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2122    11736
    ##  2 Sudan                 6.36       3892    61223
    ##  3 Peru                  6.00     209298  3490988
    ##  4 Mexico                5.83     315525  5407711
    ##  5 Syria                 5.68       3050    53659
    ##  6 Somalia               5.12       1345    26260
    ##  7 Egypt                 5.06      23752   469457
    ##  8 Afghanistan           4.38       7541   172206
    ##  9 Ecuador               4.34      35105   808925
    ## 10 Niger                 3.47        303     8738
    ## 11 Myanmar               3.42      19331   565667
    ## 12 Bulgaria              3.28      35042  1067648
    ## 13 China                 3.20       5776   180767
    ## 14 Malawi                3.06       2606    85219
    ## 15 Paraguay              2.87      18191   634780
    ## 16 Indonesia             2.80     146541  5231923
    ## 17 Tunisia               2.78      27448   986336
    ## 18 El Salvador           2.73       4032   147786
    ## 19 Haiti                 2.70        814    30162
    ## 20 South Africa          2.70      98667  3658547

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6998.     209298   29.9 
    ##  2 Bulgaria               4902.      35042    7.15
    ##  3 Hungary                4338.      43299    9.98
    ##  4 Czech Republic         3652.      38257   10.5 
    ##  5 Slovakia               3346.      18252    5.46
    ##  6 Brazil                 3202.     643880  201.  
    ##  7 Argentina              3030.     125278   41.3 
    ##  8 United States          2986.     926287  310.  
    ##  9 Colombia               2888.     137996   47.8 
    ## 10 Belgium                2876.      29920   10.4 
    ## 11 Paraguay               2853.      18191    6.38
    ## 12 Poland                 2853.     109833   38.5 
    ## 13 Romania                2848.      62539   22.0 
    ## 14 Mexico                 2805.     315525  112.  
    ## 15 Tunisia                2592.      27448   10.6 
    ## 16 United Kingdom         2576.     160581   62.3 
    ## 17 Italy                  2535.     152989   60.3 
    ## 18 Chile                  2469.      41347   16.7 
    ## 19 Russia                 2461.     346235  141.  
    ## 20 Ecuador                2373.      35105   14.8

EOL
