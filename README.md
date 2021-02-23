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

Updated: 2021-02-24

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
    ##  1 United States           77733. 27828370            358
    ##  2 India                   31839. 11016434            346
    ##  3 Brazil                  29219. 10168174            348
    ##  4 Russia                  12249.  4189153            342
    ##  5 United Kingdom          11558.  4126154            357
    ##  6 France                   9880.  3547055            359
    ##  7 Spain                    8785.  3153971            359
    ##  8 Turkey                   7738.  2646526            342
    ##  9 Italy                    7701.  2818863            366
    ## 10 Germany                  6652.  2394811            360
    ## 11 Colombia                 6509.  2226262            342
    ## 12 Argentina                6034.  2069751            343
    ## 13 Mexico                   5969.  2041380            342
    ## 14 Poland                   4765.  1648962            346
    ## 15 South Africa             4386.  1504588            343
    ## 16 Iran                     4347.  1582275            364
    ## 17 Ukraine                  3904.  1311844            336
    ## 18 Peru                     3741.  1283309            343
    ## 19 Indonesia                3725.  1288833            346
    ## 20 Czech Republic           3357.  1168491            348

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                320.             111540.            348
    ##  2 Israel                        291.             101000.            347
    ##  3 United States                 251.              89702.            358
    ##  4 Portugal                      215.              74754.            347
    ##  5 Belgium                       204.              72632.            356
    ##  6 Switzerland                   202.              72233.            357
    ##  7 Spain                         189.              67819.            359
    ##  8 Sweden                        187.              66050.            353
    ##  9 United Kingdom                185.              66179.            357
    ## 10 Netherlands                   181.              63731.            353
    ## 11 Serbia                        175.              59851.            341
    ## 12 Jordan                        170.              57480.            338
    ## 13 Slovakia                      158.              54040.            341
    ## 14 Austria                       153.              53975.            352
    ## 15 France                        153.              54765.            359
    ## 16 Argentina                     146.              50063.            343
    ## 17 Brazil                        145.              50562.            348
    ## 18 Chile                         139.              47951.            344
    ## 19 Colombia                      136.              46584.            342
    ## 20 Italy                         128.              46716.            366

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.4         620     2180
    ##  2 Mexico               8.82     180107  2041380
    ##  3 Syria                6.57       1001    15230
    ##  4 Sudan                6.19       1871    30205
    ##  5 Egypt                5.82      10404   178774
    ##  6 Ecuador              5.65      15547   274968
    ##  7 China                4.76       4842   101726
    ##  8 Bolivia              4.72      11441   242292
    ##  9 Afghanistan          4.38       2435    55646
    ## 10 Mali                 4.19        348     8306
    ## 11 Bulgaria             4.16       9933   238591
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.02       1441    35862
    ## 14 Iran                 3.76      59572  1582275
    ## 15 Guatemala            3.68       6306   171289
    ## 16 Niger                3.63        172     4740
    ## 17 Hungary              3.55      14450   407274
    ## 18 Peru                 3.51      45097  1283309
    ## 19 Greece               3.50       6321   180672
    ## 20 Chad                 3.49        135     3868

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2107.      21923   10.4 
    ##  2 United Kingdom         1937.     120757   62.3 
    ##  3 Czech Republic         1865.      19537   10.5 
    ##  4 Mexico                 1601.     180107  112.  
    ##  5 United States          1596.     495275  310.  
    ##  6 Italy                  1591.      95992   60.3 
    ##  7 Peru                   1508.      45097   29.9 
    ##  8 Portugal               1501.      16023   10.7 
    ##  9 Spain                  1454.      67636   46.5 
    ## 10 Hungary                1448.      14450    9.98
    ## 11 Bulgaria               1389.       9933    7.15
    ## 12 Sweden                 1324.      12649    9.56
    ## 13 France                 1300.      84193   64.8 
    ## 14 Argentina              1242.      51359   41.3 
    ## 15 Colombia               1231.      58834   47.8 
    ## 16 Brazil                 1226.     246504  201.  
    ## 17 Slovakia               1223.       6671    5.46
    ## 18 Switzerland            1210.       9174    7.58
    ## 19 Chile                  1202.      20126   16.7 
    ## 20 Bolivia                1150.      11441    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
