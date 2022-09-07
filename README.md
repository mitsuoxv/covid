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

Updated: 2022-09-08

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
    ##  1 United States          101940. 93580725            918
    ##  2 India                   49032. 44472241            907
    ##  3 Brazil                  38055. 34477539            906
    ##  4 France                  36521. 33599863            920
    ##  5 Germany                 35080. 32344032            922
    ##  6 United Kingdom          25623. 23522244            918
    ##  7 South Korea             25583. 23791961            930
    ##  8 Italy                   23700. 21969725            927
    ##  9 Russia                  21991. 19857571            903
    ## 10 Japan                   21136. 19635246            929
    ## 11 Turkey                  18602. 16797750            903
    ## 12 Spain                   14536. 13358722            919
    ## 13 Vietnam                 12708. 11424754            899
    ## 14 Australia               11082. 10084917            910
    ## 15 Argentina               10660.  9689861            909
    ## 16 Netherlands              9183.  8392953            914
    ## 17 Iran                     8146.  7535272            925
    ## 18 Mexico                   7746.  7041181            909
    ## 19 Indonesia                7036.  6382002            907
    ## 20 Colombia                 6987.  6302809            902

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        693.             630787.            910
    ##  2 Austria                       666.             607533.            912
    ##  3 Denmark                       655.             597641.            912
    ##  4 Switzerland                   581.             532949.            918
    ##  5 France                        564.             518769.            920
    ##  6 Portugal                      561.             508881.            907
    ##  7 Netherlands                   552.             504233.            914
    ##  8 South Korea                   528.             491340.            930
    ##  9 Australia                     515.             468722.            910
    ## 10 Greece                        476.             432984.            909
    ## 11 Belgium                       471.             431873.            917
    ## 12 Germany                       429.             395393.            922
    ## 13 Czech Republic                425.             386786.            909
    ## 14 United Kingdom                411.             377271.            918
    ## 15 Italy                         393.             364097.            927
    ## 16 Slovakia                      373.             336586.            903
    ## 17 Serbia                        347.             313238.            902
    ## 18 United States                 329.             301647.            918
    ## 19 Norway                        318.             291576.            916
    ## 20 Spain                         313.             287248.            919

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11931
    ##  2 Sudan                 7.84       4961    63270
    ##  3 Syria                 5.54       3163    57114
    ##  4 Peru                  5.25     215928  4115878
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24796   515335
    ##  7 Mexico                4.68     329622  7041181
    ##  8 Afghanistan           4.00       7783   194614
    ##  9 Ecuador               3.60      35862   997540
    ## 10 Niger                 3.33        312     9366
    ## 11 Myanmar               3.16      19442   615800
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.02      37621  1245918
    ## 14 Paraguay              2.72      19494   715569
    ## 15 Chad                  2.56        193     7547
    ## 16 Tunisia               2.55      29238  1144824
    ## 17 South Africa          2.54     102108  4012812
    ## 18 Algeria               2.54       6879   270476
    ## 19 Haiti                 2.51        841    33551
    ## 20 Sri Lanka             2.49      16716   670251

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7220.     215928   29.9 
    ##  2 Bulgaria               5263.      37621    7.15
    ##  3 Hungary                4745.      47367    9.98
    ##  4 Czech Republic         3901.      40869   10.5 
    ##  5 Slovakia               3735.      20374    5.46
    ##  6 Chile                  3621.      60645   16.7 
    ##  7 Brazil                 3403.     684425  201.  
    ##  8 United States          3342.    1036949  310.  
    ##  9 Argentina              3139.     129769   41.3 
    ## 10 Belgium                3130.      32561   10.4 
    ## 11 Paraguay               3057.      19494    6.38
    ## 12 Poland                 3044      117194   38.5 
    ## 13 Romania                3042.      66795   22.0 
    ## 14 United Kingdom         3019.     188242   62.3 
    ## 15 Colombia               2964.     141646   47.8 
    ## 16 Greece                 2959.      32552   11   
    ## 17 Mexico                 2931.     329622  112.  
    ## 18 Italy                  2916.     175952   60.3 
    ## 19 Tunisia                2761.      29238   10.6 
    ## 20 Russia                 2736.     384976  141.

EOL
