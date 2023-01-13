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

Updated: 2023-01-14

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
    ##  1 United States           95893. 100304472           1046
    ##  2 India                   43170.  44680757           1035
    ##  3 France                  36581.  38337350           1048
    ##  4 Germany                 35804.  37594526           1050
    ##  5 Brazil                  35376.  36578865           1034
    ##  6 Japan                   29359.  31032204           1057
    ##  7 South Korea             28107.  29737769           1058
    ##  8 Italy                   23962.  25279682           1055
    ##  9 United Kingdom          23177.  24243393           1046
    ## 10 Russia                  21190.  21846722           1031
    ## 11 Turkey                  16493.  17004677           1031
    ## 12 Spain                   13079.  13693478           1047
    ## 13 Vietnam                 11223.  11526034           1027
    ## 14 Australia               10643.  11047174           1038
    ## 15 China                    9950.  10855369           1091
    ## 16 Argentina                9648.  10004679           1037
    ## 17 Netherlands              8231.   8576523           1042
    ## 18 Iran                     7182.   7562275           1053
    ## 19 Mexico                   7037.   7297914           1037
    ## 20 Indonesia                6498.   6725458           1035

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       672.             699163.           1040
    ##  2 Israel                        626.             649320.           1038
    ##  3 Denmark                       596.             619319.           1039
    ##  4 South Korea                   580.             614129.           1058
    ##  5 France                        565.             591915.           1048
    ##  6 Switzerland                   553.             578242.           1046
    ##  7 Portugal                      503.             520601.           1035
    ##  8 Australia                     495.             513446.           1038
    ##  9 Netherlands                   494.             515261.           1042
    ## 10 Greece                        486.             504408.           1037
    ## 11 Germany                       438.             459578.           1050
    ## 12 Belgium                       431.             450461.           1044
    ## 13 Czech Republic                422.             437630.           1037
    ## 14 Italy                         397.             418952.           1055
    ## 15 United Kingdom                372.             388837.           1046
    ## 16 Slovakia                      331.             340979.           1031
    ## 17 Serbia                        325.             334563.           1030
    ## 18 United States                 309.             323320.           1046
    ## 19 Chile                         294.             303262.           1033
    ## 20 Norway                        282.             294811.           1045

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4995    63702
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.89     218455  4471726
    ##  6 Egypt                 4.81      24803   515556
    ##  7 Mexico                4.54     331407  7297914
    ##  8 Afghanistan           3.78       7854   207900
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        315     9506
    ## 11 Myanmar               3.08      19490   633731
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38136  1293949
    ## 14 Paraguay              2.71      19716   728605
    ## 15 Tunisia               2.55      29288  1147729
    ## 16 Algeria               2.54       6881   271255
    ## 17 Chad                  2.54        194     7651
    ## 18 South Africa          2.53     102568  4050288
    ## 19 Haiti                 2.53        860    33969
    ## 20 Sri Lanka             2.50      16821   671954

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7304.     218455   29.9 
    ##  2 Bulgaria               5335.      38136    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4032.      42242   10.5 
    ##  5 Slovakia               3825.      20866    5.46
    ##  6 Chile                  3788.      63437   16.7 
    ##  7 United States          3510.    1088854  310.  
    ##  8 Brazil                 3456.     695088  201.  
    ##  9 United Kingdom         3242.     202157   62.3 
    ## 10 Belgium                3218.      33478   10.4 
    ## 11 Greece                 3185       35035   11   
    ## 12 Argentina              3150.     130249   41.3 
    ## 13 Paraguay               3092.      19716    6.38
    ## 14 Poland                 3082.     118640   38.5 
    ## 15 Italy                  3073.     185417   60.3 
    ## 16 Romania                3072.      67460   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2947.     331407  112.  
    ## 19 Russia                 2802.     394309  141.  
    ## 20 Tunisia                2766.      29288   10.6

EOL
