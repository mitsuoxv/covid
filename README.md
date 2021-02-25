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

Updated: 2021-02-26

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
    ##  1 United States           77653. 27955338            360
    ##  2 India                   31744. 11046914            348
    ##  3 Brazil                  29308. 10257875            350
    ##  4 Russia                  12244.  4212100            344
    ##  5 United Kingdom          11544.  4144581            359
    ##  6 France                   9965.  3597495            361
    ##  7 Spain                    8807.  3170644            360
    ##  8 Turkey                   7747.  2665194            344
    ##  9 Italy                    7740.  2848564            368
    ## 10 Germany                  6670.  2414687            362
    ## 11 Colombia                 6493.  2233589            344
    ## 12 Argentina                6031.  2080824            345
    ## 13 Mexico                   5966.  2052266            344
    ## 14 Poland                   4808.  1673252            348
    ## 15 South Africa             4369.  1507448            345
    ## 16 Iran                     4368.  1598875            366
    ## 17 Ukraine                  3922.  1325841            338
    ## 18 Indonesia                3753.  1306141            348
    ## 19 Peru                     3749.  1293497            345
    ## 20 Czech Republic           3423.  1198168            350

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                327.             114373.            350
    ##  2 Israel                        296.             103412.            349
    ##  3 United States                 250.              90111.            360
    ##  4 Portugal                      215.              74989.            349
    ##  5 Belgium                       204.              73134.            358
    ##  6 Switzerland                   202.              72559.            359
    ##  7 Sweden                        191.              67756.            355
    ##  8 Spain                         189.              68177.            360
    ##  9 United Kingdom                185.              66474.            359
    ## 10 Netherlands                   181.              64221.            355
    ## 11 Serbia                        177.              60765.            343
    ## 12 Jordan                        173.              58754.            340
    ## 13 Slovakia                      161.              55137.            343
    ## 14 France                        154.              55544.            361
    ## 15 Austria                       154.              54445.            354
    ## 16 Argentina                     146.              50331.            345
    ## 17 Brazil                        146.              51008.            350
    ## 18 Chile                         139.              48241.            346
    ## 19 Colombia                      136.              46738.            344
    ## 20 Italy                         128.              47208.            368

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.1         625     2225
    ##  2 Mexico               8.86     181809  2052266
    ##  3 Syria                6.57       1008    15343
    ##  4 Sudan                6.20       1876    30236
    ##  5 Egypt                5.83      10495   180051
    ##  6 Ecuador              5.61      15634   278779
    ##  7 China                4.76       4843   101778
    ##  8 Bolivia              4.71      11508   244380
    ##  9 Afghanistan          4.38       2438    55680
    ## 10 Mali                 4.18        348     8332
    ## 11 Bulgaria             4.14      10026   242124
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.05       1456    35960
    ## 14 Iran                 3.74      59736  1598875
    ## 15 Guatemala            3.66       6327   172764
    ## 16 Niger                3.63        172     4740
    ## 17 Hungary              3.54      14672   414514
    ## 18 Peru                 3.52      45487  1293497
    ## 19 Chad                 3.48        136     3904
    ## 20 Greece               3.45       6371   184686

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2114.      21988   10.4 
    ##  2 United Kingdom         1953.     121747   62.3 
    ##  3 Czech Republic         1893.      19835   10.5 
    ##  4 Mexico                 1617.     181809  112.  
    ##  5 United States          1609.     499017  310.  
    ##  6 Italy                  1602.      96666   60.3 
    ##  7 Peru                   1521.      45487   29.9 
    ##  8 Portugal               1511.      16136   10.7 
    ##  9 Spain                  1472.      68468   46.5 
    ## 10 Hungary                1470.      14672    9.98
    ## 11 Bulgaria               1402.      10026    7.15
    ## 12 Sweden                 1339.      12793    9.56
    ## 13 France                 1311.      84894   64.8 
    ## 14 Slovakia               1257.       6859    5.46
    ## 15 Argentina              1246.      51524   41.3 
    ## 16 Colombia               1237.      59118   47.8 
    ## 17 Brazil                 1236.     248529  201.  
    ## 18 Switzerland            1214.       9204    7.58
    ## 19 Chile                  1205.      20173   16.7 
    ## 20 Bolivia                1157.      11508    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
