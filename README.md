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

Updated: 2021-03-18

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
    ##  1 United States           77059. 29205543            379
    ##  2 Brazil                  31218. 11519609            369
    ##  3 India                   31083. 11438734            368
    ##  4 Russia                  12138.  4418436            364
    ##  5 United Kingdom          11263.  4268825            379
    ##  6 France                  10597.  4037745            381
    ##  7 Spain                    8408.  3195062            380
    ##  8 Italy                    8399.  3258770            388
    ##  9 Turkey                   7998.  2911642            364
    ## 10 Germany                  6792.  2594764            382
    ## 11 Colombia                 6335.  2305884            364
    ## 12 Argentina                6065.  2201886            363
    ## 13 Mexico                   5955.  2167729            364
    ## 14 Poland                   5318.  1956974            368
    ## 15 Iran                     4568.  1763313            386
    ## 16 South Africa             4206.  1530966            364
    ## 17 Ukraine                  4159.  1489023            358
    ## 18 Indonesia                3897.  1430458            367
    ## 19 Peru                     3887.  1418974            365
    ## 20 Czech Republic           3856.  1426991            370

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                368.             136215.            370
    ##  2 Israel                        302.             111435.            369
    ##  3 United States                 248.              94141.            379
    ##  4 Jordan                        215.              77318.            360
    ##  5 Portugal                      207.              76330.            369
    ##  6 Belgium                       207.              78153.            378
    ##  7 Sweden                        202.              75900.            375
    ##  8 Switzerland                   199.              75526.            379
    ##  9 Serbia                        197.              71630.            363
    ## 10 Netherlands                   187.              70145.            375
    ## 11 Spain                         181.              68702.            380
    ## 12 United Kingdom                181.              68467.            379
    ## 13 Slovakia                      173.              62774.            363
    ## 14 France                        164.              62341.            381
    ## 15 Austria                       161.              60337.            374
    ## 16 Brazil                        155.              57282.            369
    ## 17 Hungary                       147.              53354.            362
    ## 18 Chile                         147.              53789.            366
    ## 19 Argentina                     147.              53259.            363
    ## 20 Italy                         139.              54007.            388

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               23.8         708     2973
    ##  2 Mexico               8.99     194944  2167729
    ##  3 Syria                6.66       1110    16656
    ##  4 Sudan                6.32       1959    30989
    ##  5 Egypt                5.92      11384   192195
    ##  6 Ecuador              5.37      16259   302854
    ##  7 China                4.73       4849   102433
    ##  8 Bolivia              4.60      11974   260059
    ##  9 Afghanistan          4.39       2460    56016
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.12       1507    36535
    ## 12 Somalia              4.08        385     9437
    ## 13 Mali                 4.06        360     8862
    ## 14 Bulgaria             4.03      11579   287568
    ## 15 Niger                3.76        183     4870
    ## 16 Guatemala            3.59       6599   183985
    ## 17 Chad                 3.57        155     4344
    ## 18 Iran                 3.48      61427  1763313
    ## 19 Tunisia              3.47       8429   242673
    ## 20 Peru                 3.47      49177  1418974

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2282.      23902   10.5 
    ##  2 Belgium                2170.      22572   10.4 
    ##  3 United Kingdom         2016.     125690   62.3 
    ##  4 Hungary                1745.      17421    9.98
    ##  5 Mexico                 1733.     194944  112.  
    ##  6 United States          1711.     530815  310.  
    ##  7 Italy                  1707.     103001   60.3 
    ##  8 Peru                   1644.      49177   29.9 
    ##  9 Bulgaria               1620.      11579    7.15
    ## 10 Slovakia               1602.       8738    5.46
    ## 11 Portugal               1565.      16707   10.7 
    ## 12 Spain                  1557.      72424   46.5 
    ## 13 France                 1400.      90657   64.8 
    ## 14 Brazil                 1389.     279286  201.  
    ## 15 Sweden                 1378.      13172    9.56
    ## 16 Argentina              1302.      53836   41.3 
    ## 17 Chile                  1301.      21789   16.7 
    ## 18 Colombia               1282.      61243   47.8 
    ## 19 Poland                 1248.      48032   38.5 
    ## 20 Switzerland            1240.       9399    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
