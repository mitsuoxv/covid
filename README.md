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

Updated: 2020-09-11

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
    ##  1 United States           32667.  6272193            192
    ##  2 India                   24810.  4465863            180
    ##  3 Brazil                  22868.  4162073            182
    ##  4 Russia                   5911.  1046370            177
    ##  5 Peru                     3932.   696190            177
    ##  6 Colombia                 3860.   679513            176
    ##  7 Mexico                   3652.   642860            176
    ##  8 South Africa             3629.   642431            177
    ##  9 Spain                    2830.   543379            192
    ## 10 Argentina                2824.   500034            177
    ## 11 Chile                    2398.   427027            178
    ## 12 Bangladesh               2095.   331078            158
    ## 13 Iran                     1986.   393425            198
    ## 14 United Kingdom           1859.   355223            191
    ## 15 Saudi Arabia             1784.   323012            181
    ## 16 Pakistan                 1684.   299855            178
    ## 17 France                   1668.   325400            195
    ## 18 Turkey                   1609.   284943            177
    ## 19 Iraq                     1521.   273821            180
    ## 20 Italy                    1402.   281853            201

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            143.               25499.            178
    ##  2 Peru                             131.               23278.            177
    ##  3 Brazil                           114.               20696.            182
    ##  4 United States                    105.               20218.            192
    ##  5 Israel                            97.0              17569.            181
    ##  6 Colombia                          80.8              14219.            176
    ##  7 Bolivia                           75.4              12295.            163
    ##  8 South Africa                      74.1              13111.            177
    ##  9 Saudi Arabia                      69.3              12553.            181
    ## 10 Argentina                         68.3              12095.            177
    ## 11 Spain                             60.8              11684.            192
    ## 12 Dominican Republic                59.9              10275.            171
    ## 13 Kazakhstan                        51.7               8749.            169
    ## 14 Iraq                              51.2               9228.            180
    ## 15 Honduras                          49.4               8163.            165
    ## 16 Kyrgyzstan                        49.3               8112.            164
    ## 17 Sweden                            47.7               8987.            188
    ## 18 Belarus                           45.8               7579.            165
    ## 19 Belgium                           45.3               8613.            190
    ## 20 Ecuador                           42.8               7584.            177

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         577     2003
    ##  2 Italy                  12.6       35577   281853
    ##  3 United Kingdom         11.7       41594   355223
    ##  4 Belgium                11.1        9917    89597
    ##  5 Mexico                 10.7       68484   642860
    ##  6 Ecuador                 9.54      10701   112166
    ##  7 France                  9.41      30636   325400
    ##  8 Netherlands             8.04       6237    77615
    ##  9 Chad                    7.54         79     1048
    ## 10 Canada                  6.84       9153   133748
    ## 11 Sweden                  6.80       5842    85880
    ## 12 Hungary                 6.46        628     9715
    ## 13 Sudan                   6.20        833    13437
    ## 14 Niger                   5.86         69     1178
    ## 15 Bolivia                 5.80       7097   122308
    ## 16 Iran                    5.76      22669   393425
    ## 17 Egypt                   5.55       5577   100403
    ## 18 Spain                   5.45      29628   543379
    ## 19 China                   5.23       4740    90595
    ## 20 Mali                    4.42        128     2898

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1007.      30123   29.9 
    ##  2 Belgium                 953.       9917   10.4 
    ##  3 Ecuador                 723.      10701   14.8 
    ##  4 Bolivia                 713.       7097    9.95
    ##  5 Chile                   699.      11702   16.7 
    ##  6 United Kingdom          667.      41594   62.3 
    ##  7 Spain                   637.      29628   46.5 
    ##  8 Brazil                  634.     127464  201.  
    ##  9 Sweden                  611.       5842    9.56
    ## 10 Mexico                  609.      68484  112.  
    ## 11 United States           608.     188608  310.  
    ## 12 Italy                   590.      35577   60.3 
    ## 13 France                  473.      30636   64.8 
    ## 14 Colombia                457.      21817   47.8 
    ## 15 Netherlands             375.       6237   16.6 
    ## 16 South Africa            310.      15168   49   
    ## 17 Iran                    295.      22669   76.9 
    ## 18 Canada                  272.       9153   33.7 
    ## 19 Iraq                    261.       7732   29.7 
    ## 20 Honduras                255.       2034    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
