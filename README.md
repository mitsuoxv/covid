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

Updated: 2021-04-01

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
    ##  1 United States           76412. 30030084            393
    ##  2 Brazil                  32829. 12573615            383
    ##  3 India                   31804. 12149335            382
    ##  4 Russia                  12024.  4545095            378
    ##  5 France                  11419.  4510740            395
    ##  6 United Kingdom          11047.  4341740            393
    ##  7 Italy                    8858.  3561012            402
    ##  8 Turkey                   8671.  3277880            378
    ##  9 Spain                    8301.  3270825            394
    ## 10 Germany                  7093.  2808873            396
    ## 11 Colombia                 6322.  2389779            378
    ## 12 Argentina                6160.  2322611            377
    ## 13 Poland                   6078.  2321717            382
    ## 14 Mexico                   5893.  2227842            378
    ## 15 Iran                     4688.  1875234            400
    ## 16 Ukraine                  4500.  1674168            372
    ## 17 South Africa             4091.  1546735            378
    ## 18 Peru                     4045.  1533121            379
    ## 19 Czech Republic           3990.  1532332            384
    ## 20 Indonesia                3952.  1505775            381

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             146271.            384
    ##  2 Israel                        295.             113011.            383
    ##  3 Jordan                        252.              94428.            374
    ##  4 United States                 246.              96799.            393
    ##  5 Serbia                        215.              81076.            377
    ##  6 Belgium                       215.              84287.            392
    ##  7 Sweden                        214.              83346.            389
    ##  8 Portugal                      201.              76911.            383
    ##  9 Switzerland                   200.              78612.            393
    ## 10 Netherlands                   195.              75998.            389
    ## 11 Spain                         178.              70331.            394
    ## 12 United Kingdom                177.              69637.            393
    ## 13 France                        176.              69644.            395
    ## 14 Slovakia                      176.              66212.            377
    ## 15 Hungary                       174.              65361.            376
    ## 16 Austria                       169.              65760.            388
    ## 17 Brazil                        163.              62523.            383
    ## 18 Poland                        158.              60304.            382
    ## 19 Chile                         155.              59087.            380
    ## 20 Argentina                     149.              56179.            377

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                20.8         883     4251
    ##  2 Mexico                9.06     201826  2227842
    ##  3 Syria                 6.68       1254    18775
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.94      11956   201432
    ##  6 Ecuador               5.13      16780   327325
    ##  7 China                 4.72       4851   102734
    ##  8 Somalia               4.57        510    11164
    ##  9 Bolivia               4.52      12211   270347
    ## 10 Afghanistan           4.40       2484    56454
    ## 11 Zimbabwe              4.13       1521    36858
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.86      13068   338426
    ## 14 Mali                  3.84        384     9998
    ## 15 Niger                 3.72        186     5003
    ## 16 Chad                  3.63        164     4523
    ## 17 Guatemala             3.52       6823   193834
    ## 18 Tunisia               3.48       8788   252171
    ## 19 South Africa          3.41      52788  1546735
    ## 20 Peru                  3.37      51635  1533121

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2522.      26421   10.5 
    ##  2 Belgium                2208.      22966   10.4 
    ##  3 Hungary                2077.      20737    9.98
    ##  4 United Kingdom         2032.     126670   62.3 
    ##  5 Bulgaria               1828.      13068    7.15
    ##  6 Italy                  1804.     108879   60.3 
    ##  7 Mexico                 1795.     201826  112.  
    ##  8 Slovakia               1782.       9719    5.46
    ##  9 United States          1757.     545022  310.  
    ## 10 Peru                   1727.      51635   29.9 
    ## 11 Spain                  1617.      75199   46.5 
    ## 12 Portugal               1578.      16845   10.7 
    ## 13 Brazil                 1561.     313866  201.  
    ## 14 France                 1463.      94763   64.8 
    ## 15 Sweden                 1405.      13430    9.56
    ## 16 Chile                  1380.      23107   16.7 
    ## 17 Poland                 1378.      53045   38.5 
    ## 18 Argentina              1345.      55611   41.3 
    ## 19 Colombia               1320.      63079   47.8 
    ## 20 Switzerland            1267.       9608    7.58

EOL
