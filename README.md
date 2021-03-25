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

Updated: 2021-03-25

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
    ##  1 United States           76665. 29592831            386
    ##  2 Brazil                  32041. 12047526            376
    ##  3 India                   31291. 11734058            375
    ##  4 Russia                  12084.  4483471            371
    ##  5 United Kingdom          11159.  4307308            386
    ##  6 France                  10929.  4240732            388
    ##  7 Italy                    8657.  3419616            395
    ##  8 Spain                    8357.  3234319            387
    ##  9 Turkey                   8252.  3061520            371
    ## 10 Germany                  6916.  2690523            389
    ## 11 Colombia                 6313.  2342278            371
    ## 12 Argentina                6087.  2252172            370
    ## 13 Mexico                   5922.  2197160            371
    ## 14 Poland                   5655.  2120671            375
    ## 15 Iran                     4620.  1815712            393
    ## 16 Ukraine                  4328.  1579906            365
    ## 17 South Africa             4148.  1538961            371
    ## 18 Peru                     3959.  1472790            372
    ## 19 Czech Republic           3943.  1486510            377
    ## 20 Indonesia                3933.  1471225            374

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                376.             141897.            377
    ##  2 Israel                        299.             112604.            376
    ##  3 United States                 247.              95389.            386
    ##  4 Jordan                        235.              86424.            367
    ##  5 Belgium                       210.              81013.            385
    ##  6 Sweden                        208.              79358.            382
    ##  7 Serbia                        207.              76431.            370
    ##  8 Portugal                      204.              76640.            376
    ##  9 Switzerland                   199.              76953.            386
    ## 10 Netherlands                   191.              72897.            382
    ## 11 Spain                         180.              69546.            387
    ## 12 United Kingdom                179.              69084.            386
    ## 13 Slovakia                      175.              64625.            370
    ## 14 France                        169.              65475.            388
    ## 15 Austria                       165.              62972.            381
    ## 16 Hungary                       161.              59478.            369
    ## 17 Brazil                        159.              59907.            376
    ## 18 Chile                         151.              56308.            373
    ## 19 Argentina                     147.              54475.            370
    ## 20 Poland                        147.              55082.            375

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               21.7         786     3616
    ##  2 Mexico               9.02     198239  2197160
    ##  3 Syria                6.67       1183    17743
    ##  4 Sudan                6.40       2003    31282
    ##  5 Egypt                5.94      11680   196709
    ##  6 Ecuador              5.26      16504   313570
    ##  7 China                4.73       4850   102589
    ##  8 Bolivia              4.55      12074   265207
    ##  9 Afghanistan          4.39       2466    56192
    ## 10 Somalia              4.37        453    10369
    ## 11 Zimbabwe             4.13       1516    36717
    ## 12 Tanzania             4.13         21      509
    ## 13 Bulgaria             3.94      12307   312741
    ## 14 Mali                 3.88        368     9474
    ## 15 Niger                3.75        185     4939
    ## 16 Guatemala            3.56       6730   189067
    ## 17 Chad                 3.56        158     4440
    ## 18 Tunisia              3.49       8610   246507
    ## 19 Peru                 3.42      50339  1472790
    ## 20 Iran                 3.41      61951  1815712

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2411.      25258   10.5 
    ##  2 Belgium                2188.      22763   10.4 
    ##  3 United Kingdom         2025.     126284   62.3 
    ##  4 Hungary                1899.      18952    9.98
    ##  5 Mexico                 1763.     198239  112.  
    ##  6 Italy                  1755.     105879   60.3 
    ##  7 United States          1735.     538244  310.  
    ##  8 Bulgaria               1722.      12307    7.15
    ##  9 Slovakia               1698.       9261    5.46
    ## 10 Peru                   1683.      50339   29.9 
    ## 11 Spain                  1586.      73744   46.5 
    ## 12 Portugal               1573.      16794   10.7 
    ## 13 Brazil                 1469.     295425  201.  
    ## 14 France                 1426.      92363   64.8 
    ## 15 Sweden                 1393.      13315    9.56
    ## 16 Chile                  1337.      22384   16.7 
    ## 17 Argentina              1322.      54671   41.3 
    ## 18 Poland                 1308.      50340   38.5 
    ## 19 Colombia               1300.      62148   47.8 
    ## 20 Switzerland            1250.       9478    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
