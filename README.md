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

Updated: 2023-04-27

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
    ##  1 United States           89714. 103081453           1149
    ##  2 China                   83119.  99244445           1194
    ##  3 India                   39460.  44905827           1138
    ##  4 France                  33789.  38890876           1151
    ##  5 Germany                 33301.  38396459           1153
    ##  6 Brazil                  32900.  37407232           1137
    ##  7 Japan                   29007.  33647899           1160
    ##  8 South Korea             26773.  31083586           1161
    ##  9 Italy                   22250.  25765219           1158
    ## 10 United Kingdom          21384.  24569895           1149
    ## 11 Russia                  20124.  22820815           1134
    ## 12 Turkey                  14995.  17004677           1134
    ## 13 Spain                   12022.  13825052           1150
    ## 14 Vietnam                 10217.  11544777           1130
    ## 15 Australia                9822.  11206733           1141
    ## 16 Argentina                8811.  10044957           1140
    ## 17 Netherlands              7520.   8610372           1145
    ## 18 Mexico                   6646.   7576730           1140
    ## 19 Iran                     6580.   7606689           1156
    ## 20 Indonesia                5945.   6765727           1138

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       646.             738651.           1143
    ##  2 Israel                        575.             655550.           1141
    ##  3 South Korea                   553.             641923.           1161
    ##  4 Denmark                       545.             622056.           1142
    ##  5 France                        522.             600461.           1151
    ##  6 Switzerland                   505.             580579.           1149
    ##  7 Greece                        478.             545449.           1140
    ##  8 Portugal                      459.             522742.           1138
    ##  9 Australia                     456.             520862.           1141
    ## 10 Netherlands                   452.             517295.           1145
    ## 11 Germany                       407.             469381.           1153
    ## 12 Belgium                       401.             460498.           1147
    ## 13 Czech Republic                388.             442888.           1140
    ## 14 Italy                         369.             426998.           1158
    ## 15 United Kingdom                343.             394074.           1149
    ## 16 Serbia                        304.             344768.           1133
    ## 17 Slovakia                      302.             342129.           1134
    ## 18 United States                 289.             332271.           1149
    ## 19 Chile                         278.             315390.           1136
    ## 20 Spain                         258.             297275.           1150

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.89       5046    63993
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27334
    ##  5 Peru                  4.89     220073  4499355
    ##  6 Egypt                 4.81      24826   515970
    ##  7 Mexico                4.41     333764  7576730
    ##  8 Afghanistan           3.68       7888   214112
    ##  9 Ecuador               3.39      36019  1061100
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   634471
    ## 12 Malawi                3.03       2686    88625
    ## 13 Bulgaria              2.94      38316  1303628
    ## 14 Paraguay              2.70      19880   735759
    ## 15 Tunisia               2.55      29378  1152483
    ## 16 Algeria               2.53       6881   271673
    ## 17 South Africa          2.52     102595  4072533
    ## 18 Haiti                 2.51        860    34226
    ## 19 Sri Lanka             2.51      16839   672139
    ## 20 Chad                  2.48        194     7820

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7359.     220073   29.9 
    ##  2 Bulgaria               5360.      38316    7.15
    ##  3 Hungary                4884.      48754    9.98
    ##  4 Czech Republic         4081.      42757   10.5 
    ##  5 Slovakia               3880.      21167    5.46
    ##  6 Chile                  3651.      61142   16.7 
    ##  7 United States          3616.    1121819  310.  
    ##  8 United Kingdom         3583.     223396   62.3 
    ##  9 Brazil                 3487.     701215  201.  
    ## 10 Greece                 3337.      36711   11   
    ## 11 Belgium                3286.      34188   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3142.     189582   60.3 
    ## 14 Paraguay               3118.      19880    6.38
    ## 15 Poland                 3105.     119531   38.5 
    ## 16 Romania                3097.      68001   22.0 
    ## 17 Colombia               2986.     142706   47.8 
    ## 18 Mexico                 2968.     333764  112.  
    ## 19 Russia                 2830.     398142  141.  
    ## 20 Tunisia                2774.      29378   10.6

EOL
