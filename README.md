WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

- <a href="#summary" id="toc-summary">Summary</a>
- <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
  WHO</a>
- <a href="#newly-confirmed-cases-by-region"
  id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
  region</a>
- <a href="#fastest-spreading-areas"
  id="toc-fastest-spreading-areas">Fastest spreading areas</a>
- <a href="#highest-fatality-rate-areas"
  id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
- <a href="#highest-deaths-per-population-areas"
  id="toc-highest-deaths-per-population-areas">Highest deaths per
  population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2023-01-18

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
    ##    area           speed_since_100  cum_conf days_since_100
    ##    <chr>                    <dbl>     <dbl>          <int>
    ##  1 United States           95528. 100304472           1050
    ##  2 India                   43004.  44681233           1039
    ##  3 France                  36458.  38354382           1052
    ##  4 Germany                 35695.  37622357           1054
    ##  5 Brazil                  35258.  36597935           1038
    ##  6 Japan                   29662.  31471011           1061
    ##  7 South Korea             28118.  29861234           1062
    ##  8 Italy                   23951.  25363742           1059
    ##  9 United Kingdom          23089.  24243393           1050
    ## 10 Russia                  21125.  21864944           1035
    ## 11 Turkey                  16429.  17004677           1035
    ## 12 Spain                   13046.  13711251           1051
    ## 13 Vietnam                 11179.  11526167           1031
    ## 14 Australia               10786.  11238924           1042
    ## 15 China                    9990.  10939415           1095
    ## 16 Argentina                9611.  10004679           1041
    ## 17 Netherlands              8201.   8577856           1046
    ## 18 Iran                     7155.   7562755           1057
    ## 19 Mexico                   7027.   7314891           1041
    ## 20 Indonesia                6474.   6726668           1039

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       670.             699948.           1044
    ##  2 Israel                        623.             649610.           1042
    ##  3 Denmark                       594.             619451.           1043
    ##  4 South Korea                   581.             616679.           1062
    ##  5 France                        563.             592177.           1052
    ##  6 Switzerland                   551.             578242.           1050
    ##  7 Australia                     501.             522358.           1042
    ##  8 Portugal                      501.             520601.           1039
    ##  9 Netherlands                   493.             515341.           1046
    ## 10 Greece                        485.             504408.           1041
    ## 11 Germany                       436.             459918.           1054
    ## 12 Belgium                       430.             450461.           1048
    ## 13 Czech Republic                420.             437705.           1041
    ## 14 Italy                         397.             420345.           1059
    ## 15 United Kingdom                370.             388837.           1050
    ## 16 Slovakia                      329.             341004.           1035
    ## 17 Serbia                        324.             334981.           1034
    ## 18 United States                 308.             323320.           1050
    ## 19 Chile                         293.             303909.           1037
    ## 20 Norway                        281.             294869.           1049

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4998    63717
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.89     218530  4473194
    ##  6 Egypt                 4.81      24805   515580
    ##  7 Mexico                4.53     331595  7314891
    ##  8 Afghanistan           3.78       7857   207993
    ##  9 Ecuador               3.43      35936  1047624
    ## 10 Niger                 3.31        315     9507
    ## 11 Myanmar               3.08      19490   633763
    ## 12 Malawi                3.04       2685    88282
    ## 13 Bulgaria              2.95      38146  1294318
    ## 14 Tunisia               2.55      29288  1147729
    ## 15 Algeria               2.54       6881   271255
    ## 16 Chad                  2.54        194     7651
    ## 17 South Africa          2.53     102568  4051060
    ## 18 Haiti                 2.53        860    33969
    ## 19 Sri Lanka             2.50      16824   671966
    ## 20 Paraguay              2.47      19746   800163

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7307.     218530   29.9 
    ##  2 Bulgaria               5336.      38146    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4034.      42264   10.5 
    ##  5 Slovakia               3828.      20882    5.46
    ##  6 Chile                  3794.      63541   16.7 
    ##  7 United States          3510.    1088854  310.  
    ##  8 Brazil                 3457.     695236  201.  
    ##  9 United Kingdom         3242.     202157   62.3 
    ## 10 Belgium                3218.      33478   10.4 
    ## 11 Greece                 3185       35035   11   
    ## 12 Argentina              3150.     130249   41.3 
    ## 13 Paraguay               3097.      19746    6.38
    ## 14 Italy                  3082.     185993   60.3 
    ## 15 Poland                 3082.     118660   38.5 
    ## 16 Romania                3074.      67504   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2948.     331595  112.  
    ## 19 Russia                 2804.     394483  141.  
    ## 20 Tunisia                2766.      29288   10.6

EOL
