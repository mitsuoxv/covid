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

Updated: 2021-12-10

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
    ##  1 United States           76016. 49106224            646
    ##  2 India                   54592. 34666241            635
    ##  3 Brazil                  34839. 22157726            636
    ##  4 United Kingdom          16425. 10610962            646
    ##  5 Russia                  15730.  9925806            631
    ##  6 Turkey                  14207.  8964711            631
    ##  7 France                  12053.  7810755            648
    ##  8 Germany                  9803.  6362232            649
    ##  9 Iran                     9410.  6144644            653
    ## 10 Argentina                8486.  5346242            630
    ## 11 Spain                    8109.  5246767            647
    ## 12 Colombia                 8058.  5084466            631
    ## 13 Italy                    7866.  5152264            655
    ## 14 Indonesia                6706.  4258560            635
    ## 15 Mexico                   6131.  3905319            637
    ## 16 Poland                   5921.  3760048            635
    ## 17 Ukraine                  5652.  3532357            625
    ## 18 South Africa             4867.  3071064            631
    ## 19 Philippines              4465.  2835593            635
    ## 20 Netherlands              4375.  2808892            642

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                344.             219401.            637
    ##  2 Israel                        288.             183347.            637
    ##  3 Belgium                       283.             182495.            645
    ##  4 Serbia                        274.             172745.            630
    ##  5 United Kingdom                263.             170188.            646
    ##  6 Netherlands                   263.             168753.            642
    ##  7 Jordan                        247.             155038.            627
    ##  8 United States                 245.             158288.            646
    ##  9 Austria                       231.             147618.            640
    ## 10 Switzerland                   222.             143213.            646
    ## 11 Slovakia                      220.             138862.            631
    ## 12 Argentina                     205.             129314.            630
    ## 13 Sweden                        199.             127973.            642
    ## 14 Hungary                       187.             117816.            629
    ## 15 France                        186.             120595.            648
    ## 16 Turkey                        183.             115222.            631
    ## 17 Spain                         174.             112819.            647
    ## 18 Portugal                      173.             110313.            636
    ## 19 Brazil                        173.             110181.            636
    ## 20 Colombia                      169.             106392.            631

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1956    10047
    ##  2 Peru                 8.97     201450  2246633
    ##  3 Mexico               7.57     295602  3905319
    ##  4 Sudan                7.22       3206    44406
    ##  5 Ecuador              6.32      33488   529456
    ##  6 Somalia              5.77       1331    23051
    ##  7 Syria                5.71       2793    48901
    ##  8 Egypt                5.71      20877   365831
    ##  9 Afghanistan          4.65       7319   157542
    ## 10 China                4.43       5697   128690
    ## 11 Bulgaria             4.13      29279   709537
    ## 12 Niger                3.72        265     7119
    ## 13 Malawi               3.72       2307    62053
    ## 14 Myanmar              3.65      19157   525403
    ## 15 Paraguay             3.56      16484   463479
    ## 16 Tunisia              3.54      25413   718866
    ## 17 Bolivia              3.53      19264   546155
    ## 18 Mali                 3.40        621    18254
    ## 19 Indonesia            3.38     143918  4258560
    ## 20 Romania              3.21      57360  1789539

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6736.     201450   29.9 
    ##  2 Bulgaria               4096.      29279    7.15
    ##  3 Hungary                3633.      36263    9.98
    ##  4 Czech Republic         3258.      34129   10.5 
    ##  5 Brazil                 3063.     616018  201.  
    ##  6 Argentina              2823.     116703   41.3 
    ##  7 Slovakia               2783.      15179    5.46
    ##  8 Colombia               2697.     128874   47.8 
    ##  9 Belgium                2635.      27416   10.4 
    ## 10 Mexico                 2628.     295602  112.  
    ## 11 Romania                2612.      57360   22.0 
    ## 12 Paraguay               2585.      16484    6.38
    ## 13 United States          2531.     785272  310.  
    ## 14 Tunisia                2400.      25413   10.6 
    ## 15 United Kingdom         2341.     145987   62.3 
    ## 16 Chile                  2301.      38541   16.7 
    ## 17 Poland                 2269.      87357   38.5 
    ## 18 Ecuador                2264.      33488   14.8 
    ## 19 Italy                  2229.     134472   60.3 
    ## 20 Russia                 2033.     286004  141.

EOL
