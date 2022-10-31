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

Updated: 2022-11-01

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
    ##  1 United States           98914. 95946824            970
    ##  2 India                   46466. 44653592            961
    ##  3 France                  36677. 35723289            974
    ##  4 Germany                 36446. 35571131            976
    ##  5 Brazil                  36257. 34807075            960
    ##  6 South Korea             25973. 25557309            984
    ##  7 United Kingdom          24587. 23898489            972
    ##  8 Italy                   23987. 23531023            981
    ##  9 Japan                   22658. 22273251            983
    ## 10 Russia                  22392. 21429506            957
    ## 11 Turkey                  17680. 16919638            957
    ## 12 Spain                   13887. 13511768            973
    ## 13 Vietnam                 12070. 11502474            953
    ## 14 Australia               10752. 10364859            964
    ## 15 Argentina               10091.  9717546            963
    ## 16 China                    8798.  8947493           1017
    ## 17 Netherlands              8793.  8511830            968
    ## 18 Iran                     7719.  7557437            979
    ## 19 Mexico                   7382.  7108686            963
    ## 20 Indonesia                6756.  6493079            961

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       686.             662611.            966
    ##  2 Israel                        661.             636905.            964
    ##  3 Denmark                       629.             607725.            966
    ##  4 Switzerland                   572.             555526.            972
    ##  5 France                        566.             551554.            974
    ##  6 Portugal                      537.             516002.            961
    ##  7 South Korea                   536.             527797.            984
    ##  8 Netherlands                   528.             511375.            968
    ##  9 Australia                     500.             481733.            964
    ## 10 Greece                        485.             466836.            963
    ## 11 Belgium                       457.             443357.            971
    ## 12 Germany                       446.             434843.            976
    ## 13 Czech Republic                412.             396804.            963
    ## 14 Italy                         398.             389972.            981
    ## 15 United Kingdom                394.             383305.            972
    ## 16 Slovakia                      355.             339613.            957
    ## 17 Serbia                        342.             327202.            956
    ## 18 United States                 319.             309274.            970
    ## 19 Norway                        301.             292368.            970
    ## 20 Spain                         299.             290538.            973

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4972    63481
    ##  3 Syria                 5.51       3163    57359
    ##  4 Peru                  5.22     216884  4153605
    ##  5 Somalia               5.00       1361    27237
    ##  6 Egypt                 4.81      24798   515406
    ##  7 Mexico                4.65     330353  7108686
    ##  8 Afghanistan           3.85       7821   202993
    ##  9 Ecuador               3.56      35913  1007901
    ## 10 Niger                 3.33        314     9428
    ## 11 Myanmar               3.08      19482   631625
    ## 12 Malawi                3.05       2683    88073
    ## 13 Bulgaria              2.96      37860  1278236
    ## 14 Paraguay              2.73      19598   717628
    ## 15 Tunisia               2.55      29257  1146152
    ## 16 Chad                  2.55        194     7620
    ## 17 Algeria               2.54       6881   270836
    ## 18 South Africa          2.54     102311  4028160
    ## 19 Haiti                 2.53        857    33811
    ## 20 Sri Lanka             2.50      16779   671070

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7252.     216884   29.9 
    ##  2 Bulgaria               5296.      37860    7.15
    ##  3 Hungary                4802.      47938    9.98
    ##  4 Czech Republic         3969.      41580   10.5 
    ##  5 Slovakia               3777.      20606    5.46
    ##  6 Chile                  3679.      61607   16.7 
    ##  7 Brazil                 3421.     687907  201.  
    ##  8 United States          3414.    1059255  310.  
    ##  9 Belgium                3163.      32902   10.4 
    ## 10 Argentina              3144.     129979   41.3 
    ## 11 United Kingdom         3106.     193673   62.3 
    ## 12 Paraguay               3074.      19598    6.38
    ## 13 Poland                 3068.     118124   38.5 
    ## 14 Romania                3060.      67186   22.0 
    ## 15 Greece                 3052.      33574   11   
    ## 16 Italy                  2968.     179101   60.3 
    ## 17 Colombia               2968.     141827   47.8 
    ## 18 Mexico                 2937.     330353  112.  
    ## 19 Russia                 2773.     390175  141.  
    ## 20 Tunisia                2763.      29257   10.6

EOL
