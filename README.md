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

Updated: 2021-12-14

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
    ##  1 United States           76202. 49531538            650
    ##  2 India                   54300. 34697860            639
    ##  3 Brazil                  34637. 22167781            640
    ##  4 United Kingdom          16645. 10819519            650
    ##  5 Russia                  15821. 10046454            635
    ##  6 Turkey                  14236.  9040182            635
    ##  7 France                  12300.  8019698            652
    ##  8 Germany                 10002.  6531606            653
    ##  9 Iran                     9368.  6154813            657
    ## 10 Argentina                8449.  5356885            634
    ## 11 Spain                    8126.  5290190            651
    ## 12 Colombia                 8018.  5091508            635
    ## 13 Italy                    7929.  5225517            659
    ## 14 Indonesia                6665.  4259249            639
    ## 15 Mexico                   6111.  3917361            641
    ## 16 Poland                   6009.  3839625            639
    ## 17 Ukraine                  5665.  3563165            629
    ## 18 South Africa             4988.  3167497            635
    ## 19 Netherlands              4459.  2880426            646
    ## 20 Philippines              4439.  2836592            639

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                348.             223215.            641
    ##  2 Israel                        286.             183639.            641
    ##  3 Belgium                       286.             185501.            649
    ##  4 Serbia                        274.             173461.            634
    ##  5 Netherlands                   268.             173051.            646
    ##  6 United Kingdom                267.             173533.            650
    ##  7 Jordan                        250.             157643.            631
    ##  8 United States                 246.             159659.            650
    ##  9 Austria                       232.             149475.            644
    ## 10 Switzerland                   225.             145968.            650
    ## 11 Slovakia                      224.             142480.            635
    ## 12 Argentina                     204.             129571.            634
    ## 13 Sweden                        199.             128634.            646
    ## 14 France                        190.             123821.            652
    ## 15 Hungary                       190.             120110.            633
    ## 16 Turkey                        183.             116192.            635
    ## 17 Portugal                      175.             111867.            640
    ## 18 Spain                         175.             113753.            651
    ## 19 Brazil                        172.             110231.            640
    ## 20 Colombia                      168.             106539.            635

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1971    10069
    ##  2 Peru                 8.95     201733  2252846
    ##  3 Mexico               7.57     296620  3917361
    ##  4 Sudan                7.23       3244    44877
    ##  5 Ecuador              6.32      33488   530126
    ##  6 Somalia              5.78       1333    23074
    ##  7 Syria                5.71       2814    49272
    ##  8 Egypt                5.70      21060   369198
    ##  9 Afghanistan          4.65       7328   157633
    ## 10 China                4.41       5697   129082
    ## 11 Bulgaria             4.13      29536   714688
    ## 12 Niger                3.74        268     7161
    ## 13 Malawi               3.71       2308    62265
    ## 14 Myanmar              3.64      19183   526661
    ## 15 Paraguay             3.56      16502   463707
    ## 16 Tunisia              3.53      25432   719586
    ## 17 Bolivia              3.49      19305   552586
    ## 18 Mali                 3.38        629    18592
    ## 19 Indonesia            3.38     143948  4259249
    ## 20 Romania              3.22      57696  1793149

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6745.     201733   29.9 
    ##  2 Bulgaria               4132.      29536    7.15
    ##  3 Hungary                3695.      36884    9.98
    ##  4 Czech Republic         3298.      34551   10.5 
    ##  5 Brazil                 3064.     616251  201.  
    ##  6 Slovakia               2826.      15415    5.46
    ##  7 Argentina              2824.     116760   41.3 
    ##  8 Colombia               2700.     129056   47.8 
    ##  9 Belgium                2644.      27504   10.4 
    ## 10 Mexico                 2637.     296620  112.  
    ## 11 Romania                2627.      57696   22.0 
    ## 12 Paraguay               2588.      16502    6.38
    ## 13 United States          2547.     790304  310.  
    ## 14 Tunisia                2402.      25432   10.6 
    ## 15 United Kingdom         2349.     146439   62.3 
    ## 16 Chile                  2310.      38686   16.7 
    ## 17 Poland                 2299.      88508   38.5 
    ## 18 Ecuador                2264.      33488   14.8 
    ## 19 Italy                  2235.     134831   60.3 
    ## 20 Russia                 2065.     290604  141.

EOL
