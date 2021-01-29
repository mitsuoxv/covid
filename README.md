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

Updated: 2021-01-30

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
    ##  1 United States           76138. 25354044            333
    ##  2 India                   33395. 10720048            321
    ##  3 Brazil                  27854.  8996876            323
    ##  4 Russia                  12028.  3813048            317
    ##  5 United Kingdom          11276.  3743738            332
    ##  6 France                   9220.  3079545            334
    ##  7 Spain                    8098.  2705001            334
    ##  8 Turkey                   7751.  2457118            317
    ##  9 Italy                    7376.  2515507            341
    ## 10 Germany                  6545.  2192850            335
    ## 11 Colombia                 6483.  2055305            317
    ## 12 Argentina                5962.  1896053            318
    ## 13 Mexico                   5699.  1806849            317
    ## 14 Poland                   4681.  1502810            321
    ## 15 South Africa             4521   1437798            318
    ## 16 Iran                     4126.  1398841            339
    ## 17 Ukraine                  3895.  1211593            311
    ## 18 Peru                     3503.  1113970            318
    ## 19 Indonesia                3233.  1037993            321
    ## 20 Czech Republic           3011.   972642            323

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                287.              92845.            323
    ##  2 Israel                        260.              83754.            322
    ##  3 United States                 245.              81726.            333
    ##  4 Switzerland                   205.              68178.            332
    ##  5 Belgium                       204.              67523.            331
    ##  6 Portugal                      199.              64198.            322
    ##  7 United Kingdom                181.              60045.            332
    ##  8 Sweden                        180.              59079.            328
    ##  9 Netherlands                   177.              58051.            328
    ## 10 Spain                         174.              58165.            334
    ## 11 Serbia                        168.              53185.            316
    ## 12 Jordan                        162.              50595.            313
    ## 13 Austria                       152.              49576.            327
    ## 14 Argentina                     144.              45861.            318
    ## 15 France                        142.              47547.            334
    ## 16 Slovakia                      142.              45098.            317
    ## 17 Brazil                        139.              44738.            323
    ## 18 Colombia                      136.              43007.            317
    ## 19 Chile                         134.              42644.            319
    ## 20 Italy                         122.              41689.            341

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2124
    ##  2 Mexico               8.50     153639  1806849
    ##  3 Syria                6.53        906    13885
    ##  4 Sudan                6.14       1798    29291
    ##  5 Ecuador              6.00      14766   246000
    ##  6 Egypt                5.58       9169   164282
    ##  7 Bolivia              4.89      10167   208074
    ##  8 China                4.79       4820   100641
    ##  9 Afghanistan          4.37       2399    54939
    ## 10 Iran                 4.13      57736  1398841
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12       8973   217574
    ## 13 Mali                 4.11        331     8056
    ## 14 Greece               3.71       5742   154796
    ## 15 Peru                 3.62      40272  1113970
    ## 16 Chad                 3.58        118     3296
    ## 17 Zimbabwe             3.55       1160    32646
    ## 18 Guatemala            3.52       5543   157595
    ## 19 Niger                3.51        157     4474
    ## 20 Italy                3.47      87381  2515507

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2017.      20982   10.4 
    ##  2 United Kingdom         1654.     103126   62.3 
    ##  3 Czech Republic         1534.      16072   10.5 
    ##  4 Italy                  1448.      87381   60.3 
    ##  5 United States          1372.     425670  310.  
    ##  6 Mexico                 1366.     153639  112.  
    ##  7 Peru                   1347.      40272   29.9 
    ##  8 Bulgaria               1255.       8973    7.15
    ##  9 Spain                  1243.      57806   46.5 
    ## 10 Hungary                1240.      12374    9.98
    ## 11 Sweden                 1206.      11520    9.56
    ## 12 France                 1149.      74405   64.8 
    ## 13 Argentina              1147.      47435   41.3 
    ## 14 Switzerland            1128.       8551    7.58
    ## 15 Colombia               1099.      52523   47.8 
    ## 16 Brazil                 1095.     220161  201.  
    ## 17 Portugal               1087.      11608   10.7 
    ## 18 Chile                  1085.      18174   16.7 
    ## 19 Bolivia                1022.      10167    9.95
    ## 20 Ecuador                 998.      14766   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
