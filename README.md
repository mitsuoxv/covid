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

Updated: 2022-09-07

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
    ##  1 United States          102023. 93555039            917
    ##  2 India                   49080. 44466862            906
    ##  3 Brazil                  38089. 34470776            905
    ##  4 France                  36532. 33572945            919
    ##  5 Germany                 35068. 32297537            921
    ##  6 United Kingdom          25651. 23522244            917
    ##  7 South Korea             25518. 23706477            929
    ##  8 Italy                   23698. 21944877            926
    ##  9 Russia                  21962. 19809613            902
    ## 10 Japan                   21050. 19534517            928
    ## 11 Turkey                  18623. 16797750            902
    ## 12 Spain                   14545. 13352019            918
    ## 13 Vietnam                 12718. 11421055            898
    ## 14 Australia               11084. 10075722            909
    ## 15 Argentina               10659.  9678225            908
    ## 16 Netherlands              9188.  8388688            913
    ## 17 Iran                     8154.  7534182            924
    ## 18 Mexico                   7754.  7041181            908
    ## 19 Indonesia                7040.  6378489            906
    ## 20 Colombia                 6995.  6302809            901

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        694.             630661.            909
    ##  2 Austria                       666.             607024.            911
    ##  3 Denmark                       656.             597447.            911
    ##  4 Switzerland                   579.             531048.            917
    ##  5 France                        564.             518354.            919
    ##  6 Portugal                      561.             508556.            906
    ##  7 Netherlands                   552.             503976.            913
    ##  8 South Korea                   527.             489574.            929
    ##  9 Australia                     515.             468295.            909
    ## 10 Greece                        477.             432984.            908
    ## 11 Belgium                       471.             431873.            916
    ## 12 Germany                       429.             394825.            921
    ## 13 Czech Republic                426.             386552.            908
    ## 14 United Kingdom                411.             377271.            917
    ## 15 Italy                         393.             363685.            926
    ## 16 Slovakia                      373.             336511.            902
    ## 17 Serbia                        347.             312767.            901
    ## 18 United States                 329.             301564.            917
    ## 19 Norway                        319.             291552.            915
    ## 20 Spain                         313.             287103.            918

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11931
    ##  2 Sudan                 7.84       4961    63270
    ##  3 Syria                 5.54       3163    57098
    ##  4 Peru                  5.25     215790  4111045
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24796   515335
    ##  7 Mexico                4.68     329622  7041181
    ##  8 Afghanistan           4.00       7783   194433
    ##  9 Ecuador               3.60      35843   995968
    ## 10 Niger                 3.33        312     9366
    ## 11 Myanmar               3.16      19441   615654
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.02      37620  1245457
    ## 14 Paraguay              2.72      19494   715569
    ## 15 Chad                  2.56        193     7536
    ## 16 Tunisia               2.55      29238  1144824
    ## 17 South Africa          2.54     102108  4012812
    ## 18 Algeria               2.54       6879   270461
    ## 19 Haiti                 2.52        841    33381
    ## 20 Sri Lanka             2.49      16712   670218

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7215.     215790   29.9 
    ##  2 Bulgaria               5262.      37620    7.15
    ##  3 Hungary                4738.      47291    9.98
    ##  4 Czech Republic         3900.      40857   10.5 
    ##  5 Slovakia               3734.      20369    5.46
    ##  6 Chile                  3619.      60610   16.7 
    ##  7 Brazil                 3403.     684369  201.  
    ##  8 United States          3342.    1036882  310.  
    ##  9 Argentina              3137.     129711   41.3 
    ## 10 Belgium                3130.      32561   10.4 
    ## 11 Paraguay               3057.      19494    6.38
    ## 12 Poland                 3043.     117174   38.5 
    ## 13 Romania                3041.      66779   22.0 
    ## 14 United Kingdom         3019.     188242   62.3 
    ## 15 Colombia               2964.     141646   47.8 
    ## 16 Greece                 2959.      32552   11   
    ## 17 Mexico                 2931.     329622  112.  
    ## 18 Italy                  2915.     175872   60.3 
    ## 19 Tunisia                2761.      29238   10.6 
    ## 20 Russia                 2735.     384882  141.

EOL
