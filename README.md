WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-08-23

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
    ##  1 United States          102116. 92108785            902
    ##  2 India                   49774. 44348960            891
    ##  3 Brazil                  38453. 34223207            890
    ##  4 France                  36868. 33328522            904
    ##  5 Germany                 35108. 31808228            906
    ##  6 United Kingdom          26010. 23461239            902
    ##  7 South Korea             24397. 22299377            914
    ##  8 Italy                   23765. 21650468            911
    ##  9 Russia                  21590. 19150404            887
    ## 10 Turkey                  18796. 16671848            887
    ## 11 Japan                   18773. 17139528            913
    ## 12 Spain                   14745. 13314764            903
    ## 13 Vietnam                 12892. 11383819            883
    ## 14 Australia               11060.  9887663            894
    ## 15 Argentina               10788.  9633732            893
    ## 16 Netherlands              9324.  8372961            898
    ## 17 Iran                     8258.  7506614            909
    ## 18 Mexico                   7782.  6949653            893
    ## 19 Colombia                 7095.  6286392            886
    ## 20 Indonesia                7092.  6318857            891

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        703.             628793.            894
    ##  2 Austria                       669.             599034.            896
    ##  3 Denmark                       664.             594861.            896
    ##  4 Switzerland                   584.             526802.            902
    ##  5 France                        569.             514580.            904
    ##  6 Portugal                      567.             504975.            891
    ##  7 Netherlands                   560.             503032.            898
    ##  8 Australia                     514.             459555.            894
    ##  9 South Korea                   504.             460515.            914
    ## 10 Belgium                       476.             429308.            901
    ## 11 Greece                        474.             423158.            893
    ## 12 Czech Republic                430.             384217.            893
    ## 13 Germany                       429.             388843.            906
    ## 14 United Kingdom                417.             376292.            902
    ## 15 Italy                         394.             358806.            911
    ## 16 Slovakia                      378.             335680.            887
    ## 17 Serbia                        345.             305480.            886
    ## 18 United States                 329.             296902.            902
    ## 19 Norway                        323.             291216.            901
    ## 20 Spain                         317.             286302.            903

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2154    11915
    ##  2 Sudan                 7.85       4961    63172
    ##  3 Syria                 5.56       3160    56861
    ##  4 Peru                  5.32     215159  4046670
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24791   515264
    ##  7 Mexico                4.73     328871  6949653
    ##  8 Afghanistan           4.07       7764   190767
    ##  9 Ecuador               3.63      35811   986169
    ## 10 Niger                 3.39        312     9203
    ## 11 Myanmar               3.16      19437   614696
    ## 12 Malawi                3.05       2673    87718
    ## 13 Bulgaria              3.04      37544  1233760
    ## 14 Paraguay              2.72      19357   712907
    ## 15 Chad                  2.59        193     7456
    ## 16 Haiti                 2.56        838    32703
    ## 17 Tunisia               2.56      29209  1141773
    ## 18 Algeria               2.55       6878   269805
    ## 19 South Africa          2.55     102066  4009730
    ## 20 Indonesia             2.49     157396  6318857

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7194.     215159   29.9 
    ##  2 Bulgaria               5252.      37544    7.15
    ##  3 Hungary                4717.      47083    9.98
    ##  4 Czech Republic         3888.      40726   10.5 
    ##  5 Slovakia               3727.      20333    5.46
    ##  6 Chile                  3585.      60043   16.7 
    ##  7 Brazil                 3391.     682010  201.  
    ##  8 United States          3316.    1028619  310.  
    ##  9 Argentina              3134.     129566   41.3 
    ## 10 Belgium                3118.      32436   10.4 
    ## 11 Paraguay               3036.      19357    6.38
    ## 12 Poland                 3036.     116881   38.5 
    ## 13 Romania                3028.      66490   22.0 
    ## 14 United Kingdom         3000.     187018   62.3 
    ## 15 Colombia               2956.     141287   47.8 
    ## 16 Mexico                 2924.     328871  112.  
    ## 17 Greece                 2912.      32028   11   
    ## 18 Italy                  2896.     174722   60.3 
    ## 19 Tunisia                2758.      29209   10.6 
    ## 20 Russia                 2726.     383617  141.

EOL
