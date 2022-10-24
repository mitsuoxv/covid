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

Updated: 2022-10-25

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
    ##  1 United States           99198. 95726462            965
    ##  2 India                   46797. 44644076            954
    ##  3 France                  36692. 35481485            967
    ##  4 Brazil                  36486. 34771320            953
    ##  5 Germany                 36298. 35172694            969
    ##  6 South Korea             25838. 25244255            977
    ##  7 United Kingdom          24721. 23855526            965
    ##  8 Italy                   23971. 23348075            974
    ##  9 Russia                  22505. 21380264            950
    ## 10 Japan                   22433. 21894638            976
    ## 11 Turkey                  17810. 16919638            950
    ## 12 Spain                   13963. 13488015            966
    ## 13 Vietnam                 12151. 11495231            946
    ## 14 Australia               10765. 10301894            957
    ## 15 Argentina               10163.  9715464            956
    ## 16 Netherlands              8839.  8494705            961
    ## 17 China                    8494.  8578991           1010
    ## 18 Iran                     7774.  7556097            972
    ## 19 Mexico                   7430.  7103339            956
    ## 20 Indonesia                6785.  6472664            954

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       686.             657954.            959
    ##  2 Israel                        665.             636136.            957
    ##  3 Denmark                       632.             606482.            959
    ##  4 Switzerland                   572.             551545.            965
    ##  5 France                        567.             547821.            967
    ##  6 Portugal                      541.             516002.            954
    ##  7 South Korea                   534.             521332.            977
    ##  8 Netherlands                   531.             510346.            961
    ##  9 Australia                     500.             478807.            957
    ## 10 Greece                        483.             461998.            956
    ## 11 Belgium                       459.             442414.            964
    ## 12 Germany                       444.             429972.            969
    ## 13 Czech Republic                414.             396257.            956
    ## 14 Italy                         397.             386940.            974
    ## 15 United Kingdom                396.             382616.            965
    ## 16 Slovakia                      357.             339379.            950
    ## 17 Serbia                        344.             326285.            949
    ## 18 United States                 320.             308563.            965
    ## 19 Norway                        303.             292231.            963
    ## 20 Spain                         300.             290028.            966

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4966    63446
    ##  3 Syria                 5.52       3163    57348
    ##  4 Peru                  5.22     216877  4151414
    ##  5 Somalia               5.00       1361    27225
    ##  6 Egypt                 4.81      24798   515401
    ##  7 Mexico                4.65     330279  7103339
    ##  8 Afghanistan           3.87       7818   202149
    ##  9 Ecuador               3.57      35904  1006922
    ## 10 Niger                 3.33        314     9425
    ## 11 Myanmar               3.09      19476   630603
    ## 12 Malawi                3.05       2683    88073
    ## 13 Bulgaria              2.97      37821  1274336
    ## 14 Paraguay              2.73      19596   717260
    ## 15 Tunisia               2.55      29257  1146044
    ## 16 Algeria               2.54       6881   270777
    ## 17 South Africa          2.54     102257  4025375
    ## 18 Haiti                 2.54        857    33761
    ## 19 Chad                  2.54        193     7613
    ## 20 Sri Lanka             2.50      16774   670994

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7252.     216877   29.9 
    ##  2 Bulgaria               5291.      37821    7.15
    ##  3 Hungary                4788.      47798    9.98
    ##  4 Czech Republic         3961.      41497   10.5 
    ##  5 Slovakia               3770.      20564    5.46
    ##  6 Chile                  3672.      61495   16.7 
    ##  7 Brazil                 3419.     687483  201.  
    ##  8 United States          3399.    1054617  310.  
    ##  9 Belgium                3157.      32846   10.4 
    ## 10 Argentina              3144.     129970   41.3 
    ## 11 United Kingdom         3090.     192682   62.3 
    ## 12 Paraguay               3073.      19596    6.38
    ## 13 Poland                 3066.     118029   38.5 
    ## 14 Romania                3059.      67163   22.0 
    ## 15 Greece                 3039.      33426   11   
    ## 16 Colombia               2968.     141820   47.8 
    ## 17 Italy                  2960.     178594   60.3 
    ## 18 Mexico                 2937.     330279  112.  
    ## 19 Russia                 2769.     389626  141.  
    ## 20 Tunisia                2763.      29257   10.6

EOL
