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

Updated: 2021-03-22

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
    ##  1 United States           76861. 29437770            383
    ##  2 Brazil                  31826. 11871390            373
    ##  3 India                   31180. 11599130            372
    ##  4 Russia                  12111.  4456869            368
    ##  5 United Kingdom          11204.  4291275            383
    ##  6 France                  10859.  4180829            385
    ##  7 Italy                    8562.  3356331            392
    ##  8 Spain                    8349.  3206116            384
    ##  9 Turkey                   8132.  2992694            368
    ## 10 Germany                  6890.  2659516            386
    ## 11 Colombia                 6316.  2324426            368
    ## 12 Argentina                6089.  2234913            367
    ## 13 Mexico                   5945.  2187910            368
    ## 14 Poland                   5533.  2058550            372
    ## 15 Iran                     4599.  1793805            390
    ## 16 Ukraine                  4271.  1546363            362
    ## 17 South Africa             4176.  1536801            368
    ## 18 Peru                     3934.  1451645            369
    ## 19 Czech Republic           3929.  1469547            374
    ## 20 Indonesia                3924.  1455788            371

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                375.             140277.            374
    ##  2 Israel                        301.             112145.            373
    ##  3 United States                 248.              94889.            383
    ##  4 Jordan                        226.              82201.            364
    ##  5 Belgium                       208.              79587.            382
    ##  6 Sweden                        205.              77886.            379
    ##  7 Portugal                      205.              76534.            373
    ##  8 Serbia                        203.              74460.            367
    ##  9 Switzerland                   199.              76231.            383
    ## 10 Netherlands                   189.              71768.            379
    ## 11 United Kingdom                180.              68827.            383
    ## 12 Spain                         180.              68940.            384
    ## 13 Slovakia                      174.              63954.            367
    ## 14 France                        168.              64550.            385
    ## 15 Austria                       164.              62004.            378
    ## 16 Brazil                        158.              59031.            373
    ## 17 Hungary                       156.              57263.            366
    ## 18 Chile                         149.              55241.            370
    ## 19 Argentina                     147.              54058.            367
    ## 20 Poland                        144.              53469.            372

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               22.5         738     3282
    ##  2 Mexico               9.01     197219  2187910
    ##  3 Syria                6.69       1153    17240
    ##  4 Sudan                6.32       1959    30989
    ##  5 Egypt                5.93      11557   194771
    ##  6 Ecuador              5.29      16435   310868
    ##  7 China                4.73       4849   102523
    ##  8 Bolivia              4.56      12041   263808
    ##  9 Afghanistan          4.39       2463    56103
    ## 10 Somalia              4.20        419     9968
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.12       1510    36662
    ## 13 Mali                 3.96        367     9270
    ## 14 Bulgaria             3.96      11966   302480
    ## 15 Niger                3.76        185     4918
    ## 16 Guatemala            3.56       6685   187659
    ## 17 Chad                 3.56        157     4410
    ## 18 Tunisia              3.47       8526   245405
    ## 19 Iran                 3.44      61724  1793805
    ## 20 Peru                 3.44      49897  1451645

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2355.      24667   10.5 
    ##  2 Belgium                2177.      22650   10.4 
    ##  3 United Kingdom         2023.     126122   62.3 
    ##  4 Hungary                1829.      18262    9.98
    ##  5 Mexico                 1754.     197219  112.  
    ##  6 Italy                  1734.     104642   60.3 
    ##  7 United States          1728.     536008  310.  
    ##  8 Bulgaria               1674.      11966    7.15
    ##  9 Peru                   1668.      49897   29.9 
    ## 10 Slovakia               1658.       9044    5.46
    ## 11 Portugal               1570.      16762   10.7 
    ## 12 Spain                  1565.      72793   46.5 
    ## 13 Brazil                 1444.     290314  201.  
    ## 14 France                 1414.      91613   64.8 
    ## 15 Sweden                 1388.      13262    9.56
    ## 16 Chile                  1324.      22180   16.7 
    ## 17 Argentina              1318.      54476   41.3 
    ## 18 Colombia               1293.      61771   47.8 
    ## 19 Poland                 1281.      49300   38.5 
    ## 20 Switzerland            1247.       9455    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
