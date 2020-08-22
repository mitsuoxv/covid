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

Updated: 2020-08-23

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
    ##  1 United States           31914.  5521257            173
    ##  2 Brazil                  21484.  3501975            163
    ##  3 India                   18482.  2975701            161
    ##  4 Russia                   6024.   951897            158
    ##  5 South Africa             3818.   603338            158
    ##  6 Peru                     3588.   567059            158
    ##  7 Mexico                   3463.   543806            157
    ##  8 Colombia                 3271.   513719            157
    ##  9 Chile                    2476.   393769            159
    ## 10 Spain                    2231.   386054            173
    ## 11 Bangladesh               2088.   290360            139
    ## 12 Argentina                2030.   320884            158
    ## 13 Iran                     1981.   354764            179
    ## 14 Saudi Arabia             1883.   305186            162
    ## 15 United Kingdom           1879.   323317            172
    ## 16 Pakistan                 1836.   292174            159
    ## 17 Turkey                   1617.   255723            158
    ## 18 Italy                    1412.   257065            182
    ## 19 Germany                  1326.   232082            175
    ## 20 France                   1251.   220309            176

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            148.               23514.            159
    ##  2 Peru                             120.               18961.            158
    ##  3 Brazil                           107.               17414.            163
    ##  4 United States                    103.               17797.            173
    ##  5 Israel                            83.2              13575.            163
    ##  6 South Africa                      77.9              12313.            158
    ##  7 Bolivia                           74.0              10663.            144
    ##  8 Saudi Arabia                      73.2              11860.            162
    ##  9 Colombia                          68.5              10750.            157
    ## 10 Dominican Republic                60.0               9148.            152
    ## 11 Kazakhstan                        54.8               8230.            150
    ## 12 Kyrgyzstan                        53.6               7786.            145
    ## 13 Sweden                            52.9               9007.            170
    ## 14 Belarus                           49.5               7239.            146
    ## 15 Argentina                         49.1               7761.            158
    ## 16 Spain                             48.0               8301.            173
    ## 17 Ecuador                           45.5               7199.            158
    ## 18 Belgium                           45.4               7767.            171
    ## 19 Honduras                          45.2               6611.            146
    ## 20 Russia                            42.8               6765.            158

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         543     1910
    ##  2 France                 13.8       30368   220309
    ##  3 Italy                  13.8       35427   257065
    ##  4 United Kingdom         12.8       41405   323317
    ##  5 Belgium                12.4        9985    80800
    ##  6 Hungary                12.0         611     5098
    ##  7 Mexico                 10.9       59106   543806
    ##  8 Netherlands             9.44       6186    65526
    ##  9 Chad                    7.75         76      981
    ## 10 Spain                   7.47      28838   386054
    ## 11 Canada                  7.31       9054   123873
    ## 12 Sweden                  6.75       5810    86068
    ## 13 Sudan                   6.43        812    12623
    ## 14 Niger                   5.89         69     1172
    ## 15 Ecuador                 5.87       6248   106481
    ## 16 Iran                    5.74      20376   354764
    ## 17 Egypt                   5.38       5231    97148
    ## 18 China                   5.23       4716    90103
    ## 19 Peru                    4.77      27034   567059
    ## 20 Mali                    4.65        125     2688

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 960.       9985   10.4 
    ##  2 Peru                    904.      27034   29.9 
    ##  3 United Kingdom          664.      41405   62.3 
    ##  4 Chile                   640.      10723   16.7 
    ##  5 Spain                   620.      28838   46.5 
    ##  6 Sweden                  608.       5810    9.56
    ##  7 Italy                   587.      35427   60.3 
    ##  8 Brazil                  558.     112304  201.  
    ##  9 United States           558.     173098  310.  
    ## 10 Mexico                  526.      59106  112.  
    ## 11 France                  469.      30368   64.8 
    ## 12 Bolivia                 433.       4305    9.95
    ## 13 Ecuador                 422.       6248   14.8 
    ## 14 Netherlands             372.       6186   16.6 
    ## 15 Colombia                339.      16183   47.8 
    ## 16 Canada                  269.       9054   33.7 
    ## 17 Iran                    265.      20376   76.9 
    ## 18 South Africa            262.      12843   49   
    ## 19 Switzerland             227.       1718    7.58
    ## 20 Iraq                    212.       6283   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
