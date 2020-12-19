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

Updated: 2020-12-20

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
    ##  1 United States           57919. 16912564            292
    ##  2 India                   35730. 10004599            280
    ##  3 Brazil                  25214.  7110434            282
    ##  4 Russia                  10215.  2819429            276
    ##  5 France                   8195.  2401113            293
    ##  6 United Kingdom           6794.  1977171            291
    ##  7 Italy                    6405.  1921778            300
    ##  8 Spain                    6155.  1797236            292
    ##  9 Argentina                5503.  1524372            277
    ## 10 Colombia                 5321.  1468795            276
    ## 11 Germany                  5004.  1471238            294
    ## 12 Mexico                   4671.  1289298            276
    ## 13 Poland                   4264.  1194110            280
    ## 14 Turkey                   4230.  1167752            276
    ## 15 Iran                     3844.  1145651            298
    ## 16 Peru                     3579.   991518            277
    ## 17 Ukraine                  3541.   956123            270
    ## 18 South Africa             3254.   901538            277
    ## 19 Indonesia                2322.   650197            280
    ## 20 Netherlands              2306.   664307            288

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                209.              59072.            282
    ##  2 Belgium                       206.              59698.            290
    ##  3 United States                 187.              54516.            292
    ##  4 Switzerland                   182.              53062.            292
    ##  5 Israel                        176.              49342.            281
    ##  6 Jordan                        156.              42377.            272
    ##  7 Serbia                        145.              39843.            275
    ##  8 Austria                       142.              40508.            286
    ##  9 Netherlands                   139.              39910.            288
    ## 10 Sweden                        134.              38418.            287
    ## 11 Argentina                     133.              36871.            277
    ## 12 Spain                         132.              38645.            292
    ## 13 France                        127.              37072.            293
    ## 14 Brazil                        125.              35357.            282
    ## 15 Chile                         125.              34702.            278
    ## 16 Portugal                      122.              34372.            281
    ## 17 Peru                          120.              33153.            277
    ## 18 Colombia                      111.              30734.            276
    ## 19 Poland                        111.              31016.            280
    ## 20 Hungary                       110.              30056.            274

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         607     2091
    ##  2 Mexico               9.03     116487  1289298
    ##  3 Ecuador              6.82      13932   204249
    ##  4 Sudan                6.32       1408    22265
    ##  5 Bolivia              6.07       9031   148665
    ##  6 Syria                5.95        591     9928
    ##  7 Egypt                5.67       7041   124280
    ##  8 Chad                 5.55        102     1839
    ##  9 China                4.99       4770    95580
    ## 10 Iran                 4.65      53273  1145651
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.04       2037    50456
    ## 13 Peru                 3.72      36901   991518
    ## 14 Italy                3.53      67894  1921778
    ## 15 Mali                 3.49        211     6049
    ## 16 Tunisia              3.48       4090   117582
    ## 17 Guatemala            3.47       4589   132062
    ## 18 Niger                3.47         82     2361
    ## 19 Nicaragua            3.43        163     4748
    ## 20 Bulgaria             3.42       6496   190027

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1774.      18455   10.4 
    ##  2 Peru                   1234.      36901   29.9 
    ##  3 Italy                  1125.      67894   60.3 
    ##  4 United Kingdom         1067.      66541   62.3 
    ##  5 Spain                  1052.      48926   46.5 
    ##  6 Mexico                 1036.     116487  112.  
    ##  7 Argentina              1005.      41534   41.3 
    ##  8 United States           994.     308403  310.  
    ##  9 Czech Republic          980.      10271   10.5 
    ## 10 Chile                   958.      16051   16.7 
    ## 11 Ecuador                 942.      13932   14.8 
    ## 12 France                  924.      59855   64.8 
    ## 13 Brazil                  919.     184827  201.  
    ## 14 Bulgaria                909.       6496    7.15
    ## 15 Bolivia                 908.       9031    9.95
    ## 16 Sweden                  836.       7993    9.56
    ## 17 Colombia                833.      39787   47.8 
    ## 18 Hungary                 793.       7914    9.98
    ## 19 Switzerland             789.       5981    7.58
    ## 20 Iran                    693.      53273   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
