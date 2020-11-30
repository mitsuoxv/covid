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

Updated: 2020-12-01

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
    ##  1 United States           47922. 13082877            273
    ##  2 India                   36136.  9431691            261
    ##  3 Brazil                  23917.  6290272            263
    ##  4 Russia                   8932.  2295654            257
    ##  5 France                   7954.  2179481            274
    ##  6 Spain                    5964.  1628208            273
    ##  7 United Kingdom           5946.  1617331            272
    ##  8 Italy                    5641.  1585178            281
    ##  9 Argentina                5478.  1413375            258
    ## 10 Colombia                 5056.  1299613            257
    ## 11 Mexico                   4282.  1100683            257
    ## 12 Germany                  3832.  1053869            275
    ## 13 Poland                   3774.   985075            261
    ## 14 Peru                     3722.   960368            258
    ## 15 Iran                     3400.   948749            279
    ## 16 South Africa             3053.   787702            258
    ## 17 Ukraine                  2918.   732625            251
    ## 18 Belgium                  2127.   576503            271
    ## 19 Chile                    2125.   550430            259
    ## 20 Iraq                     2108.   550435            261

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      204.               55417.            271
    ##  2 Czech Republic               189.               49611.            263
    ##  3 Israel                       172.               45172.            262
    ##  4 United States                154.               42171.            273
    ##  5 Switzerland                  153.               41817.            273
    ##  6 Argentina                    132.               34186.            258
    ##  7 Jordan                       132.               33448.            253
    ##  8 Spain                        128.               35011.            273
    ##  9 Austria                      127.               33904.            267
    ## 10 Chile                        127.               32868.            259
    ## 11 Peru                         124.               32112.            258
    ## 12 France                       123.               33650.            274
    ## 13 Brazil                       119.               31279.            263
    ## 14 Netherlands                  116.               31137.            269
    ## 15 Colombia                     106.               27194.            257
    ## 16 Portugal                     105.               27613.            262
    ## 17 Poland                        98.0              25586.            261
    ## 18 United Kingdom                95.4              25940.            272
    ## 19 Sweden                        94.5              25443.            269
    ## 20 Italy                         93.5              26271.            281

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         606     2081
    ##  2 Mexico                  9.58     105459  1100683
    ##  3 Sudan                   7.10       1235    17404
    ##  4 Ecuador                 6.99      13423   192117
    ##  5 Bolivia                 6.19       8949   144592
    ##  6 Chad                    6.00        101     1682
    ##  7 Egypt                   5.74       6636   115541
    ##  8 Syria                   5.30        413     7797
    ##  9 China                   5.08       4750    93465
    ## 10 Iran                    5.05      47875   948749
    ## 11 Niger                   4.62         70     1516
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.81       1763    46215
    ## 14 Peru                    3.74      35879   960368
    ## 15 United Kingdom          3.60      58245  1617331
    ## 16 Italy                   3.46      54904  1585178
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.42       4166   121971
    ## 19 Tunisia                 3.34       3219    96251
    ## 20 Canada                  3.28      11976   364810

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1591.      16547   10.4 
    ##  2 Peru                   1200.      35879   29.9 
    ##  3 Spain                   960.      44668   46.5 
    ##  4 Mexico                  938.     105459  112.  
    ##  5 United Kingdom          934.      58245   62.3 
    ##  6 Argentina               927.      38322   41.3 
    ##  7 Chile                   917.      15356   16.7 
    ##  8 Italy                   910.      54904   60.3 
    ##  9 Ecuador                 908.      13423   14.8 
    ## 10 Bolivia                 900.       8949    9.95
    ## 11 Brazil                  858.     172561  201.  
    ## 12 United States           851.     263946  310.  
    ## 13 France                  802.      51965   64.8 
    ## 14 Czech Republic          777.       8138   10.5 
    ## 15 Colombia                762.      36401   47.8 
    ## 16 Sweden                  699.       6681    9.56
    ## 17 Iran                    622.      47875   76.9 
    ## 18 Netherlands             561.       9336   16.6 
    ## 19 Switzerland             559.       4236    7.58
    ## 20 Bulgaria                534.       3814    7.15

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
