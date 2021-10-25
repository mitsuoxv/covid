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

Updated: 2021-10-26

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
    ##  1 United States           71561. 44940696            628
    ##  2 India                   58023. 34175468            589
    ##  3 Brazil                  36746. 21680488            590
    ##  4 United Kingdom          14558.  8734938            600
    ##  5 Russia                  14088.  8241643            585
    ##  6 Turkey                  13379.  7827013            585
    ##  7 France                  11461.  6899508            602
    ##  8 Iran                     9640.  5851670            607
    ##  9 Argentina                9034   5275984            584
    ## 10 Colombia                 8521.  4984751            585
    ## 11 Spain                    8315.  4997733            601
    ## 12 Italy                    7779.  4737462            609
    ## 13 Germany                  7406.  4466157            603
    ## 14 Indonesia                7198.  4240019            589
    ## 15 Mexico                   6440.  3767758            585
    ## 16 Poland                   5047.  2972927            589
    ## 17 South Africa             4990.  2919332            585
    ## 18 Ukraine                  4783.  2769405            579
    ## 19 Philippines              4672.  2751644            589
    ## 20 Malaysia                 4084.  2426050            594

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        304.             179847.            591
    ##  2 Czech Republic                279.             165088.            591
    ##  3 Serbia                        255.             148740.            584
    ##  4 United Kingdom                233.             140099.            600
    ##  5 United States                 231.             144861.            628
    ##  6 Jordan                        228.             132628.            581
    ##  7 Argentina                     219.             127614.            584
    ##  8 Belgium                       211.             126152.            599
    ##  9 Netherlands                   209.             124735.            596
    ## 10 Sweden                        205.             122019.            596
    ## 11 Switzerland                   189.             113281.            600
    ## 12 Brazil                        183.             107808.            590
    ## 13 Spain                         179.             107464.            601
    ## 14 Colombia                      178.             104305.            585
    ## 15 France                        177.             106526.            602
    ## 16 Portugal                      172.             101586.            590
    ## 17 Turkey                        172.             100599.            585
    ## 18 Chile                         170.             100082.            587
    ## 19 Austria                       162.              96491.            594
    ## 20 Hungary                       145.              84535.            583

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1838     9662
    ##  2 Peru                 9.12     199945  2192205
    ##  3 Mexico               7.57     285347  3767758
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.41      32937   514087
    ##  6 Syria                6.05       2492    41222
    ##  7 Egypt                5.63      18242   323733
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7253   155940
    ## 10 China                4.54       5695   125518
    ## 11 Bulgaria             4.05      23033   568073
    ## 12 Myanmar              3.75      18538   494263
    ## 13 Malawi               3.72       2296    61757
    ## 14 Bolivia              3.72      18887   508166
    ## 15 Hungary              3.61      30492   843825
    ## 16 Tunisia              3.53      25149   711693
    ## 17 Mali                 3.53        558    15810
    ## 18 Paraguay             3.52      16228   460615
    ## 19 Zimbabwe             3.52       4668   132625
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6686.     199945   29.9 
    ##  2 Bulgaria               3222.      23033    7.15
    ##  3 Hungary                3055.      30492    9.98
    ##  4 Brazil                 3005.     604228  201.  
    ##  5 Czech Republic         2922.      30615   10.5 
    ##  6 Argentina              2800.     115770   41.3 
    ##  7 Colombia               2656.     126931   47.8 
    ##  8 Paraguay               2545.      16228    6.38
    ##  9 Mexico                 2537.     285347  112.  
    ## 10 Belgium                2484.      25846   10.4 
    ## 11 Tunisia                2375.      25149   10.6 
    ## 12 Slovakia               2365.      12903    5.46
    ## 13 United States          2343.     726846  310.  
    ## 14 Chile                  2248.      37640   16.7 
    ## 15 United Kingdom         2237.     139461   62.3 
    ## 16 Ecuador                2227.      32937   14.8 
    ## 17 Italy                  2184.     131802   60.3 
    ## 18 Romania                2035.      44679   22.0 
    ## 19 Poland                 1986.      76447   38.5 
    ## 20 Bolivia                1899.      18887    9.95

EOL
