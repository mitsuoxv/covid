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

Updated: 2021-11-23

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
    ##  1 United States           75315. 47373195            629
    ##  2 India                   55856. 34518901            618
    ##  3 Brazil                  35561. 22012150            619
    ##  4 United Kingdom          15652.  9845496            629
    ##  5 Russia                  15255.  9366839            614
    ##  6 Turkey                  13960.  8571554            614
    ##  7 France                  11388.  7185901            631
    ##  8 Iran                     9555.  6077438            636
    ##  9 Argentina                8671.  5315348            613
    ## 10 Germany                  8521.  5385585            632
    ## 11 Colombia                 8217.  5045412            614
    ## 12 Spain                    8064.  5080664            630
    ## 13 Italy                    7720.  4925688            638
    ## 14 Indonesia                6883.  4253598            618
    ## 15 Mexico                   6229.  3862137            620
    ## 16 Ukraine                  5494.  3340407            608
    ## 17 Poland                   5433.  3357763            618
    ## 18 South Africa             4772.  2929862            614
    ## 19 Philippines              4573.  2826410            618
    ## 20 Malaysia                 4152.  2586601            623

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                308.             191252.            620
    ##  2 Israel                        294.             182298.            620
    ##  3 Serbia                        274.             167881.            613
    ##  4 United Kingdom                251.             157911.            629
    ##  5 United States                 243.             152702.            629
    ##  6 Belgium                       242.             152023.            628
    ##  7 Netherlands                   235.             146728.            625
    ##  8 Jordan                        234.             142787.            610
    ##  9 Argentina                     210.             128566.            613
    ## 10 Austria                       207.             128694.            623
    ## 11 Switzerland                   200.             125508.            629
    ## 12 Sweden                        199.             124398.            625
    ## 13 Slovakia                      183.             112683.            614
    ## 14 Turkey                        179.             110168.            614
    ## 15 Brazil                        177.             109457.            619
    ## 16 France                        176.             110948.            631
    ## 17 Spain                         173.             109248.            630
    ## 18 Colombia                      172.             105575.            614
    ## 19 Portugal                      170.             105122.            619
    ## 20 Chile                         169.             104090.            616

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1938     9955
    ##  2 Peru                 9.03     200833  2222879
    ##  3 Mexico               7.57     292372  3862137
    ##  4 Sudan                7.42       3103    41822
    ##  5 Ecuador              6.32      33121   523847
    ##  6 Somalia              5.76       1324    22969
    ##  7 Syria                5.73       2704    47212
    ##  8 Egypt                5.69      19933   350397
    ##  9 Afghanistan          4.65       7303   156911
    ## 10 China                4.47       5697   127512
    ## 11 Bulgaria             4.05      27253   673288
    ## 12 Malawi               3.72       2304    61863
    ## 13 Myanmar              3.67      19034   518471
    ## 14 Bolivia              3.60      19062   529075
    ## 15 Niger                3.54        242     6836
    ## 16 Tunisia              3.54      25344   716262
    ## 17 Paraguay             3.54      16355   462242
    ## 18 Zimbabwe             3.52       4699   133647
    ## 19 Mali                 3.49        592    16947
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6715.     200833   29.9 
    ##  2 Bulgaria               3812.      27253    7.15
    ##  3 Hungary                3323.      33172    9.98
    ##  4 Czech Republic         3071.      32173   10.5 
    ##  5 Brazil                 3046.     612587  201.  
    ##  6 Argentina              2815.     116377   41.3 
    ##  7 Colombia               2680.     128054   47.8 
    ##  8 Mexico                 2600.     292372  112.  
    ##  9 Paraguay               2565.      16355    6.38
    ## 10 Belgium                2554.      26568   10.4 
    ## 11 Slovakia               2552.      13919    5.46
    ## 12 Romania                2503.      54959   22.0 
    ## 13 United States          2472.     766850  310.  
    ## 14 Tunisia                2393.      25344   10.6 
    ## 15 United Kingdom         2308.     143927   62.3 
    ## 16 Chile                  2276.      38117   16.7 
    ## 17 Ecuador                2239.      33121   14.8 
    ## 18 Italy                  2207.     133177   60.3 
    ## 19 Poland                 2099.      80830   38.5 
    ## 20 Bolivia                1916.      19062    9.95

EOL
