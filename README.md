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

Updated: 2021-03-29

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
    ##  1 United States           76563. 29859706            390
    ##  2 Brazil                  32643. 12404414            380
    ##  3 India                   31587. 11971624            379
    ##  4 Russia                  12052.  4519832            375
    ##  5 France                  11314.  4435057            392
    ##  6 United Kingdom          11100.  4329184            390
    ##  7 Italy                    8803.  3512453            399
    ##  8 Turkey                   8477.  3179115            375
    ##  9 Spain                    8306.  3247738            391
    ## 10 Germany                  7054.  2772401            393
    ## 11 Colombia                 6313.  2367337            375
    ## 12 Argentina                6125.  2291051            374
    ## 13 Poland                   5939.  2250991            379
    ## 14 Mexico                   5919.  2219845            375
    ## 15 Iran                     4652.  1846923            397
    ## 16 Ukraine                  4455.  1644063            369
    ## 17 South Africa             4118.  1544466            375
    ## 18 Peru                     4022.  1512384            376
    ## 19 Czech Republic           3976.  1515029            381
    ## 20 Indonesia                3947.  1492002            378

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                380.             144619.            381
    ##  2 Israel                        297.             113011.            380
    ##  3 United States                 247.              96249.            390
    ##  4 Jordan                        245.              90858.            371
    ##  5 Belgium                       214.              83251.            389
    ##  6 Serbia                        212.              79187.            374
    ##  7 Sweden                        211.              81627.            386
    ##  8 Portugal                      202.              76812.            380
    ##  9 Switzerland                   199.              77758.            390
    ## 10 Netherlands                   194.              74798.            386
    ## 11 Spain                         179.              69835.            391
    ## 12 United Kingdom                178.              69435.            390
    ## 13 Slovakia                      175.              65611.            374
    ## 14 France                        175.              68476.            392
    ## 15 Hungary                       170.              63500.            373
    ## 16 Austria                       168.              64698.            385
    ## 17 Brazil                        162.              61682.            380
    ## 18 Poland                        154.              58467.            379
    ## 19 Chile                         154.              57917.            377
    ## 20 Argentina                     148.              55415.            374

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                21.0         833     3973
    ##  2 Mexico                9.05     200862  2219845
    ##  3 Syria                 6.68       1227    18356
    ##  4 Sudan                 6.46       2028    31407
    ##  5 Egypt                 5.94      11845   199364
    ##  6 Ecuador               5.17      16679   322699
    ##  7 China                 4.72       4851   102680
    ##  8 Bolivia               4.52      12143   268711
    ##  9 Somalia               4.50        488    10838
    ## 10 Afghanistan           4.39       2470    56294
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.13       1519    36818
    ## 13 Bulgaria              3.86      12650   327770
    ## 14 Mali                  3.85        376     9773
    ## 15 Niger                 3.71        185     4987
    ## 16 Chad                  3.55        160     4501
    ## 17 Guatemala             3.53       6775   192133
    ## 18 Tunisia               3.49       8705   249703
    ## 19 South Africa          3.41      52648  1544466
    ## 20 Peru                  3.37      51032  1512384

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2470.      25874   10.5 
    ##  2 Belgium                2198.      22870   10.4 
    ##  3 United Kingdom         2030.     126573   62.3 
    ##  4 Hungary                2001.      19972    9.98
    ##  5 Mexico                 1786.     200862  112.  
    ##  6 Italy                  1784.     107636   60.3 
    ##  7 Bulgaria               1770.      12650    7.15
    ##  8 United States          1750.     543003  310.  
    ##  9 Slovakia               1741.       9496    5.46
    ## 10 Peru                   1706.      51032   29.9 
    ## 11 Spain                  1600.      74420   46.5 
    ## 12 Portugal               1576.      16827   10.7 
    ## 13 Brazil                 1527.     307112  201.  
    ## 14 France                 1450.      93884   64.8 
    ## 15 Sweden                 1402.      13402    9.56
    ## 16 Chile                  1353.      22653   16.7 
    ## 17 Poland                 1348.      51884   38.5 
    ## 18 Argentina              1336.      55235   41.3 
    ## 19 Colombia               1311.      62645   47.8 
    ## 20 Switzerland            1263.       9577    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
