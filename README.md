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

Updated: 2023-03-03

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
    ##  1 United States           93424. 102019564           1092
    ##  2 China                   87098.  99030129           1137
    ##  3 India                   41338.  44686371           1081
    ##  4 France                  35204.  38513431           1094
    ##  5 Germany                 34803.  38144033           1096
    ##  6 Brazil                  34282.  37024417           1080
    ##  7 Japan                   30091.  33190296           1103
    ##  8 South Korea             27639.  30513721           1104
    ##  9 Italy                   23230.  25576852           1101
    ## 10 United Kingdom          22317.  24370154           1092
    ## 11 Russia                  20680.  22272470           1077
    ## 12 Turkey                  15789.  17004677           1077
    ## 13 Spain                   12592.  13763336           1093
    ## 14 Vietnam                 10743.  11526905           1073
    ## 15 Australia               10482.  11362275           1084
    ## 16 Argentina                9274.  10044125           1083
    ## 17 Netherlands              7899.   8594150           1088
    ## 18 Iran                     6886.   7567702           1099
    ## 19 Mexico                   6880.   7450992           1083
    ## 20 Indonesia                6231.   6736046           1081

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             719732.           1086
    ##  2 Israel                        602.             652564.           1084
    ##  3 Denmark                       572.             620573.           1085
    ##  4 South Korea                   571.             630154.           1104
    ##  5 France                        544.             594633.           1094
    ##  6 Switzerland                   530.             579034.           1092
    ##  7 Greece                        493.             533769.           1083
    ##  8 Australia                     487.             528091.           1084
    ##  9 Portugal                      482.             521552.           1081
    ## 10 Netherlands                   475.             516320.           1088
    ## 11 Germany                       425.             466296.           1096
    ## 12 Belgium                       416.             453490.           1090
    ## 13 Czech Republic                406.             440036.           1083
    ## 14 Italy                         385.             423877.           1101
    ## 15 United Kingdom                358.             390870.           1092
    ## 16 Slovakia                      317.             341501.           1077
    ## 17 Serbia                        315.             339245.           1076
    ## 18 United States                 301.             328848.           1092
    ## 19 Chile                         286.             308418.           1079
    ## 20 Spain                         271.             295948.           1093

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.86       5013    63809
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27324
    ##  5 Peru                  4.89     219429  4485684
    ##  6 Egypt                 4.81      24809   515698
    ##  7 Mexico                4.47     332986  7450992
    ##  8 Afghanistan           3.76       7879   209322
    ##  9 Ecuador               3.41      36014  1057121
    ## 10 Niger                 3.31        315     9512
    ## 11 Myanmar               3.07      19490   633914
    ## 12 Malawi                3.03       2686    88584
    ## 13 Bulgaria              2.95      38216  1296773
    ## 14 Paraguay              2.70      19870   735664
    ## 15 Tunisia               2.55      29330  1150793
    ## 16 Algeria               2.54       6881   271432
    ## 17 Chad                  2.53        194     7675
    ## 18 South Africa          2.53     102595  4060385
    ## 19 Haiti                 2.52        860    34076
    ## 20 Sri Lanka             2.50      16830   672029

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7337.     219429   29.9 
    ##  2 Bulgaria               5346.      38216    7.15
    ##  3 Hungary                4874.      48650    9.98
    ##  4 Czech Republic         4051.      42436   10.5 
    ##  5 Slovakia               3854.      21021    5.46
    ##  6 Chile                  3832.      64174   16.7 
    ##  7 United States          3575.    1109145  310.  
    ##  8 Brazil                 3476.     698947  201.  
    ##  9 United Kingdom         3319.     206952   62.3 
    ## 10 Greece                 3290.      36185   11   
    ## 11 Belgium                3241.      33717   10.4 
    ## 12 Argentina              3156.     130463   41.3 
    ## 13 Italy                  3117.     188094   60.3 
    ## 14 Paraguay               3116.      19870    6.38
    ## 15 Poland                 3088.     118884   38.5 
    ## 16 Romania                3083.      67704   22.0 
    ## 17 Colombia               2984.     142615   47.8 
    ## 18 Mexico                 2961.     332986  112.  
    ## 19 Russia                 2815.     396100  141.  
    ## 20 Tunisia                2770.      29330   10.6

EOL
