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

Updated: 2021-02-13

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
    ##  1 United States           77870. 27020890            347
    ##  2 India                   32479. 10880603            335
    ##  3 Brazil                  28662.  9659167            337
    ##  4 Russia                  12214.  4042837            331
    ##  5 United Kingdom          11557.  3998659            346
    ##  6 France                   9624.  3349393            348
    ##  7 Spain                    8740.  3041454            348
    ##  8 Turkey                   7747.  2564427            331
    ##  9 Italy                    7559.  2683403            355
    ## 10 Germany                  6648.  2320093            349
    ## 11 Colombia                 6566.  2173347            331
    ## 12 Argentina                6027.  2001034            332
    ## 13 Mexico                   5915.  1957889            331
    ## 14 Poland                   4707.  1577036            335
    ## 15 South Africa             4472.  1484900            332
    ## 16 Iran                     4239.  1496455            353
    ## 17 Ukraine                  3885.  1262867            325
    ## 18 Peru                     3625.  1203502            332
    ## 19 Indonesia                3558.  1191990            335
    ## 20 Czech Republic           3186.  1073966            337

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                304.             102517.            337
    ##  2 Israel                        285.              95879.            336
    ##  3 United States                 251.              87099.            347
    ##  4 Portugal                      217.              72908.            336
    ##  5 Switzerland                   205.              70817.            346
    ##  6 Belgium                       204.              70470.            345
    ##  7 Spain                         188.              65399.            348
    ##  8 United Kingdom                185.              64134.            346
    ##  9 Sweden                        185.              63267.            342
    ## 10 Netherlands                   179.              61118.            342
    ## 11 Serbia                        172.              56631.            330
    ## 12 Jordan                        163.              53376.            327
    ## 13 Austria                       152.              51878.            341
    ## 14 Slovakia                      151.              49766.            330
    ## 15 France                        149.              51713.            348
    ## 16 Argentina                     146.              48401.            332
    ## 17 Brazil                        143.              48031.            337
    ## 18 Colombia                      137.              45477.            331
    ## 19 Chile                         137.              45640.            333
    ## 20 Italy                         125.              44471.            355

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         617     2138
    ##  2 Mexico               8.67     169760  1957889
    ##  3 Syria                6.57        968    14724
    ##  4 Sudan                6.18       1849    29933
    ##  5 Ecuador              5.78      15174   262313
    ##  6 Egypt                5.73       9857   171993
    ##  7 China                4.77       4836   101463
    ##  8 Bolivia              4.73      10996   232502
    ##  9 Afghanistan          4.37       2424    55445
    ## 10 Bulgaria             4.19       9561   228044
    ## 11 Mali                 4.14        340     8218
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             3.95       1382    34949
    ## 14 Iran                 3.93      58751  1496455
    ## 15 Guatemala            3.64       6023   165532
    ## 16 Greece               3.59       6056   168872
    ## 17 Niger                3.58        167     4665
    ## 18 Peru                 3.56      42859  1203502
    ## 19 Hungary              3.53      13543   383735
    ## 20 Chad                 3.52        126     3581

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2072.      21551   10.4 
    ##  2 United Kingdom         1853.     115529   62.3 
    ##  3 Czech Republic         1709.      17902   10.5 
    ##  4 Italy                  1537.      92729   60.3 
    ##  5 Mexico                 1509.     169760  112.  
    ##  6 United States          1509.     468051  310.  
    ##  7 Peru                   1433.      42859   29.9 
    ##  8 Portugal               1394.      14885   10.7 
    ##  9 Spain                  1381.      64217   46.5 
    ## 10 Hungary                1357.      13543    9.98
    ## 11 Bulgaria               1337.       9561    7.15
    ## 12 Sweden                 1294.      12370    9.56
    ## 13 France                 1241.      80389   64.8 
    ## 14 Argentina              1202.      49674   41.3 
    ## 15 Colombia               1187.      56733   47.8 
    ## 16 Switzerland            1181.       8953    7.58
    ## 17 Brazil                 1168.     234850  201.  
    ## 18 Chile                  1150.      19262   16.7 
    ## 19 Bolivia                1105.      10996    9.95
    ## 20 Poland                 1050.      40424   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
