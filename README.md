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

Updated: 2022-01-22

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
    ##  1 United States           98984. 68199861            689
    ##  2 India                   56882. 38566027            678
    ##  3 Brazil                  34487. 23416748            679
    ##  4 United Kingdom          22727. 15613287            687
    ##  5 France                  21998. 15201084            691
    ##  6 Russia                  16302. 10987774            674
    ##  7 Turkey                  15927. 10735324            674
    ##  8 Italy                   13493.  9418256            698
    ##  9 Spain                   12803.  8834363            690
    ## 10 Germany                 12226.  8460546            692
    ## 11 Argentina               11065.  7446626            673
    ## 12 Iran                     8960.  6236567            696
    ## 13 Colombia                 8345.  5624520            674
    ## 14 Mexico                   6611.  4495310            680
    ## 15 Poland                   6553.  4443217            678
    ## 16 Indonesia                6313.  4280248            678
    ## 17 Ukraine                  5718.  3819538            668
    ## 18 Netherlands              5432.  3720816            685
    ## 19 South Africa             5301.  3572860            674
    ## 20 Philippines              4903.  3324478            678

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        420.             286096.            681
    ##  2 Czech Republic                380.             258281.            680
    ##  3 Belgium                       369.             254038.            688
    ##  4 United Kingdom                365.             250420.            687
    ##  5 Switzerland                   351.             241864.            689
    ##  6 Denmark                       340.             232105.            683
    ##  7 France                        340.             234699.            691
    ##  8 Netherlands                   326.             223540.            685
    ##  9 United States                 319.             219834.            689
    ## 10 Serbia                        304.             204446.            673
    ## 11 Portugal                      284.             192918.            679
    ## 12 Spain                         275.             189962.            690
    ## 13 Austria                       273.             186584.            683
    ## 14 Argentina                     268.             180117.            673
    ## 15 Sweden                        266.             182266.            685
    ## 16 Jordan                        260.             174400.            670
    ## 17 Slovakia                      246.             165689.            674
    ## 18 Greece                        233.             158397.            680
    ## 19 Italy                         224.             156086.            698
    ## 20 Hungary                       209.             140398.            672

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1995    10585
    ##  2 Peru                 7.48     203750  2723166
    ##  3 Mexico               6.72     302112  4495310
    ##  4 Sudan                6.29       3393    53959
    ##  5 Syria                5.82       2956    50821
    ##  6 Egypt                5.50      22238   403990
    ##  7 Somalia              5.50       1335    24261
    ##  8 Ecuador              5.44      34232   629507
    ##  9 Afghanistan          4.64       7386   159303
    ## 10 China                4.17       5700   136700
    ## 11 Bulgaria             3.78      32518   860877
    ## 12 Myanmar              3.62      19307   533732
    ## 13 Niger                3.47        295     8503
    ## 14 Indonesia            3.37     144201  4280248
    ## 15 Paraguay             3.27      16887   516555
    ## 16 Tunisia              3.17      25881   817051
    ## 17 El Salvador          3.11       3840   123577
    ## 18 Romania              3.03      59428  1964021
    ## 19 Malawi               3.00       2502    83403
    ## 20 Russia               2.96     324752 10987774

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6813.     203750   29.9 
    ##  2 Bulgaria               4549.      32518    7.15
    ##  3 Hungary                4090.      40822    9.98
    ##  4 Czech Republic         3532.      36997   10.5 
    ##  5 Slovakia               3222.      17577    5.46
    ##  6 Brazil                 3092.     621855  201.  
    ##  7 Argentina              2869.     118628   41.3 
    ##  8 Belgium                2764.      28759   10.4 
    ##  9 Colombia               2750.     131437   47.8 
    ## 10 United States          2747.     852334  310.  
    ## 11 Romania                2706.      59428   22.0 
    ## 12 Poland                 2692.     103626   38.5 
    ## 13 Mexico                 2686.     302112  112.  
    ## 14 Paraguay               2649.      16887    6.38
    ## 15 United Kingdom         2457.     153202   62.3 
    ## 16 Tunisia                2444.      25881   10.6 
    ## 17 Italy                  2363.     142590   60.3 
    ## 18 Chile                  2356.      39456   16.7 
    ## 19 Ecuador                2314.      34232   14.8 
    ## 20 Russia                 2308.     324752  141.

EOL
