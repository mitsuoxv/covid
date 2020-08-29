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

Updated: 2020-08-30

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
    ##  1 United States           32286.  5811519            180
    ##  2 Brazil                  22125.  3761391            170
    ##  3 India                   20618.  3463972            168
    ##  4 Russia                   5971.   985346            165
    ##  5 Peru                     3769.   621997            165
    ##  6 South Africa             3758.   620132            165
    ##  7 Colombia                 3548.   582022            164
    ##  8 Mexico                   3535.   579914            164
    ##  9 Chile                    2445.   405972            166
    ## 10 Spain                    2440.   439286            180
    ## 11 Argentina                2304.   380292            165
    ## 12 Bangladesh               2100.   306794            146
    ## 13 Iran                     1988    369911            186
    ## 14 United Kingdom           1852.   331648            179
    ## 15 Saudi Arabia             1851.   312924            169
    ## 16 Pakistan                 1778.   295372            166
    ## 17 Turkey                   1608    265515            165
    ## 18 Italy                    1404.   265409            189
    ## 19 France                   1374.   251516            183
    ## 20 Iraq                     1330.   223612            168

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            146.               24242.            166
    ##  2 Peru                             126.               20798.            165
    ##  3 Brazil                           110.               18704.            170
    ##  4 United States                    104.               18733.            180
    ##  5 Israel                            88.6              15075.            170
    ##  6 South Africa                      76.7              12656.            165
    ##  7 Bolivia                           75.2              11373.            151
    ##  8 Colombia                          74.2              12179.            164
    ##  9 Saudi Arabia                      71.9              12161.            169
    ## 10 Dominican Republic                59.6               9506.            159
    ## 11 Argentina                         55.7               9198.            165
    ## 12 Kazakhstan                        54.2               8518.            157
    ## 13 Spain                             52.5               9446.            180
    ## 14 Kyrgyzstan                        52.1               7935.            152
    ## 15 Sweden                            50.1               8786.            175
    ## 16 Belarus                           48.0               7367.            153
    ## 17 Honduras                          47.1               7218.            153
    ## 18 Ecuador                           45.9               7582.            165
    ## 19 Belgium                           45.2               8061.            178
    ## 20 Iraq                              44.8               7536.            168

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         564     1947
    ##  2 Italy                  13.4       35472   265409
    ##  3 United Kingdom         12.5       41486   331648
    ##  4 France                 12.1       30460   251516
    ##  5 Belgium                11.8        9886    83858
    ##  6 Hungary                11.1         614     5511
    ##  7 Mexico                 10.8       62594   579914
    ##  8 Netherlands             8.99       6211    69063
    ##  9 Chad                    7.64         77     1008
    ## 10 Canada                  7.18       9102   126848
    ## 11 Sweden                  6.93       5821    83958
    ## 12 Spain                   6.60      29011   439286
    ## 13 Sudan                   6.29        823    13082
    ## 14 Niger                   5.88         69     1173
    ## 15 Ecuador                 5.80       6504   112141
    ## 16 Iran                    5.74      21249   369911
    ## 17 Egypt                   5.46       5362    98285
    ## 18 China                   5.23       4725    90323
    ## 19 Mali                    4.61        126     2736
    ## 20 Peru                    4.55      28277   621997

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 950.       9886   10.4 
    ##  2 Peru                    945.      28277   29.9 
    ##  3 United Kingdom          665.      41486   62.3 
    ##  4 Chile                   665.      11132   16.7 
    ##  5 Spain                   624.      29011   46.5 
    ##  6 Sweden                  609.       5821    9.56
    ##  7 Brazil                  590.     118649  201.  
    ##  8 Italy                   588.      35472   60.3 
    ##  9 United States           579.     179716  310.  
    ## 10 Mexico                  557.      62594  112.  
    ## 11 Bolivia                 482.       4791    9.95
    ## 12 France                  470.      30460   64.8 
    ## 13 Ecuador                 440.       6504   14.8 
    ## 14 Colombia                386.      18468   47.8 
    ## 15 Netherlands             373.       6211   16.6 
    ## 16 South Africa            280.      13743   49   
    ## 17 Iran                    276.      21249   76.9 
    ## 18 Canada                  270.       9102   33.7 
    ## 19 Iraq                    230.       6814   29.7 
    ## 20 Switzerland             227.       1724    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
