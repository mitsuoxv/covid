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

Updated: 2023-01-24

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
    ##  1 United States           94985. 100304472           1056
    ##  2 India                   42758.  44682015           1045
    ##  3 France                  36273.  38377086           1058
    ##  4 Germany                 35536.  37668384           1060
    ##  5 Brazil                  35132.  36677844           1044
    ##  6 Japan                   30033.  32045328           1067
    ##  7 South Korea             28098.  30008756           1068
    ##  8 Italy                   23864.  25415630           1065
    ##  9 United Kingdom          22973.  24259240           1056
    ## 10 Russia                  21036.  21898876           1041
    ## 11 Turkey                  16335.  17004677           1041
    ## 12 Spain                   12983.  13722677           1057
    ## 13 Vietnam                 11115.  11526329           1037
    ## 14 Australia               10753.  11269081           1048
    ## 15 China                   10047.  11062159           1101
    ## 16 Argentina                9574.  10024095           1047
    ## 17 Netherlands              8156.   8579731           1052
    ## 18 Iran                     7115.   7563385           1063
    ## 19 Mexico                   6986.   7314891           1047
    ## 20 Indonesia                6438.   6728184           1045

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       668.             701477.           1050
    ##  2 Israel                        620.             650118.           1048
    ##  3 Denmark                       591.             619688.           1049
    ##  4 South Korea                   580.             619726.           1068
    ##  5 France                        560.             592528.           1058
    ##  6 Switzerland                   548.             578407.           1056
    ##  7 Australia                     500.             523760.           1048
    ##  8 Portugal                      499.             521002.           1045
    ##  9 Greece                        494.             516718.           1047
    ## 10 Netherlands                   490.             515454.           1052
    ## 11 Germany                       434.             460481.           1060
    ## 12 Belgium                       428.             450728.           1054
    ## 13 Czech Republic                418.             437841.           1047
    ## 14 Italy                         395.             421205.           1065
    ## 15 United Kingdom                368.             389091.           1056
    ## 16 Slovakia                      328.             341054.           1041
    ## 17 Serbia                        323.             335598.           1040
    ## 18 United States                 306.             323320.           1056
    ## 19 Chile                         292.             304355.           1043
    ## 20 Norway                        280.             294937.           1055

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.85       5001    63729
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27318
    ##  5 Peru                  4.88     218580  4477064
    ##  6 Egypt                 4.81      24805   515580
    ##  7 Mexico                4.53     331595  7314891
    ##  8 Afghanistan           3.78       7870   208097
    ##  9 Ecuador               3.43      35936  1047624
    ## 10 Niger                 3.31        315     9508
    ## 11 Myanmar               3.08      19490   633801
    ## 12 Malawi                3.04       2686    88349
    ## 13 Bulgaria              2.95      38163  1294871
    ## 14 Paraguay              2.71      19746   729384
    ## 15 Tunisia               2.55      29291  1150217
    ## 16 Algeria               2.54       6881   271307
    ## 17 Chad                  2.54        194     7651
    ## 18 Haiti                 2.53        860    33969
    ## 19 South Africa          2.53     102568  4053527
    ## 20 Sri Lanka             2.50      16825   671981

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7309.     218580   29.9 
    ##  2 Bulgaria               5338.      38163    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4036.      42283   10.5 
    ##  5 Slovakia               3833.      20911    5.46
    ##  6 Chile                  3798.      63599   16.7 
    ##  7 United States          3510.    1088854  310.  
    ##  8 Brazil                 3459.     695615  201.  
    ##  9 United Kingdom         3260.     203229   62.3 
    ## 10 Belgium                3223.      33525   10.4 
    ## 11 Greece                 3217.      35392   11   
    ## 12 Argentina              3153.     130338   41.3 
    ## 13 Paraguay               3097.      19746    6.38
    ## 14 Italy                  3091.     186488   60.3 
    ## 15 Poland                 3083.     118681   38.5 
    ## 16 Romania                3074.      67504   22.0 
    ## 17 Colombia               2979.     142385   47.8 
    ## 18 Mexico                 2948.     331595  112.  
    ## 19 Russia                 2805.     394735  141.  
    ## 20 Tunisia                2766.      29291   10.6

EOL
