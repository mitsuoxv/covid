WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-08-20

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

WHO offers those numbers at [Data Table tab in its
Dashboard](https://covid19.who.int/table). Fortunately I can download a
csv file, whose URL is
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

The ugly codes I wrote are in R directory. Data in Table 1 (In China)
and Table 2 (World including China) are in table1.csv, table2.csv and
tables.rdata in data directory in this repository.

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

## Load

Here, I load Table 1 and Table 2. Beware Table 1 (in\_china) includes
total, but Table 2 (world) does not include subtotal or total.

``` r
# load data
load("data/tables.rdata")
```

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/).

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           31724.  5393138            170
    ##  2 Brazil                  20997.  3359570            160
    ##  3 India                   17514.  2767273            158
    ##  4 Russia                   6046.   937321            155
    ##  5 South Africa             3820.   592144            155
    ##  6 Peru                     3493.   541493            155
    ##  7 Mexico                   3413.   525733            154
    ##  8 Colombia                 3094.   476660            154
    ##  9 Chile                    2492.   388855            156
    ## 10 Spain                    2142.   364196            170
    ## 11 Bangladesh               2075.   282344            136
    ## 12 Iran                     1976.   347835            176
    ## 13 Argentina                1929.   299126            155
    ## 14 United Kingdom           1895.   320290            169
    ## 15 Saudi Arabia             1894.   301323            159
    ## 16 Pakistan                 1861.   290445            156
    ## 17 Turkey                   1623.   251805            155
    ## 18 Italy                    1422.   254636            179
    ## 19 Germany                  1319.   226914            172
    ## 20 France                   1199.   207545            173

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            149.               23220.            156
    ##  2 Peru                             117.               18106.            155
    ##  3 Brazil                           104.               16706.            160
    ##  4 United States                    102.               17384.            170
    ##  5 Israel                            80.2              12922.            161
    ##  6 South Africa                      77.9              12085.            155
    ##  7 Saudi Arabia                      73.6              11710.            159
    ##  8 Bolivia                           72.1              10176.            141
    ##  9 Colombia                          64.8               9974.            154
    ## 10 Dominican Republic                59.3               8869.            149
    ## 11 Kyrgyzstan                        54.0               7683.            142
    ## 12 Kazakhstan                        53.9               7930.            147
    ## 13 Sweden                            53.3               8918.            167
    ## 14 Belarus                           50.2               7194.            143
    ## 15 Argentina                         46.7               7235.            155
    ## 16 Spain                             46.1               7831.            170
    ## 17 Belgium                           45.0               7575.            168
    ## 18 Ecuador                           44.8               6960.            155
    ## 19 Honduras                          44.5               6383.            143
    ## 20 Russia                            43.0               6662.            155

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         538     1893
    ##  2 France                 14.6       30318   207545
    ##  3 Italy                  13.9       35405   254636
    ##  4 United Kingdom         12.9       41381   320290
    ##  5 Belgium                12.6        9959    78804
    ##  6 Hungary                12.3         609     4970
    ##  7 Mexico                 10.8       57023   525733
    ##  8 Netherlands             9.65       6166    63911
    ##  9 Spain                   7.87      28670   364196
    ## 10 Chad                    7.84         76      970
    ## 11 Canada                  7.35       9032   122872
    ## 12 Sweden                  6.79       5790    85219
    ## 13 Sudan                   6.44        808    12546
    ## 14 Ecuador                 5.93       6105   102941
    ## 15 Niger                   5.91         69     1167
    ## 16 Iran                    5.74      19972   347835
    ## 17 Egypt                   5.36       5184    96753
    ## 18 China                   5.24       4712    89980
    ## 19 Peru                    4.89      26481   541493
    ## 20 Mali                    4.69        125     2666

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 957.       9959   10.4 
    ##  2 Peru                    885.      26481   29.9 
    ##  3 United Kingdom          664.      41381   62.3 
    ##  4 Chile                   630.      10546   16.7 
    ##  5 Spain                   616.      28670   46.5 
    ##  6 Sweden                  606.       5790    9.56
    ##  7 Italy                   587.      35405   60.3 
    ##  8 United States           546.     169508  310.  
    ##  9 Brazil                  540.     108536  201.  
    ## 10 Mexico                  507.      57023  112.  
    ## 11 France                  468.      30318   64.8 
    ## 12 Bolivia                 414.       4123    9.95
    ## 13 Ecuador                 413.       6105   14.8 
    ## 14 Netherlands             370.       6166   16.6 
    ## 15 Colombia                322.      15372   47.8 
    ## 16 Canada                  268.       9032   33.7 
    ## 17 Iran                    260.      19972   76.9 
    ## 18 South Africa            250.      12264   49   
    ## 19 Switzerland             226.       1716    7.58
    ## 20 Iraq                    203.       6036   29.7

EOL
