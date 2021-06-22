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

Updated: 2021-06-23

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
    ##  1 United States           68433. 33190195            485
    ##  2 India                   64468. 29977861            465
    ##  3 Brazil                  38472. 17927928            466
    ##  4 France                  11820.  5650315            478
    ##  5 Turkey                  11660.  5375593            461
    ##  6 Russia                  11607.  5350919            461
    ##  7 United Kingdom           9749.  4640511            476
    ##  8 Argentina                9280.  4268789            460
    ##  9 Italy                    8770.  4253460            485
    ## 10 Colombia                 8558.  3945166            461
    ## 11 Spain                    7892.  3764651            477
    ## 12 Germany                  7772.  3722782            479
    ## 13 Iran                     6430.  3105620            483
    ## 14 Poland                   6191.  2879030            465
    ## 15 Mexico                   5373.  2477283            461
    ## 16 Ukraine                  4901.  2230142            455
    ## 17 Peru                     4393.  2029625            462
    ## 18 Indonesia                4340.  2018113            465
    ## 19 South Africa             3975.  1832479            461
    ## 20 Czech Republic           3568.  1666192            467

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                341.             159048.            467
    ##  2 Jordan                        255.             116590.            457
    ##  3 Israel                        245.             114228.            467
    ##  4 Sweden                        240.             113504.            472
    ##  5 Argentina                     224.             103253.            460
    ##  6 United States                 221.             106985.            485
    ##  7 Belgium                       218.             103782.            475
    ##  8 Netherlands                   214.             100904.            472
    ##  9 Serbia                        212.              97462.            460
    ## 10 Chile                         196.              90898.            463
    ## 11 Switzerland                   194.              92187.            476
    ## 12 Brazil                        191.              89148.            466
    ## 13 France                        183.              87239.            478
    ## 14 Colombia                      179.              82552.            461
    ## 15 Hungary                       176.              80914.            459
    ## 16 Portugal                      174.              81098.            466
    ## 17 Spain                         170.              80950.            477
    ## 18 Austria                       167.              78685.            471
    ## 19 Poland                        161.              74780             465
    ## 20 United Kingdom                156.              74429.            476

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1355     6889
    ##  2 Peru                 9.38     190425  2029625
    ##  3 Mexico               9.33     231187  2477283
    ##  4 Sudan                7.53       2737    36347
    ##  5 Syria                7.35       1848    25158
    ##  6 Egypt                5.72      15898   277797
    ##  7 Somalia              5.21        775    14867
    ##  8 Ecuador              4.77      21304   446633
    ##  9 China                4.60       5415   117651
    ## 10 Bulgaria             4.27      18000   421152
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.06       4293   105749
    ## 13 Zimbabwe             3.99       1685    42195
    ## 14 Bolivia              3.82      16132   422047
    ## 15 Hungary              3.70      29879   807684
    ## 16 Tunisia              3.66      14118   385428
    ## 17 Mali                 3.64        524    14386
    ## 18 Niger                3.53        193     5469
    ## 19 Chad                 3.52        174     4947
    ## 20 Malawi               3.35       1171    34914

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6367.     190425   29.9 
    ##  2 Hungary                2993.      29879    9.98
    ##  3 Czech Republic         2891.      30283   10.5 
    ##  4 Bulgaria               2518.      18000    7.15
    ##  5 Brazil                 2495.     501825  201.  
    ##  6 Belgium                2417.      25141   10.4 
    ##  7 Slovakia               2292.      12502    5.46
    ##  8 Argentina              2154.      89043   41.3 
    ##  9 Italy                  2110.     127291   60.3 
    ## 10 Colombia               2091.      99934   47.8 
    ## 11 Mexico                 2056.     231187  112.  
    ## 12 United Kingdom         2053.     127981   62.3 
    ## 13 Poland                 1944.      74858   38.5 
    ## 14 United States          1921.     596003  310.  
    ## 15 Chile                  1890.      31645   16.7 
    ## 16 Paraguay               1825.      11633    6.38
    ## 17 Spain                  1735.      80689   46.5 
    ## 18 France                 1696.     109879   64.8 
    ## 19 Bolivia                1622.      16132    9.95
    ## 20 Portugal               1599.      17068   10.7

EOL
