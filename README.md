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

Updated: 2021-06-15

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
    ##  1 United States           69460. 33132301            477
    ##  2 India                   64574. 29510410            457
    ##  3 Brazil                  37936. 17374818            458
    ##  4 France                  11991.  5635843            470
    ##  5 Turkey                  11767.  5330447            453
    ##  6 Russia                  11528.  5222408            453
    ##  7 United Kingdom           9756.  4565817            468
    ##  8 Argentina                9095.  4111147            452
    ##  9 Italy                    8899.  4244872            477
    ## 10 Colombia                 8222.  3724705            453
    ## 11 Spain                    7952.  3729458            469
    ## 12 Germany                  7888.  3715518            471
    ## 13 Iran                     6376.  3028717            475
    ## 14 Poland                   6297.  2877608            457
    ## 15 Mexico                   5414.  2452469            453
    ## 16 Ukraine                  4975.  2223978            447
    ## 17 Peru                     4407.  2001059            454
    ## 18 Indonesia                4200.  1919547            457
    ## 19 South Africa             3856.  1747082            453
    ## 20 Czech Republic           3628.  1665139            459

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                346.             158948.            459
    ##  2 Jordan                        258.             116017.            449
    ##  3 Israel                        249.             114179.            458
    ##  4 Sweden                        244.             113381.            464
    ##  5 United States                 224.             106798.            477
    ##  6 Belgium                       222.             103464.            467
    ##  7 Argentina                     220.              99439.            452
    ##  8 Netherlands                   217.             100495.            464
    ##  9 Serbia                        215.              97332.            452
    ## 10 Switzerland                   196.              91932.            468
    ## 11 Chile                         194.              88166.            455
    ## 12 Brazil                        189.              86397.            458
    ## 13 France                        185.              87015.            470
    ## 14 Hungary                       179.              80850.            451
    ## 15 Portugal                      175.              80249.            458
    ## 16 Colombia                      172.              77939.            453
    ## 17 Spain                         171.              80193.            469
    ## 18 Austria                       170.              78559.            463
    ## 19 Poland                        164.              74743.            457
    ## 20 Slovakia                      159.              71684.            452

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1349     6862
    ##  2 Peru                 9.42     188443  2001059
    ##  3 Mexico               9.38     230097  2452469
    ##  4 Sudan                7.53       2732    36304
    ##  5 Syria                7.29       1810    24814
    ##  6 Egypt                5.72      15623   273182
    ##  7 Somalia              5.22        774    14817
    ##  8 Ecuador              4.80      21048   438934
    ##  9 China                4.54       5283   116301
    ## 10 Bulgaria             4.26      17900   420336
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.08       1632    39959
    ## 13 Afghanistan          3.95       3612    91458
    ## 14 Bolivia              3.82      15485   405347
    ## 15 Hungary              3.70      29841   807045
    ## 16 Tunisia              3.66      13515   368908
    ## 17 Mali                 3.64        523    14351
    ## 18 Niger                3.53        192     5446
    ## 19 Chad                 3.52        174     4942
    ## 20 Malawi               3.36       1159    34506

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6301.     188443   29.9 
    ##  2 Hungary                2989.      29841    9.98
    ##  3 Czech Republic         2885.      30226   10.5 
    ##  4 Bulgaria               2504.      17900    7.15
    ##  5 Brazil                 2418.     486272  201.  
    ##  6 Belgium                2412.      25088   10.4 
    ##  7 Slovakia               2281.      12441    5.46
    ##  8 Italy                  2105.     127002   60.3 
    ##  9 Argentina              2058.      85075   41.3 
    ## 10 United Kingdom         2051.     127904   62.3 
    ## 11 Mexico                 2046.     230097  112.  
    ## 12 Colombia               1992.      95192   47.8 
    ## 13 Poland                 1937.      74574   38.5 
    ## 14 United States          1916.     594496  310.  
    ## 15 Chile                  1834.      30707   16.7 
    ## 16 Spain                  1730.      80465   46.5 
    ## 17 France                 1691.     109512   64.8 
    ## 18 Paraguay               1678.      10699    6.38
    ## 19 Portugal               1597.      17045   10.7 
    ## 20 Bolivia                1557.      15485    9.95

EOL
