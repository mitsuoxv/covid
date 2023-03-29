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

Updated: 2023-03-30

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
    ##  1 United States           91612. 102697566           1121
    ##  2 China                   85110.  99238143           1166
    ##  3 India                   40277.  44707525           1110
    ##  4 France                  34441.  38677413           1123
    ##  5 Germany                 34078.  38338298           1125
    ##  6 Brazil                  33548.  37204677           1109
    ##  7 Japan                   29524.  33421785           1132
    ##  8 South Korea             27161.  30773460           1133
    ##  9 Italy                   22720.  25673442           1130
    ## 10 United Kingdom          21665.  24286411           1121
    ## 11 Russia                  20437.  22603646           1106
    ## 12 Turkey                  15375.  17004677           1106
    ## 13 Spain                   12291.  13790580           1122
    ## 14 Vietnam                 10460.  11527210           1102
    ## 15 Australia                9953.  11077631           1113
    ## 16 Argentina                9033.  10044957           1112
    ## 17 Netherlands              7706.   8608123           1117
    ## 18 Mexico                   6770.   7527885           1112
    ## 19 Iran                     6725.   7585422           1128
    ## 20 Indonesia                6076.   6744873           1110

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       659.             734293.           1115
    ##  2 Israel                        588.             654447.           1113
    ##  3 South Korea                   561.             635518.           1133
    ##  4 Denmark                       558.             621408.           1114
    ##  5 France                        532.             597165.           1123
    ##  6 Switzerland                   517.             579878.           1121
    ##  7 Greece                        487.             541081.           1112
    ##  8 Portugal                      470.             522202.           1110
    ##  9 Netherlands                   463.             517160.           1117
    ## 10 Australia                     463.             514861.           1113
    ## 11 Germany                       417.             468670.           1125
    ## 12 Belgium                       410.             458303.           1119
    ## 13 Czech Republic                398.             442135.           1112
    ## 14 Italy                         377.             425477.           1130
    ## 15 United Kingdom                347.             389527.           1121
    ## 16 Serbia                        310.             342435.           1105
    ## 17 Slovakia                      309.             341922.           1106
    ## 18 United States                 295.             331034.           1121
    ## 19 Chile                         283.             313834.           1108
    ## 20 Spain                         264.             296534.           1122

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
    ##  5 Peru                  4.89     219741  4491653
    ##  6 Egypt                 4.81      24821   515882
    ##  7 Mexico                4.43     333449  7527885
    ##  8 Afghanistan           3.75       7882   210181
    ##  9 Ecuador               3.40      36017  1059009
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   634076
    ## 12 Malawi                3.03       2686    88616
    ## 13 Bulgaria              2.94      38250  1299557
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29355  1151593
    ## 16 Algeria               2.53       6881   271569
    ## 17 Chad                  2.52        194     7688
    ## 18 South Africa          2.52     102595  4070434
    ## 19 Haiti                 2.51        860    34202
    ## 20 Sri Lanka             2.50      16834   672068

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7347.     219741   29.9 
    ##  2 Bulgaria               5351.      38250    7.15
    ##  3 Hungary                4879.      48707    9.98
    ##  4 Czech Republic         4070.      42635   10.5 
    ##  5 Slovakia               3867.      21092    5.46
    ##  6 Chile                  3851.      64497   16.7 
    ##  7 United States          3601.    1117054  310.  
    ##  8 Brazil                 3480.     699917  201.  
    ##  9 United Kingdom         3375.     210396   62.3 
    ## 10 Greece                 3320.      36517   11   
    ## 11 Belgium                3267.      33982   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3131.     188933   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3098.     119265   38.5 
    ## 16 Romania                3090.      67858   22.0 
    ## 17 Colombia               2985.     142665   47.8 
    ## 18 Mexico                 2965.     333449  112.  
    ## 19 Russia                 2823.     397146  141.  
    ## 20 Tunisia                2772.      29355   10.6

EOL
