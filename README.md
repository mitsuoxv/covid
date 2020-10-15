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

Updated: 2020-10-16

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
    ##  1 United States           34249.  7774745            227
    ##  2 India                   33986.  7307097            215
    ##  3 Brazil                  23565.  5113628            217
    ##  4 Russia                   6417.  1354163            211
    ##  5 Colombia                 4379.   924098            211
    ##  6 Argentina                4325.   917035            212
    ##  7 Peru                     4027.   853974            212
    ##  8 Spain                    4000.   908056            227
    ##  9 Mexico                   3911.   825340            211
    ## 10 South Africa             3284.   696414            212
    ## 11 France                   3262.   750451            230
    ## 12 United Kingdom           2896.   654648            226
    ## 13 Chile                    2278.   485372            213
    ## 14 Iran                     2202.   513219            233
    ## 15 Bangladesh               1984.   382959            193
    ## 16 Iraq                     1921.   413215            215
    ## 17 Turkey                   1613.   340450            211
    ## 18 Philippines              1611.   346536            215
    ## 19 Indonesia                1603.   344749            215
    ## 20 Italy                    1586.   372799            235

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           187.               40404.            216
    ##  2 Chile                            136.               28984.            213
    ##  3 Peru                             135.               28554.            212
    ##  4 Brazil                           117.               25428.            217
    ##  5 United States                    110.               25061.            227
    ##  6 Argentina                        105.               22181.            212
    ##  7 Colombia                          91.6              19337.            211
    ##  8 Spain                             86.0              19526.            227
    ##  9 Belgium                           77.5              17439.            225
    ## 10 Bolivia                           70.5              13966.            198
    ## 11 South Africa                      67.0              14213.            212
    ## 12 Iraq                              64.8              13926.            215
    ## 13 Saudi Arabia                      61.3              13236.            216
    ## 14 Czech Republic                    61.2              13296.            217
    ## 15 Dominican Republic                59.0              12181.            206
    ## 16 Honduras                          53.0              10621.            200
    ## 17 Netherlands                       52.8              11771.            223
    ## 18 Libya                             50.5               7091.            140
    ## 19 France                            50.4              11587.            230
    ## 20 Ecuador                           47.5              10080.            212

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         597     2057
    ##  2 Mexico                 10.2       84420   825340
    ##  3 Italy                   9.73      36289   372799
    ##  4 Ecuador                 8.23      12264   149083
    ##  5 Chad                    6.92         92     1329
    ##  6 United Kingdom          6.59      43155   654648
    ##  7 Sudan                   6.11        836    13691
    ##  8 Bolivia                 6.01       8351   138922
    ##  9 Sweden                  5.83       5907   101332
    ## 10 Egypt                   5.79       6077   104915
    ## 11 Niger                   5.73         69     1205
    ## 12 Iran                    5.72      29349   513219
    ## 13 Belgium                 5.67      10278   181418
    ## 14 China                   5.19       4746    91399
    ## 15 Canada                  5.17       9654   186881
    ## 16 Syria                   4.79        234     4883
    ## 17 France                  4.37      32780   750451
    ## 18 Tanzania                4.13         21      509
    ## 19 Mali                    3.94        132     3352
    ## 20 Peru                    3.91      33419   853974

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1117.      33419   29.9 
    ##  2 Belgium                 988.      10278   10.4 
    ##  3 Bolivia                 840.       8351    9.95
    ##  4 Ecuador                 829.      12264   14.8 
    ##  5 Chile                   801.      13415   16.7 
    ##  6 Brazil                  751.     150998  201.  
    ##  7 Mexico                  751.      84420  112.  
    ##  8 Spain                   718.      33413   46.5 
    ##  9 United Kingdom          692.      43155   62.3 
    ## 10 United States           691.     214369  310.  
    ## 11 Sweden                  618.       5907    9.56
    ## 12 Italy                   601.      36289   60.3 
    ## 13 Argentina               594.      24572   41.3 
    ## 14 Colombia                589.      28141   47.8 
    ## 15 France                  506.      32780   64.8 
    ## 16 Netherlands             400.       6654   16.6 
    ## 17 Iran                    382.      29349   76.9 
    ## 18 South Africa            370.      18151   49   
    ## 19 Iraq                    338.      10021   29.7 
    ## 20 Honduras                316.       2528    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
