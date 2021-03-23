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

Updated: 2021-03-24

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
    ##  1 United States           76720. 29537163            385
    ##  2 Brazil                  31995. 11998233            375
    ##  3 India                   31248. 11686796            374
    ##  4 Russia                  12093.  4474610            370
    ##  5 United Kingdom          11174.  4301929            385
    ##  6 France                  10923.  4227202            387
    ##  7 Italy                    8631.  3400877            394
    ##  8 Spain                    8364.  3228803            386
    ##  9 Turkey                   8203.  3035338            370
    ## 10 Germany                  6893.  2674710            388
    ## 11 Colombia                 6316.  2337150            370
    ## 12 Argentina                6086.  2245771            369
    ## 13 Mexico                   5934.  2195772            370
    ## 14 Poland                   5588.  2089869            374
    ## 15 Iran                     4613.  1808422            392
    ## 16 Ukraine                  4301.  1565732            364
    ## 17 South Africa             4158.  1538451            370
    ## 18 Peru                     3952.  1466326            371
    ## 19 Indonesia                3930.  1465928            373
    ## 20 Czech Republic           3924.  1475538            376

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                375.             140849.            376
    ##  2 Israel                        300.             112604.            375
    ##  3 United States                 247.              95210.            385
    ##  4 Jordan                        232.              85019.            366
    ##  5 Belgium                       210.              80673.            384
    ##  6 Serbia                        205.              75685.            369
    ##  7 Sweden                        204.              77886.            381
    ##  8 Portugal                      204.              76600.            375
    ##  9 Switzerland                   199.              76710.            385
    ## 10 Netherlands                   190.              72563.            381
    ## 11 Spain                         180.              69428.            386
    ## 12 United Kingdom                179.              68998.            385
    ## 13 Slovakia                      174.              64262.            369
    ## 14 France                        169.              65266.            387
    ## 15 Austria                       165.              62641.            380
    ## 16 Hungary                       160.              58718.            368
    ## 17 Brazil                        159.              59662.            375
    ## 18 Chile                         151.              56017.            372
    ## 19 Argentina                     147.              54320.            369
    ## 20 Poland                        145.              54282.            374

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               21.9         772     3520
    ##  2 Mexico               9.02     198036  2195772
    ##  3 Syria                6.68       1175    17583
    ##  4 Sudan                6.38       1986    31147
    ##  5 Egypt                5.94      11637   196061
    ##  6 Ecuador              5.27      16478   312851
    ##  7 China                4.73       4849   102566
    ##  8 Bolivia              4.56      12060   264634
    ##  9 Afghanistan          4.39       2466    56177
    ## 10 Somalia              4.32        441    10214
    ## 11 Zimbabwe             4.13       1514    36684
    ## 12 Tanzania             4.13         21      509
    ## 13 Bulgaria             3.96      12188   307890
    ## 14 Mali                 3.87        361     9330
    ## 15 Niger                3.76        185     4918
    ## 16 Guatemala            3.57       6710   188119
    ## 17 Chad                 3.55        157     4427
    ## 18 Tunisia              3.48       8569   245923
    ## 19 Peru                 3.42      50198  1466326
    ## 20 Iran                 3.42      61877  1808422

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2392.      25055   10.5 
    ##  2 Belgium                2185.      22728   10.4 
    ##  3 United Kingdom         2024.     126172   62.3 
    ##  4 Hungary                1874.      18703    9.98
    ##  5 Mexico                 1761.     198036  112.  
    ##  6 Italy                  1746.     105328   60.3 
    ##  7 United States          1732.     537260  310.  
    ##  8 Bulgaria               1705.      12188    7.15
    ##  9 Slovakia               1685.       9190    5.46
    ## 10 Peru                   1678.      50198   29.9 
    ## 11 Spain                  1581.      73543   46.5 
    ## 12 Portugal               1572.      16784   10.7 
    ## 13 Brazil                 1462.     294042  201.  
    ## 14 France                 1422.      92094   64.8 
    ## 15 Sweden                 1388.      13262    9.56
    ## 16 Chile                  1335.      22359   16.7 
    ## 17 Argentina              1319.      54545   41.3 
    ## 18 Colombia               1298.      62028   47.8 
    ## 19 Poland                 1292.      49761   38.5 
    ## 20 Switzerland            1249.       9467    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
