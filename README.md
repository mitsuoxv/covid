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

Updated: 2022-06-07

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
    ##  1 United States          101274. 83551386            825
    ##  2 India                   53048. 43181335            814
    ##  3 Brazil                  38204. 31060017            813
    ##  4 France                  34744. 28733287            827
    ##  5 Germany                 31962  26496611            829
    ##  6 United Kingdom          27037. 22305897            825
    ##  7 Russia                  22661. 18355200            810
    ##  8 South Korea             21707. 18168708            837
    ##  9 Italy                   20990. 17505973            834
    ## 10 Turkey                  18609. 15073722            810
    ## 11 Spain                   15016. 12403245            826
    ## 12 Vietnam                 13307. 10725239            806
    ## 13 Argentina               11312.  9230573            816
    ## 14 Japan                   10701.  8945784            836
    ## 15 Netherlands              9854.  8090237            821
    ## 16 Australia                9025.  7373942            817
    ## 17 Iran                     8693.  7232731            832
    ## 18 Colombia                 7544.  6103455            809
    ## 19 Indonesia                7441.  6057142            814
    ## 20 Poland                   7382.  6008665            814

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       699.             572334.            819
    ##  2 Israel                        690.             564046.            817
    ##  3 Austria                       641.             524598.            819
    ##  4 Netherlands                   592.             486046.            821
    ##  5 Switzerland                   585.             482463.            825
    ##  6 Portugal                      550.             447314.            814
    ##  7 France                        536.             443631.            827
    ##  8 Belgium                       485.             399765.            824
    ##  9 Czech Republic                459.             374296.            816
    ## 10 South Korea                   448.             375211.            837
    ## 11 United Kingdom                434.             357762.            825
    ## 12 Australia                     419.             342723.            817
    ## 13 Slovakia                      405.             328186.            810
    ## 14 Germany                       391.             323911.            829
    ## 15 Greece                        387.             315513.            816
    ## 16 Norway                        348.             286435.            823
    ## 17 Italy                         348.             290121.            834
    ## 18 Serbia                        340.             274833.            809
    ## 19 Jordan                        329.             264905.            806
    ## 20 United States                 326.             269318.            825

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4942    62382
    ##  3 Peru                 5.95     213205  3581524
    ##  4 Syria                5.64       3150    55898
    ##  5 Mexico               5.62     324966  5782405
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24719   513975
    ##  8 Afghanistan          4.27       7709   180688
    ##  9 Ecuador              4.06      35645   878196
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37163  1165856
    ## 12 Myanmar              3.17      19434   613382
    ## 13 Malawi               3.07       2642    86001
    ## 14 Paraguay             2.90      18894   650661
    ## 15 Tunisia              2.75      28641  1042872
    ## 16 Haiti                2.71        835    30818
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156622  6057142
    ## 19 Algeria              2.59       6875   265897
    ## 20 Honduras             2.56      10899   425371

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7129.     213205   29.9 
    ##  2 Bulgaria               5199.      37163    7.15
    ##  3 Hungary                4663.      46547    9.98
    ##  4 Czech Republic         3846.      40293   10.5 
    ##  5 Slovakia               3685.      20104    5.46
    ##  6 Chile                  3459.      57920   16.7 
    ##  7 Brazil                 3316.     666801  201.  
    ##  8 United States          3217.     998070  310.  
    ##  9 Argentina              3118.     128889   41.3 
    ## 10 Belgium                3054.      31768   10.4 
    ## 11 Poland                 3022.     116349   38.5 
    ## 12 Romania                2992.      65692   22.0 
    ## 13 Paraguay               2963.      18894    6.38
    ## 14 Colombia               2926.     139854   47.8 
    ## 15 Mexico                 2889.     324966  112.  
    ## 16 United Kingdom         2867.     178749   62.3 
    ## 17 Italy                  2767.     166949   60.3 
    ## 18 Greece                 2719.      29913   11   
    ## 19 Tunisia                2705.      28641   10.6 
    ## 20 Russia                 2698.     379584  141.

EOL
