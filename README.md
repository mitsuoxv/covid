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

Updated: 2021-10-05

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           73564. 43329413            589
    ##  2 India                   59463. 33834702            569
    ##  3 Brazil                  37647. 21459117            570
    ##  4 United Kingdom          13622.  7900684            580
    ##  5 Russia                  13473.  7612317            565
    ##  6 Turkey                  12811.  7238267            565
    ##  7 France                  11705.  6812247            582
    ##  8 Iran                     9581.  5624128            587
    ##  9 Argentina                9326.  5259738            564
    ## 10 Colombia                 8780.  4960641            565
    ## 11 Spain                    8539.  4961129            581
    ## 12 Italy                    7949.  4682034            589
    ## 13 Indonesia                7417.  4220206            569
    ## 14 Germany                  7299.  4255388            583
    ## 15 Mexico                   6511.  3678980            565
    ## 16 South Africa             5144.  2906422            565
    ## 17 Poland                   5117.  2911549            569
    ## 18 Philippines              4558.  2593399            569
    ## 19 Ukraine                  4401.  2460010            559
    ## 20 Malaysia                 3968.  2277565            574

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             175566.            571
    ##  2 Czech Republic                283.             161713.            571
    ##  3 United States                 237.             139667.            589
    ##  4 Serbia                        232.             130841.            564
    ##  5 Jordan                        230.             128964.            561
    ##  6 Argentina                     226.             127221.            564
    ##  7 United Kingdom                218.             126718.            580
    ##  8 Sweden                        210.             120727.            576
    ##  9 Netherlands                   209.             120638.            576
    ## 10 Belgium                       207.             119888.            579
    ## 11 Switzerland                   191.             110889.            580
    ## 12 Brazil                        187.             106707.            570
    ## 13 Colombia                      184.             103801.            565
    ## 14 Spain                         184.             106677.            581
    ## 15 France                        181.             105179.            582
    ## 16 Portugal                      176.             100329.            570
    ## 17 Chile                         174.              98922.            567
    ## 18 Turkey                        165.              93032.            565
    ## 19 Austria                       158.              90784.            574
    ## 20 Hungary                       147.              82636.            563

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1734     9139
    ##  2 Peru                 9.16     199457  2178147
    ##  3 Mexico               7.57     278592  3678980
    ##  4 Sudan                7.50       2876    38345
    ##  5 Syria                6.52       2276    34920
    ##  6 Ecuador              6.42      32762   510619
    ##  7 Egypt                5.68      17436   306798
    ##  8 Somalia              5.53       1137    20577
    ##  9 Afghanistan          4.64       7212   155287
    ## 10 China                4.56       5692   124805
    ## 11 Bulgaria             4.16      21038   505994
    ## 12 Myanmar              3.81      17921   469782
    ## 13 Bolivia              3.74      18762   501179
    ## 14 Malawi               3.71       2284    61612
    ## 15 Hungary              3.66      30230   824876
    ## 16 Mali                 3.59        549    15288
    ## 17 Zimbabwe             3.53       4627   131129
    ## 18 Paraguay             3.52      16200   460022
    ## 19 Tunisia              3.52      24934   708203
    ## 20 Chad                 3.45        174     5046

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6669.     199457   29.9 
    ##  2 Hungary                3028.      30230    9.98
    ##  3 Brazil                 2972.     597723  201.  
    ##  4 Bulgaria               2943.      21038    7.15
    ##  5 Czech Republic         2909.      30478   10.5 
    ##  6 Argentina              2788.     115245   41.3 
    ##  7 Colombia               2644.     126372   47.8 
    ##  8 Paraguay               2541.      16200    6.38
    ##  9 Mexico                 2477.     278592  112.  
    ## 10 Belgium                2462.      25612   10.4 
    ## 11 Tunisia                2355.      24934   10.6 
    ## 12 Slovakia               2324.      12676    5.46
    ## 13 United States          2241.     695238  310.  
    ## 14 Chile                  2239.      37494   16.7 
    ## 15 Ecuador                2215.      32762   14.8 
    ## 16 United Kingdom         2197.     136953   62.3 
    ## 17 Italy                  2172.     131031   60.3 
    ## 18 Poland                 1966.      75695   38.5 
    ## 19 Bolivia                1886.      18762    9.95
    ## 20 Spain                  1859.      86463   46.5

EOL
