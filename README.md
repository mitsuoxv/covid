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

Updated: 2023-01-19

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
    ##  1 United States           95437. 100304472           1051
    ##  2 India                   42963.  44681371           1040
    ##  3 France                  36432.  38362763           1053
    ##  4 Germany                 35676.  37637807           1055
    ##  5 Brazil                  35265.  36640787           1039
    ##  6 Japan                   29753.  31597810           1062
    ##  7 South Korea             28126.  29898142           1063
    ##  8 Italy                   23928.  25363742           1060
    ##  9 United Kingdom          23067.  24243393           1051
    ## 10 Russia                  21110.  21870422           1036
    ## 11 Turkey                  16414.  17004677           1036
    ## 12 Spain                   13033.  13711251           1052
    ## 13 Vietnam                 11169.  11526213           1032
    ## 14 Australia               10775.  11238924           1043
    ## 15 China                   10000.  10960241           1096
    ## 16 Argentina                9620.  10024095           1042
    ## 17 Netherlands              8193.   8577856           1047
    ## 18 Iran                     7148.   7562868           1058
    ## 19 Mexico                   7020.   7314891           1042
    ## 20 Indonesia                6468.   6727007           1040

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       670.             700170.           1045
    ##  2 Israel                        623.             649772.           1043
    ##  3 Denmark                       593.             619529.           1044
    ##  4 South Korea                   581.             617441.           1063
    ##  5 France                        562.             592307.           1053
    ##  6 Switzerland                   550.             578242.           1051
    ##  7 Australia                     501.             522358.           1043
    ##  8 Portugal                      501.             520601.           1040
    ##  9 Netherlands                   492.             515341.           1047
    ## 10 Greece                        484.             504408.           1042
    ## 11 Germany                       436.             460107.           1055
    ## 12 Belgium                       429.             450461.           1049
    ## 13 Czech Republic                420.             437740.           1042
    ## 14 Italy                         397.             420345.           1060
    ## 15 United Kingdom                370.             388837.           1051
    ## 16 Slovakia                      329.             341018.           1036
    ## 17 Serbia                        324.             335118.           1035
    ## 18 United States                 308.             323320.           1051
    ## 19 Chile                         293.             303997.           1038
    ## 20 Norway                        281.             294886.           1050

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
    ##  5 Peru                  4.88     218547  4475610
    ##  6 Egypt                 4.81      24805   515580
    ##  7 Mexico                4.53     331595  7314891
    ##  8 Afghanistan           3.78       7859   208009
    ##  9 Ecuador               3.43      35936  1047624
    ## 10 Niger                 3.31        315     9508
    ## 11 Myanmar               3.08      19490   633777
    ## 12 Malawi                3.04       2686    88349
    ## 13 Bulgaria              2.95      38150  1294475
    ## 14 Paraguay              2.71      19746   729384
    ## 15 Tunisia               2.55      29291  1150217
    ## 16 Algeria               2.54       6881   271287
    ## 17 Chad                  2.54        194     7651
    ## 18 Haiti                 2.53        860    33969
    ## 19 South Africa          2.53     102568  4051891
    ## 20 Sri Lanka             2.50      16824   671968

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7308.     218547   29.9 
    ##  2 Bulgaria               5337.      38150    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4035.      42266   10.5 
    ##  5 Slovakia               3829.      20888    5.46
    ##  6 Chile                  3795.      63548   16.7 
    ##  7 United States          3510.    1088854  310.  
    ##  8 Brazil                 3458.     695410  201.  
    ##  9 United Kingdom         3242.     202157   62.3 
    ## 10 Belgium                3218.      33478   10.4 
    ## 11 Greece                 3185       35035   11   
    ## 12 Argentina              3153.     130338   41.3 
    ## 13 Paraguay               3097.      19746    6.38
    ## 14 Italy                  3082.     185993   60.3 
    ## 15 Poland                 3082.     118666   38.5 
    ## 16 Romania                3074.      67504   22.0 
    ## 17 Colombia               2977.     142259   47.8 
    ## 18 Mexico                 2948.     331595  112.  
    ## 19 Russia                 2804.     394529  141.  
    ## 20 Tunisia                2766.      29291   10.6

EOL
