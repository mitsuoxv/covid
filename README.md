WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2022-01-25

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
    ##  1 United States          100763. 69727991            692
    ##  2 India                   58066. 39543328            681
    ##  3 Brazil                  35057. 23909175            682
    ##  4 France                  23467. 16286388            694
    ##  5 United Kingdom          22984. 15859292            690
    ##  6 Russia                  16408. 11108191            677
    ##  7 Turkey                  16168. 10946238            677
    ##  8 Italy                   14156.  9923678            701
    ##  9 Spain                   12748.  8834364            693
    ## 10 Germany                 12582.  8744840            695
    ## 11 Argentina               11527.  7792652            676
    ## 12 Iran                     8942.  6250490            699
    ## 13 Colombia                 8440.  5714092            677
    ## 14 Mexico                   6804.  4646957            683
    ## 15 Poland                   6677.  4547315            681
    ## 16 Indonesia                6298.  4289305            681
    ## 17 Ukraine                  5768.  3870370            671
    ## 18 Netherlands              5653.  3889669            688
    ## 19 South Africa             5290.  3581359            677
    ## 20 Philippines              5018.  3417216            681

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        474.             324426.            684
    ##  2 Czech Republic                386.             263822.            683
    ##  3 Belgium                       375.             259275.            691
    ##  4 Denmark                       371.             254893.            686
    ##  5 United Kingdom                369.             254365.            690
    ##  6 France                        362.             251456.            694
    ##  7 Switzerland                   357.             246860.            692
    ##  8 Netherlands                   340.             233684.            688
    ##  9 United States                 325.             224760.            692
    ## 10 Serbia                        311.             210338.            676
    ## 11 Portugal                      305.             208114.            682
    ## 12 Austria                       286.             196206.            686
    ## 13 Argentina                     279.             188487.            676
    ## 14 Spain                         274.             189962.            693
    ## 15 Sweden                        271.             186692.            688
    ## 16 Jordan                        265.             178092.            673
    ## 17 Slovakia                      249.             168913.            677
    ## 18 Greece                        239.             163028.            683
    ## 19 Italy                         235.             164462.            701
    ## 20 Hungary                       214.             144398.            675

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1995    10585
    ##  2 Peru                 7.05     204141  2894215
    ##  3 Mexico               6.52     303085  4646957
    ##  4 Sudan                6.17       3404    55149
    ##  5 Syria                5.82       2968    50985
    ##  6 Somalia              5.49       1335    24322
    ##  7 Egypt                5.45      22368   410098
    ##  8 Ecuador              5.16      34287   664664
    ##  9 Afghanistan          4.63       7393   159682
    ## 10 China                4.15       5700   137350
    ## 11 Bulgaria             3.71      32664   880228
    ## 12 Myanmar              3.62      19310   534071
    ## 13 Niger                3.46        296     8544
    ## 14 Indonesia            3.36     144227  4289305
    ## 15 Paraguay             3.18      16953   532648
    ## 16 Tunisia              3.04      25988   853905
    ## 17 El Salvador          3.04       3855   127012
    ## 18 Malawi               3.01       2523    83823
    ## 19 Romania              2.95      59547  2017129
    ## 20 Russia               2.94     326767 11108191

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6826.     204141   29.9 
    ##  2 Bulgaria               4569.      32664    7.15
    ##  3 Hungary                4102.      40944    9.98
    ##  4 Czech Republic         3537.      37050   10.5 
    ##  5 Slovakia               3240.      17675    5.46
    ##  6 Brazil                 3097.     622801  201.  
    ##  7 Argentina              2881.     119103   41.3 
    ##  8 United States          2767.     858470  310.  
    ##  9 Belgium                2767.      28780   10.4 
    ## 10 Colombia               2763.     132023   47.8 
    ## 11 Romania                2712.      59547   22.0 
    ## 12 Poland                 2697.     103846   38.5 
    ## 13 Mexico                 2695.     303085  112.  
    ## 14 Paraguay               2659.      16953    6.38
    ## 15 United Kingdom         2468.     153862   62.3 
    ## 16 Tunisia                2454.      25988   10.6 
    ## 17 Italy                  2379.     143523   60.3 
    ## 18 Chile                  2359.      39512   16.7 
    ## 19 Russia                 2322.     326767  141.  
    ## 20 Ecuador                2318.      34287   14.8

EOL
