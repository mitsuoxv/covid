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

Updated: 2023-04-13

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
    ##  1 United States           90638. 102873924           1135
    ##  2 China                   84101.  99239252           1180
    ##  3 India                   39829.  44768172           1124
    ##  4 France                  34117.  38791479           1137
    ##  5 Germany                 33686.  38368891           1139
    ##  6 Brazil                  33232.  37319254           1123
    ##  7 Japan                   29253.  33523927           1146
    ##  8 South Korea             26955.  30918060           1147
    ##  9 Italy                   22478.  25715384           1144
    ## 10 United Kingdom          21436.  24330379           1135
    ## 11 Russia                  20292.  22727542           1120
    ## 12 Turkey                  15183.  17004677           1120
    ## 13 Spain                   12147.  13798747           1136
    ## 14 Vietnam                 10329.  11527745           1116
    ## 15 Australia                9897.  11153745           1127
    ## 16 Argentina                8921.  10044957           1126
    ## 17 Netherlands              7613.   8610372           1131
    ## 18 Mexico                   6708.   7553646           1126
    ## 19 Iran                     6653.   7597982           1142
    ## 20 Indonesia                6008.   6752606           1124

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       653.             736984.           1129
    ##  2 Israel                        581.             655054.           1127
    ##  3 South Korea                   557.             638504.           1147
    ##  4 Denmark                       551.             621741.           1128
    ##  5 France                        527.             598926.           1137
    ##  6 Switzerland                   511.             580278.           1135
    ##  7 Greece                        482.             542978.           1126
    ##  8 Portugal                      465.             522464.           1124
    ##  9 Australia                     460.             518399.           1127
    ## 10 Netherlands                   457.             517295.           1131
    ## 11 Germany                       412.             469044.           1139
    ## 12 Belgium                       406.             459758.           1133
    ## 13 Czech Republic                393.             442562.           1126
    ## 14 Italy                         373.             426172.           1144
    ## 15 United Kingdom                344.             390232.           1135
    ## 16 Serbia                        307.             343734.           1119
    ## 17 Slovakia                      305.             342040.           1120
    ## 18 United States                 292.             331602.           1135
    ## 19 Chile                         281.             314858.           1122
    ## 20 Spain                         261.             296709.           1136

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
    ##  5 Peru                  4.89     219866  4492891
    ##  6 Egypt                 4.81      24823   515913
    ##  7 Mexico                4.42     333596  7553646
    ##  8 Afghanistan           3.73       7884   211630
    ##  9 Ecuador               3.40      36017  1059529
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   634105
    ## 12 Malawi                3.03       2686    88620
    ## 13 Bulgaria              2.94      38282  1301475
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29363  1152033
    ## 16 Algeria               2.53       6881   271613
    ## 17 Chad                  2.52        194     7696
    ## 18 South Africa          2.52     102595  4072533
    ## 19 Haiti                 2.51        860    34202
    ## 20 Sri Lanka             2.50      16835   672092

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7352.     219866   29.9 
    ##  2 Bulgaria               5355.      38282    7.15
    ##  3 Hungary                4881.      48719    9.98
    ##  4 Czech Republic         4076.      42702   10.5 
    ##  5 Slovakia               3872.      21123    5.46
    ##  6 Chile                  3851.      64497   16.7 
    ##  7 United States          3606.    1118800  310.  
    ##  8 Brazil                 3484.     700556  201.  
    ##  9 United Kingdom         3402.     212083   62.3 
    ## 10 Greece                 3330.      36629   11   
    ## 11 Belgium                3279.      34115   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3137.     189262   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3102.     119423   38.5 
    ## 16 Romania                3095.      67961   22.0 
    ## 17 Colombia               2986.     142690   47.8 
    ## 18 Mexico                 2966.     333596  112.  
    ## 19 Russia                 2826.     397642  141.  
    ## 20 Tunisia                2773.      29363   10.6

EOL
