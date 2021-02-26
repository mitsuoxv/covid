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

Updated: 2021-02-27

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
    ##  1 United States           77642. 28028815            361
    ##  2 India                   31700. 11063491            349
    ##  3 Brazil                  29414. 10324463            351
    ##  4 Russia                  12241.  4223186            345
    ##  5 United Kingdom          11540.  4154566            360
    ##  6 France                  10007.  3622675            362
    ##  7 Spain                    8809.  3180212            361
    ##  8 Italy                    7773.  2868435            369
    ##  9 Turkey                   7752.  2674766            345
    ## 10 Germany                  6679.  2424684            363
    ## 11 Colombia                 6485.  2237542            345
    ## 12 Argentina                6035.  2088187            346
    ## 13 Mexico                   5973.  2060908            345
    ## 14 Poland                   4827.  1684788            349
    ## 15 Iran                     4379.  1607081            367
    ## 16 South Africa             4361.  1509124            346
    ## 17 Ukraine                  3934.  1333844            339
    ## 18 Indonesia                3767.  1314634            349
    ## 19 Peru                     3759.  1300799            346
    ## 20 Czech Republic           3455.  1212780            351

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                330.             115767.            351
    ##  2 Israel                        297.             103997.            350
    ##  3 United States                 250.              90348.            361
    ##  4 Portugal                      215.              75098.            350
    ##  5 Belgium                       205.              73429.            359
    ##  6 Switzerland                   202.              72712.            360
    ##  7 Sweden                        192.              68279.            356
    ##  8 Spain                         189.              68383.            361
    ##  9 United Kingdom                185.              66635.            360
    ## 10 Netherlands                   181.              64522.            356
    ## 11 Serbia                        178.              61254.            344
    ## 12 Jordan                        174.              59351.            341
    ## 13 Slovakia                      162.              55622.            344
    ## 14 France                        155.              55933.            362
    ## 15 Austria                       154.              54741.            355
    ## 16 Brazil                        146.              51339.            351
    ## 17 Argentina                     146.              50509.            346
    ## 18 Chile                         140.              48508.            347
    ## 19 Colombia                      136.              46820.            345
    ## 20 Italy                         129.              47538.            369

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.8         628     2259
    ##  2 Mexico               8.87     182815  2060908
    ##  3 Syria                6.58       1014    15405
    ##  4 Sudan                6.20       1878    30284
    ##  5 Egypt                5.84      10541   180640
    ##  6 Ecuador              5.61      15634   278779
    ##  7 China                4.76       4843   101802
    ##  8 Bolivia              4.70      11547   245719
    ##  9 Afghanistan          4.38       2442    55696
    ## 10 Mali                 4.18        349     8349
    ## 11 Bulgaria             4.13      10079   243946
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.05       1458    35994
    ## 14 Iran                 3.72      59830  1607081
    ## 15 Guatemala            3.66       6334   173142
    ## 16 Niger                3.63        172     4740
    ## 17 Hungary              3.53      14795   419182
    ## 18 Peru                 3.51      45683  1300799
    ## 19 Chad                 3.48        137     3934
    ## 20 Greece               3.44       6410   186469

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2115.      22006   10.4 
    ##  2 United Kingdom         1958.     122070   62.3 
    ##  3 Czech Republic         1909.      19999   10.5 
    ##  4 Mexico                 1625.     182815  112.  
    ##  5 United States          1616.     501414  310.  
    ##  6 Italy                  1607.      96974   60.3 
    ##  7 Peru                   1528.      45683   29.9 
    ##  8 Portugal               1516.      16185   10.7 
    ##  9 Hungary                1482.      14795    9.98
    ## 10 Spain                  1480.      68813   46.5 
    ## 11 Bulgaria               1410.      10079    7.15
    ## 12 Sweden                 1339.      12798    9.56
    ## 13 France                 1315.      85151   64.8 
    ## 14 Slovakia               1277.       6966    5.46
    ## 15 Argentina              1250.      51680   41.3 
    ## 16 Brazil                 1243.     249957  201.  
    ## 17 Colombia               1240.      59260   47.8 
    ## 18 Switzerland            1215.       9211    7.58
    ## 19 Chile                  1213.      20310   16.7 
    ## 20 Bolivia                1161.      11547    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
