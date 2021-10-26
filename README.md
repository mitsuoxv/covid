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

Updated: 2021-10-27

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
    ##  1 United States           71598. 45107253            630
    ##  2 India                   57872. 34202202            591
    ##  3 Brazil                  36705. 21729763            592
    ##  4 United Kingdom          14634.  8809778            602
    ##  5 Russia                  14167.  8316019            587
    ##  6 Turkey                  13423.  7879468            587
    ##  7 France                  11432.  6905201            604
    ##  8 Iran                     9636.  5868360            609
    ##  9 Argentina                9011.  5280358            586
    ## 10 Colombia                 8502.  4991050            587
    ## 11 Spain                    8295.  5002218            603
    ## 12 Italy                    7764.  4743720            611
    ## 13 Germany                  7410.  4483203            605
    ## 14 Indonesia                7176.  4241090            591
    ## 15 Mexico                   6445.  3783327            587
    ## 16 Poland                   5046.  2982143            591
    ## 17 South Africa             4974.  2919778            587
    ## 18 Ukraine                  4825.  2803159            581
    ## 19 Philippines              4672.  2761307            591
    ## 20 Malaysia                 4088.  2436498            596

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        304.             180076.            593
    ##  2 Czech Republic                279.             165669.            593
    ##  3 Serbia                        256.             150325.            586
    ##  4 United Kingdom                235.             141299.            602
    ##  5 United States                 231.             145398.            630
    ##  6 Jordan                        228.             133136.            583
    ##  7 Argentina                     218.             127720.            586
    ##  8 Belgium                       212.             127675.            601
    ##  9 Netherlands                   210.             125435.            598
    ## 10 Sweden                        204.             122019.            598
    ## 11 Switzerland                   189.             113714.            602
    ## 12 Brazil                        183.             108053.            592
    ## 13 Spain                         178.             107561.            603
    ## 14 Colombia                      178.             104437.            587
    ## 15 France                        177.             106614.            604
    ## 16 Turkey                        173.             101273.            587
    ## 17 Portugal                      172.             101672.            592
    ## 18 Chile                         171.             100526.            589
    ## 19 Austria                       163.              97274.            596
    ## 20 Hungary                       146.              85375.            585

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.1        1850     9694
    ##  2 Peru                 9.11     200052  2195859
    ##  3 Mexico               7.57     286346  3783327
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.39      32952   515606
    ##  6 Syria                6.02       2517    41799
    ##  7 Egypt                5.63      18333   325508
    ##  8 Somalia              5.49       1208    21998
    ##  9 Afghanistan          4.65       7260   156040
    ## 10 China                4.53       5696   125620
    ## 11 Bulgaria             4.05      23316   575306
    ## 12 Myanmar              3.75      18582   495898
    ## 13 Malawi               3.72       2296    61765
    ## 14 Bolivia              3.71      18901   509919
    ## 15 Hungary              3.59      30611   852214
    ## 16 Tunisia              3.53      25155   711821
    ## 17 Mali                 3.52        559    15867
    ## 18 Paraguay             3.52      16231   460723
    ## 19 Zimbabwe             3.52       4673   132688
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6689.     200052   29.9 
    ##  2 Bulgaria               3262.      23316    7.15
    ##  3 Hungary                3067.      30611    9.98
    ##  4 Brazil                 3012.     605644  201.  
    ##  5 Czech Republic         2926.      30648   10.5 
    ##  6 Argentina              2802.     115826   41.3 
    ##  7 Colombia               2659.     127067   47.8 
    ##  8 Mexico                 2546.     286346  112.  
    ##  9 Paraguay               2546.      16231    6.38
    ## 10 Belgium                2489.      25889   10.4 
    ## 11 Tunisia                2376.      25155   10.6 
    ## 12 Slovakia               2371.      12935    5.46
    ## 13 United States          2354.     730306  310.  
    ## 14 Chile                  2250.      37685   16.7 
    ## 15 United Kingdom         2239.     139571   62.3 
    ## 16 Ecuador                2228.      32952   14.8 
    ## 17 Italy                  2185.     131856   60.3 
    ## 18 Romania                2072.      45503   22.0 
    ## 19 Poland                 1988.      76540   38.5 
    ## 20 Bolivia                1900.      18901    9.95

EOL
