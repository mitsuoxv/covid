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

Updated: 2020-12-22

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
    ##  1 United States           59575. 17515091            294
    ##  2 India                   35658. 10055560            282
    ##  3 Brazil                  25398.  7213155            284
    ##  4 Russia                  10351.  2877727            278
    ##  5 France                   8241.  2431237            295
    ##  6 United Kingdom           6963.  2040151            293
    ##  7 Italy                    6467.  1953185            302
    ##  8 Spain                    6113.  1797236            294
    ##  9 Argentina                5509.  1537169            279
    ## 10 Colombia                 5381.  1496062            278
    ## 11 Germany                  5103.  1510652            296
    ## 12 Mexico                   4725.  1313675            278
    ## 13 Turkey                   4353.  1210263            278
    ## 14 Poland                   4281.  1207333            282
    ## 15 Iran                     3861.  1158384            300
    ## 16 Ukraine                  3569.   970993            272
    ## 17 Peru                     3569.   995899            279
    ## 18 South Africa             3304.   921922            279
    ## 19 Netherlands              2378.   689655            290
    ## 20 Indonesia                2357.   664930            282

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                211.              59901.            284
    ##  2 Belgium                       206.              60168.            292
    ##  3 United States                 192.              56458.            294
    ##  4 Switzerland                   180.              53062.            294
    ##  5 Israel                        179.              50754.            283
    ##  6 Jordan                        157.              42913.            274
    ##  7 Serbia                        147.              40853.            277
    ##  8 Netherlands                   143.              41433.            290
    ##  9 Austria                       142.              40978.            288
    ## 10 Argentina                     133.              37181.            279
    ## 11 Sweden                        133.              38418.            289
    ## 12 Spain                         131.              38645.            294
    ## 13 France                        127.              37537.            295
    ## 14 Brazil                        126.              35868.            284
    ## 15 Chile                         125.              34965.            280
    ## 16 Portugal                      124.              35043.            283
    ## 17 Peru                          119.              33300.            279
    ## 18 Colombia                      113.              31305.            278
    ## 19 United Kingdom                112.              32722.            293
    ## 20 Poland                        111.              31359.            282

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         607     2091
    ##  2 Mexico               8.97     117876  1313675
    ##  3 Ecuador              6.76      13948   206257
    ##  4 Sudan                6.28       1434    22823
    ##  5 Bolivia              6.03       9035   149770
    ##  6 Syria                5.98        610    10195
    ##  7 Egypt                5.65       7098   125555
    ##  8 Chad                 5.40        102     1890
    ##  9 China                4.98       4771    95816
    ## 10 Iran                 4.63      53625  1158384
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.09       2074    50678
    ## 13 Peru                 3.72      37034   995899
    ## 14 Mali                 3.59        222     6191
    ## 15 Italy                3.52      68799  1953185
    ## 16 Guatemala            3.51       4656   132765
    ## 17 Niger                3.47         82     2361
    ## 18 Bulgaria             3.46       6609   191195
    ## 19 Tunisia              3.45       4158   120687
    ## 20 Nicaragua            3.43        163     4748

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1790.      18626   10.4 
    ##  2 Peru                   1238.      37034   29.9 
    ##  3 Italy                  1140.      68799   60.3 
    ##  4 United Kingdom         1081.      67401   62.3 
    ##  5 Spain                  1052.      48926   46.5 
    ##  6 Mexico                 1048.     117876  112.  
    ##  7 United States          1011.     313748  310.  
    ##  8 Argentina              1010.      41763   41.3 
    ##  9 Czech Republic          994.      10411   10.5 
    ## 10 Chile                   965.      16154   16.7 
    ## 11 Ecuador                 943.      13948   14.8 
    ## 12 France                  929.      60174   64.8 
    ## 13 Brazil                  927.     186356  201.  
    ## 14 Bulgaria                924.       6609    7.15
    ## 15 Bolivia                 908.       9035    9.95
    ## 16 Colombia                843.      40268   47.8 
    ## 17 Sweden                  836.       7993    9.56
    ## 18 Hungary                 831.       8292    9.98
    ## 19 Switzerland             789.       5981    7.58
    ## 20 Iran                    697.      53625   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
