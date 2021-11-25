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

Updated: 2021-11-26

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
    ##  1 United States           75478. 47702004            632
    ##  2 India                   55628. 34544882            621
    ##  3 Brazil                  35418. 22030182            622
    ##  4 United Kingdom          15783.  9974847            632
    ##  5 Russia                  15345.  9468189            617
    ##  6 Turkey                  14023.  8652172            617
    ##  7 France                  11438.  7251808            634
    ##  8 Iran                     9535.  6092822            639
    ##  9 Germany                  8777.  5573756            635
    ## 10 Argentina                8632.  5317633            616
    ## 11 Colombia                 8189.  5052733            617
    ## 12 Spain                    8075.  5111842            633
    ## 13 Italy                    7729.  4954585            641
    ## 14 Indonesia                6851.  4254815            621
    ## 15 Mexico                   6208.  3867976            623
    ## 16 Ukraine                  5539.  3384404            611
    ## 17 Poland                   5530.  3434272            621
    ## 18 South Africa             4781.  2950035            617
    ## 19 Philippines              4555.  2828660            621
    ## 20 Malaysia                 4158.  2602835            626

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                316.             196837.            623
    ##  2 Israel                        293.             182280.            623
    ##  3 Serbia                        274.             169029.            616
    ##  4 United Kingdom                253.             159985.            632
    ##  5 Belgium                       253.             159476.            631
    ##  6 United States                 243.             153762.            632
    ##  7 Netherlands                   240.             150913.            628
    ##  8 Jordan                        236.             144880.            613
    ##  9 Austria                       213.             133223.            626
    ## 10 Argentina                     209.             128622.            616
    ## 11 Switzerland                   202.             127466.            632
    ## 12 Sweden                        199.             125016.            628
    ## 13 Slovakia                      191.             117672.            617
    ## 14 Turkey                        180.             111205.            617
    ## 15 France                        177.             111965.            634
    ## 16 Brazil                        176.             109547.            622
    ## 17 Spain                         174.             109918.            633
    ## 18 Hungary                       172.             105892.            615
    ## 19 Colombia                      171.             105728.            617
    ## 20 Portugal                      170.             105853.            622

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1942     9972
    ##  2 Peru                 9.02     200931  2226656
    ##  3 Mexico               7.57     292850  3867976
    ##  4 Sudan                7.40       3114    42056
    ##  5 Ecuador              6.32      33128   524432
    ##  6 Somalia              5.76       1324    22969
    ##  7 Syria                5.72       2719    47558
    ##  8 Egypt                5.70      20109   353024
    ##  9 Afghanistan          4.65       7306   157032
    ## 10 China                4.46       5697   127602
    ## 11 Bulgaria             4.07      27778   682552
    ## 12 Malawi               3.72       2304    61867
    ## 13 Myanmar              3.67      19049   519731
    ## 14 Bolivia              3.59      19096   531428
    ## 15 Niger                3.59        248     6902
    ## 16 Paraguay             3.54      16364   462389
    ## 17 Tunisia              3.54      25356   716702
    ## 18 Zimbabwe             3.52       4703   133747
    ## 19 Mali                 3.52        601    17097
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6719.     200931   29.9 
    ##  2 Bulgaria               3886.      27778    7.15
    ##  3 Hungary                3376.      33704    9.98
    ##  4 Czech Republic         3105.      32523   10.5 
    ##  5 Brazil                 3049.     613066  201.  
    ##  6 Argentina              2816.     116415   41.3 
    ##  7 Colombia               2682.     128188   47.8 
    ##  8 Mexico                 2604.     292850  112.  
    ##  9 Slovakia               2586.      14107    5.46
    ## 10 Belgium                2571.      26743   10.4 
    ## 11 Paraguay               2567.      16364    6.38
    ## 12 Romania                2533.      55617   22.0 
    ## 13 United States          2483.     770162  310.  
    ## 14 Tunisia                2395.      25356   10.6 
    ## 15 United Kingdom         2314.     144286   62.3 
    ## 16 Chile                  2280.      38175   16.7 
    ## 17 Ecuador                2240.      33128   14.8 
    ## 18 Italy                  2211.     133415   60.3 
    ## 19 Poland                 2135.      82186   38.5 
    ## 20 Bolivia                1920.      19096    9.95

EOL
