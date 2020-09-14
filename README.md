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

Updated: 2020-09-15

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
    ##  1 United States           32790.  6426958            196
    ##  2 India                   26339.  4846427            184
    ##  3 Brazil                  23202.  4315687            186
    ##  4 Russia                   5901.  1068320            181
    ##  5 Peru                     3993.   722832            181
    ##  6 Colombia                 3938.   708964            180
    ##  7 Mexico                   3688.   663973            180
    ##  8 South Africa             3589.   649793            181
    ##  9 Argentina                3019.   546481            181
    ## 10 Spain                    2889.   566326            196
    ## 11 Chile                    2388.   434748            182
    ## 12 Bangladesh               2083.   337520            162
    ## 13 Iran                     1990.   402029            202
    ## 14 United Kingdom           1889.   368508            195
    ## 15 France                   1814.   361087            199
    ## 16 Saudi Arabia             1760.   325651            185
    ## 17 Pakistan                 1655.   301481            182
    ## 18 Turkey                   1608.   291162            181
    ## 19 Iraq                     1577.   290309            184
    ## 20 Philippines              1419.   261216            184

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            143.               25961.            182
    ##  2 Peru                             134.               24169.            181
    ##  3 Brazil                           115.               21460.            186
    ##  4 Israel                           111.               20819.            187
    ##  5 United States                    106.               20717.            196
    ##  6 Colombia                          82.4              14835.            180
    ##  7 Bolivia                           75.8              12665.            167
    ##  8 South Africa                      73.3              13261.            181
    ##  9 Argentina                         73.0              13218.            181
    ## 10 Saudi Arabia                      68.4              12656.            185
    ## 11 Spain                             62.1              12177.            196
    ## 12 Dominican Republic                60.1              10552.            175
    ## 13 Iraq                              53.2               9784.            184
    ## 14 Kazakhstan                        51.4               8899.            173
    ## 15 Honduras                          49.6               8403.            169
    ## 16 Kyrgyzstan                        48.4               8156.            168
    ## 17 Sweden                            47.1               9053.            192
    ## 18 Belgium                           46.2               8974.            194
    ## 19 Belarus                           45.2               7659.            169
    ## 20 Ecuador                           43.4               7873.            181

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         584     2015
    ##  2 Italy                  12.4       35610   287753
    ##  3 United Kingdom         11.3       41628   368508
    ##  4 Mexico                 10.6       70604   663973
    ##  5 Belgium                10.6        9925    93361
    ##  6 Ecuador                 9.33      10864   116451
    ##  7 France                  8.52      30755   361087
    ##  8 Netherlands             7.61       6245    82023
    ##  9 Chad                    7.38         80     1084
    ## 10 Sweden                  6.76       5846    86505
    ## 11 Canada                  6.74       9170   136141
    ## 12 Sudan                   6.19        834    13470
    ## 13 Niger                   5.86         69     1178
    ## 14 Bolivia                 5.79       7297   125982
    ## 15 Iran                    5.76      23157   402029
    ## 16 Egypt                   5.58       5627   100856
    ## 17 Spain                   5.25      29747   566326
    ## 18 China                   5.23       4741    90695
    ## 19 Hungary                 5.18        637    12309
    ## 20 Syria                   4.38        155     3540

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1023.      30593   29.9 
    ##  2 Belgium                 954.       9925   10.4 
    ##  3 Ecuador                 735.      10864   14.8 
    ##  4 Bolivia                 734.       7297    9.95
    ##  5 Chile                   714.      11949   16.7 
    ##  6 United Kingdom          668.      41628   62.3 
    ##  7 Brazil                  652.     131210  201.  
    ##  8 Spain                   640.      29747   46.5 
    ##  9 Mexico                  628.      70604  112.  
    ## 10 United States           621.     192612  310.  
    ## 11 Sweden                  612.       5846    9.56
    ## 12 Italy                   590.      35610   60.3 
    ## 13 Colombia                476.      22734   47.8 
    ## 14 France                  475.      30755   64.8 
    ## 15 Netherlands             375.       6245   16.6 
    ## 16 South Africa            315.      15447   49   
    ## 17 Iran                    301.      23157   76.9 
    ## 18 Argentina               273.      11307   41.3 
    ## 19 Canada                  272.       9170   33.7 
    ## 20 Iraq                    270.       8014   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
