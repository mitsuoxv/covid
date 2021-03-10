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

Updated: 2021-03-11

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
    ##  1 United States           77487. 28825174            372
    ##  2 India                   31198. 11262707            361
    ##  3 Brazil                  30529. 11051665            362
    ##  4 Russia                  12189.  4351553            357
    ##  5 United Kingdom          11368.  4229002            372
    ##  6 France                  10332.  3864335            374
    ##  7 Spain                    8485.  3164983            373
    ##  8 Italy                    8139.  3101093            381
    ##  9 Turkey                   7863.  2807387            357
    ## 10 Germany                  6716.  2518591            375
    ## 11 Colombia                 6383.  2278861            357
    ## 12 Argentina                6073.  2162001            356
    ## 13 Mexico                   5967.  2130477            357
    ## 14 Poland                   5064.  1828313            361
    ## 15 Iran                     4502.  1706559            379
    ## 16 South Africa             4265.  1522697            357
    ## 17 Ukraine                  4035.  1416438            351
    ## 18 Indonesia                3858.  1392945            361
    ## 19 Peru                     3839.  1374467            358
    ## 20 Czech Republic           3722.  1351195            363

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                355.             128980.            363
    ##  2 Israel                        303.             109635.            362
    ##  3 United States                 250.              92915.            372
    ##  4 Portugal                      210.              75993.            362
    ##  5 Belgium                       205.              76052.            371
    ##  6 Switzerland                   200.              74362.            372
    ##  7 Sweden                        198.              72832.            368
    ##  8 Jordan                        195.              69018.            353
    ##  9 Serbia                        189.              67272.            356
    ## 10 Netherlands                   184.              67780.            368
    ## 11 Spain                         182.              68055.            373
    ## 12 United Kingdom                182.              67829.            372
    ## 13 Slovakia                      170.              60420.            356
    ## 14 France                        160.              59664.            374
    ## 15 Austria                       158.              58011.            367
    ## 16 Brazil                        152.              54955.            362
    ## 17 Argentina                     147.              52294.            356
    ## 18 Chile                         144.              51597.            359
    ## 19 Hungary                       136.              48173.            355
    ## 20 Italy                         135.              51393.            381

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               25.3         655     2590
    ##  2 Mexico               8.96     190923  2130477
    ##  3 Syria                6.66       1074    16117
    ##  4 Sudan                6.24       1915    30686
    ##  5 Egypt                5.90      11082   187716
    ##  6 Ecuador              5.45      16069   295114
    ##  7 China                4.75       4848   102152
    ##  8 Bolivia              4.65      11845   254736
    ##  9 Afghanistan          4.39       2451    55894
    ## 10 Tanzania             4.13         21      509
    ## 11 Mali                 4.11        358     8710
    ## 12 Zimbabwe             4.10       1489    36321
    ## 13 Bulgaria             4.09      10902   266805
    ## 14 Somalia              3.72        319     8577
    ## 15 Niger                3.67        177     4829
    ## 16 Guatemala            3.62       6493   179563
    ## 17 Iran                 3.57      60867  1706559
    ## 18 Peru                 3.49      47973  1374467
    ## 19 Tunisia              3.47       8268   238613
    ## 20 Chad                 3.42        144     4214

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2146.      22327   10.4 
    ##  2 Czech Republic         2137.      22385   10.5 
    ##  3 United Kingdom         2002.     124797   62.3 
    ##  4 Mexico                 1698.     190923  112.  
    ##  5 United States          1684.     522469  310.  
    ##  6 Italy                  1665.     100479   60.3 
    ##  7 Hungary                1635.      16325    9.98
    ##  8 Peru                   1604.      47973   29.9 
    ##  9 Portugal               1554.      16595   10.7 
    ## 10 Spain                  1542.      71727   46.5 
    ## 11 Bulgaria               1525.      10902    7.15
    ## 12 Slovakia               1493.       8146    5.46
    ## 13 France                 1371.      88813   64.8 
    ## 14 Sweden                 1365.      13042    9.56
    ## 15 Brazil                 1325.     266398  201.  
    ## 16 Argentina              1288.      53252   41.3 
    ## 17 Colombia               1268.      60598   47.8 
    ## 18 Chile                  1265.      21182   16.7 
    ## 19 Switzerland            1228.       9307    7.58
    ## 20 Poland                 1195.      45997   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
