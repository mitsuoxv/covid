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

Updated: 2023-03-23

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
<https://covid19.who.int/WHO-COVID-19-global-data.csv>. Starting from
the week of 20 February 2023, it will be updated once per week on
Wednesdays.

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
    ##  1 United States           92133. 102544598           1113
    ##  2 China                   85690.  99229372           1158
    ##  3 India                   40560.  44696984           1102
    ##  4 France                  34640.  38623552           1115
    ##  5 Germany                 34294.  38306781           1117
    ##  6 Brazil                  33738.  37145514           1101
    ##  7 Japan                   29692.  33374303           1124
    ##  8 South Korea             27291.  30702960           1125
    ##  9 Italy                   22862.  25651205           1122
    ## 10 United Kingdom          21966.  24448729           1113
    ## 11 Russia                  20515.  22525882           1098
    ## 12 Turkey                  15487.  17004677           1098
    ## 13 Spain                   12373.  13783163           1114
    ## 14 Vietnam                 10537.  11527139           1094
    ## 15 Australia               10299.  11380700           1105
    ## 16 Argentina                9099.  10044957           1104
    ## 17 Netherlands              7760.   8605996           1109
    ## 18 Mexico                   6804.   7511450           1104
    ## 19 Iran                     6768.   7580858           1120
    ## 20 Indonesia                6118.   6742061           1102

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       661.             731689.           1107
    ##  2 Israel                        592.             654021.           1105
    ##  3 South Korea                   564.             634062.           1125
    ##  4 Denmark                       561.             621026.           1106
    ##  5 France                        535.             596333.           1115
    ##  6 Switzerland                   521.             579646.           1113
    ##  7 Greece                        488.             538221.           1104
    ##  8 Australia                     479.             528947.           1105
    ##  9 Portugal                      474.             522060.           1102
    ## 10 Netherlands                   466.             517032.           1109
    ## 11 Germany                       419.             468285.           1117
    ## 12 Belgium                       412.             457315.           1111
    ## 13 Czech Republic                400.             441718.           1104
    ## 14 Italy                         379.             425109.           1122
    ## 15 United Kingdom                352.             392131.           1113
    ## 16 Serbia                        311.             341612.           1097
    ## 17 Slovakia                      311.             341841.           1098
    ## 18 United States                 297.             330541.           1113
    ## 19 Chile                         284.             312511.           1100
    ## 20 Spain                         266.             296374.           1114

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.87       5026    63899
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27334
    ##  5 Peru                  4.89     219648  4489377
    ##  6 Egypt                 4.81      24819   515852
    ##  7 Mexico                4.44     333327  7511450
    ##  8 Afghanistan           3.76       7881   209848
    ##  9 Ecuador               3.40      36016  1058004
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   633993
    ## 12 Malawi                3.03       2686    88613
    ## 13 Bulgaria              2.94      38240  1298608
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29345  1151333
    ## 16 Algeria               2.53       6881   271542
    ## 17 Chad                  2.53        194     7682
    ## 18 South Africa          2.52     102595  4068224
    ## 19 Haiti                 2.51        860    34202
    ## 20 Sri Lanka             2.50      16832   672054

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7344.     219648   29.9 
    ##  2 Bulgaria               5349.      38240    7.15
    ##  3 Hungary                4878.      48690    9.98
    ##  4 Czech Republic         4064.      42576   10.5 
    ##  5 Slovakia               3862.      21069    5.46
    ##  6 Chile                  3846.      64407   16.7 
    ##  7 United States          3594.    1114970  310.  
    ##  8 Brazil                 3479.     699634  201.  
    ##  9 United Kingdom         3358.     209396   62.3 
    ## 10 Greece                 3313.      36447   11   
    ## 11 Belgium                3257.      33885   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3128.     188750   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3095.     119170   38.5 
    ## 16 Romania                3088.      67821   22.0 
    ## 17 Colombia               2985.     142652   47.8 
    ## 18 Mexico                 2964.     333327  112.  
    ## 19 Russia                 2821.     396899  141.  
    ## 20 Tunisia                2771.      29345   10.6

EOL
