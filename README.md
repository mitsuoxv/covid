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
-   [Save data](#save-data)

Updated: 2021-03-03

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
    ##  1 United States           77520. 28294809            365
    ##  2 India                   31514. 11124527            353
    ##  3 Brazil                  29722. 10551259            355
    ##  4 Russia                  12229.  4268215            349
    ##  5 United Kingdom          11489.  4182013            364
    ##  6 France                  10096.  3695124            366
    ##  7 Spain                    8779.  3204531            365
    ##  8 Italy                    7877.  2938371            373
    ##  9 Turkey                   7769.  2711479            349
    ## 10 Germany                  6678.  2451011            367
    ## 11 Colombia                 6452.  2251690            349
    ## 12 Argentina                6034.  2112023            350
    ## 13 Mexico                   5979.  2086938            349
    ## 14 Poland                   4871.  1719708            353
    ## 15 Iran                     4419.  1639679            371
    ## 16 South Africa             4325.  1513959            350
    ## 17 Ukraine                  3957.  1357470            343
    ## 18 Indonesia                3799.  1341314            353
    ## 19 Peru                     3799.  1329805            350
    ## 20 Czech Republic           3527.  1252242            355

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                337.             119534.            355
    ##  2 Israel                        298.             105668.            354
    ##  3 United States                 250.              91205.            365
    ##  4 Portugal                      213.              75399.            354
    ##  5 Belgium                       204.              74238.            363
    ##  6 Switzerland                   201.              73188.            364
    ##  7 Sweden                        191.              68786.            360
    ##  8 Spain                         189.              68906.            365
    ##  9 United Kingdom                184.              67075.            364
    ## 10 Netherlands                   182.              65632.            360
    ## 11 Serbia                        181.              63000.            348
    ## 12 Jordan                        180.              61987.            345
    ## 13 Slovakia                      164.              57012.            348
    ## 14 France                        156.              57051.            366
    ## 15 Austria                       155.              55641.            359
    ## 16 Brazil                        148.              52467.            355
    ## 17 Argentina                     146.              51085.            350
    ## 18 Chile                         141.              49549.            351
    ## 19 Colombia                      135.              47116.            349
    ## 20 Italy                         131.              48697.            373

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.4         635     2314
    ##  2 Mexico               8.90     185715  2086938
    ##  3 Syria                6.60       1032    15642
    ##  4 Sudan                6.20       1886    30417
    ##  5 Egypt                5.87      10736   183010
    ##  6 Ecuador              5.53      15832   286367
    ##  7 China                4.75       4845   101945
    ##  8 Bolivia              4.68      11649   249010
    ##  9 Afghanistan          4.39       2446    55759
    ## 10 Mali                 4.23        355     8390
    ## 11 Bulgaria             4.13      10308   249626
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.06       1468    36115
    ## 14 Iran                 3.67      60181  1639679
    ## 15 Guatemala            3.67       6402   174653
    ## 16 Niger                3.63        172     4740
    ## 17 Chad                 3.51        140     3986
    ## 18 Peru                 3.50      46494  1329805
    ## 19 Hungary              3.48      15058   432925
    ## 20 Tunisia              3.43       8022   233669

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2125.      22106   10.4 
    ##  2 Czech Republic         1976.      20701   10.5 
    ##  3 United Kingdom         1972.     122953   62.3 
    ##  4 Mexico                 1651.     185715  112.  
    ##  5 United States          1643.     509645  310.  
    ##  6 Italy                  1623.      97945   60.3 
    ##  7 Peru                   1555.      46494   29.9 
    ##  8 Portugal               1532.      16351   10.7 
    ##  9 Hungary                1509.      15058    9.98
    ## 10 Spain                  1497.      69609   46.5 
    ## 11 Bulgaria               1442.      10308    7.15
    ## 12 Slovakia               1354.       7388    5.46
    ## 13 Sweden                 1342.      12826    9.56
    ## 14 France                 1333.      86361   64.8 
    ## 15 Brazil                 1268.     254942  201.  
    ## 16 Argentina              1260.      52077   41.3 
    ## 17 Colombia               1251.      59766   47.8 
    ## 18 Chile                  1234.      20660   16.7 
    ## 19 Switzerland            1218.       9235    7.58
    ## 20 Bolivia                1171.      11649    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
