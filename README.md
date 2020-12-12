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

Updated: 2020-12-13

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
    ##  1 United States           54052. 15404889            285
    ##  2 India                   35995.  9826775            273
    ##  3 Brazil                  24661.  6781799            275
    ##  4 Russia                   9761.  2625848            269
    ##  5 France                   8079.  2310701            286
    ##  6 United Kingdom           6371.  1809459            284
    ##  7 Italy                    6163.  1805873            293
    ##  8 Spain                    6072.  1730575            285
    ##  9 Argentina                5494.  1483376            270
    ## 10 Colombia                 5204.  1399911            269
    ## 11 Germany                  4531.  1300516            287
    ## 12 Mexico                   4524.  1217126            269
    ## 13 Poland                   4085.  1115201            273
    ## 14 Iran                     3754.  1092617            291
    ## 15 Peru                     3626.   979111            270
    ## 16 Turkey                   3592.   966335            269
    ## 17 Ukraine                  3365.   885039            263
    ## 18 South Africa             3129.   845083            270
    ## 19 Indonesia                2217.   605243            273
    ## 20 Belgium                  2131.   603159            283

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       205.              57979.            283
    ##  2 Czech Republic                200.              54928.            275
    ##  3 United States                 174.              49656.            285
    ##  4 Israel                        174.              47698.            274
    ##  5 Switzerland                   172.              49113.            285
    ##  6 Jordan                        150.              39871.            265
    ##  7 Austria                       137.              38281.            279
    ##  8 Argentina                     133.              35880.            270
    ##  9 Spain                         131.              37212.            285
    ## 10 Serbia                        130.              34821.            268
    ## 11 Netherlands                   127.              35684.            281
    ## 12 Chile                         125.              33916.            271
    ## 13 France                        125.              35676.            286
    ## 14 Brazil                        123.              33723.            275
    ## 15 Peru                          121.              32739.            270
    ## 16 Sweden                        120.              33497.            280
    ## 17 Portugal                      116.              31874.            274
    ## 18 Colombia                      109.              29293.            269
    ## 19 Poland                        106.              28966.            273
    ## 20 Hungary                       104.              27675.            267

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         607     2086
    ##  2 Mexico                  9.23     112326  1217126
    ##  3 Ecuador                 6.90      13858   200765
    ##  4 Sudan                   6.44       1319    20468
    ##  5 Bolivia                 6.15       9008   146385
    ##  6 Chad                    5.87        102     1739
    ##  7 Egypt                   5.70       6877   120611
    ##  8 Syria                   5.51        491     8911
    ##  9 China                   5.01       4755    94849
    ## 10 Iran                    4.73      51728  1092617
    ## 11 Niger                   4.15         77     1856
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.99       1949    48826
    ## 14 Peru                    3.73      36499   979111
    ## 15 Italy                   3.51      63387  1805873
    ## 16 United Kingdom          3.51      63506  1809459
    ## 17 Tunisia                 3.48       3801   109104
    ## 18 Nicaragua               3.44        162     4709
    ## 19 Guatemala               3.40       4376   128541
    ## 20 Mali                    3.27        185     5649

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1710.      17792   10.4 
    ##  2 Peru                   1220.      36499   29.9 
    ##  3 Italy                  1050.      63387   60.3 
    ##  4 Spain                  1024.      47624   46.5 
    ##  5 United Kingdom         1019.      63506   62.3 
    ##  6 Mexico                  999.     112326  112.  
    ##  7 Argentina               978.      40442   41.3 
    ##  8 Chile                   942.      15782   16.7 
    ##  9 Ecuador                 937.      13858   14.8 
    ## 10 United States           935.     290133  310.  
    ## 11 Bolivia                 906.       9008    9.95
    ## 12 Czech Republic          902.       9450   10.5 
    ## 13 Brazil                  894.     179765  201.  
    ## 14 France                  883.      57198   64.8 
    ## 15 Colombia                805.      38484   47.8 
    ## 16 Sweden                  786.       7514    9.56
    ## 17 Bulgaria                778.       5562    7.15
    ## 18 Switzerland             709.       5378    7.58
    ## 19 Hungary                 680.       6784    9.98
    ## 20 Iran                    672.      51728   76.9

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
