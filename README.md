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

Updated: 2022-05-27

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
    ##  1 United States          101570. 82678161            814
    ##  2 India                   53729. 43144820            803
    ##  3 Brazil                  38450. 30836815            802
    ##  4 France                  34976. 28540945            816
    ##  5 Germany                 32028. 26198811            818
    ##  6 United Kingdom          27360. 22271126            814
    ##  7 Russia                  22917. 18310673            799
    ##  8 South Korea             21836. 18036720            826
    ##  9 Italy                   21036. 17312432            823
    ## 10 Turkey                  18857. 15066784            799
    ## 11 Spain                   15068. 12280345            815
    ## 12 Vietnam                 13475. 10712733            795
    ## 13 Argentina               11402.  9178795            805
    ## 14 Japan                   10553.  8705990            825
    ## 15 Netherlands              9975.  8080032            810
    ## 16 Iran                     8807.  7230882            821
    ## 17 Australia                8767.  7066298            806
    ## 18 Colombia                 7643.  6099111            798
    ## 19 Indonesia                7539.  6053670            803
    ## 20 Poland                   7480.  6006547            803

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       707.             571495.            808
    ##  2 Israel                        697.             561576.            806
    ##  3 Austria                       645.             521506.            808
    ##  4 Netherlands                   599.             485433.            810
    ##  5 Switzerland                   592.             481554.            814
    ##  6 France                        540.             440662.            816
    ##  7 Portugal                      530.             425657.            803
    ##  8 Belgium                       490.             398690.            813
    ##  9 Czech Republic                465.             374103.            805
    ## 10 South Korea                   451.             372485.            826
    ## 11 United Kingdom                439.             357204.            814
    ## 12 Slovakia                      410.             327931.            799
    ## 13 Australia                     407.             328424.            806
    ## 14 Germany                       392.             320270.            818
    ## 15 Greece                        388.             312000.            805
    ## 16 Norway                        352.             285875.            812
    ## 17 Italy                         349.             286913.            823
    ## 18 Serbia                        344.             274478.            798
    ## 19 Jordan                        333.             264811.            795
    ## 20 United States                 327.             266504.            814

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11819
    ##  2 Sudan                7.94       4941    62251
    ##  3 Peru                 5.96     213122  3576640
    ##  4 Mexico               5.64     324768  5759773
    ##  5 Syria                5.64       3150    55885
    ##  6 Somalia              5.13       1361    26535
    ##  7 Egypt                4.81      24704   513916
    ##  8 Afghanistan          4.28       7699   179835
    ##  9 Ecuador              4.07      35617   874750
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37115  1164122
    ## 12 Myanmar              3.17      19434   613256
    ## 13 Malawi               3.07       2638    85935
    ## 14 Paraguay             2.90      18885   650283
    ## 15 Tunisia              2.75      28632  1042362
    ## 16 Haiti                2.71        835    30781
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156556  6053670
    ## 19 Algeria              2.59       6875   265862
    ## 20 Honduras             2.56      10899   425087

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7126.     213122   29.9 
    ##  2 Bulgaria               5192.      37115    7.15
    ##  3 Hungary                4659.      46507    9.98
    ##  4 Czech Republic         3845.      40280   10.5 
    ##  5 Slovakia               3682.      20088    5.46
    ##  6 Chile                  3454.      57835   16.7 
    ##  7 Brazil                 3311.     665905  201.  
    ##  8 United States          3209.     995391  310.  
    ##  9 Argentina              3116.     128825   41.3 
    ## 10 Belgium                3050.      31727   10.4 
    ## 11 Poland                 3021.     116299   38.5 
    ## 12 Romania                2990.      65664   22.0 
    ## 13 Paraguay               2962.      18885    6.38
    ## 14 Colombia               2926.     139833   47.8 
    ## 15 Mexico                 2888.     324768  112.  
    ## 16 United Kingdom         2858.     178221   62.3 
    ## 17 Italy                  2755.     166264   60.3 
    ## 18 Tunisia                2704.      28632   10.6 
    ## 19 Greece                 2704.      29743   11   
    ## 20 Russia                 2692.     378700  141.

EOL
