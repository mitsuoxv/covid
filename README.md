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

Updated: 2021-06-25

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
    ##  1 United States           68262. 33243529            487
    ##  2 India                   64417. 30082778            467
    ##  3 Brazil                  38578. 18054653            468
    ##  4 France                  11778.  5653613            480
    ##  5 Russia                  11638.  5388695            463
    ##  6 Turkey                  11636.  5387545            463
    ##  7 United Kingdom           9765.  4667874            478
    ##  8 Argentina                9304.  4298782            462
    ##  9 Italy                    8738.  4255434            487
    ## 10 Colombia                 8633.  3997021            463
    ## 11 Spain                    7877.  3773032            479
    ## 12 Germany                  7744.  3724806            481
    ## 13 Iran                     6450.  3128395            485
    ## 14 Poland                   6165.  2879336            467
    ## 15 Mexico                   5362.  2482784            463
    ## 16 Ukraine                  4884.  2231914            457
    ## 17 Indonesia                4398.  2053995            467
    ## 18 Peru                     4383.  2033606            464
    ## 19 South Africa             4019.  1861065            463
    ## 20 Czech Republic           3553.  1666521            469

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                339.             159080.            469
    ##  2 Jordan                        254.             116762.            459
    ##  3 Israel                        243.             114266.            470
    ##  4 Sweden                        240.             113911.            474
    ##  5 Argentina                     225.             103978.            462
    ##  6 United States                 220.             107157.            487
    ##  7 Belgium                       218.             103918.            477
    ##  8 Netherlands                   213.             100984.            474
    ##  9 Serbia                        211.              97485.            462
    ## 10 Chile                         196.              91267.            465
    ## 11 Switzerland                   193.              92225.            478
    ## 12 Brazil                        192.              89778.            468
    ## 13 France                        182.              87290.            480
    ## 14 Colombia                      181.              83637.            463
    ## 15 Hungary                       176.              80930.            461
    ## 16 Portugal                      174.              81334.            468
    ## 17 Spain                         169.              81130.            479
    ## 18 Austria                       166.              78707.            473
    ## 19 Poland                        160.              74788.            467
    ## 20 United Kingdom                157.              74868.            478

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1355     6898
    ##  2 Peru                 9.39     190906  2033606
    ##  3 Mexico               9.32     231505  2482784
    ##  4 Sudan                7.52       2750    36558
    ##  5 Syria                7.35       1855    25248
    ##  6 Egypt                5.73      15967   278761
    ##  7 Somalia              5.21        775    14868
    ##  8 Ecuador              4.76      21367   449107
    ##  9 China                4.62       5445   117880
    ## 10 Bulgaria             4.28      18013   421339
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.06       4452   109532
    ## 13 Zimbabwe             3.89       1692    43480
    ## 14 Bolivia              3.83      16243   424478
    ## 15 Hungary              3.70      29888   807844
    ## 16 Tunisia              3.66      14318   391411
    ## 17 Mali                 3.65        525    14392
    ## 18 Niger                3.53        193     5472
    ## 19 Chad                 3.51        174     4951
    ## 20 Malawi               3.35       1177    35115

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6383.     190906   29.9 
    ##  2 Hungary                2994.      29888    9.98
    ##  3 Czech Republic         2891.      30291   10.5 
    ##  4 Bulgaria               2520.      18013    7.15
    ##  5 Brazil                 2510.     504717  201.  
    ##  6 Belgium                2417.      25149   10.4 
    ##  7 Slovakia               2292.      12502    5.46
    ##  8 Argentina              2184.      90281   41.3 
    ##  9 Colombia               2120.     101302   47.8 
    ## 10 Italy                  2111.     127352   60.3 
    ## 11 Mexico                 2058.     231505  112.  
    ## 12 United Kingdom         2053.     128027   62.3 
    ## 13 Poland                 1946.      74917   38.5 
    ## 14 United States          1926.     597372  310.  
    ## 15 Chile                  1896.      31746   16.7 
    ## 16 Paraguay               1858.      11849    6.38
    ## 17 Spain                  1736.      80748   46.5 
    ## 18 France                 1698.     109957   64.8 
    ## 19 Bolivia                1633.      16243    9.95
    ## 20 Portugal               1600.      17077   10.7

EOL
