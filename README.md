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

Updated: 2020-09-09

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
    ##  1 United States           32752.  6222974            190
    ##  2 India                   24047.  4280422            178
    ##  3 Brazil                  22986.  4137521            180
    ##  4 Russia                   5918.  1035789            175
    ##  5 Peru                     3942.   689977            175
    ##  6 Colombia                 3830.   666521            174
    ##  7 South Africa             3653.   639362            175
    ##  8 Mexico                   3643.   634023            174
    ##  9 Argentina                2735.   478792            175
    ## 10 Spain                    2626.   498989            190
    ## 11 Chile                    2410.   424274            176
    ## 12 Bangladesh               2098.   327359            156
    ## 13 Iran                     1983.   388810            196
    ## 14 United Kingdom           1852.   350104            189
    ## 15 Saudi Arabia             1796.   321595            179
    ## 16 Pakistan                 1697.   298903            176
    ## 17 France                   1614.   311587            193
    ## 18 Turkey                   1608.   281509            175
    ## 19 Iraq                     1486.   264684            178
    ## 20 Italy                    1400.   278784            199

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            144.               25335.            176
    ##  2 Peru                             132.               23071.            175
    ##  3 Brazil                           114.               20574.            180
    ##  4 United States                    106.               20059.            190
    ##  5 Israel                            98.1              17569.            179
    ##  6 Colombia                          80.1              13947.            174
    ##  7 Bolivia                           75.3              12141.            161
    ##  8 South Africa                      74.5              13048.            175
    ##  9 Saudi Arabia                      69.8              12498.            179
    ## 10 Argentina                         66.2              11581.            175
    ## 11 Dominican Republic                60.0              10169.            169
    ## 12 Spain                             56.5              10730.            190
    ## 13 Kazakhstan                        52.3               8749.            167
    ## 14 Iraq                              50.1               8920.            178
    ## 15 Kyrgyzstan                        49.8               8083.            162
    ## 16 Honduras                          49.6               8106.            163
    ## 17 Sweden                            48.1               8953.            186
    ## 18 Belarus                           46.2               7541.            163
    ## 19 Belgium                           45.3               8524.            188
    ## 20 Ecuador                           42.5               7443.            175

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         574     1993
    ##  2 Italy                  12.8       35553   278784
    ##  3 United Kingdom         11.9       41554   350104
    ##  4 Belgium                11.2        9909    88675
    ##  5 Mexico                 10.7       67558   634023
    ##  6 France                  9.81      30572   311587
    ##  7 Ecuador                 9.61      10576   110092
    ##  8 Netherlands             8.26       6234    75512
    ##  9 Chad                    7.60         79     1040
    ## 10 Hungary                 6.97        625     8963
    ## 11 Canada                  6.93       9145   131895
    ## 12 Sweden                  6.82       5837    85558
    ## 13 Sudan                   6.20        833    13437
    ## 14 Spain                   5.90      29418   498989
    ## 15 Niger                   5.86         69     1178
    ## 16 Bolivia                 5.80       7008   120769
    ## 17 Iran                    5.76      22410   388810
    ## 18 Egypt                   5.54       5530    99863
    ## 19 China                   5.23       4739    90573
    ## 20 Mali                    4.43        127     2870

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    998.      29838   29.9 
    ##  2 Belgium                 953.       9909   10.4 
    ##  3 Ecuador                 715.      10576   14.8 
    ##  4 Bolivia                 705.       7008    9.95
    ##  5 Chile                   696.      11652   16.7 
    ##  6 United Kingdom          666.      41554   62.3 
    ##  7 Spain                   633.      29418   46.5 
    ##  8 Brazil                  630.     126650  201.  
    ##  9 Sweden                  611.       5837    9.56
    ## 10 United States           606.     188003  310.  
    ## 11 Mexico                  601.      67558  112.  
    ## 12 Italy                   589.      35553   60.3 
    ## 13 France                  472.      30572   64.8 
    ## 14 Colombia                448.      21412   47.8 
    ## 15 Netherlands             375.       6234   16.6 
    ## 16 South Africa            306.      15004   49   
    ## 17 Iran                    291.      22410   76.9 
    ## 18 Canada                  272.       9145   33.7 
    ## 19 Iraq                    256.       7589   29.7 
    ## 20 Honduras                251.       2007    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
