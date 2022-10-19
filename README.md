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

Updated: 2022-10-20

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
    ##  1 United States           99674. 95687463            960
    ##  2 India                   47033. 44634376            949
    ##  3 France                  36708. 35312935            962
    ##  4 Brazil                  36661. 34754590            948
    ##  5 Germany                 36192. 34888963            964
    ##  6 South Korea             25920. 25194177            972
    ##  7 United Kingdom          24790. 23798797            960
    ##  8 Italy                   23914. 23172370            969
    ##  9 Russia                  22577. 21335087            945
    ## 10 Japan                   22466. 21814973            971
    ## 11 Turkey                  17904. 16919638            945
    ## 12 Spain                   14009. 13462593            961
    ## 13 Vietnam                 12213. 11492598            941
    ## 14 Australia               10821. 10301894            952
    ## 15 Argentina               10216.  9715464            951
    ## 16 Netherlands              8878.  8487703            956
    ## 17 China                    8449.  8491345           1005
    ## 18 Iran                     7813.  7555010            967
    ## 19 Mexico                   7469.  7103339            951
    ## 20 Indonesia                6810.  6462655            949

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       684.             652794.            954
    ##  2 Israel                        668.             635642.            952
    ##  3 Denmark                       635.             605834.            954
    ##  4 Switzerland                   575.             551545.            960
    ##  5 France                        567.             545219.            962
    ##  6 Portugal                      544.             516002.            949
    ##  7 South Korea                   535.             520297.            972
    ##  8 Netherlands                   533.             509925.            956
    ##  9 Australia                     503.             478807.            952
    ## 10 Greece                        486.             461998.            951
    ## 11 Belgium                       461.             441636.            959
    ## 12 Germany                       442.             426504.            964
    ## 13 Czech Republic                416.             395756.            951
    ## 14 United Kingdom                398.             381706.            960
    ## 15 Italy                         396.             384028.            969
    ## 16 Slovakia                      359.             339201.            945
    ## 17 Serbia                        345.             325592.            944
    ## 18 United States                 321.             308438.            960
    ## 19 Norway                        305.             292178.            958
    ## 20 Spain                         301.             289481.            961

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4965    63449
    ##  3 Syria                 5.52       3163    57338
    ##  4 Peru                  5.22     216877  4150832
    ##  5 Somalia               5.00       1361    27223
    ##  6 Egypt                 4.81      24798   515397
    ##  7 Mexico                4.65     330279  7103339
    ##  8 Afghanistan           3.88       7812   201557
    ##  9 Ecuador               3.57      35904  1006922
    ## 10 Niger                 3.33        314     9417
    ## 11 Myanmar               3.09      19471   629376
    ## 12 Malawi                3.05       2682    88057
    ## 13 Bulgaria              2.97      37801  1272015
    ## 14 Paraguay              2.73      19596   717260
    ## 15 Tunisia               2.55      29257  1146044
    ## 16 Chad                  2.55        193     7581
    ## 17 Algeria               2.54       6881   270763
    ## 18 South Africa          2.54     102246  4024129
    ## 19 Haiti                 2.54        857    33761
    ## 20 Sri Lanka             2.50      16770   670942

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7252.     216877   29.9 
    ##  2 Bulgaria               5288.      37801    7.15
    ##  3 Hungary                4788.      47798    9.98
    ##  4 Czech Republic         3954.      41427   10.5 
    ##  5 Slovakia               3764.      20530    5.46
    ##  6 Chile                  3670.      61455   16.7 
    ##  7 Brazil                 3417.     687243  201.  
    ##  8 United States          3398.    1054151  310.  
    ##  9 Belgium                3154.      32810   10.4 
    ## 10 Argentina              3144.     129970   41.3 
    ## 11 United Kingdom         3074.     191681   62.3 
    ## 12 Paraguay               3073.      19596    6.38
    ## 13 Poland                 3064.     117973   38.5 
    ## 14 Romania                3057.      67131   22.0 
    ## 15 Greece                 3039.      33426   11   
    ## 16 Colombia               2968.     141820   47.8 
    ## 17 Italy                  2953.     178194   60.3 
    ## 18 Mexico                 2937.     330279  112.  
    ## 19 Russia                 2766.     389176  141.  
    ## 20 Tunisia                2763.      29257   10.6

EOL
