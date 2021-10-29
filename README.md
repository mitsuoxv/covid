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

Updated: 2021-10-30

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
    ##  1 United States           71793. 45445663            633
    ##  2 India                   57653. 34246157            594
    ##  3 Brazil                  36582. 21766168            595
    ##  4 United Kingdom          14770.  8936159            605
    ##  5 Russia                  14292.  8432546            590
    ##  6 Turkey                  13494.  7961535            590
    ##  7 France                  11407.  6923896            607
    ##  8 Iran                     9639.  5899509            612
    ##  9 Argentina                8972.  5284485            589
    ## 10 Colombia                 8467.  4995694            590
    ## 11 Spain                    8265.  5008888            606
    ## 12 Italy                    7748.  4757231            614
    ## 13 Germany                  7498.  4559120            608
    ## 14 Indonesia                7142.  4242532            594
    ## 15 Mexico                   6430.  3793783            590
    ## 16 Poland                   5064.  3008294            594
    ## 17 South Africa             4951.  2921114            590
    ## 18 Ukraine                  4929.  2878674            584
    ## 19 Philippines              4667.  2772491            594
    ## 20 Malaysia                 4098.  2454749            599

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        303.             180358.            596
    ##  2 Czech Republic                281.             167248.            596
    ##  3 Serbia                        260.             153251.            589
    ##  4 United Kingdom                237.             143326.            605
    ##  5 United States                 231.             146489.            633
    ##  6 Jordan                        228.             133672.            586
    ##  7 Argentina                     217.             127820.            589
    ##  8 Belgium                       215.             129954.            604
    ##  9 Netherlands                   211.             126678.            601
    ## 10 Sweden                        204.             122482.            601
    ## 11 Switzerland                   189.             114615.            605
    ## 12 Brazil                        182.             108234.            595
    ## 13 Spain                         178.             107704.            606
    ## 14 Colombia                      177.             104534.            590
    ## 15 France                        176.             106902.            607
    ## 16 Turkey                        173.             102328.            590
    ## 17 Portugal                      171.             101923.            595
    ## 18 Chile                         170.             100824.            592
    ## 19 Austria                       165.              98739.            599
    ## 20 Slovakia                      147.              87002.            590

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.2        1874     9751
    ##  2 Peru                 9.11     200149  2198038
    ##  3 Mexico               7.57     287274  3793783
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32958   515859
    ##  6 Syria                5.99       2536    42351
    ##  7 Egypt                5.63      18428   327286
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.65       7268   156166
    ## 10 China                4.53       5696   125810
    ## 11 Bulgaria             4.00      23718   592943
    ## 12 Myanmar              3.74      18622   497700
    ## 13 Malawi               3.72       2298    61782
    ## 14 Bolivia              3.69      18911   511854
    ## 15 Hungary              3.56      30729   863419
    ## 16 Tunisia              3.54      25221   712139
    ## 17 Mali                 3.52        562    15948
    ## 18 Paraguay             3.52      16238   460894
    ## 19 Zimbabwe             3.52       4675   132880
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6692.     200149   29.9 
    ##  2 Bulgaria               3318.      23718    7.15
    ##  3 Hungary                3078.      30729    9.98
    ##  4 Brazil                 3017.     606679  201.  
    ##  5 Czech Republic         2931.      30705   10.5 
    ##  6 Argentina              2803.     115889   41.3 
    ##  7 Colombia               2661.     127159   47.8 
    ##  8 Mexico                 2554.     287274  112.  
    ##  9 Paraguay               2547.      16238    6.38
    ## 10 Belgium                2497.      25976   10.4 
    ## 11 Slovakia               2383.      13000    5.46
    ## 12 Tunisia                2382.      25221   10.6 
    ## 13 United States          2375.     736801  310.  
    ## 14 Chile                  2252.      37719   16.7 
    ## 15 United Kingdom         2249.     140206   62.3 
    ## 16 Ecuador                2228.      32958   14.8 
    ## 17 Italy                  2188.     132004   60.3 
    ## 18 Romania                2136.      46911   22.0 
    ## 19 Poland                 1997.      76875   38.5 
    ## 20 Bolivia                1901.      18911    9.95

EOL
