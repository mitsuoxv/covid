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

Updated: 2023-01-17

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
    ##  1 United States           95619. 100304472           1049
    ##  2 India                   43045.  44681154           1038
    ##  3 France                  36487.  38347754           1051
    ##  4 Germany                 35712.  37605135           1053
    ##  5 Brazil                  35274.  36578865           1037
    ##  6 Japan                   29638.  31416633           1060
    ##  7 South Korea             28106.  29821035           1061
    ##  8 Italy                   23973.  25363742           1058
    ##  9 United Kingdom          23111.  24243393           1049
    ## 10 Russia                  21142.  21860902           1034
    ## 11 Turkey                  16445.  17004677           1034
    ## 12 Spain                   13058.  13711251           1050
    ## 13 Vietnam                 11190.  11526140           1030
    ## 14 Australia               10796.  11238924           1041
    ## 15 China                    9984.  10922742           1094
    ## 16 Argentina                9620.  10004679           1040
    ## 17 Netherlands              8208.   8577856           1045
    ## 18 Iran                     7161.   7562610           1056
    ## 19 Mexico                   7017.   7297914           1040
    ## 20 Indonesia                6480.   6726311           1038

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       671.             699824.           1043
    ##  2 Israel                        624.             649553.           1041
    ##  3 Denmark                       594.             619451.           1042
    ##  4 South Korea                   580.             615849.           1061
    ##  5 France                        563.             592075.           1051
    ##  6 Switzerland                   551.             578242.           1049
    ##  7 Australia                     502.             522358.           1041
    ##  8 Portugal                      502.             520601.           1038
    ##  9 Netherlands                   493.             515341.           1045
    ## 10 Greece                        485.             504408.           1040
    ## 11 Germany                       437.             459708.           1053
    ## 12 Belgium                       430.             450461.           1047
    ## 13 Czech Republic                421.             437662.           1040
    ## 14 Italy                         397.             420345.           1058
    ## 15 United Kingdom                371.             388837.           1049
    ## 16 Slovakia                      330.             340992.           1034
    ## 17 Serbia                        324.             334851.           1033
    ## 18 United States                 308.             323320.           1049
    ## 19 Chile                         293.             303262.           1036
    ## 20 Norway                        281.             294852.           1048

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
    ##  5 Peru                  4.89     218455  4471726
    ##  6 Egypt                 4.81      24803   515556
    ##  7 Mexico                4.54     331407  7297914
    ##  8 Afghanistan           3.78       7855   207969
    ##  9 Ecuador               3.43      35936  1047624
    ## 10 Niger                 3.31        315     9507
    ## 11 Myanmar               3.08      19490   633750
    ## 12 Malawi                3.04       2685    88282
    ## 13 Bulgaria              2.95      38139  1294152
    ## 14 Paraguay              2.71      19716   728605
    ## 15 Tunisia               2.55      29288  1147729
    ## 16 Algeria               2.54       6881   271255
    ## 17 Chad                  2.54        194     7651
    ## 18 South Africa          2.53     102568  4051060
    ## 19 Haiti                 2.53        860    33969
    ## 20 Sri Lanka             2.50      16823   671964

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7304.     218455   29.9 
    ##  2 Bulgaria               5335.      38139    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4034.      42258   10.5 
    ##  5 Slovakia               3827.      20878    5.46
    ##  6 Chile                  3788.      63437   16.7 
    ##  7 United States          3510.    1088854  310.  
    ##  8 Brazil                 3456.     695088  201.  
    ##  9 United Kingdom         3242.     202157   62.3 
    ## 10 Belgium                3218.      33478   10.4 
    ## 11 Greece                 3185       35035   11   
    ## 12 Argentina              3150.     130249   41.3 
    ## 13 Paraguay               3092.      19716    6.38
    ## 14 Italy                  3082.     185993   60.3 
    ## 15 Poland                 3082.     118651   38.5 
    ## 16 Romania                3074.      67504   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2947.     331407  112.  
    ## 19 Russia                 2803.     394438  141.  
    ## 20 Tunisia                2766.      29288   10.6

EOL
