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

Updated: 2020-11-18

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
    ##  1 United States           42053. 10933918            260
    ##  2 India                   35783.  8874290            248
    ##  3 Brazil                  23452.  5863093            250
    ##  4 Russia                   8077.  1971013            244
    ##  5 France                   7488.  1954562            261
    ##  6 Spain                    5610.  1458591            260
    ##  7 United Kingdom           5369.  1390685            259
    ##  8 Argentina                5349.  1310491            245
    ##  9 Colombia                 4912.  1198746            244
    ## 10 Italy                    4499.  1205881            268
    ## 11 Mexico                   4125.  1006522            244
    ## 12 Peru                     3824.   937011            245
    ## 13 Germany                  3113.   815746            262
    ## 14 South Africa             3070.   752269            245
    ## 15 Poland                   2958.   733788            248
    ## 16 Iran                     2913.   775121            266
    ## 17 Ukraine                  2343.   557657            238
    ## 18 Chile                    2164.   532604            246
    ## 19 Iraq                     2102.   521542            248
    ## 20 Belgium                  2084.   537775            258

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      200.               51694.            258
    ##  2 Czech Republic               178.               44437.            250
    ##  3 Israel                       176.               44068.            250
    ##  4 Switzerland                  136.               35479.            260
    ##  5 United States                136.               35244.            260
    ##  6 Argentina                    129.               31698.            245
    ##  7 Chile                        129.               31804.            246
    ##  8 Peru                         128.               31331.            245
    ##  9 Spain                        121.               31364.            260
    ## 10 Brazil                       117.               29155.            250
    ## 11 France                       116.               30178.            261
    ## 12 Netherlands                  106.               27165.            256
    ## 13 Colombia                     103.               25084.            244
    ## 14 Austria                       99.7              25326.            254
    ## 15 Jordan                        97.2              23340.            240
    ## 16 United Kingdom                86.1              22305.            259
    ## 17 Portugal                      84.9              21138.            249
    ## 18 Poland                        76.8              19059.            248
    ## 19 Italy                         74.6              19985.            268
    ## 20 Sweden                        72.4              18560.            256

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         604     2072
    ##  2 Mexico                  9.79      98542  1006522
    ##  3 Sudan                   7.81       1175    15047
    ##  4 Ecuador                 7.20      13016   180676
    ##  5 Chad                    6.30        101     1603
    ##  6 Bolivia                 6.18       8849   143246
    ##  7 Egypt                   5.82       6465   111009
    ##  8 Iran                    5.42      41979   775121
    ##  9 Niger                   5.32         70     1316
    ## 10 Syria                   5.18        350     6759
    ## 11 China                   5.14       4749    92476
    ## 12 Tanzania                4.13         21      509
    ## 13 Italy                   3.79      45733  1205881
    ## 14 Peru                    3.76      35231   937011
    ## 15 United Kingdom          3.75      52147  1390685
    ## 16 Afghanistan             3.75       1626    43403
    ## 17 Canada                  3.70      10953   296077
    ## 18 Mali                    3.57        141     3948
    ## 19 Nicaragua               3.49        158     4533
    ## 20 Sweden                  3.48       6164   177355

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1405.      14616   10.4 
    ##  2 Peru                   1178.      35231   29.9 
    ##  3 Bolivia                 890.       8849    9.95
    ##  4 Chile                   888.      14863   16.7 
    ##  5 Ecuador                 880.      13016   14.8 
    ##  6 Spain                   877.      40769   46.5 
    ##  7 Mexico                  876.      98542  112.  
    ##  8 Argentina               857.      35436   41.3 
    ##  9 United Kingdom          836.      52147   62.3 
    ## 10 Brazil                  824.     165798  201.  
    ## 11 United States           788.     244411  310.  
    ## 12 Italy                   758.      45733   60.3 
    ## 13 Colombia                712.      34031   47.8 
    ## 14 France                  690.      44719   64.8 
    ## 15 Sweden                  645.       6164    9.56
    ## 16 Czech Republic          612.       6416   10.5 
    ## 17 Iran                    546.      41979   76.9 
    ## 18 Netherlands             512.       8519   16.6 
    ## 19 Switzerland             416.       3153    7.58
    ## 20 South Africa            415.      20314   49

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
