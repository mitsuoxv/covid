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

Updated: 2021-07-08

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
    ##  1 United States           66785. 33392406            500
    ##  2 India                   63882. 30663665            480
    ##  3 Brazil                  39069. 18792511            481
    ##  4 Russia                  11938.  5682634            476
    ##  5 France                  11516.  5677746            493
    ##  6 Turkey                  11459.  5454763            476
    ##  7 United Kingdom          10099.  4958872            491
    ##  8 Argentina                9584.  4552750            475
    ##  9 Colombia                 9193.  4375861            476
    ## 10 Italy                    8529.  4264704            500
    ## 11 Spain                    7887.  3880612            492
    ## 12 Germany                  7556.  3732549            494
    ## 13 Iran                     6600.  3286923            498
    ## 14 Poland                   6001.  2880503            480
    ## 15 Mexico                   5340.  2541873            476
    ## 16 Indonesia                4957.  2379397            480
    ## 17 Ukraine                  4764.  2238974            470
    ## 18 South Africa             4392.  2090909            476
    ## 19 Peru                     4332.  2066677            477
    ## 20 Netherlands              3476.  1692834            487

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                330.             159248.            482
    ##  2 Jordan                        249.             117726.            472
    ##  3 Israel                        238.             114787.            483
    ##  4 Sweden                        235.             114247.            487
    ##  5 Argentina                     232.             110121.            475
    ##  6 United States                 215.             107637.            500
    ##  7 Belgium                       214.             104691.            490
    ##  8 Netherlands                   209.             101702.            487
    ##  9 Serbia                        206.              97632.            475
    ## 10 Chile                         197.              94018.            478
    ## 11 Brazil                        194.              93447.            481
    ## 12 Colombia                      192.              91564.            476
    ## 13 Switzerland                   188.              92457.            491
    ## 14 France                        178.              87662.            493
    ## 15 Portugal                      174.              83621.            481
    ## 16 Hungary                       171.              80980.            474
    ## 17 Spain                         170.              83443.            492
    ## 18 Austria                       162.              78838.            486
    ## 19 United Kingdom                162.              79535.            491
    ## 20 Poland                        156.              74818.            480

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1363     6931
    ##  2 Peru                 9.36     193389  2066677
    ##  3 Mexico               9.19     233689  2541873
    ##  4 Sudan                7.50       2760    36805
    ##  5 Syria                7.35       1891    25712
    ##  6 Egypt                5.77      16306   282421
    ##  7 Somalia              5.17        775    14995
    ##  8 Ecuador              4.68      21708   463951
    ##  9 China                4.67       5554   119036
    ## 10 Bulgaria             4.29      18127   422238
    ## 11 Afghanistan          4.20       5415   129021
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.81      16985   446362
    ## 14 Hungary              3.71      29999   808338
    ## 15 Mali                 3.65        527    14455
    ## 16 Niger                3.52        194     5519
    ## 17 Chad                 3.51        174     4952
    ## 18 Zimbabwe             3.46       1939    56014
    ## 19 Tunisia              3.43      15601   455091
    ## 20 Malawi               3.26       1218    37366

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6466.     193389   29.9 
    ##  2 Hungary                3005.      29999    9.98
    ##  3 Czech Republic         2893.      30311   10.5 
    ##  4 Brazil                 2611.     525112  201.  
    ##  5 Bulgaria               2536.      18127    7.15
    ##  6 Belgium                2422.      25194   10.4 
    ##  7 Argentina              2335.      96521   41.3 
    ##  8 Slovakia               2294.      12514    5.46
    ##  9 Colombia               2291.     109466   47.8 
    ## 10 Italy                  2116.     127704   60.3 
    ## 11 Paraguay               2109.      13447    6.38
    ## 12 Mexico                 2078.     233689  112.  
    ## 13 United Kingdom         2057.     128268   62.3 
    ## 14 Chile                  1988.      33288   16.7 
    ## 15 Poland                 1951.      75114   38.5 
    ## 16 United States          1936.     600457  310.  
    ## 17 Spain                  1741.      80952   46.5 
    ## 18 Bolivia                1707.      16985    9.95
    ## 19 France                 1703.     110290   64.8 
    ## 20 Portugal               1603.      17118   10.7

EOL
