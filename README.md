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

Updated: 2021-06-18

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           69091. 33163632            480
    ##  2 India                   64566. 29700313            460
    ##  3 Brazil                  38033. 17533221            461
    ##  4 France                  11926.  5640981            473
    ##  5 Turkey                  11728.  5348249            456
    ##  6 Russia                  11544.  5264047            456
    ##  7 United Kingdom           9745.  4589818            471
    ##  8 Argentina                9171.  4172742            455
    ##  9 Italy                    8851.  4248432            480
    ## 10 Colombia                 8338.  3802052            456
    ## 11 Spain                    7943.  3749031            472
    ## 12 Germany                  7846.  3718955            474
    ## 13 Iran                     6402.  3060135            478
    ## 14 Poland                   6257.  2878276            460
    ## 15 Mexico                   5394.  2459601            456
    ## 16 Ukraine                  4949.  2227225            450
    ## 17 Peru                     4392.  2007477            457
    ## 18 Indonesia                4239.  1950276            460
    ## 19 South Africa             3891.  1774312            456
    ## 20 Czech Republic           3605.  1665660            462

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                344.             158998.            462
    ##  2 Jordan                        257.             116253.            452
    ##  3 Israel                        247.             114188.            462
    ##  4 Sweden                        243.             113504.            467
    ##  5 United States                 223.             106899.            480
    ##  6 Argentina                     222.             100929.            455
    ##  7 Belgium                       220.             103601.            470
    ##  8 Netherlands                   216.             100670.            467
    ##  9 Serbia                        214.              97389.            455
    ## 10 Switzerland                   195.              92091.            471
    ## 11 Chile                         194.              89067.            458
    ## 12 Brazil                        189.              87185.            461
    ## 13 France                        184.              87095.            473
    ## 14 Hungary                       178.              80878.            454
    ## 15 Portugal                      175.              80592.            461
    ## 16 Colombia                      174.              79557.            456
    ## 17 Spain                         171.              80614.            472
    ## 18 Austria                       169.              78605.            466
    ## 19 Poland                        163.              74760.            460
    ## 20 Slovakia                      158.              71716.            455

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1351     6867
    ##  2 Peru                  9.43     189261  2007477
    ##  3 Mexico                9.37     230428  2459601
    ##  4 Sudan                 7.53       2737    36347
    ##  5 Syria                 7.32       1826    24946
    ##  6 Egypt                 5.72      15723   275010
    ##  7 Somalia               5.23        775    14827
    ##  8 Ecuador               4.79      21153   441180
    ##  9 China                 4.56       5324   116853
    ## 10 Bulgaria              4.27      17957   420749
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.04       1640    40556
    ## 13 Afghanistan           3.98       3842    96531
    ## 14 Sierra Leone          3.86        174     4505
    ## 15 Bolivia               3.82      15738   411677
    ## 16 Hungary               3.70      29864   807322
    ## 17 Tunisia               3.67      13721   374312
    ## 18 Mali                  3.64        523    14360
    ## 19 Chad                  3.52        174     4943
    ## 20 Niger                 3.52        192     5455

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6328.     189261   29.9 
    ##  2 Hungary                2992.      29864    9.98
    ##  3 Czech Republic         2888.      30257   10.5 
    ##  4 Bulgaria               2512.      17957    7.15
    ##  5 Brazil                 2440.     490696  201.  
    ##  6 Belgium                2414.      25110   10.4 
    ##  7 Slovakia               2285.      12464    5.46
    ##  8 Italy                  2107.     127153   60.3 
    ##  9 Argentina              2095.      86615   41.3 
    ## 10 United Kingdom         2052.     127926   62.3 
    ## 11 Mexico                 2049.     230428  112.  
    ## 12 Colombia               2029.      96965   47.8 
    ## 13 Poland                 1941.      74734   38.5 
    ## 14 United States          1919.     595256  310.  
    ## 15 Chile                  1846.      30922   16.7 
    ## 16 Paraguay               1736.      11069    6.38
    ## 17 Spain                  1733.      80615   46.5 
    ## 18 France                 1694.     109688   64.8 
    ## 19 Portugal               1598.      17055   10.7 
    ## 20 Bolivia                1582.      15738    9.95

EOL
