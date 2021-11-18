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

Updated: 2021-11-19

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
    ##  1 United States           75249. 47030792            625
    ##  2 India                   56154. 34478517            614
    ##  3 Brazil                  35716. 21965684            615
    ##  4 United Kingdom          15480.  9675062            625
    ##  5 Russia                  15114.  9219912            610
    ##  6 Turkey                  13903.  8480986            610
    ##  7 France                  11328.  7102897            627
    ##  8 Iran                     9585.  6057893            632
    ##  9 Argentina                8717   5308781            609
    ## 10 Germany                  8273.  5195321            628
    ## 11 Colombia                 8256.  5036287            610
    ## 12 Spain                    8095.  5067712            626
    ## 13 Italy                    7702.  4883242            634
    ## 14 Indonesia                6925.  4252345            614
    ## 15 Mexico                   6245.  3847243            616
    ## 16 Ukraine                  5437.  3284008            604
    ## 17 Poland                   5342.  3279787            614
    ## 18 South Africa             4798.  2926914            610
    ## 19 Philippines              4593.  2820494            614
    ## 20 Malaysia                 4141.  2563153            619

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                301.             185605.            616
    ##  2 Israel                        296.             182071.            616
    ##  3 Serbia                        273.             166378.            609
    ##  4 United Kingdom                248.             155177.            625
    ##  5 United States                 243.             151598.            625
    ##  6 Belgium                       238.             148351.            624
    ##  7 Jordan                        232.             140781.            606
    ##  8 Netherlands                   228.             141498.            621
    ##  9 Argentina                     211.             128408.            609
    ## 10 Sweden                        200.             124152.            621
    ## 11 Austria                       196.             121397.            619
    ## 12 Switzerland                   195.             122014.            625
    ## 13 Turkey                        179.             109004.            610
    ## 14 Brazil                        178.             109226.            615
    ## 15 Slovakia                      176.             107392.            610
    ## 16 France                        175.             109666.            627
    ## 17 Spain                         174.             108969.            626
    ## 18 Colombia                      173.             105384.            610
    ## 19 Portugal                      169.             104223.            615
    ## 20 Chile                         169.             103459.            612

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1929     9947
    ##  2 Peru                 9.05     200695  2216832
    ##  3 Mexico               7.57     291241  3847243
    ##  4 Sudan                7.43       3087    41558
    ##  5 Ecuador              6.34      33088   521792
    ##  6 Somalia              5.75       1313    22837
    ##  7 Syria                5.74       2682    46703
    ##  8 Egypt                5.68      19707   346808
    ##  9 Afghanistan          4.66       7297   156739
    ## 10 China                4.47       5697   127374
    ## 11 Bulgaria             4.03      26840   665578
    ## 12 Malawi               3.72       2302    61854
    ## 13 Myanmar              3.68      18975   515559
    ## 14 Bolivia              3.62      19030   525187
    ## 15 Tunisia              3.54      25325   715911
    ## 16 Paraguay             3.54      16342   462059
    ## 17 Zimbabwe             3.52       4699   133557
    ## 18 Mali                 3.51        589    16759
    ## 19 Niger                3.50        236     6750
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6711.     200695   29.9 
    ##  2 Bulgaria               3754.      26840    7.15
    ##  3 Hungary                3270.      32645    9.98
    ##  4 Brazil                 3041.     611478  201.  
    ##  5 Czech Republic         3033.      31769   10.5 
    ##  6 Argentina              2813.     116294   41.3 
    ##  7 Colombia               2676.     127865   47.8 
    ##  8 Mexico                 2590.     291241  112.  
    ##  9 Paraguay               2563.      16342    6.38
    ## 10 Belgium                2546.      26484   10.4 
    ## 11 Slovakia               2516.      13725    5.46
    ## 12 Romania                2460.      54011   22.0 
    ## 13 United States          2448.     759388  310.  
    ## 14 Tunisia                2392.      25325   10.6 
    ## 15 United Kingdom         2299.     143360   62.3 
    ## 16 Chile                  2270.      38016   16.7 
    ## 17 Ecuador                2237.      33088   14.8 
    ## 18 Italy                  2204.     132965   60.3 
    ## 19 Poland                 2078.      79994   38.5 
    ## 20 Bolivia                1913.      19030    9.95

EOL
