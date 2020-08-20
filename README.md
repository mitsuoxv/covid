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

Updated: 2020-08-21

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
    ##  1 United States           31760.  5431046            171
    ##  2 Brazil                  21163.  3407354            161
    ##  3 India                   17842.  2836925            159
    ##  4 Russia                   6038.   942106            156
    ##  5 South Africa             3820.   596060            156
    ##  6 Peru                     3520.   549321            156
    ##  7 Mexico                   3427.   531239            155
    ##  8 Colombia                 3155.   489122            155
    ##  9 Chile                    2483.   390037            157
    ## 10 Spain                    2168.   370867            171
    ## 11 Bangladesh               2080.   285091            137
    ## 12 Iran                     1978.   350279            177
    ## 13 Argentina                1961.   305966            156
    ## 14 Saudi Arabia             1891.   302686            160
    ## 15 United Kingdom           1888.   321102            170
    ## 16 Pakistan                 1852.   290958            157
    ## 17 Turkey                   1621.   253108            156
    ## 18 Italy                    1418.   255278            180
    ## 19 Germany                  1321.   228621            173
    ## 20 France                   1213.   211225            174

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            148.               23291.            157
    ##  2 Peru                             118.               18368.            156
    ##  3 Brazil                           105.               16943.            161
    ##  4 United States                    102.               17506.            171
    ##  5 Israel                            79.7              12922.            162
    ##  6 South Africa                      78.0              12164.            156
    ##  7 Saudi Arabia                      73.5              11763.            160
    ##  8 Bolivia                           72.9              10356.            142
    ##  9 Colombia                          66.0              10235.            155
    ## 10 Dominican Republic                59.6               8971.            150
    ## 11 Kazakhstan                        54.7               8107.            148
    ## 12 Kyrgyzstan                        53.8               7716.            143
    ## 13 Sweden                            53.1               8938.            168
    ## 14 Belarus                           49.9               7207.            144
    ## 15 Argentina                         47.4               7401.            156
    ## 16 Spain                             46.6               7975.            171
    ## 17 Ecuador                           45.2               7064.            156
    ## 18 Belgium                           45.1               7631.            169
    ## 19 Honduras                          44.8               6467.            144
    ## 20 Russia                            42.9               6696.            156

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         540     1896
    ##  2 France                 14.4       30334   211225
    ##  3 Italy                  13.9       35412   255278
    ##  4 United Kingdom         12.9       41397   321102
    ##  5 Belgium                12.6        9969    79386
    ##  6 Hungary                12.2         609     5002
    ##  7 Mexico                 10.9       57774   531239
    ##  8 Netherlands             9.57       6172    64463
    ##  9 Chad                    7.83         76      971
    ## 10 Spain                   7.76      28797   370867
    ## 11 Canada                  7.34       9045   123154
    ## 12 Sweden                  6.79       5802    85411
    ## 13 Sudan                   6.45        812    12582
    ## 14 Niger                   5.91         69     1167
    ## 15 Ecuador                 5.88       6146   104475
    ## 16 Iran                    5.75      20125   350279
    ## 17 Egypt                   5.36       5197    96914
    ## 18 China                   5.24       4713    90013
    ## 19 Peru                    4.85      26658   549321
    ## 20 Mali                    4.69        125     2667

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 958.       9969   10.4 
    ##  2 Peru                    891.      26658   29.9 
    ##  3 United Kingdom          664.      41397   62.3 
    ##  4 Chile                   632.      10578   16.7 
    ##  5 Spain                   619.      28797   46.5 
    ##  6 Sweden                  607.       5802    9.56
    ##  7 Italy                   587.      35412   60.3 
    ##  8 United States           550.     170640  310.  
    ##  9 Brazil                  546.     109888  201.  
    ## 10 Mexico                  514.      57774  112.  
    ## 11 France                  468.      30334   64.8 
    ## 12 Bolivia                 419.       4172    9.95
    ## 13 Ecuador                 416.       6146   14.8 
    ## 14 Netherlands             371.       6172   16.6 
    ## 15 Colombia                327.      15619   47.8 
    ## 16 Canada                  269.       9045   33.7 
    ## 17 Iran                    262.      20125   76.9 
    ## 18 South Africa            254.      12423   49   
    ## 19 Switzerland             227.       1718    7.58
    ## 20 Iraq                    206.       6121   29.7

EOL
