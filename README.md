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

Updated: 2021-12-04

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
    ##  1 United States           75646. 48413265            640
    ##  2 India                   55033. 34615757            629
    ##  3 Brazil                  35088. 22105872            630
    ##  4 United Kingdom          16139. 10329078            640
    ##  5 Russia                  15577.  9736037            625
    ##  6 Turkey                  14144.  8839891            625
    ##  7 France                  11742.  7538806            642
    ##  8 Iran                     9467.  6125596            647
    ##  9 Germany                  9411.  6051560            643
    ## 10 Argentina                8546.  5332629            624
    ## 11 Colombia                 8115.  5071817            625
    ## 12 Spain                    8095.  5189220            641
    ## 13 Italy                    7797.  5060430            649
    ## 14 Indonesia                6768.  4257243            629
    ## 15 Mexico                   6167.  3891218            631
    ## 16 Poland                   5760.  3623452            629
    ## 17 Ukraine                  5618.  3477649            619
    ## 18 South Africa             4781.  2988148            625
    ## 19 Philippines              4505.  2833473            629
    ## 20 Netherlands              4221.  2684734            636

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                335.             211147.            631
    ##  2 Israel                        290.             182864.            631
    ##  3 Serbia                        275.             171413.            624
    ##  4 Belgium                       272.             173946.            639
    ##  5 United Kingdom                259.             165667.            640
    ##  6 Netherlands                   254.             161294.            636
    ##  7 United States                 244.             156055.            640
    ##  8 Jordan                        241.             149676.            621
    ##  9 Austria                       226.             143536.            634
    ## 10 Switzerland                   212.             135841.            640
    ## 11 Slovakia                      209.             130660.            625
    ## 12 Argentina                     207.             128984.            624
    ## 13 Sweden                        199.             126617.            636
    ## 14 Hungary                       182.             113692.            623
    ## 15 Turkey                        182.             113617.            625
    ## 16 France                        181.             116396.            642
    ## 17 Brazil                        174.             109923.            630
    ## 18 Spain                         174.             111582.            641
    ## 19 Portugal                      172.             108169.            630
    ## 20 Colombia                      170.             106127.            625

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1950    10006
    ##  2 Peru                 8.99     201209  2237842
    ##  3 Mexico               7.57     294428  3891218
    ##  4 Sudan                7.28       3164    43489
    ##  5 Ecuador              6.31      33250   526870
    ##  6 Somalia              5.77       1327    23016
    ##  7 Egypt                5.71      20537   359516
    ##  8 Syria                5.71       2755    48267
    ##  9 Afghanistan          4.64       7310   157387
    ## 10 China                4.45       5697   128141
    ## 11 Bulgaria             4.10      28656   699180
    ## 12 Malawi               3.72       2307    61936
    ## 13 Niger                3.70        261     7056
    ## 14 Myanmar              3.65      19120   523346
    ## 15 Paraguay             3.56      16474   463121
    ## 16 Bolivia              3.56      19196   539762
    ## 17 Tunisia              3.54      25376   717710
    ## 18 Mali                 3.48        611    17573
    ## 19 Zimbabwe             3.45       4707   136379
    ## 20 Indonesia            3.38     143858  4257243

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6728.     201209   29.9 
    ##  2 Bulgaria               4009.      28656    7.15
    ##  3 Hungary                3519.      35122    9.98
    ##  4 Czech Republic         3193.      33450   10.5 
    ##  5 Brazil                 3058.     614964  201.  
    ##  6 Argentina              2820.     116597   41.3 
    ##  7 Slovakia               2694.      14696    5.46
    ##  8 Colombia               2691.     128586   47.8 
    ##  9 Mexico                 2618.     294428  112.  
    ## 10 Belgium                2607.      27120   10.4 
    ## 11 Paraguay               2584.      16474    6.38
    ## 12 Romania                2581.      56684   22.0 
    ## 13 United States          2509.     778336  310.  
    ## 14 Tunisia                2396.      25376   10.6 
    ## 15 United Kingdom         2330.     145281   62.3 
    ## 16 Chile                  2293.      38403   16.7 
    ## 17 Ecuador                2248.      33250   14.8 
    ## 18 Italy                  2221.     134003   60.3 
    ## 19 Poland                 2211.      85126   38.5 
    ## 20 Russia                 1982.     278857  141.

EOL
