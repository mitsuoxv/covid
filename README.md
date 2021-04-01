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

Updated: 2021-04-02

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
    ##  1 United States           76385. 30095776            394
    ##  2 Brazil                  32964. 12658109            384
    ##  3 India                   31910. 12221665            383
    ##  4 Russia                  12016.  4554264            379
    ##  5 France                  11539.  4569568            396
    ##  6 United Kingdom          11030.  4345792            394
    ##  7 Italy                    8895.  3584899            403
    ##  8 Turkey                   8752.  3317182            379
    ##  9 Spain                    8289.  3274150            395
    ## 10 Germany                  7136.  2833173            397
    ## 11 Colombia                 6326.  2397731            379
    ## 12 Argentina                6171.  2332765            378
    ## 13 Poland                   6154.  2356970            383
    ## 14 Mexico                   5891.  2232910            379
    ## 15 Iran                     4702.  1885564            401
    ## 16 Ukraine                  4535.  1691737            373
    ## 17 South Africa             4084.  1548157            379
    ## 18 Peru                     4053.  1540077            380
    ## 19 Czech Republic           3999.  1539617            385
    ## 20 Indonesia                3957   1511712            382

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             146966.            385
    ##  2 Israel                        294.             113011.            384
    ##  3 Jordan                        254.              95453.            375
    ##  4 United States                 246.              97010.            394
    ##  5 Serbia                        216.              81771.            378
    ##  6 Sweden                        216.              84229.            390
    ##  7 Belgium                       216.              84827.            393
    ##  8 Portugal                      200.              76969.            384
    ##  9 Switzerland                   200.              78930.            394
    ## 10 Netherlands                   196.              76456.            390
    ## 11 Spain                         178.              70403.            395
    ## 12 France                        178.              70552.            396
    ## 13 United Kingdom                177.              69702.            394
    ## 14 Hungary                       176.              66291.            377
    ## 15 Slovakia                      176.              66451.            378
    ## 16 Austria                       170.              66139.            389
    ## 17 Brazil                        164.              62943.            384
    ## 18 Poland                        160.              61220             383
    ## 19 Chile                         156.              59448.            381
    ## 20 Argentina                     149.              56424.            378

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                20.4         889     4361
    ##  2 Mexico                9.07     202633  2232910
    ##  3 Syria                 6.69       1265    18909
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.93      11995   202131
    ##  6 Ecuador               5.12      16847   328755
    ##  7 China                 4.72       4851   102762
    ##  8 Somalia               4.64        529    11398
    ##  9 Bolivia               4.51      12239   271419
    ## 10 Afghanistan           4.40       2489    56517
    ## 11 Zimbabwe              4.13       1523    36882
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.85      13197   342633
    ## 14 Mali                  3.83        385    10042
    ## 15 Niger                 3.72        187     5021
    ## 16 Chad                  3.62        164     4533
    ## 17 Guatemala             3.52       6823   193834
    ## 18 Tunisia               3.47       8812   254018
    ## 19 South Africa          3.41      52846  1548157
    ## 20 Peru                  3.36      51801  1540077

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2538.      26586   10.5 
    ##  2 Belgium                2212.      23016   10.4 
    ##  3 Hungary                2103.      20995    9.98
    ##  4 United Kingdom         2032.     126713   62.3 
    ##  5 Bulgaria               1846.      13197    7.15
    ##  6 Italy                  1812.     109346   60.3 
    ##  7 Mexico                 1802.     202633  112.  
    ##  8 Slovakia               1795.       9790    5.46
    ##  9 United States          1760.     545887  310.  
    ## 10 Peru                   1732.      51801   29.9 
    ## 11 Spain                  1617.      75215   46.5 
    ## 12 Brazil                 1580.     317646  201.  
    ## 13 Portugal               1578.      16848   10.7 
    ## 14 France                 1468.      95062   64.8 
    ## 15 Sweden                 1409.      13465    9.56
    ## 16 Poland                 1394.      53665   38.5 
    ## 17 Chile                  1381.      23135   16.7 
    ## 18 Argentina              1348.      55736   41.3 
    ## 19 Colombia               1324.      63255   47.8 
    ## 20 Switzerland            1269.       9622    7.58

EOL
