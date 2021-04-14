WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2021-04-15

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76043. 30949496            407
    ##  2 India                   35035. 13873825            396
    ##  3 Brazil                  34050. 13517808            397
    ##  4 France                  12290.  5026645            409
    ##  5 Russia                  11903.  4666209            392
    ##  6 United Kingdom          10751.  4375818            407
    ##  7 Turkey                  10109.  3962760            392
    ##  8 Italy                    9118.  3793033            416
    ##  9 Spain                    8178.  3336637            408
    ## 10 Germany                  7424.  3044016            410
    ## 11 Poland                   6619.  2621116            396
    ## 12 Argentina                6527.  2551999            391
    ## 13 Colombia                 6512.  2552937            392
    ## 14 Mexico                   5821.  2281840            392
    ## 15 Iran                     5107.  2114515            414
    ## 16 Ukraine                  4889.  1887338            386
    ## 17 Peru                     4207.  1653320            393
    ## 18 Czech Republic           3995.  1590124            398
    ## 19 Indonesia                3993.  1577526            395
    ## 20 South Africa             3979.  1559960            392

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             151787.            398
    ##  2 Israel                        286.             113744.            397
    ##  3 Jordan                        270.             104898.            388
    ##  4 United States                 245.              99762.            407
    ##  5 Sweden                        228.              91724.            403
    ##  6 Serbia                        226.              88327.            391
    ##  7 Belgium                       220.              89455.            406
    ##  8 Netherlands                   203.              81948.            403
    ##  9 Switzerland                   202.              82114.            407
    ## 10 Portugal                      195.              77573.            397
    ## 11 France                        190.              77610.            409
    ## 12 Hungary                       188.              73299.            390
    ## 13 Spain                         176.              71746.            408
    ## 14 Austria                       175.              70414.            402
    ## 15 Slovakia                      175.              68397.            391
    ## 16 United Kingdom                172.              70183.            407
    ## 17 Poland                        172.              68081.            396
    ## 18 Brazil                        169.              67218.            397
    ## 19 Chile                         165.              65011.            394
    ## 20 Argentina                     158.              61727.            391

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5        1074     5511
    ##  2 Mexico                9.19     209702  2281840
    ##  3 Syria                 6.81       1392    20435
    ##  4 Sudan                 6.62       2179    32932
    ##  5 Egypt                 5.90      12526   212130
    ##  6 Ecuador               4.99      17351   347589
    ##  7 Somalia               4.97        624    12566
    ##  8 China                 4.71       4855   103165
    ##  9 Bolivia               4.40      12469   283084
    ## 10 Afghanistan           4.40       2532    57492
    ## 11 Zimbabwe              4.13       1543    37330
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.90      14746   378059
    ## 14 Niger                 3.72        190     5108
    ## 15 Chad                  3.59        167     4652
    ## 16 Guatemala             3.44       7057   205322
    ## 17 South Africa          3.42      53423  1559960
    ## 18 Mali                  3.42        417    12179
    ## 19 Tunisia               3.42       9396   274604
    ## 20 Malawi                3.34       1133    33872

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2685.      28124   10.5 
    ##  2 Hungary                2431.      24265    9.98
    ##  3 Belgium                2265.      23566   10.4 
    ##  4 Bulgaria               2063.      14746    7.15
    ##  5 United Kingdom         2039.     127123   62.3 
    ##  6 Slovakia               1979.      10798    5.46
    ##  7 Italy                  1907.     115088   60.3 
    ##  8 Mexico                 1865.     209702  112.  
    ##  9 Peru                   1847.      55230   29.9 
    ## 10 United States          1797.     557415  310.  
    ## 11 Brazil                 1763.     354617  201.  
    ## 12 Spain                  1638.      76179   46.5 
    ## 13 Portugal               1585.      16923   10.7 
    ## 14 Poland                 1557.      59930   38.5 
    ## 15 France                 1526.      98850   64.8 
    ## 16 Chile                  1464.      24518   16.7 
    ## 17 Sweden                 1429.      13660    9.56
    ## 18 Argentina              1402.      57957   41.3 
    ## 19 Colombia               1384.      66156   47.8 
    ## 20 Switzerland            1290.       9776    7.58

EOL
