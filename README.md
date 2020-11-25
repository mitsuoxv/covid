WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2020-11-26

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           45809. 12276834            268
    ##  2 India                   36024.  9222216            256
    ##  3 Brazil                  23595.  6087608            258
    ##  4 Russia                   8581.  2162503            252
    ##  5 France                   7865.  2115778            269
    ##  6 Spain                    5950.  1594844            268
    ##  7 United Kingdom           5763.  1538798            267
    ##  8 Argentina                5433.  1374631            253
    ##  9 Italy                    5271.  1455022            276
    ## 10 Colombia                 4980.  1254979            252
    ## 11 Mexico                   4164.  1049358            252
    ## 12 Peru                     3757.   950557            253
    ## 13 Germany                  3560.   961320            270
    ## 14 Poland                   3551.   909066            256
    ## 15 Iran                     3213.   880542            274
    ## 16 South Africa             3052.   772252            253
    ## 17 Ukraine                  2690.   661858            246
    ## 18 Chile                    2138.   543087            254
    ## 19 Belgium                  2111.   561707            266
    ## 20 Iraq                     2108.   539749            256

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               53995.            266
    ##  2 Czech Republic               186.               47970.            258
    ##  3 Israel                       174.               44777.            257
    ##  4 Switzerland                  149.               40020.            268
    ##  5 United States                148.               39573.            268
    ##  6 Argentina                    131.               33249.            253
    ##  7 Spain                        128.               34293.            268
    ##  8 Chile                        128.               32430.            254
    ##  9 Peru                         126.               31784.            253
    ## 10 France                       121.               32667.            269
    ## 11 Jordan                       121.               30122.            248
    ## 12 Austria                      118.               30877.            262
    ## 13 Brazil                       117.               30271.            258
    ## 14 Netherlands                  112.               29627.            264
    ## 15 Colombia                     104.               26260.            252
    ## 16 Portugal                      97.9              25171.            257
    ## 17 United Kingdom                92.4              24681.            267
    ## 18 Poland                        92.2              23612.            256
    ## 19 Sweden                        89.4              23604.            264
    ## 20 Italy                         87.4              24114.            276

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         605     2077
    ##  2 Mexico                  9.71     101926  1049358
    ##  3 Sudan                   7.32       1202    16431
    ##  4 Ecuador                 7.11      13264   186436
    ##  5 Bolivia                 6.19       8916   144034
    ##  6 Chad                    6.12        101     1649
    ##  7 Egypt                   5.78       6573   113742
    ##  8 Syria                   5.22        385     7369
    ##  9 Iran                    5.19      45738   880542
    ## 10 China                   5.11       4749    92914
    ## 11 Niger                   5.07         70     1381
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.78       1712    45278
    ## 14 Peru                    3.75      35641   950557
    ## 15 United Kingdom          3.63      55838  1538798
    ## 16 Italy                   3.53      51306  1455022
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.43       4099   119349
    ## 19 Canada                  3.41      11521   337555
    ## 20 Mali                    3.37        146     4326

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1532.      15938   10.4 
    ##  2 Peru                   1192.      35641   29.9 
    ##  3 Spain                   939.      43668   46.5 
    ##  4 Mexico                  906.     101926  112.  
    ##  5 Chile                   904.      15131   16.7 
    ##  6 Argentina               898.      37122   41.3 
    ##  7 Ecuador                 897.      13264   14.8 
    ##  8 Bolivia                 896.       8916    9.95
    ##  9 United Kingdom          896.      55838   62.3 
    ## 10 Italy                   850.      51306   60.3 
    ## 11 Brazil                  843.     169485  201.  
    ## 12 United States           825.     255850  310.  
    ## 13 France                  770.      49888   64.8 
    ## 14 Colombia                742.      35479   47.8 
    ## 15 Czech Republic          716.       7499   10.5 
    ## 16 Sweden                  680.       6500    9.56
    ## 17 Iran                    595.      45738   76.9 
    ## 18 Netherlands             542.       9023   16.6 
    ## 19 Switzerland             518.       3930    7.58
    ## 20 Romania                 472.      10373   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
