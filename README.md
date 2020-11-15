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

Updated: 2020-11-16

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
    ##  1 United States           41245. 10641431            258
    ##  2 India                   35831.  8814579            246
    ##  3 Brazil                  23430.  5810652            248
    ##  4 Russia                   7957.  1925825            242
    ##  5 France                   7406.  1918345            259
    ##  6 Spain                    5653.  1458591            258
    ##  7 Argentina                5334.  1296378            243
    ##  8 United Kingdom           5231.  1344360            257
    ##  9 Colombia                 4887.  1182697            242
    ## 10 Italy                    4302.  1144552            266
    ## 11 Mexico                   4121.   997393            242
    ## 12 Peru                     3837.   932650            243
    ## 13 South Africa             3083.   749182            243
    ## 14 Germany                  3040.   790503            260
    ## 15 Iran                     2839.   749525            264
    ## 16 Poland                   2809    691118            246
    ## 17 Ukraine                  2270.   535857            236
    ## 18 Chile                    2170.   529676            244
    ## 19 Iraq                     2101.   516915            246
    ## 20 Belgium                  2074.   531184            256

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      199.               51061.            256
    ##  2 Israel                       177.               43836.            248
    ##  3 Czech Republic               176.               43741.            248
    ##  4 United States                133.               34301.            258
    ##  5 Switzerland                  131.               33793.            258
    ##  6 Chile                        130.               31629.            244
    ##  7 Argentina                    129.               31356.            243
    ##  8 Peru                         128.               31185.            243
    ##  9 Spain                        122.               31364.            258
    ## 10 Brazil                       117.               28894.            248
    ## 11 France                       114.               29619.            259
    ## 12 Netherlands                  104.               26550.            254
    ## 13 Colombia                     102.               24748.            242
    ## 14 Austria                       95.8              24158.            252
    ## 15 Jordan                        92.6              22054.            238
    ## 16 United Kingdom                83.9              21562.            257
    ## 17 Portugal                      80.1              19789.            247
    ## 18 Sweden                        73.0              18560.            254
    ## 19 Poland                        73.0              17951.            246
    ## 20 Italy                         71.3              18968.            266

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         603     2072
    ##  2 Mexico                  9.79      97624   997393
    ##  3 Sudan                   7.63       1116    14626
    ##  4 Ecuador                 7.24      12997   179627
    ##  5 Chad                    6.29        100     1591
    ##  6 Bolivia                 6.18       8835   143069
    ##  7 Egypt                   5.83       6442   110547
    ##  8 Iran                    5.47      41034   749525
    ##  9 Niger                   5.38         70     1301
    ## 10 Syria                   5.16        341     6613
    ## 11 China                   5.14       4749    92428
    ## 12 Tanzania                4.13         21      509
    ## 13 Italy                   3.90      44683  1144552
    ## 14 United Kingdom          3.85      51766  1344360
    ## 15 Canada                  3.77      10828   287318
    ## 16 Peru                    3.76      35106   932650
    ## 17 Afghanistan             3.73       1605    43035
    ## 18 Mali                    3.59        139     3868
    ## 19 Nicaragua               3.49        158     4533
    ## 20 Sweden                  3.48       6164   177355

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1375.      14303   10.4 
    ##  2 Peru                   1174.      35106   29.9 
    ##  3 Bolivia                 888.       8835    9.95
    ##  4 Chile                   882.      14777   16.7 
    ##  5 Ecuador                 879.      12997   14.8 
    ##  6 Spain                   877.      40769   46.5 
    ##  7 Mexico                  868.      97624  112.  
    ##  8 Argentina               848.      35045   41.3 
    ##  9 United Kingdom          830.      51766   62.3 
    ## 10 Brazil                  819.     164737  201.  
    ## 11 United States           782.     242542  310.  
    ## 12 Italy                   741.      44683   60.3 
    ## 13 Colombia                705.      33669   47.8 
    ## 14 France                  678.      43913   64.8 
    ## 15 Sweden                  645.       6164    9.56
    ## 16 Czech Republic          578.       6058   10.5 
    ## 17 Iran                    533.      41034   76.9 
    ## 18 Netherlands             507.       8432   16.6 
    ## 19 South Africa            412.      20206   49   
    ## 20 Romania                 401.       8813   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
