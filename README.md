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

Updated: 2023-01-21

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
    ##  1 United States           95256. 100304472           1053
    ##  2 India                   42881.  44681650           1042
    ##  3 France                  36372.  38372611           1055
    ##  4 Germany                 35629.  37659518           1057
    ##  5 Brazil                  35233.  36677844           1041
    ##  6 Japan                   29905.  31819310           1064
    ##  7 South Korea             28127.  29955366           1065
    ##  8 Italy                   23883.  25363742           1062
    ##  9 United Kingdom          23038.  24259240           1053
    ## 10 Russia                  21081.  21882414           1038
    ## 11 Turkey                  16382.  17004677           1038
    ## 12 Spain                   13009.  13711251           1054
    ## 13 Vietnam                 11147.  11526284           1034
    ## 14 Australia               10784.  11269081           1045
    ## 15 China                   10019.  11001439           1098
    ## 16 Argentina                9602.  10024095           1044
    ## 17 Netherlands              8178.   8578818           1049
    ## 18 Iran                     7135.   7562998           1060
    ## 19 Mexico                   7006.   7314891           1044
    ## 20 Indonesia                6456.   6727609           1042

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       669.             700760.           1047
    ##  2 Israel                        622.             649953.           1045
    ##  3 Denmark                       592.             619607.           1046
    ##  4 South Korea                   581.             618623.           1065
    ##  5 France                        562.             592459.           1055
    ##  6 Switzerland                   549.             578407.           1053
    ##  7 Australia                     501.             523760.           1045
    ##  8 Portugal                      500.             521002.           1042
    ##  9 Greece                        495.             516718.           1044
    ## 10 Netherlands                   491.             515399.           1049
    ## 11 Germany                       436.             460373.           1057
    ## 12 Belgium                       429.             450728.           1051
    ## 13 Czech Republic                419.             437796.           1044
    ## 14 Italy                         396.             420345.           1062
    ## 15 United Kingdom                370.             389091.           1053
    ## 16 Slovakia                      329.             341039.           1038
    ## 17 Serbia                        323.             335361.           1037
    ## 18 United States                 307.             323320.           1053
    ## 19 Chile                         293.             304355.           1040
    ## 20 Norway                        280.             294916.           1052

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.85       5001    63725
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.88     218580  4477064
    ##  6 Egypt                 4.81      24805   515580
    ##  7 Mexico                4.53     331595  7314891
    ##  8 Afghanistan           3.78       7863   208034
    ##  9 Ecuador               3.43      35936  1047624
    ## 10 Niger                 3.31        315     9508
    ## 11 Myanmar               3.08      19490   633785
    ## 12 Malawi                3.04       2686    88349
    ## 13 Bulgaria              2.95      38157  1294697
    ## 14 Paraguay              2.71      19746   729384
    ## 15 Tunisia               2.55      29291  1150217
    ## 16 Algeria               2.54       6881   271287
    ## 17 Chad                  2.54        194     7651
    ## 18 Haiti                 2.53        860    33969
    ## 19 South Africa          2.53     102568  4051891
    ## 20 Sri Lanka             2.50      16824   671970

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7309.     218580   29.9 
    ##  2 Bulgaria               5338.      38157    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4035.      42275   10.5 
    ##  5 Slovakia               3831.      20897    5.46
    ##  6 Chile                  3798.      63599   16.7 
    ##  7 United States          3510.    1088854  310.  
    ##  8 Brazil                 3459.     695615  201.  
    ##  9 United Kingdom         3260.     203229   62.3 
    ## 10 Belgium                3223.      33525   10.4 
    ## 11 Greece                 3217.      35392   11   
    ## 12 Argentina              3153.     130338   41.3 
    ## 13 Paraguay               3097.      19746    6.38
    ## 14 Poland                 3083.     118678   38.5 
    ## 15 Italy                  3082.     185993   60.3 
    ## 16 Romania                3074.      67504   22.0 
    ## 17 Colombia               2979.     142385   47.8 
    ## 18 Mexico                 2948.     331595  112.  
    ## 19 Russia                 2805.     394610  141.  
    ## 20 Tunisia                2766.      29291   10.6

EOL
