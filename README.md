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

Updated: 2023-01-26

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
    ##  1 United States           95134. 100651473           1058
    ##  2 India                   42676.  44682206           1047
    ##  3 France                  36219.  38392364           1060
    ##  4 Germany                 35500.  37701193           1062
    ##  5 Brazil                  35115.  36730913           1046
    ##  6 Japan                   30095.  32171700           1069
    ##  7 South Korea             28075.  30040556           1070
    ##  8 Italy                   23820.  25415630           1067
    ##  9 United Kingdom          22929.  24259240           1058
    ## 10 Russia                  21007.  21910020           1043
    ## 11 Turkey                  16303.  17004677           1043
    ## 12 Spain                   12958.  13722677           1059
    ## 13 Vietnam                 11094.  11526339           1039
    ## 14 Australia               10732.  11268946           1050
    ## 15 China                   10053.  11088646           1103
    ## 16 Argentina                9564.  10032709           1049
    ## 17 Netherlands              8141.   8580559           1054
    ## 18 Iran                     7102.   7563623           1065
    ## 19 Mexico                   7000.   7342764           1049
    ## 20 Indonesia                6427.   6728676           1047

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       667.             701952.           1052
    ##  2 Israel                        619.             650370.           1050
    ##  3 Denmark                       590.             619744.           1051
    ##  4 South Korea                   580.             620382.           1070
    ##  5 France                        559.             592764.           1060
    ##  6 Switzerland                   547.             578407.           1058
    ##  7 Australia                     499.             523753.           1050
    ##  8 Portugal                      498.             521065.           1047
    ##  9 Greece                        493.             516718.           1049
    ## 10 Netherlands                   489.             515504.           1054
    ## 11 Germany                       434.             460882.           1062
    ## 12 Belgium                       427.             450728.           1056
    ## 13 Czech Republic                417.             437927.           1049
    ## 14 Italy                         395.             421205.           1067
    ## 15 United Kingdom                368.             389091.           1058
    ## 16 Slovakia                      327.             341075.           1043
    ## 17 Serbia                        322.             335813.           1042
    ## 18 United States                 307.             324438.           1058
    ## 19 Chile                         292.             304927.           1045
    ## 20 Norway                        279.             294963.           1057

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
    ##  5 Peru                  4.88     218656  4479075
    ##  6 Egypt                 4.81      24805   515609
    ##  7 Mexico                4.52     331897  7342764
    ##  8 Afghanistan           3.78       7872   208324
    ##  9 Ecuador               3.42      35942  1051239
    ## 10 Niger                 3.31        315     9508
    ## 11 Myanmar               3.08      19490   633814
    ## 12 Malawi                3.04       2686    88349
    ## 13 Bulgaria              2.95      38169  1295082
    ## 14 Paraguay              2.70      19778   733429
    ## 15 Tunisia               2.55      29302  1150278
    ## 16 Algeria               2.54       6881   271307
    ## 17 Chad                  2.54        194     7651
    ## 18 South Africa          2.53     102568  4053527
    ## 19 Haiti                 2.53        860    34008
    ## 20 Sri Lanka             2.50      16826   671984

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7311.     218656   29.9 
    ##  2 Bulgaria               5339.      38169    7.15
    ##  3 Hungary                4866.      48572    9.98
    ##  4 Czech Republic         4037.      42293   10.5 
    ##  5 Slovakia               3835.      20918    5.46
    ##  6 Chile                  3803.      63689   16.7 
    ##  7 United States          3525.    1093540  310.  
    ##  8 Brazil                 3463.     696342  201.  
    ##  9 United Kingdom         3260.     203229   62.3 
    ## 10 Belgium                3223.      33525   10.4 
    ## 11 Greece                 3217.      35392   11   
    ## 12 Argentina              3154.     130394   41.3 
    ## 13 Paraguay               3102.      19778    6.38
    ## 14 Italy                  3091.     186488   60.3 
    ## 15 Poland                 3083.     118702   38.5 
    ## 16 Romania                3076.      67542   22.0 
    ## 17 Colombia               2979.     142385   47.8 
    ## 18 Mexico                 2951.     331897  112.  
    ## 19 Russia                 2806.     394821  141.  
    ## 20 Tunisia                2767.      29302   10.6

EOL
