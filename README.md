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

Updated: 2020-09-22

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
    ##  1 United States           33023.  6703698            203
    ##  2 India                   28730.  5487580            191
    ##  3 Brazil                  23462.  4528240            193
    ##  4 Russia                   5901.  1109595            188
    ##  5 Peru                     4057    762865            188
    ##  6 Colombia                 4055.   758398            187
    ##  7 Mexico                   3711.   694121            187
    ##  8 South Africa             3516.   661211            188
    ##  9 Argentina                3313.   622934            188
    ## 10 Spain                    3152.   640040            203
    ## 11 Chile                    2360.   446274            189
    ## 12 France                   2099.   432424            206
    ## 13 Bangladesh               2064.   348916            169
    ## 14 Iran                     2019.   422140            209
    ## 15 United Kingdom           1951.   394261            202
    ## 16 Saudi Arabia             1717.   329754            192
    ## 17 Iraq                     1670.   319035            191
    ## 18 Pakistan                 1620.   306304            189
    ## 19 Turkey                   1610.   302867            188
    ## 20 Philippines              1501.   286743            191

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            141.               26649.            189
    ##  2 Peru                             136.               25508.            188
    ##  3 Israel                           124.               23994.            194
    ##  4 Brazil                           117.               22517.            193
    ##  5 United States                    106.               21609.            203
    ##  6 Colombia                          84.9              15869.            187
    ##  7 Argentina                         80.1              15067.            188
    ##  8 Bolivia                           75.3              13116.            174
    ##  9 South Africa                      71.8              13494.            188
    ## 10 Spain                             67.8              13763.            203
    ## 11 Saudi Arabia                      66.7              12815.            192
    ## 12 Dominican Republic                60.4              11023.            182
    ## 13 Iraq                              56.3              10752.            191
    ## 14 Honduras                          50.5               8905.            176
    ## 15 Kazakhstan                        50.1               9026.            180
    ## 16 Belgium                           48.8               9824.            201
    ## 17 Kyrgyzstan                        47.1               8255.            175
    ## 18 Sweden                            46.3               9234.            199
    ## 19 Ecuador                           45.4               8547.            188
    ## 20 Belarus                           44.3               7814.            176

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2034
    ##  2 Italy                  12.0       35707   298156
    ##  3 United Kingdom         10.6       41777   394261
    ##  4 Mexico                 10.6       73258   694121
    ##  5 Belgium                 9.73       9948   102201
    ##  6 Ecuador                 8.77      11090   126419
    ##  7 France                  7.20      31120   432424
    ##  8 Chad                    7.04         81     1151
    ##  9 Netherlands             6.69       6270    93684
    ## 10 Sweden                  6.65       5865    88237
    ## 11 Canada                  6.45       9211   142774
    ## 12 Sudan                   6.17        836    13555
    ## 13 Niger                   5.83         69     1183
    ## 14 Bolivia                 5.81       7586   130470
    ## 15 Iran                    5.76      24301   422140
    ## 16 Egypt                   5.66       5770   102015
    ## 17 China                   5.22       4744    90876
    ## 18 Spain                   4.76      30495   640040
    ## 19 Syria                   4.53        172     3800
    ## 20 Mali                    4.25        128     3013

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1049.      31369   29.9 
    ##  2 Belgium                 956.       9948   10.4 
    ##  3 Bolivia                 763.       7586    9.95
    ##  4 Ecuador                 750.      11090   14.8 
    ##  5 Chile                   734.      12286   16.7 
    ##  6 Brazil                  679.     136532  201.  
    ##  7 United Kingdom          670.      41777   62.3 
    ##  8 Spain                   656.      30495   46.5 
    ##  9 Mexico                  651.      73258  112.  
    ## 10 United States           639.     198094  310.  
    ## 11 Sweden                  614.       5865    9.56
    ## 12 Italy                   592.      35707   60.3 
    ## 13 Colombia                503.      24039   47.8 
    ## 14 France                  480.      31120   64.8 
    ## 15 Netherlands             377.       6270   16.6 
    ## 16 South Africa            326.      15953   49   
    ## 17 Iran                    316.      24301   76.9 
    ## 18 Argentina               312.      12909   41.3 
    ## 19 Iraq                    288.       8555   29.7 
    ## 20 Canada                  273.       9211   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
