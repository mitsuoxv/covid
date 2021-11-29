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

Updated: 2021-11-30

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
    ##  1 United States           75216. 47837599            636
    ##  2 India                   55329. 34580832            625
    ##  3 Brazil                  35266. 22076863            626
    ##  4 United Kingdom          15954. 10146919            636
    ##  5 Russia                  15466.  9604233            621
    ##  6 Turkey                  14084.  8746055            621
    ##  7 France                  11580.  7388196            638
    ##  8 Iran                     9500.  6108882            643
    ##  9 Germany                  9063.  5791060            639
    ## 10 Argentina                8589.  5325560            620
    ## 11 Colombia                 8153.  5063177            621
    ## 12 Spain                    8055.  5131013            637
    ## 13 Italy                    7764.  5007818            645
    ## 14 Indonesia                6810.  4256112            625
    ## 15 Mexico                   6192.  3882792            627
    ## 16 Poland                   5633.  3520961            625
    ## 17 Ukraine                  5574.  3427827            615
    ## 18 South Africa             4769.  2961406            621
    ## 19 Philippines              4531.  2831807            625
    ## 20 Malaysia                 4165.  2623816            630

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                325.             203549.            627
    ##  2 Israel                        291.             182546.            627
    ##  3 Serbia                        275.             170241.            620
    ##  4 Belgium                       258.             163571.            635
    ##  5 United Kingdom                256.             162745.            636
    ##  6 Netherlands                   247.             156178.            632
    ##  7 United States                 242.             154199.            636
    ##  8 Jordan                        239.             147228.            617
    ##  9 Austria                       221.             139202.            630
    ## 10 Argentina                     208.             128813.            620
    ## 11 Switzerland                   204.             129573.            636
    ## 12 Slovakia                      199.             123376.            621
    ## 13 Sweden                        198.             125456.            632
    ## 14 Turkey                        181.             112411.            621
    ## 15 France                        179.             114071.            638
    ## 16 Hungary                       177.             109870.            619
    ## 17 Brazil                        175.             109779.            626
    ## 18 Spain                         173.             110330.            637
    ## 19 Portugal                      171.             107035.            626
    ## 20 Colombia                      171.             105946.            621

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1946     9987
    ##  2 Peru                 9.01     201071  2232749
    ##  3 Mexico               7.57     293859  3882792
    ##  4 Sudan                7.33       3141    42826
    ##  5 Ecuador              6.32      33128   524432
    ##  6 Somalia              5.77       1327    23016
    ##  7 Syria                5.71       2739    47965
    ##  8 Egypt                5.70      20347   356718
    ##  9 Afghanistan          4.65       7308   157218
    ## 10 China                4.46       5697   127764
    ## 11 Bulgaria             4.08      28101   689356
    ## 12 Malawi               3.72       2305    61897
    ## 13 Myanmar              3.66      19088   521561
    ## 14 Niger                3.65        254     6958
    ## 15 Bolivia              3.58      19137   535115
    ## 16 Paraguay             3.56      16461   462908
    ## 17 Tunisia              3.54      25363   717258
    ## 18 Zimbabwe             3.51       4705   133991
    ## 19 Mali                 3.49        605    17340
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6723.     201071   29.9 
    ##  2 Bulgaria               3931.      28101    7.15
    ##  3 Hungary                3439.      34326    9.98
    ##  4 Czech Republic         3143.      32929   10.5 
    ##  5 Brazil                 3054.     614186  201.  
    ##  6 Argentina              2818.     116517   41.3 
    ##  7 Colombia               2687.     128394   47.8 
    ##  8 Slovakia               2629.      14341    5.46
    ##  9 Mexico                 2613.     293859  112.  
    ## 10 Paraguay               2582.      16461    6.38
    ## 11 Belgium                2580.      26840   10.4 
    ## 12 Romania                2563.      56275   22.0 
    ## 13 United States          2488.     771919  310.  
    ## 14 Tunisia                2395.      25363   10.6 
    ## 15 United Kingdom         2322.     144775   62.3 
    ## 16 Chile                  2288.      38313   16.7 
    ## 17 Ecuador                2240.      33128   14.8 
    ## 18 Italy                  2215.     133674   60.3 
    ## 19 Poland                 2157.      83055   38.5 
    ## 20 Russia                 1947.     273964  141.

EOL
