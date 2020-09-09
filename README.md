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

Updated: 2020-09-10

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
    ##  1 United States           32717.  6248989            191
    ##  2 India                   24414.  4370128            179
    ##  3 Brazil                  22915.  4147794            181
    ##  4 Russia                   5914.  1041007            176
    ##  5 Peru                     3929.   691575            176
    ##  6 Colombia                 3839.   671848            175
    ##  7 Mexico                   3642.   637509            175
    ##  8 South Africa             3638.   640441            176
    ##  9 Spain                    2798.   534513            191
    ## 10 Argentina                2772.   488007            176
    ## 11 Chile                    2403.   425541            177
    ## 12 Bangladesh               2096.   329251            157
    ## 13 Iran                     1985.   391112            197
    ## 14 United Kingdom           1855.   352564            190
    ## 15 Saudi Arabia             1790.   322237            180
    ## 16 Pakistan                 1692.   299659            177
    ## 17 France                   1634.   317106            194
    ## 18 Turkey                   1608.   283270            176
    ## 19 Iraq                     1505.   269578            179
    ## 20 Italy                    1400.   280153            200

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            144.               25411.            177
    ##  2 Peru                             131.               23124.            176
    ##  3 Brazil                           114.               20625.            181
    ##  4 United States                    105.               20143.            191
    ##  5 Israel                            97.5              17569.            180
    ##  6 Colombia                          80.3              14058.            175
    ##  7 Bolivia                           75.4              12225.            162
    ##  8 South Africa                      74.2              13070.            176
    ##  9 Saudi Arabia                      69.5              12523.            180
    ## 10 Argentina                         67.1              11804.            176
    ## 11 Spain                             60.2              11493.            191
    ## 12 Dominican Republic                59.8              10193.            170
    ## 13 Kazakhstan                        52.0               8749.            168
    ## 14 Iraq                              50.7               9085.            179
    ## 15 Kyrgyzstan                        49.6               8099.            163
    ## 16 Honduras                          49.4               8112.            164
    ## 17 Sweden                            47.9               8969.            187
    ## 18 Belarus                           46.0               7559.            164
    ## 19 Belgium                           45.0               8560.            190
    ## 20 Ecuador                           42.2               7443.            176

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         577     1998
    ##  2 Italy                  12.7       35563   280153
    ##  3 United Kingdom         11.8       41586   352564
    ##  4 Belgium                11.1        9912    89047
    ##  5 Mexico                 10.6       67781   637509
    ##  6 France                  9.65      30607   317106
    ##  7 Ecuador                 9.61      10576   110092
    ##  8 Netherlands             8.15       6235    76475
    ##  9 Chad                    7.56         79     1045
    ## 10 Canada                  6.92       9146   132142
    ## 11 Sweden                  6.81       5838    85707
    ## 12 Hungary                 6.73        626     9304
    ## 13 Sudan                   6.20        833    13437
    ## 14 Niger                   5.86         69     1178
    ## 15 Bolivia                 5.80       7054   121604
    ## 16 Iran                    5.76      22542   391112
    ## 17 Egypt                   5.55       5560   100228
    ## 18 Spain                   5.54      29594   534513
    ## 19 China                   5.23       4740    90582
    ## 20 Mali                    4.41        127     2882

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1002.      29976   29.9 
    ##  2 Belgium                 953.       9912   10.4 
    ##  3 Ecuador                 715.      10576   14.8 
    ##  4 Bolivia                 709.       7054    9.95
    ##  5 Chile                   698.      11682   16.7 
    ##  6 United Kingdom          667.      41586   62.3 
    ##  7 Spain                   636.      29594   46.5 
    ##  8 Brazil                  631.     126960  201.  
    ##  9 Sweden                  611.       5838    9.56
    ## 10 United States           607.     188172  310.  
    ## 11 Mexico                  603.      67781  112.  
    ## 12 Italy                   589.      35563   60.3 
    ## 13 France                  473.      30607   64.8 
    ## 14 Colombia                452.      21615   47.8 
    ## 15 Netherlands             375.       6235   16.6 
    ## 16 South Africa            308.      15086   49   
    ## 17 Iran                    293.      22542   76.9 
    ## 18 Canada                  272.       9146   33.7 
    ## 19 Iraq                    258.       7657   29.7 
    ## 20 Honduras                253.       2023    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
