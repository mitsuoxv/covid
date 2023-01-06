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

Updated: 2023-01-07

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
    ##  1 United States           95692. 99423758           1039
    ##  2 India                   43462. 44679547           1028
    ##  3 France                  36780. 38288448           1041
    ##  4 Germany                 35950. 37496370           1043
    ##  5 Brazil                  35465. 36423138           1027
    ##  6 Japan                   28380. 29798835           1050
    ##  7 South Korea             27992. 29420226           1051
    ##  8 Italy                   23992. 25143705           1048
    ##  9 United Kingdom          23301. 24210131           1039
    ## 10 Russia                  21309. 21820552           1024
    ## 11 Turkey                  16606. 17004677           1024
    ## 12 Spain                   13167. 13693478           1040
    ## 13 Vietnam                 11299. 11525571           1020
    ## 14 Australia               10715. 11047174           1031
    ## 15 China                    9748. 10566576           1084
    ## 16 Argentina                9673.  9963697           1030
    ## 17 Netherlands              8282.  8572096           1035
    ## 18 Iran                     7229.  7561541           1046
    ## 19 Mexico                   7046.  7257916           1030
    ## 20 Indonesia                6540.  6722746           1028

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       675.             697085.           1033
    ##  2 Israel                        629.             648523.           1031
    ##  3 Denmark                       600.             618769.           1032
    ##  4 South Korea                   578.             607572.           1051
    ##  5 France                        568.             591159.           1041
    ##  6 Switzerland                   556.             578072.           1039
    ##  7 Portugal                      506.             520601.           1028
    ##  8 Australia                     498.             513446.           1031
    ##  9 Netherlands                   498.             514995.           1035
    ## 10 Greece                        490.             504408.           1030
    ## 11 Germany                       439.             458378.           1043
    ## 12 Belgium                       434.             450085.           1037
    ## 13 Czech Republic                425.             437427.           1030
    ## 14 Italy                         398.             416698.           1048
    ## 15 United Kingdom                374.             388304.           1039
    ## 16 Slovakia                      333.             340904.           1024
    ## 17 Serbia                        326.             333664.           1023
    ## 18 United States                 308.             320481.           1039
    ## 19 Chile                         294.             301734.           1026
    ## 20 Norway                        284.             294654.           1038

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.84       4995    63702
    ##  3 Syria                 5.51       3163    57423
    ##  4 Somalia               4.98       1361    27310
    ##  5 Peru                  4.89     218304  4463641
    ##  6 Egypt                 4.81      24802   515533
    ##  7 Mexico                4.56     331206  7257916
    ##  8 Afghanistan           3.78       7850   207714
    ##  9 Ecuador               3.45      35934  1040463
    ## 10 Niger                 3.31        315     9504
    ## 11 Myanmar               3.08      19490   633709
    ## 12 Malawi                3.05       2685    88123
    ## 13 Bulgaria              2.95      38118  1292969
    ## 14 Paraguay              2.71      19688   725365
    ## 15 Tunisia               2.55      29285  1147645
    ## 16 Haiti                 2.54        860    33893
    ## 17 Algeria               2.54       6881   271229
    ## 18 Chad                  2.54        194     7651
    ## 19 South Africa          2.53     102568  4049319
    ## 20 Sri Lanka             2.50      16818   671916

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7299.     218304   29.9 
    ##  2 Bulgaria               5332.      38118    7.15
    ##  3 Hungary                4858.      48495    9.98
    ##  4 Czech Republic         4027.      42186   10.5 
    ##  5 Slovakia               3820.      20838    5.46
    ##  6 Chile                  3777.      63254   16.7 
    ##  7 United States          3489.    1082265  310.  
    ##  8 Brazil                 3453.     694411  201.  
    ##  9 United Kingdom         3224.     201028   62.3 
    ## 10 Belgium                3210.      33395   10.4 
    ## 11 Greece                 3162.      34779   11   
    ## 12 Argentina              3149.     130171   41.3 
    ## 13 Paraguay               3088.      19688    6.38
    ## 14 Poland                 3080.     118586   38.5 
    ## 15 Romania                3070.      67408   22.0 
    ## 16 Italy                  3060.     184642   60.3 
    ## 17 Colombia               2975.     142179   47.8 
    ## 18 Mexico                 2945.     331206  112.  
    ## 19 Russia                 2800.     393986  141.  
    ## 20 Tunisia                2766.      29285   10.6

EOL
