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

Updated: 2023-04-06

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
    ##  1 United States           91200. 102873924           1128
    ##  2 China                   84602.  99238586           1173
    ##  3 India                   40044.  44729284           1117
    ##  4 France                  34279.  38735658           1130
    ##  5 Germany                 33886.  38359611           1132
    ##  6 Brazil                  33386.  37258663           1116
    ##  7 Japan                   29385.  33469149           1139
    ##  8 South Korea             27057.  30844726           1140
    ##  9 Italy                   22599.  25695311           1137
    ## 10 United Kingdom          21553.  24311933           1128
    ## 11 Russia                  20369.  22671103           1113
    ## 12 Turkey                  15278.  17004677           1113
    ## 13 Spain                   12222.  13798747           1129
    ## 14 Vietnam                 10394.  11527326           1109
    ## 15 Australia                9912.  11101234           1120
    ## 16 Argentina                8977.  10044957           1119
    ## 17 Netherlands              7660.   8609661           1124
    ## 18 Mexico                   6742.   7544489           1119
    ## 19 Iran                     6689.   7592255           1135
    ## 20 Indonesia                6041.   6748308           1117

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       656.             735892.           1122
    ##  2 Israel                        585.             654771.           1120
    ##  3 South Korea                   559.             636990.           1140
    ##  4 Denmark                       554.             621632.           1121
    ##  5 France                        529.             598064.           1130
    ##  6 Switzerland                   514.             580278.           1128
    ##  7 Greece                        485.             542331.           1119
    ##  8 Portugal                      468.             522348.           1117
    ##  9 Australia                     461.             515958.           1120
    ## 10 Netherlands                   460.             517252.           1124
    ## 11 Germany                       414.             468931.           1132
    ## 12 Belgium                       408.             459179.           1126
    ## 13 Czech Republic                395.             442429.           1119
    ## 14 Italy                         375.             425840.           1137
    ## 15 United Kingdom                346.             389936.           1128
    ## 16 Serbia                        309.             343125.           1112
    ## 17 Slovakia                      307.             341995.           1113
    ## 18 United States                 294.             331602.           1128
    ## 19 Chile                         282.             314354.           1115
    ## 20 Spain                         263.             296709.           1129

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.88       5034    63922
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27334
    ##  5 Peru                  4.89     219784  4492891
    ##  6 Egypt                 4.81      24821   515882
    ##  7 Mexico                4.42     333539  7544489
    ##  8 Afghanistan           3.74       7883   210864
    ##  9 Ecuador               3.40      36017  1059529
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   634086
    ## 12 Malawi                3.03       2686    88616
    ## 13 Bulgaria              2.94      38268  1300490
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29362  1151832
    ## 16 Algeria               2.53       6881   271592
    ## 17 Chad                  2.52        194     7695
    ## 18 South Africa          2.52     102595  4072533
    ## 19 Haiti                 2.51        860    34202
    ## 20 Sri Lanka             2.50      16834   672079

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7349.     219784   29.9 
    ##  2 Bulgaria               5353.      38268    7.15
    ##  3 Hungary                4881.      48719    9.98
    ##  4 Czech Republic         4073.      42671   10.5 
    ##  5 Slovakia               3871.      21114    5.46
    ##  6 Chile                  3646.      61050   16.7 
    ##  7 United States          3606.    1118800  310.  
    ##  8 Brazil                 3482.     700239  201.  
    ##  9 United Kingdom         3387.     211155   62.3 
    ## 10 Greece                 3326.      36582   11   
    ## 11 Belgium                3274.      34059   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3134.     189089   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3101.     119378   38.5 
    ## 16 Romania                3093.      67917   22.0 
    ## 17 Colombia               2986.     142678   47.8 
    ## 18 Mexico                 2966.     333539  112.  
    ## 19 Russia                 2824.     397384  141.  
    ## 20 Tunisia                2773.      29362   10.6

EOL
