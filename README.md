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

Updated: 2020-09-23

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
    ##  1 United States           33041.  6740464            204
    ##  2 India                   28972.  5562663            192
    ##  3 Brazil                  23425.  4544629            194
    ##  4 Russia                   5903.  1115810            189
    ##  5 Colombia                 4069.   765076            188
    ##  6 Peru                     4067.   768895            189
    ##  7 Mexico                   3710.   697663            188
    ##  8 South Africa             3502.   661936            189
    ##  9 Argentina                3340.   631365            189
    ## 10 Spain                    3137.   640040            204
    ## 11 Chile                    2354.   447468            190
    ## 12 France                   2108.   436481            207
    ## 13 Bangladesh               2062.   350621            170
    ## 14 Iran                     2025.   425481            210
    ## 15 United Kingdom           1963.   398629            203
    ## 16 Saudi Arabia             1711.   330246            193
    ## 17 Iraq                     1681.   322856            192
    ## 18 Pakistan                 1611.   306304            190
    ## 19 Turkey                   1611.   304610            189
    ## 20 Philippines              1511.   290190            192

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            141.               26720.            190
    ##  2 Peru                             136.               25710.            189
    ##  3 Israel                           123.               23994.            195
    ##  4 Brazil                           116.               22598.            194
    ##  5 United States                    107.               21727.            204
    ##  6 Colombia                          85.1              16009.            188
    ##  7 Argentina                         80.8              15271.            189
    ##  8 Bolivia                           75.0              13137.            175
    ##  9 South Africa                      71.5              13509.            189
    ## 10 Spain                             67.5              13763.            204
    ## 11 Saudi Arabia                      66.5              12834.            193
    ## 12 Dominican Republic                60.3              11073.            183
    ## 13 Iraq                              56.6              10881.            192
    ## 14 Honduras                          50.6               8964.            177
    ## 15 Kazakhstan                        49.8               9031.            181
    ## 16 Belgium                           49.1               9930.            202
    ## 17 Kyrgyzstan                        46.9               8267.            176
    ## 18 Sweden                            46.1               9234.            200
    ## 19 Ecuador                           45.3               8567.            189
    ## 20 Belarus                           44.2               7837.            177

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         587     2030
    ##  2 Italy                  11.9       35724   299506
    ##  3 Mexico                 10.5       73493   697663
    ##  4 United Kingdom         10.5       41788   398629
    ##  5 Belgium                 9.63       9950   103298
    ##  6 Ecuador                 8.76      11095   126711
    ##  7 France                  7.14      31172   436481
    ##  8 Chad                    7.03         81     1153
    ##  9 Sweden                  6.65       5865    88237
    ## 10 Netherlands             6.54       6272    95899
    ## 11 Canada                  6.42       9217   143649
    ## 12 Sudan                   6.17        836    13555
    ## 13 Bolivia                 5.83       7617   130676
    ## 14 Niger                   5.80         69     1189
    ## 15 Iran                    5.75      24478   425481
    ## 16 Egypt                   5.66       5770   102015
    ## 17 China                   5.22       4744    90890
    ## 18 Spain                   4.76      30495   640040
    ## 19 Syria                   4.53        172     3800
    ## 20 Mali                    4.23        128     3024

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1049.      31369   29.9 
    ##  2 Belgium                 956.       9950   10.4 
    ##  3 Bolivia                 766.       7617    9.95
    ##  4 Ecuador                 750.      11095   14.8 
    ##  5 Chile                   734.      12298   16.7 
    ##  6 Brazil                  681.     136895  201.  
    ##  7 United Kingdom          670.      41788   62.3 
    ##  8 Spain                   656.      30495   46.5 
    ##  9 Mexico                  653.      73493  112.  
    ## 10 United States           639.     198363  310.  
    ## 11 Sweden                  614.       5865    9.56
    ## 12 Italy                   592.      35724   60.3 
    ## 13 Colombia                507.      24208   47.8 
    ## 14 France                  481.      31172   64.8 
    ## 15 Netherlands             377.       6272   16.6 
    ## 16 South Africa            326.      15992   49   
    ## 17 Iran                    318.      24478   76.9 
    ## 18 Argentina               316.      13053   41.3 
    ## 19 Iraq                    291.       8625   29.7 
    ## 20 Canada                  274.       9217   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
