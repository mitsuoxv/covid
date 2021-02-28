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

Updated: 2021-03-01

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
    ##  1 United States           77617. 28174978            363
    ##  2 India                   31614. 11096731            351
    ##  3 Brazil                  29619. 10455630            353
    ##  4 Russia                  12236.  4246079            347
    ##  5 United Kingdom          11520.  4170523            362
    ##  6 France                  10085.  3671208            364
    ##  7 Spain                    8761.  3180212            363
    ##  8 Italy                    7837.  2907825            371
    ##  9 Turkey                   7761.  2693164            347
    ## 10 Germany                  6691.  2442336            365
    ## 11 Colombia                 6469.  2244792            347
    ## 12 Argentina                6046.  2104197            348
    ## 13 Mexico                   5985.  2076882            347
    ## 14 Poland                   4863.  1706986            351
    ## 15 Iran                     4398.  1623159            369
    ## 16 South Africa             4345.  1512225            348
    ## 17 Ukraine                  3952.  1347849            341
    ## 18 Indonesia                3786.  1329074            351
    ## 19 Peru                     3782.  1316363            348
    ## 20 Czech Republic           3500.  1235480            353

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                334.             117934.            353
    ##  2 Israel                        295.             103997.            352
    ##  3 United States                 250.              90819.            363
    ##  4 Portugal                      214.              75294.            352
    ##  5 Belgium                       205.              73961.            361
    ##  6 Switzerland                   201.              72852.            362
    ##  7 Sweden                        192.              68786.            358
    ##  8 Spain                         188.              68383.            363
    ##  9 United Kingdom                185.              66891.            362
    ## 10 Netherlands                   182.              65126.            358
    ## 11 Serbia                        180.              62146.            346
    ## 12 Jordan                        176.              60323.            343
    ## 13 Slovakia                      163.              56477.            346
    ## 14 France                        156.              56682.            364
    ## 15 Austria                       155.              55304.            357
    ## 16 Brazil                        147.              51991.            353
    ## 17 Argentina                     146.              50896.            348
    ## 18 Chile                         141.              49050.            349
    ## 19 Colombia                      135.              46972.            347
    ## 20 Italy                         130.              48190.            371

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.8         632     2273
    ##  2 Mexico               8.88     184474  2076882
    ##  3 Syria                6.59       1023    15533
    ##  4 Sudan                6.20       1880    30347
    ##  5 Egypt                5.85      10639   181829
    ##  6 Ecuador              5.56      15713   282599
    ##  7 China                4.75       4843   101878
    ##  8 Bolivia              4.68      11609   247891
    ##  9 Afghanistan          4.38       2443    55714
    ## 10 Mali                 4.21        352     8365
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12      10167   246706
    ## 13 Zimbabwe             4.05       1458    35994
    ## 14 Iran                 3.70      59980  1623159
    ## 15 Guatemala            3.66       6374   174335
    ## 16 Niger                3.63        172     4740
    ## 17 Chad                 3.52        140     3973
    ## 18 Peru                 3.50      46094  1316363
    ## 19 Hungary              3.49      14974   428599
    ## 20 Tunisia              3.43       7974   232615

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2120.      22052   10.4 
    ##  2 United Kingdom         1968.     122705   62.3 
    ##  3 Czech Republic         1941.      20339   10.5 
    ##  4 Mexico                 1640.     184474  112.  
    ##  5 United States          1633.     506760  310.  
    ##  6 Italy                  1616.      97507   60.3 
    ##  7 Peru                   1541.      46094   29.9 
    ##  8 Portugal               1525.      16276   10.7 
    ##  9 Hungary                1500.      14974    9.98
    ## 10 Spain                  1480.      68813   46.5 
    ## 11 Bulgaria               1422.      10167    7.15
    ## 12 Sweden                 1342.      12826    9.56
    ## 13 France                 1326.      85872   64.8 
    ## 14 Slovakia               1318.       7189    5.46
    ## 15 Brazil                 1257.     252835  201.  
    ## 16 Argentina              1256.      51946   41.3 
    ## 17 Colombia               1245.      59518   47.8 
    ## 18 Chile                  1223.      20476   16.7 
    ## 19 Switzerland            1216.       9219    7.58
    ## 20 Bolivia                1167.      11609    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
