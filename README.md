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

Updated: 2021-12-07

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
    ##  1 United States           75742. 48702375            643
    ##  2 India                   54812. 34641561            632
    ##  3 Brazil                  34973. 22138247            633
    ##  4 United Kingdom          16274. 10464393            643
    ##  5 Russia                  15659.  9833749            628
    ##  6 Turkey                  14173.  8901117            628
    ##  7 France                  11910.  7682238            645
    ##  8 Germany                  9576.  6185961            646
    ##  9 Iran                     9437.  6134465            650
    ## 10 Argentina                8516.  5339382            627
    ## 11 Colombia                 8087.  5078987            628
    ## 12 Spain                    8058.  5189221            644
    ## 13 Italy                    7836.  5109082            652
    ## 14 Indonesia                6737.  4257815            632
    ## 15 Mexico                   6152.  3900293            634
    ## 16 Poland                   5830.  3684671            632
    ## 17 Ukraine                  5630.  3501955            622
    ## 18 South Africa             4827.  3031694            628
    ## 19 Philippines              4485.  2834775            632
    ## 20 Netherlands              4306.  2751954            639

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                338.             214497.            634
    ##  2 Israel                        289.             183044.            634
    ##  3 Serbia                        274.             172048.            627
    ##  4 Belgium                       274.             175667.            642
    ##  5 United Kingdom                261.             167837.            643
    ##  6 Netherlands                   259.             165332.            639
    ##  7 United States                 244.             156987.            643
    ##  8 Jordan                        244.             152324.            624
    ##  9 Austria                       229.             145823.            637
    ## 10 Slovakia                      214.             134280.            628
    ## 11 Switzerland                   213.             137150.            643
    ## 12 Argentina                     206.             129148.            627
    ## 13 Sweden                        198.             126848.            639
    ## 14 Hungary                       185.             115966.            626
    ## 15 France                        184.             118611.            645
    ## 16 Turkey                        182.             114404.            628
    ## 17 Brazil                        174.             110084.            633
    ## 18 Spain                         173.             111582.            644
    ## 19 Portugal                      173.             109291.            633
    ## 20 Colombia                      169.             106277.            628

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1954    10025
    ##  2 Peru                 8.98     201360  2242646
    ##  3 Mexico               7.57     295155  3900293
    ##  4 Sudan                7.26       3200    44075
    ##  5 Ecuador              6.31      33250   526870
    ##  6 Somalia              5.77       1331    23051
    ##  7 Syria                5.71       2777    48619
    ##  8 Egypt                5.71      20727   363162
    ##  9 Afghanistan          4.64       7312   157454
    ## 10 China                4.44       5697   128393
    ## 11 Bulgaria             4.10      28852   703160
    ## 12 Malawi               3.72       2307    61981
    ## 13 Niger                3.69        261     7080
    ## 14 Myanmar              3.65      19141   524407
    ## 15 Paraguay             3.56      16477   463315
    ## 16 Bolivia              3.54      19215   542859
    ## 17 Tunisia              3.54      25401   718443
    ## 18 Mali                 3.45        618    17916
    ## 19 Zimbabwe             3.39       4710   139046
    ## 20 Indonesia            3.38     143876  4257815

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6733.     201360   29.9 
    ##  2 Bulgaria               4036.      28852    7.15
    ##  3 Hungary                3568.      35611    9.98
    ##  4 Czech Republic         3223.      33768   10.5 
    ##  5 Brazil                 3061.     615570  201.  
    ##  6 Argentina              2821.     116643   41.3 
    ##  7 Slovakia               2731.      14900    5.46
    ##  8 Colombia               2694.     128733   47.8 
    ##  9 Mexico                 2624.     295155  112.  
    ## 10 Belgium                2611.      27167   10.4 
    ## 11 Romania                2600.      57099   22.0 
    ## 12 Paraguay               2584.      16477    6.38
    ## 13 United States          2518.     781265  310.  
    ## 14 Tunisia                2399.      25401   10.6 
    ## 15 United Kingdom         2335.     145605   62.3 
    ## 16 Chile                  2299.      38501   16.7 
    ## 17 Ecuador                2248.      33250   14.8 
    ## 18 Poland                 2226.      85700   38.5 
    ## 19 Italy                  2224.     134195   60.3 
    ## 20 Russia                 2008.     282462  141.

EOL
