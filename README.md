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

Updated: 2020-09-20

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
    ##  1 United States           32904.  6613737            201
    ##  2 India                   28084.  5308014            189
    ##  3 Brazil                  23326.  4455386            191
    ##  4 Russia                   5898.  1097251            186
    ##  5 Peru                     4032.   750098            186
    ##  6 Colombia                 4021.   743945            185
    ##  7 Mexico                   3697.   684113            185
    ##  8 South Africa             3535.   657627            186
    ##  9 Argentina                3234.   601713            186
    ## 10 Spain                    3184.   640040            201
    ## 11 Chile                    2367.   442827            187
    ## 12 Bangladesh               2070.   345805            167
    ## 13 Iran                     2010.   416198            207
    ## 14 France                   1996.   407390            204
    ## 15 United Kingdom           1929.   385940            200
    ## 16 Saudi Arabia             1730.   328720            190
    ## 17 Iraq                     1648.   311690            189
    ## 18 Pakistan                 1630.   305031            187
    ## 19 Turkey                   1611.   299810            186
    ## 20 Philippines              1478.   279526            189

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            141.               26443.            187
    ##  2 Peru                             135.               25081.            186
    ##  3 Israel                           125.               23994.            192
    ##  4 Brazil                           116.               22155.            191
    ##  5 United States                    106.               21319.            201
    ##  6 Colombia                          84.1              15567.            185
    ##  7 Argentina                         78.2              14554.            186
    ##  8 Bolivia                           75.6              13010.            172
    ##  9 South Africa                      72.1              13421.            186
    ## 10 Spain                             68.5              13763.            201
    ## 11 Saudi Arabia                      67.2              12775.            190
    ## 12 Dominican Republic                60.2              10865.            180
    ## 13 Iraq                              55.6              10505.            189
    ## 14 Kazakhstan                        50.4               8977.            178
    ## 15 Honduras                          50.4               8777.            174
    ## 16 Belgium                           48.0               9570.            199
    ## 17 Kyrgyzstan                        47.5               8230.            173
    ## 18 Sweden                            46.8               9234.            197
    ## 19 Belarus                           44.6               7768.            174
    ## 20 Ecuador                           44.4               8266.            186

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         586     2028
    ##  2 Italy                  12.1       35668   294932
    ##  3 United Kingdom         10.8       41732   385940
    ##  4 Mexico                 10.6       72179   684113
    ##  5 Belgium                 9.98       9937    99555
    ##  6 Ecuador                 9.02      11029   122257
    ##  7 France                  7.63      31084   407390
    ##  8 Chad                    7.06         81     1147
    ##  9 Netherlands             6.96       6264    89959
    ## 10 Sweden                  6.65       5865    88237
    ## 11 Canada                  6.53       9200   140867
    ## 12 Sudan                   6.18        836    13535
    ## 13 Niger                   5.84         69     1182
    ## 14 Bolivia                 5.80       7511   129419
    ## 15 Iran                    5.75      23952   416198
    ## 16 Egypt                   5.63       5733   101772
    ## 17 China                   5.22       4744    90814
    ## 18 Spain                   4.76      30495   640040
    ## 19 Syria                   4.50        168     3731
    ## 20 Mali                    4.28        128     2991

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1041.      31146   29.9 
    ##  2 Belgium                 955.       9937   10.4 
    ##  3 Bolivia                 755.       7511    9.95
    ##  4 Ecuador                 746.      11029   14.8 
    ##  5 Chile                   728.      12199   16.7 
    ##  6 Brazil                  671.     134935  201.  
    ##  7 United Kingdom          669.      41732   62.3 
    ##  8 Spain                   656.      30495   46.5 
    ##  9 Mexico                  642.      72179  112.  
    ## 10 United States           633.     196465  310.  
    ## 11 Sweden                  614.       5865    9.56
    ## 12 Italy                   591.      35668   60.3 
    ## 13 Colombia                495.      23665   47.8 
    ## 14 France                  480.      31084   64.8 
    ## 15 Netherlands             376.       6264   16.6 
    ## 16 South Africa            324.      15857   49   
    ## 17 Iran                    311.      23952   76.9 
    ## 18 Argentina               302.      12491   41.3 
    ## 19 Iraq                    283.       8408   29.7 
    ## 20 Canada                  273.       9200   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
