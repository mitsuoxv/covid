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

Updated: 2022-11-26

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
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           97322. 97030505            997
    ##  2 India                   45305. 44670830            986
    ##  3 France                  36505. 36468916            999
    ##  4 Germany                 36312. 36348477           1001
    ##  5 Brazil                  35639. 35104673            985
    ##  6 South Korea             26598. 26837840           1009
    ##  7 United Kingdom          24072. 24000101            997
    ##  8 Japan                   23937. 24128914           1008
    ##  9 Italy                   23888. 24031538           1006
    ## 10 Russia                  21958. 21562758            982
    ## 11 Turkey                  17230. 16919638            982
    ## 12 Spain                   13601. 13573721            998
    ## 13 Vietnam                 11772. 11513173            978
    ## 14 Australia               10649. 10532366            989
    ## 15 Argentina                9842.  9723924            988
    ## 16 China                    9183.  9568798           1042
    ## 17 Netherlands              8597.  8536849            993
    ## 18 Iran                     7529.  7559446           1004
    ## 19 Mexico                   7212.  7125176            988
    ## 20 Indonesia                6729.  6634648            986

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       681.             674620.            991
    ##  2 Israel                        648.             640911.            989
    ##  3 Denmark                       616.             610681.            991
    ##  4 Switzerland                   569.             566947.            997
    ##  5 France                        564.             563067.            999
    ##  6 South Korea                   549.             554242.           1009
    ##  7 Portugal                      526.             518589.            986
    ##  8 Netherlands                   516.             512878.            993
    ##  9 Australia                     495.             489519.            989
    ## 10 Greece                        493.             487319.            988
    ## 11 Belgium                       447.             445363.            996
    ## 12 Germany                       444.             444346.           1001
    ## 13 Czech Republic                403.             398107.            988
    ## 14 Italy                         396.             398267.           1006
    ## 15 United Kingdom                386.             384935.            997
    ## 16 Slovakia                      346.             340139.            982
    ## 17 Serbia                        336.             329508.            981
    ## 18 United States                 314.             312767.            997
    ## 19 Chile                         297.             292317.            984
    ## 20 Norway                        294.             293091.            996

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4990    63637
    ##  3 Syria                 5.51       3163    57391
    ##  4 Peru                  5.17     217303  4203229
    ##  5 Somalia               4.99       1361    27286
    ##  6 Egypt                 4.81      24798   515431
    ##  7 Mexico                4.64     330495  7125176
    ##  8 Afghanistan           3.81       7833   205391
    ##  9 Ecuador               3.56      35940  1009958
    ## 10 Niger                 3.33        314     9434
    ## 11 Myanmar               3.08      19488   633118
    ## 12 Malawi                3.05       2685    88045
    ## 13 Bulgaria              2.96      38022  1286305
    ## 14 Paraguay              2.73      19611   718071
    ## 15 Tunisia               2.55      29268  1146991
    ## 16 Haiti                 2.54        860    33837
    ## 17 Chad                  2.54        194     7641
    ## 18 Algeria               2.54       6881   271028
    ## 19 South Africa          2.54     102395  4038121
    ## 20 Sri Lanka             2.50      16797   671610

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7266.     217303   29.9 
    ##  2 Bulgaria               5319.      38022    7.15
    ##  3 Hungary                4833.      48245    9.98
    ##  4 Czech Republic         3989.      41791   10.5 
    ##  5 Slovakia               3799.      20725    5.46
    ##  6 Chile                  3719.      62288   16.7 
    ##  7 United States          3440.    1067123  310.  
    ##  8 Brazil                 3428.     689341  201.  
    ##  9 Belgium                3176.      33042   10.4 
    ## 10 United Kingdom         3157.     196821   62.3 
    ## 11 Argentina              3145.     130017   41.3 
    ## 12 Greece                 3107.      34178   11   
    ## 13 Paraguay               3076.      19611    6.38
    ## 14 Poland                 3073.     118298   38.5 
    ## 15 Romania                3063.      67253   22.0 
    ## 16 Italy                  2992.     180518   60.3 
    ## 17 Colombia               2969.     141881   47.8 
    ## 18 Mexico                 2939.     330495  112.  
    ## 19 Russia                 2784.     391736  141.  
    ## 20 Tunisia                2764.      29268   10.6

EOL
