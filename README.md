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

Updated: 2022-06-17

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
    ##  1 United States          101639. 84868797            835
    ##  2 India                   52497. 43257730            824
    ##  3 Brazil                  38325. 31541479            823
    ##  4 France                  34721. 29061188            837
    ##  5 Germany                 32296. 27096571            839
    ##  6 United Kingdom          26884. 22447915            835
    ##  7 Russia                  22425. 18388424            820
    ##  8 South Korea             21554. 18256457            847
    ##  9 Italy                   21015. 17736696            844
    ## 10 Turkey                  18397. 15085742            820
    ## 11 Spain                   14970. 12515127            836
    ## 12 Vietnam                 13154. 10734151            816
    ## 13 Argentina               11275.  9313453            826
    ## 14 Japan                   10748.  9092521            846
    ## 15 Netherlands              9764.  8114233            831
    ## 16 Australia                9296.  7687619            827
    ## 17 Iran                     8592.  7234221            842
    ## 18 Colombia                 7470.  6117847            819
    ## 19 Indonesia                7360.  6064424            824
    ## 20 Poland                   7295.  6010871            824

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       692.             574067.            829
    ##  2 Israel                        692.             572209.            827
    ##  3 Austria                       638.             529227.            829
    ##  4 Netherlands                   587.             487488.            831
    ##  5 Switzerland                   582.             485988.            835
    ##  6 Portugal                      569.             468882.            824
    ##  7 France                        536.             448694.            837
    ##  8 Belgium                       481.             401561.            834
    ##  9 Czech Republic                454.             374604.            826
    ## 10 South Korea                   445.             377023.            847
    ## 11 Australia                     432.             357302.            827
    ## 12 United Kingdom                431.             360040.            835
    ## 13 Slovakia                      401.             328472.            820
    ## 14 Germany                       395.             331245.            839
    ## 15 Greece                        387.             319809.            826
    ## 16 Italy                         348.             293944.            844
    ## 17 Norway                        345.             287028.            833
    ## 18 Serbia                        336.             275195.            819
    ## 19 United States                 328.             273565.            835
    ## 20 Jordan                        325.             264968.            816

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4950    62489
    ##  3 Peru                 5.94     213343  3592765
    ##  4 Syria                5.63       3150    55909
    ##  5 Mexico               5.58     325242  5833738
    ##  6 Somalia              5.10       1361    26675
    ##  7 Egypt                4.81      24720   514008
    ##  8 Afghanistan          4.25       7710   181320
    ##  9 Ecuador              4.00      35659   891064
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37210  1167466
    ## 12 Myanmar              3.17      19434   613467
    ## 13 Malawi               3.07       2642    86146
    ## 14 Paraguay             2.90      18932   652044
    ## 15 Tunisia              2.74      28655  1044426
    ## 16 Haiti                2.70        837    31054
    ## 17 Chad                 2.60        193     7420
    ## 18 Algeria              2.59       6875   265952
    ## 19 Indonesia            2.58     156673  6064424
    ## 20 Honduras             2.56      10902   425655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7134.     213343   29.9 
    ##  2 Bulgaria               5205.      37210    7.15
    ##  3 Hungary                4668.      46594    9.98
    ##  4 Czech Republic         3847.      40303   10.5 
    ##  5 Slovakia               3689.      20122    5.46
    ##  6 Chile                  3471.      58135   16.7 
    ##  7 Brazil                 3323.     668354  201.  
    ##  8 United States          3231.    1002369  310.  
    ##  9 Argentina              3120.     128994   41.3 
    ## 10 Belgium                3060.      31835   10.4 
    ## 11 Poland                 3023.     116390   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2969.      18932    6.38
    ## 14 Colombia               2927.     139894   47.8 
    ## 15 Mexico                 2892.     325242  112.  
    ## 16 United Kingdom         2878.     179411   62.3 
    ## 17 Italy                  2777.     167553   60.3 
    ## 18 Greece                 2732.      30049   11   
    ## 19 Tunisia                2706.      28655   10.6 
    ## 20 Russia                 2703.     380270  141.

EOL
