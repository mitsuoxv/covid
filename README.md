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

Updated: 2023-03-09

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
    ##  1 United States           93037. 102247392           1099
    ##  2 China                   86634.  99109603           1144
    ##  3 India                   41074.  44688367           1088
    ##  4 France                  35003.  38538948           1101
    ##  5 Germany                 34652.  38221663           1103
    ##  6 Brazil                  34108.  37076053           1087
    ##  7 Japan                   29968.  33264491           1110
    ##  8 South Korea             27526.  30581499           1111
    ##  9 Italy                   23108.  25603510           1108
    ## 10 United Kingdom          22199.  24396534           1099
    ## 11 Russia                  20631.  22363740           1084
    ## 12 Turkey                  15687.  17004677           1084
    ## 13 Spain                   12518.  13770429           1100
    ## 14 Vietnam                 10673.  11526966           1080
    ## 15 Australia               10431.  11380700           1091
    ## 16 Argentina                9215.  10044957           1090
    ## 17 Netherlands              7852.   8598182           1095
    ## 18 Mexico                   6854.   7470653           1090
    ## 19 Iran                     6845.   7570743           1106
    ## 20 Indonesia                6193.   6737606           1088

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       663.             724365.           1093
    ##  2 Israel                        598.             652913.           1091
    ##  3 South Korea                   568.             631554.           1111
    ##  4 Denmark                       568.             620707.           1092
    ##  5 France                        540.             595027.           1101
    ##  6 Switzerland                   527.             579212.           1099
    ##  7 Greece                        492.             536072.           1090
    ##  8 Australia                     485.             528947.           1091
    ##  9 Portugal                      480.             521775.           1088
    ## 10 Netherlands                   472.             516562.           1095
    ## 11 Germany                       424.             467245.           1103
    ## 12 Belgium                       414.             454465.           1097
    ## 13 Czech Republic                404.             440621.           1090
    ## 14 Italy                         383.             424318.           1108
    ## 15 United Kingdom                356.             391293.           1099
    ## 16 Slovakia                      315.             341630.           1084
    ## 17 Serbia                        314.             340000.           1083
    ## 18 United States                 300.             329583.           1099
    ## 19 Chile                         285.             309459.           1086
    ## 20 Spain                         269.             296100.           1100

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.86       5017    63829
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27324
    ##  5 Peru                  4.89     219493  4486832
    ##  6 Egypt                 4.81      24812   515759
    ##  7 Mexico                4.46     333100  7470653
    ##  8 Afghanistan           3.76       7879   209414
    ##  9 Ecuador               3.41      36014  1057121
    ## 10 Niger                 3.31        315     9513
    ## 11 Myanmar               3.07      19490   633947
    ## 12 Malawi                3.03       2686    88605
    ## 13 Bulgaria              2.95      38219  1297243
    ## 14 Paraguay              2.70      19878   735709
    ## 15 Tunisia               2.55      29331  1150962
    ## 16 Algeria               2.53       6881   271463
    ## 17 Chad                  2.53        194     7678
    ## 18 South Africa          2.53     102595  4061578
    ## 19 Haiti                 2.51        860    34202
    ## 20 Sri Lanka             2.50      16830   672034

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7339.     219493   29.9 
    ##  2 Bulgaria               5346.      38219    7.15
    ##  3 Hungary                4874.      48651    9.98
    ##  4 Czech Republic         4055.      42484   10.5 
    ##  5 Slovakia               3855.      21031    5.46
    ##  6 Chile                  3836.      64247   16.7 
    ##  7 United States          3582.    1111342  310.  
    ##  8 Brazil                 3477.     699276  201.  
    ##  9 United Kingdom         3331.     207695   62.3 
    ## 10 Greece                 3298.      36283   11   
    ## 11 Belgium                3247.      33775   10.4 
    ## 12 Argentina              3156.     130472   41.3 
    ## 13 Italy                  3121.     188322   60.3 
    ## 14 Paraguay               3118.      19878    6.38
    ## 15 Poland                 3090.     118970   38.5 
    ## 16 Romania                3085.      67736   22.0 
    ## 17 Colombia               2984.     142629   47.8 
    ## 18 Mexico                 2962.     333100  112.  
    ## 19 Russia                 2817.     396378  141.  
    ## 20 Tunisia                2770.      29331   10.6

EOL
