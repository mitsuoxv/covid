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

Updated: 2020-11-06

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
    ##  1 United States           37427.  9281928            248
    ##  2 India                   35441.  8364086            236
    ##  3 Brazil                  23386.  5566049            238
    ##  4 Russia                   7382.  1712858            232
    ##  5 France                   6061.  1509315            249
    ##  6 Spain                    5179.  1284408            248
    ##  7 Argentina                5134.  1196412            233
    ##  8 Colombia                 4738.  1099392            232
    ##  9 United Kingdom           4449.  1099063            247
    ## 10 Mexico                   4044.   938405            232
    ## 11 Peru                     3900.   908902            233
    ## 12 South Africa             3135.   730548            233
    ## 13 Italy                    3087.   790377            256
    ## 14 Iran                     2543.   646164            254
    ## 15 Germany                  2390.   597583            250
    ## 16 Chile                    2200.   515042            234
    ## 17 Iraq                     2058.   485870            236
    ## 18 Bangladesh               1935.   414164            214
    ## 19 Ukraine                  1904.   430467            226
    ## 20 Belgium                  1902.   468118            246

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      183.               44998.            246
    ##  2 Israel                       180.               42634.            237
    ##  3 Czech Republic               152.               36151.            238
    ##  4 Chile                        131.               30755.            234
    ##  5 Peru                         130.               30391.            233
    ##  6 Argentina                    124.               28939.            233
    ##  7 United States                121.               29919.            248
    ##  8 Brazil                       116.               27678.            238
    ##  9 Spain                        111.               27618.            248
    ## 10 Switzerland                  102.               25287.            248
    ## 11 Colombia                      99.1              23005.            232
    ## 12 Netherlands                   94.3              23014.            244
    ## 13 France                        93.6              23303.            249
    ## 14 United Kingdom                71.4              17628.            247
    ## 15 Iraq                          69.4              16375.            236
    ## 16 Bolivia                       65.1              14269.            219
    ## 17 South Africa                  64.0              14909.            233
    ## 18 Austria                       63.0              15263.            242
    ## 19 Jordan                        62.4              14240.            228
    ## 20 Libya                         62.0               9995.            161

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2067
    ##  2 Mexico                  9.87      92593   938405
    ##  3 Ecuador                 7.41      12704   171433
    ##  4 Chad                    6.53         99     1517
    ##  5 Bolivia                 6.17       8751   141936
    ##  6 Sudan                   6.00        837    13943
    ##  7 Egypt                   5.83       6318   108329
    ##  8 Iran                    5.66      36579   646164
    ##  9 Niger                   5.65         69     1222
    ## 10 China                   5.16       4747    92077
    ## 11 Syria                   5.05        301     5964
    ## 12 Italy                   5.03      39764   790377
    ## 13 Sweden                  4.35       5997   137730
    ## 14 United Kingdom          4.34      47742  1099063
    ## 15 Canada                  4.20      10279   244935
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.81      34623   908902
    ## 18 Mali                    3.79        136     3584
    ## 19 Afghanistan             3.70       1548    41814
    ## 20 Nicaragua               3.53        156     4424

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1185.      12331   10.4 
    ##  2 Peru                   1158.      34623   29.9 
    ##  3 Bolivia                 880.       8751    9.95
    ##  4 Ecuador                 859.      12704   14.8 
    ##  5 Chile                   856.      14340   16.7 
    ##  6 Mexico                  823.      92593  112.  
    ##  7 Spain                   820.      38118   46.5 
    ##  8 Brazil                  798.     160496  201.  
    ##  9 Argentina               775.      32052   41.3 
    ## 10 United Kingdom          766.      47742   62.3 
    ## 11 United States           745.     231034  310.  
    ## 12 Colombia                666.      31847   47.8 
    ## 13 Italy                   659.      39764   60.3 
    ## 14 Sweden                  628.       5997    9.56
    ## 15 France                  592.      38355   64.8 
    ## 16 Iran                    476.      36579   76.9 
    ## 17 Netherlands             461.       7672   16.6 
    ## 18 South Africa            400.      19585   49   
    ## 19 Czech Republic          395.       4133   10.5 
    ## 20 Iraq                    375.      11128   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
