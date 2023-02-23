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

Updated: 2023-02-24

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
    ##  1 United States           93781. 101752396           1085
    ##  2 China                   87551.  98932687           1130
    ##  3 India                   41606.  44685132           1074
    ##  4 France                  35407.  38487043           1087
    ##  5 Germany                 34911.  38018111           1089
    ##  6 Brazil                  34473.  36989373           1073
    ##  7 Japan                   30199.  33097952           1096
    ##  8 South Korea             27754.  30445775           1097
    ##  9 Italy                   23352.  25547414           1094
    ## 10 United Kingdom          22435.  24341615           1085
    ## 11 Russia                  20738.  22189988           1070
    ## 12 Turkey                  15892.  17004677           1070
    ## 13 Spain                   12667.  13755956           1086
    ## 14 Vietnam                 10813.  11526825           1066
    ## 15 Australia               10533.  11344054           1077
    ## 16 Argentina                9333.  10042136           1076
    ## 17 Netherlands              7946.   8589725           1081
    ## 18 Iran                     6929.   7566803           1092
    ## 19 Mexico                   6905.   7429778           1076
    ## 20 Indonesia                6270.   6734606           1074

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             714981.           1079
    ##  2 Israel                        605.             652070.           1077
    ##  3 Denmark                       575.             620428.           1078
    ##  4 South Korea                   573.             628751.           1097
    ##  5 France                        547.             594226.           1087
    ##  6 Switzerland                   534.             578874.           1085
    ##  7 Greece                        494.             531814.           1076
    ##  8 Australia                     490.             527244.           1077
    ##  9 Portugal                      485.             521423.           1074
    ## 10 Netherlands                   477.             516054.           1081
    ## 11 Germany                       427.             464756.           1089
    ## 12 Belgium                       418.             452588.           1083
    ## 13 Czech Republic                408.             439385.           1076
    ## 14 Italy                         387.             423389.           1094
    ## 15 United Kingdom                360.             390413.           1085
    ## 16 Slovakia                      319.             341385.           1070
    ## 17 Serbia                        317.             338445.           1069
    ## 18 United States                 302.             327987.           1085
    ## 19 Chile                         287.             307564.           1072
    ## 20 Spain                         272.             295789.           1086

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.86       5011    63787
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27324
    ##  5 Peru                  4.89     219344  4484531
    ##  6 Egypt                 4.81      24809   515698
    ##  7 Mexico                4.48     332839  7429778
    ##  8 Afghanistan           3.77       7878   209166
    ##  9 Ecuador               3.41      36008  1056578
    ## 10 Niger                 3.31        315     9512
    ## 11 Myanmar               3.07      19490   633901
    ## 12 Malawi                3.03       2686    88543
    ## 13 Bulgaria              2.95      38206  1296299
    ## 14 Paraguay              2.70      19849   734840
    ## 15 Tunisia               2.55      29326  1150606
    ## 16 Algeria               2.54       6881   271424
    ## 17 Chad                  2.53        194     7661
    ## 18 South Africa          2.53     102595  4058915
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16829   672022

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7334.     219344   29.9 
    ##  2 Bulgaria               5344.      38206    7.15
    ##  3 Hungary                4874.      48650    9.98
    ##  4 Czech Republic         4046.      42391   10.5 
    ##  5 Slovakia               3850.      21003    5.46
    ##  6 Chile                  3828.      64102   16.7 
    ##  7 United States          3568.    1106783  310.  
    ##  8 Brazil                 3471.     698056  201.  
    ##  9 United Kingdom         3308.     206246   62.3 
    ## 10 Greece                 3280.      36077   11   
    ## 11 Belgium                3236.      33663   10.4 
    ## 12 Argentina              3155.     130448   41.3 
    ## 13 Italy                  3113.     187850   60.3 
    ## 14 Paraguay               3113.      19849    6.38
    ## 15 Poland                 3087.     118833   38.5 
    ## 16 Romania                3081.      67650   22.0 
    ## 17 Colombia               2984.     142596   47.8 
    ## 18 Mexico                 2959.     332839  112.  
    ## 19 Russia                 2814.     395867  141.  
    ## 20 Tunisia                2769.      29326   10.6

EOL
