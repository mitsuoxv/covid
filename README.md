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

Updated: 2023-02-18

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
    ##  1 United States           93891. 101496168           1081
    ##  2 China                   87810.  98873697           1126
    ##  3 India                   41761.  44684658           1070
    ##  4 France                  35527.  38475606           1083
    ##  5 Germany                 35011.  37986750           1085
    ##  6 Brazil                  34575.  36960888           1069
    ##  7 Japan                   30257.  33040963           1092
    ##  8 South Korea             27821.  30408656           1093
    ##  9 Italy                   23412.  25519067           1090
    ## 10 United Kingdom          22518.  24341615           1081
    ## 11 Russia                  20766.  22137084           1066
    ## 12 Turkey                  15952.  17004677           1066
    ## 13 Spain                   12707.  13748918           1082
    ## 14 Vietnam                 10854.  11526786           1062
    ## 15 Australia               10555.  11326032           1073
    ## 16 Argentina                9368.  10042136           1072
    ## 17 Netherlands              7974.   8587919           1077
    ## 18 Iran                     6954.   7566043           1088
    ## 19 Mexico                   6917.   7414918           1072
    ## 20 Indonesia                6293.   6733912           1070

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             712898.           1075
    ##  2 Israel                        607.             651830.           1073
    ##  3 Denmark                       578.             620350.           1074
    ##  4 South Korea                   575.             627984.           1093
    ##  5 France                        549.             594049.           1083
    ##  6 Switzerland                   535.             578874.           1081
    ##  7 Greece                        495.             531150.           1072
    ##  8 Australia                     491.             526406.           1073
    ##  9 Portugal                      487.             521423.           1070
    ## 10 Netherlands                   479.             515946.           1077
    ## 11 Germany                       428.             464373.           1085
    ## 12 Belgium                       419.             452588.           1079
    ## 13 Czech Republic                410.             439092.           1072
    ## 14 Italy                         388.             422919.           1090
    ## 15 United Kingdom                361.             390413.           1081
    ## 16 Slovakia                      320.             341343.           1066
    ## 17 Serbia                        317.             338015.           1065
    ## 18 United States                 303.             327161.           1081
    ## 19 Chile                         288.             307182.           1068
    ## 20 Norway                        273.             295167.           1080

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.86       5011    63775
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27324
    ##  5 Peru                  4.89     219305  4484173
    ##  6 Egypt                 4.81      24809   515698
    ##  7 Mexico                4.49     332695  7414918
    ##  8 Afghanistan           3.77       7877   209059
    ##  9 Ecuador               3.41      36008  1056578
    ## 10 Niger                 3.31        315     9512
    ## 11 Myanmar               3.07      19490   633877
    ## 12 Malawi                3.03       2686    88543
    ## 13 Bulgaria              2.95      38201  1296119
    ## 14 Paraguay              2.70      19843   734244
    ## 15 Tunisia               2.55      29326  1150606
    ## 16 Algeria               2.54       6881   271406
    ## 17 Chad                  2.54        194     7652
    ## 18 South Africa          2.53     102595  4057134
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16829   672017

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7333.     219305   29.9 
    ##  2 Bulgaria               5344.      38201    7.15
    ##  3 Hungary                4874.      48650    9.98
    ##  4 Czech Republic         4044.      42369   10.5 
    ##  5 Slovakia               3848.      20993    5.46
    ##  6 Chile                  3824.      64040   16.7 
    ##  7 United States          3558.    1103936  310.  
    ##  8 Brazil                 3470.     697894  201.  
    ##  9 United Kingdom         3308.     206246   62.3 
    ## 10 Greece                 3279.      36066   11   
    ## 11 Belgium                3236.      33663   10.4 
    ## 12 Argentina              3155.     130448   41.3 
    ## 13 Paraguay               3112.      19843    6.38
    ## 14 Italy                  3108.     187551   60.3 
    ## 15 Poland                 3086.     118817   38.5 
    ## 16 Romania                3081.      67650   22.0 
    ## 17 Colombia               2984.     142596   47.8 
    ## 18 Mexico                 2958.     332695  112.  
    ## 19 Russia                 2813.     395727  141.  
    ## 20 Tunisia                2769.      29326   10.6

EOL
