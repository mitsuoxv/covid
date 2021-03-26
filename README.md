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

Updated: 2021-03-27

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
    ##  1 United States           76595. 29718930            388
    ##  2 Brazil                  32328. 12220011            378
    ##  3 India                   31423. 11846652            377
    ##  4 Russia                  12069.  4501859            373
    ##  5 France                  11157.  4351506            390
    ##  6 United Kingdom          11132.  4319132            388
    ##  7 Italy                    8726.  3464543            397
    ##  8 Turkey                   8364.  3120013            373
    ##  9 Spain                    8349.  3247738            389
    ## 10 Germany                  6994.  2734753            391
    ## 11 Colombia                 6309.  2353210            373
    ## 12 Argentina                6101.  2269877            372
    ## 13 Mexico                   5921.  2208755            373
    ## 14 Poland                   5809.  2189966            377
    ## 15 Iran                     4635.  1830823            395
    ## 16 Ukraine                  4399.  1614707            367
    ## 17 South Africa             4132.  1541563            373
    ## 18 Peru                     3990.  1492519            374
    ## 19 Czech Republic           3966.  1503307            379
    ## 20 Indonesia                3943.  1482559            376

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             143500.            379
    ##  2 Israel                        298.             112830.            378
    ##  3 United States                 247.              95796.            388
    ##  4 Jordan                        242.              89165.            369
    ##  5 Belgium                       212.              82150.            387
    ##  6 Sweden                        211.              80965.            384
    ##  7 Serbia                        209.              77863.            372
    ##  8 Portugal                      203.              76734.            378
    ##  9 Switzerland                   200.              77488.            388
    ## 10 Netherlands                   192.              73815.            384
    ## 11 Spain                         180.              69835.            389
    ## 12 United Kingdom                179.              69274.            388
    ## 13 Slovakia                      175.              65161.            372
    ## 14 France                        172.              67186.            390
    ## 15 Austria                       167.              63798.            383
    ## 16 Hungary                       166.              61572.            371
    ## 17 Brazil                        161.              60765.            378
    ## 18 Chile                         152.              57013.            375
    ## 19 Poland                        151.              56882.            377
    ## 20 Argentina                     148.              54903.            372

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                21.2         811     3820
    ##  2 Mexico                9.04     199627  2208755
    ##  3 Syria                 6.68       1206    18046
    ##  4 Sudan                 6.46       2028    31407
    ##  5 Egypt                 5.94      11768   198011
    ##  6 Ecuador               5.20      16582   318656
    ##  7 China                 4.73       4850   102635
    ##  8 Bolivia               4.53      12107   267059
    ##  9 Somalia               4.42        471    10664
    ## 10 Afghanistan           4.39       2467    56254
    ## 11 Zimbabwe              4.13       1518    36778
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.90      12512   321104
    ## 14 Mali                  3.89        375     9647
    ## 15 Niger                 3.73        185     4955
    ## 16 Chad                  3.54        158     4465
    ## 17 Guatemala             3.54       6765   191207
    ## 18 Tunisia               3.49       8663   248037
    ## 19 South Africa          3.41      52535  1541563
    ## 20 Iran                  3.39      62142  1830823

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2447.      25639   10.5 
    ##  2 Belgium                2193.      22816   10.4 
    ##  3 United Kingdom         2028.     126445   62.3 
    ##  4 Hungary                1953.      19499    9.98
    ##  5 Mexico                 1775.     199627  112.  
    ##  6 Italy                  1770.     106799   60.3 
    ##  7 Bulgaria               1750.      12512    7.15
    ##  8 United States          1742.     540320  310.  
    ##  9 Slovakia               1718.       9373    5.46
    ## 10 Peru                   1694.      50656   29.9 
    ## 11 Spain                  1600.      74420   46.5 
    ## 12 Portugal               1575.      16814   10.7 
    ## 13 Brazil                 1495.     300685  201.  
    ## 14 France                 1433.      92831   64.8 
    ## 15 Sweden                 1399.      13373    9.56
    ## 16 Chile                  1345.      22524   16.7 
    ## 17 Poland                 1333.      51305   38.5 
    ## 18 Argentina              1329.      54946   41.3 
    ## 19 Colombia               1306.      62394   47.8 
    ## 20 Switzerland            1262.       9567    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
