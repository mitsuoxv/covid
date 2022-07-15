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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-16

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          101884. 88027926            864
    ##  2 India                   51243. 43710027            853
    ##  3 Brazil                  38822. 33076779            852
    ##  4 France                  36776. 31848565            866
    ##  5 Germany                 34067. 29569943            868
    ##  6 United Kingdom          26707. 23075360            864
    ##  7 Italy                   22781. 19887543            873
    ##  8 Russia                  21768. 18480934            849
    ##  9 South Korea             21324. 18680142            876
    ## 10 Turkey                  18018. 15297539            849
    ## 11 Spain                   15067. 13032841            865
    ## 12 Vietnam                 12731. 10758189            845
    ## 13 Japan                   11429. 10000720            875
    ## 14 Argentina               11025.  9426171            855
    ## 15 Australia               10098.  8643705            856
    ## 16 Netherlands              9613.  8267718            860
    ## 17 Iran                     8335.  7260017            871
    ## 18 Mexico                   7414.  6338991            855
    ## 19 Colombia                 7310.  6198848            848
    ## 20 Indonesia                7183.  6127084            853

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        714.             610962.            856
    ##  2 Denmark                       680.             583843.            858
    ##  3 Austria                       656.             562932.            858
    ##  4 Switzerland                   587.             506997.            864
    ##  5 Portugal                      579.             493981.            853
    ##  6 Netherlands                   578.             496709.            860
    ##  7 France                        568.             491730.            866
    ##  8 Belgium                       484.             418057.            863
    ##  9 Australia                     469.             401738.            856
    ## 10 Czech Republic                441.             377004.            855
    ## 11 South Korea                   440.             385773.            876
    ## 12 United Kingdom                428.             370103.            864
    ## 13 Germany                       416.             361481.            868
    ## 14 Greece                        409.             349377.            855
    ## 15 Slovakia                      390.             330804.            849
    ## 16 Italy                         378.             329590.            873
    ## 17 Norway                        336.             289840.            862
    ## 18 Serbia                        329.             279024.            848
    ## 19 United States                 328.             283748.            864
    ## 20 Spain                         324.             280240.            865

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11832
    ##  2 Sudan                 7.89       4955    62795
    ##  3 Peru                  5.77     213731  3703751
    ##  4 Syria                 5.63       3150    55960
    ##  5 Mexico                5.15     326261  6338991
    ##  6 Somalia               5.06       1361    26900
    ##  7 Egypt                 4.81      24725   514182
    ##  8 Afghanistan           4.22       7728   183285
    ##  9 Ecuador               3.87      35763   924884
    ## 10 Niger                 3.42        311     9096
    ## 11 Myanmar               3.17      19434   613784
    ## 12 Bulgaria              3.15      37283  1182764
    ## 13 Malawi                3.05       2649    86750
    ## 14 Paraguay              2.83      19036   673829
    ## 15 Tunisia               2.65      28823  1087030
    ## 16 Haiti                 2.62        837    31980
    ## 17 Chad                  2.60        193     7427
    ## 18 Algeria               2.58       6875   266356
    ## 19 Indonesia             2.56     156833  6127084
    ## 20 South Africa          2.55     101915  3999345

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7147.     213731   29.9 
    ##  2 Bulgaria               5215.      37283    7.15
    ##  3 Hungary                4678.      46696    9.98
    ##  4 Czech Republic         3851.      40346   10.5 
    ##  5 Slovakia               3697.      20169    5.46
    ##  6 Chile                  3520.      58955   16.7 
    ##  7 Brazil                 3354.     674482  201.  
    ##  8 United States          3265.    1012816  310.  
    ##  9 Argentina              3124.     129145   41.3 
    ## 10 Belgium                3081.      32051   10.4 
    ## 11 Poland                 3025.     116470   38.5 
    ## 12 Romania                2997.      65802   22.0 
    ## 13 Paraguay               2986.      19036    6.38
    ## 14 Colombia               2934.     140202   47.8 
    ## 15 United Kingdom         2912.     181580   62.3 
    ## 16 Mexico                 2901.     326261  112.  
    ## 17 Italy                  2811.     169601   60.3 
    ## 18 Greece                 2771.      30476   11   
    ## 19 Tunisia                2722.      28823   10.6 
    ## 20 Russia                 2713.     381794  141.

EOL
