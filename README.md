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

Updated: 2020-11-05

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
    ##  1 United States           37221.  9193765            247
    ##  2 India                   35378.  8313876            235
    ##  3 Brazil                  23435.  5554206            237
    ##  4 Russia                   7330.  1693454            231
    ##  5 France                   5925.  1469508            248
    ##  6 Argentina                5099.  1183131            232
    ##  7 Spain                    5098.  1259366            247
    ##  8 Colombia                 4732.  1093256            231
    ##  9 United Kingdom           4365.  1073886            246
    ## 10 Mexico                   4039.   933155            231
    ## 11 Peru                     3907.   906545            232
    ## 12 South Africa             3141.   728836            232
    ## 13 Italy                    2979.   759829            255
    ## 14 Iran                     2520.   637712            253
    ## 15 Germany                  2250.   560379            249
    ## 16 Chile                    2206.   514202            233
    ## 17 Iraq                     2052.   482296            235
    ## 18 Bangladesh               1937.   412647            213
    ## 19 Ukraine                  1869.   420617            225
    ## 20 Belgium                  1846.   452447            245

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                       181.               42634.            236
    ##  2 Belgium                      177.               43492.            245
    ##  3 Czech Republic               146.               34649.            237
    ##  4 Chile                        132.               30705.            233
    ##  5 Peru                         131.               30312.            232
    ##  6 Argentina                    123.               28617.            232
    ##  7 United States                120.               29635.            247
    ##  8 Brazil                       117.               27619.            237
    ##  9 Spain                        110.               27080.            247
    ## 10 Colombia                      99.0              22876.            231
    ## 11 Switzerland                   97.0              23963.            247
    ## 12 Netherlands                   92.8              22556.            243
    ## 13 France                        91.5              22689.            248
    ## 14 United Kingdom                70.0              17224.            246
    ## 15 Iraq                          69.1              16254.            235
    ## 16 Bolivia                       65.4              14262.            218
    ## 17 South Africa                  64.1              14874.            232
    ## 18 Libya                         61.5               9857.            160
    ## 19 Austria                       60.0              14469.            241
    ## 20 Jordan                        59.4              13513.            227

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2067
    ##  2 Mexico                  9.87      92100   933155
    ##  3 Ecuador                 7.46      12698   170110
    ##  4 Chad                    6.48         98     1513
    ##  5 Bolivia                 6.16       8741   141867
    ##  6 Sudan                   6.02        837    13905
    ##  7 Egypt                   5.83       6305   108122
    ##  8 Iran                    5.67      36160   637712
    ##  9 Niger                   5.65         69     1222
    ## 10 Italy                   5.19      39412   759829
    ## 11 China                   5.16       4746    92045
    ## 12 Syria                   5.06        298     5888
    ## 13 Sweden                  4.44       5969   134532
    ## 14 United Kingdom          4.40      47250  1073886
    ## 15 Canada                  4.25      10208   240263
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.82      34585   906545
    ## 18 Mali                    3.79        136     3584
    ## 19 Afghanistan             3.70       1544    41728
    ## 20 Nicaragua               3.53        156     4424

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1166.      12126   10.4 
    ##  2 Peru                   1156.      34585   29.9 
    ##  3 Bolivia                 879.       8741    9.95
    ##  4 Ecuador                 859.      12698   14.8 
    ##  5 Chile                   855.      14319   16.7 
    ##  6 Mexico                  819.      92100  112.  
    ##  7 Brazil                  797.     160253  201.  
    ##  8 Spain                   785.      36495   46.5 
    ##  9 Argentina               765.      31623   41.3 
    ## 10 United Kingdom          758.      47250   62.3 
    ## 11 United States           741.     229948  310.  
    ## 12 Colombia                663.      31670   47.8 
    ## 13 Italy                   653.      39412   60.3 
    ## 14 Sweden                  625.       5969    9.56
    ## 15 France                  586.      37969   64.8 
    ## 16 Iran                    470.      36160   76.9 
    ## 17 Netherlands             455.       7566   16.6 
    ## 18 South Africa            399.      19539   49   
    ## 19 Czech Republic          374.       3913   10.5 
    ## 20 Iraq                    373.      11068   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
