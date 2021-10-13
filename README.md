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

Updated: 2021-10-13

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
    ##  1 United States           73477. 43792254            596
    ##  2 India                   58978. 33971607            576
    ##  3 Brazil                  37291. 21516967            577
    ##  4 United Kingdom          13891.  8154310            587
    ##  5 Russia                  13644.  7804774            572
    ##  6 Turkey                  13015.  7444552            572
    ##  7 France                  11611.  6839116            589
    ##  8 Iran                     9601.  5702890            594
    ##  9 Argentina                9217.  5263219            571
    ## 10 Colombia                 8681.  4965847            572
    ## 11 Spain                    8454.  4971311            588
    ## 12 Italy                    7886.  4700316            596
    ## 13 Indonesia                7341.  4228552            576
    ## 14 Germany                  7311.  4313384            590
    ## 15 Mexico                   6468.  3699621            572
    ## 16 South Africa             5091.  2912145            572
    ## 17 Poland                   5075   2923304            576
    ## 18 Philippines              4629.  2666522            576
    ## 19 Ukraine                  4505.  2550089            566
    ## 20 Malaysia                 4027.  2339594            581

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             177593.            578
    ##  2 Czech Republic                281.             162529.            578
    ##  3 Serbia                        240.             136853.            571
    ##  4 United States                 237.             141159.            596
    ##  5 Jordan                        229.             130086.            568
    ##  6 Argentina                     223.             127306.            571
    ##  7 United Kingdom                223.             130786.            587
    ##  8 Netherlands                   209.             121606.            583
    ##  9 Sweden                        208.             121163.            583
    ## 10 Belgium                       208.             121749.            586
    ## 11 Switzerland                   190.             111741.            587
    ## 12 Brazil                        185.             106995.            577
    ## 13 Spain                         182.             106896.            588
    ## 14 Colombia                      182.             103910.            572
    ## 15 France                        179.             105593.            589
    ## 16 Portugal                      175.             100722.            577
    ## 17 Chile                         173.              99089.            574
    ## 18 Turkey                        167.              95683.            572
    ## 19 Austria                       159.              92332.            581
    ## 20 Hungary                       146.              83095.            570

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1778     9369
    ##  2 Peru                 9.15     199559  2181183
    ##  3 Sudan                7.60       2955    38884
    ##  4 Mexico               7.58     280610  3699621
    ##  5 Ecuador              6.42      32819   511317
    ##  6 Syria                6.34       2341    36953
    ##  7 Egypt                5.66      17695   312413
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7226   155509
    ## 10 China                4.55       5695   125055
    ## 11 Bulgaria             4.16      21656   520862
    ## 12 Myanmar              3.78      18162   479848
    ## 13 Bolivia              3.74      18775   502550
    ## 14 Malawi               3.71       2290    61676
    ## 15 Hungary              3.65      30303   829456
    ## 16 Mali                 3.57        553    15472
    ## 17 Tunisia              3.53      25028   709834
    ## 18 Paraguay             3.52      16205   460113
    ## 19 Zimbabwe             3.52       4637   131796
    ## 20 Chad                 3.44        174     5061

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6673.     199559   29.9 
    ##  2 Hungary                3036.      30303    9.98
    ##  3 Bulgaria               3029.      21656    7.15
    ##  4 Brazil                 2980.     599359  201.  
    ##  5 Czech Republic         2912.      30509   10.5 
    ##  6 Argentina              2791.     115379   41.3 
    ##  7 Colombia               2647.     126487   47.8 
    ##  8 Paraguay               2542.      16205    6.38
    ##  9 Mexico                 2495.     280610  112.  
    ## 10 Belgium                2470.      25693   10.4 
    ## 11 Tunisia                2364.      25028   10.6 
    ## 12 Slovakia               2335.      12735    5.46
    ## 13 United States          2268.     703599  310.  
    ## 14 Chile                  2241.      37533   16.7 
    ## 15 Ecuador                2219.      32819   14.8 
    ## 16 United Kingdom         2209.     137735   62.3 
    ## 17 Italy                  2176.     131301   60.3 
    ## 18 Poland                 1971.      75869   38.5 
    ## 19 Bolivia                1887.      18775    9.95
    ## 20 Spain                  1864.      86701   46.5

EOL
