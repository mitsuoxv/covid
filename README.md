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

Updated: 2020-11-27

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
    ##  1 United States           46252. 12441925            269
    ##  2 India                   36057.  9266705            257
    ##  3 Brazil                  23624.  6118708            259
    ##  4 Russia                   8648.  2187990            253
    ##  5 France                   7894.  2131376            270
    ##  6 Spain                    5966.  1605066            269
    ##  7 United Kingdom           5809.  1557011            268
    ##  8 Argentina                5440.  1381795            254
    ##  9 Italy                    5346.  1480874            277
    ## 10 Colombia                 4990.  1262494            253
    ## 11 Mexico                   4190.  1060152            253
    ## 12 Peru                     3749.   952439            254
    ## 13 Germany                  3629.   983588            271
    ## 14 Poland                   3597.   924422            257
    ## 15 Iran                     3252.   894385            275
    ## 16 South Africa             3053.   775502            254
    ## 17 Ukraine                  2741.   677189            247
    ## 18 Chile                    2133.   544092            255
    ## 19 Belgium                  2115.   564871            267
    ## 20 Iraq                     2109.   542187            257

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               54299.            267
    ##  2 Czech Republic               186.               48226.            259
    ##  3 Israel                       173.               44777.            258
    ##  4 Switzerland                  151.               40661.            269
    ##  5 United States                149.               40105.            269
    ##  6 Argentina                    132.               33423.            254
    ##  7 Spain                        128.               34513.            269
    ##  8 Chile                        127.               32490.            255
    ##  9 Peru                         125.               31847.            254
    ## 10 Jordan                       124.               30907.            249
    ## 11 France                       122.               32908.            270
    ## 12 Austria                      120.               31596.            263
    ## 13 Brazil                       117.               30426.            259
    ## 14 Netherlands                  113.               29921.            265
    ## 15 Colombia                     104.               26418.            253
    ## 16 Portugal                      99.4              25666.            258
    ## 17 Poland                        93.4              24011.            257
    ## 18 United Kingdom                93.2              24973.            268
    ## 19 Sweden                        91.0              24123.            265
    ## 20 Italy                         88.6              24542.            277

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         605     2077
    ##  2 Mexico                  9.69     102739  1060152
    ##  3 Sudan                   7.27       1210    16649
    ##  4 Ecuador                 7.10      13288   187230
    ##  5 Bolivia                 6.19       8928   144147
    ##  6 Chad                    6.10        101     1655
    ##  7 Egypt                   5.77       6585   114107
    ##  8 Syria                   5.24        391     7459
    ##  9 Iran                    5.17      46207   894385
    ## 10 China                   5.11       4749    93025
    ## 11 Niger                   4.93         70     1419
    ## 12 Tanzania                4.13         21      509
    ## 13 Afghanistan             3.79       1725    45490
    ## 14 Peru                    3.75      35685   952439
    ## 15 United Kingdom          3.63      56533  1557011
    ## 16 Italy                   3.51      52028  1480874
    ## 17 Nicaragua               3.46        160     4629
    ## 18 Guatemala               3.42       4107   119989
    ## 19 Canada                  3.39      11618   342444
    ## 20 Mali                    3.32        148     4461

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1545.      16077   10.4 
    ##  2 Peru                   1193.      35685   29.9 
    ##  3 Spain                   947.      44037   46.5 
    ##  4 Mexico                  913.     102739  112.  
    ##  5 United Kingdom          907.      56533   62.3 
    ##  6 Argentina               905.      37432   41.3 
    ##  7 Chile                   904.      15138   16.7 
    ##  8 Ecuador                 898.      13288   14.8 
    ##  9 Bolivia                 898.       8928    9.95
    ## 10 Italy                   862.      52028   60.3 
    ## 11 Brazil                  846.     170115  201.  
    ## 12 United States           831.     257825  310.  
    ## 13 France                  776.      50259   64.8 
    ## 14 Colombia                747.      35677   47.8 
    ## 15 Czech Republic          727.       7611   10.5 
    ## 16 Sweden                  686.       6555    9.56
    ## 17 Iran                    601.      46207   76.9 
    ## 18 Netherlands             546.       9096   16.6 
    ## 19 Switzerland             530.       4016    7.58
    ## 20 Romania                 480.      10541   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
