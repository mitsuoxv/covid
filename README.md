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

Updated: 2022-01-12

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
    ##  1 United States           88141. 59848136            679
    ##  2 India                   53706. 35875790            668
    ##  3 Brazil                  33668. 22523907            669
    ##  4 United Kingdom          21591. 14617318            677
    ##  5 France                  17485. 11907500            681
    ##  6 Russia                  16090. 10684204            664
    ##  7 Turkey                  15124. 10042797            664
    ##  8 Germany                 11116.  7581381            682
    ##  9 Italy                   10980.  7554344            688
    ## 10 Spain                   10966.  7457301            680
    ## 11 Argentina                9518.  6310844            663
    ## 12 Iran                     9050.  6208337            686
    ## 13 Colombia                 8028.  5330662            664
    ## 14 Indonesia                6388.  4267451            668
    ## 15 Poland                   6336.  4232386            668
    ## 16 Mexico                   6157.  4125388            670
    ## 17 Ukraine                  5638.  3709871            658
    ## 18 South Africa             5314.  3528463            664
    ## 19 Netherlands              4994.  3371037            675
    ## 20 Philippines              4489.  2998530            668

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                362.             242296.            670
    ##  2 United Kingdom                346.             234446.            677
    ##  3 Belgium                       324.             219795.            678
    ##  4 Israel                        314.             210872.            671
    ##  5 Netherlands                   300.             202526.            675
    ##  6 Switzerland                   299.             203146.            679
    ##  7 United States                 284.             192914.            679
    ##  8 Serbia                        279.             185102.            663
    ##  9 France                        270.             183847.            681
    ## 10 Denmark                       267.             179413.            673
    ## 11 Jordan                        256.             168965.            660
    ## 12 Austria                       244.             164205.            673
    ## 13 Slovakia                      239.             158829.            664
    ## 14 Spain                         236.             160352.            680
    ## 15 Portugal                      232.             155494.            669
    ## 16 Argentina                     230.             152645.            663
    ## 17 Sweden                        220.             148249.            675
    ## 18 Greece                        208.             139580.            670
    ## 19 Hungary                       197.             130334.            662
    ## 20 Turkey                        194.             129078.            664

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1987    10208
    ##  2 Peru                 8.55     203067  2375813
    ##  3 Mexico               7.28     300334  4125388
    ##  4 Sudan                6.89       3347    48606
    ##  5 Ecuador              5.97      33706   564238
    ##  6 Syria                5.80       2930    50527
    ##  7 Egypt                5.59      21995   393808
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.65       7373   158394
    ## 10 China                4.24       5699   134399
    ## 11 Bulgaria             4.02      31672   787178
    ## 12 Myanmar              3.63      19293   532167
    ## 13 Paraguay             3.50      16673   476892
    ## 14 Niger                3.48        281     8076
    ## 15 Tunisia              3.45      25670   744967
    ## 16 Indonesia            3.38     144144  4267451
    ## 17 Romania              3.19      59027  1848641
    ## 18 El Salvador          3.12       3827   122469
    ## 19 Hungary              3.08      40016  1300994
    ## 20 Malawi               3.01       2420    80269

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6790.     203067   29.9 
    ##  2 Bulgaria               4430.      31672    7.15
    ##  3 Hungary                4009.      40016    9.98
    ##  4 Czech Republic         3502.      36683   10.5 
    ##  5 Slovakia               3124.      17039    5.46
    ##  6 Brazil                 3083.     619981  201.  
    ##  7 Argentina              2842.     117492   41.3 
    ##  8 Belgium                2741.      28518   10.4 
    ##  9 Colombia               2727.     130338   47.8 
    ## 10 Romania                2688.      59027   22.0 
    ## 11 United States          2680.     831548  310.  
    ## 12 Mexico                 2670.     300334  112.  
    ## 13 Paraguay               2615.      16673    6.38
    ## 14 Poland                 2604      100254   38.5 
    ## 15 Tunisia                2424.      25670   10.6 
    ## 16 United Kingdom         2410.     150230   62.3 
    ## 17 Chile                  2346.      39285   16.7 
    ## 18 Italy                  2308.     139265   60.3 
    ## 19 Ecuador                2279.      33706   14.8 
    ## 20 Russia                 2258.     317687  141.

EOL
