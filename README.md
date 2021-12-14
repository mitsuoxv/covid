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

Updated: 2021-12-15

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
    ##  1 United States           76230. 49625855            651
    ##  2 India                   54224. 34703644            640
    ##  3 Brazil                  34583. 22167781            641
    ##  4 United Kingdom          16703. 10873472            651
    ##  5 Russia                  15841. 10074797            636
    ##  6 Turkey                  14243.  9058978            636
    ##  7 France                  12294.  8028319            653
    ##  8 Germany                 10034.  6562429            654
    ##  9 Iran                     9358.  6157519            658
    ## 10 Argentina                8438.  5358455            635
    ## 11 Spain                    8190.  5339992            652
    ## 12 Colombia                 8009.  5093534            636
    ## 13 Italy                    7936.  5238221            660
    ## 14 Indonesia                6655.  4259439            640
    ## 15 Mexico                   6103.  3918216            642
    ## 16 Poland                   6027.  3857085            640
    ## 17 Ukraine                  5667.  3570448            630
    ## 18 South Africa             5001.  3180785            636
    ## 19 Netherlands              4473.  2894209            647
    ## 20 Philippines              4432.  2836803            640

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                349.             224355.            642
    ##  2 Belgium                       290.             188330.            650
    ##  3 Israel                        286.             183755.            642
    ##  4 Serbia                        273.             173620.            635
    ##  5 Netherlands                   269.             173879.            647
    ##  6 United Kingdom                268.             174398.            651
    ##  7 Jordan                        251.             158463.            632
    ##  8 United States                 246.             159963.            651
    ##  9 Austria                       232.             149820.            645
    ## 10 Switzerland                   229.             149037.            651
    ## 11 Slovakia                      225.             143353.            636
    ## 12 Argentina                     204.             129609.            635
    ## 13 Sweden                        200.             129342.            647
    ## 14 Hungary                       190.             120468.            634
    ## 15 France                        190.             123954.            653
    ## 16 Turkey                        183.             116433.            636
    ## 17 Spain                         176.             114824.            652
    ## 18 Portugal                      175.             112083.            641
    ## 19 Brazil                        172.             110231.            641
    ## 20 Colombia                      168.             106582.            636

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1972    10072
    ##  2 Peru                 8.95     201770  2254373
    ##  3 Mexico               7.57     296672  3918216
    ##  4 Sudan                7.21       3252    45112
    ##  5 Ecuador              6.29      33561   533457
    ##  6 Somalia              5.78       1333    23074
    ##  7 Syria                5.71       2818    49350
    ##  8 Egypt                5.70      21104   369997
    ##  9 Afghanistan          4.65       7328   157648
    ## 10 China                4.41       5697   129165
    ## 11 Bulgaria             4.14      29688   716647
    ## 12 Niger                3.76        269     7163
    ## 13 Malawi               3.70       2308    62380
    ## 14 Myanmar              3.64      19188   526911
    ## 15 Paraguay             3.56      16505   463755
    ## 16 Tunisia              3.53      25437   719662
    ## 17 Bolivia              3.49      19317   553108
    ## 18 Mali                 3.38        630    18628
    ## 19 Indonesia            3.38     143960  4259439
    ## 20 Romania              3.22      57741  1793643

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6747.     201770   29.9 
    ##  2 Bulgaria               4153.      29688    7.15
    ##  3 Hungary                3715.      37079    9.98
    ##  4 Czech Republic         3312.      34697   10.5 
    ##  5 Brazil                 3064.     616251  201.  
    ##  6 Slovakia               2844.      15516    5.46
    ##  7 Argentina              2824.     116771   41.3 
    ##  8 Colombia               2702.     129107   47.8 
    ##  9 Belgium                2656.      27631   10.4 
    ## 10 Mexico                 2638.     296672  112.  
    ## 11 Romania                2629.      57741   22.0 
    ## 12 Paraguay               2589.      16505    6.38
    ## 13 United States          2549.     790920  310.  
    ## 14 Tunisia                2402.      25437   10.6 
    ## 15 United Kingdom         2349.     146477   62.3 
    ## 16 Poland                 2313.      89045   38.5 
    ## 17 Chile                  2312.      38716   16.7 
    ## 18 Ecuador                2269.      33561   14.8 
    ## 19 Italy                  2236.     134929   60.3 
    ## 20 Russia                 2074.     291749  141.

EOL
