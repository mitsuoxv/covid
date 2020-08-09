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

Updated: 2020-08-10

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

WHO offers those numbers in [the situation
reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/),
which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning
regular expressions, and made the shiny app above. I would like to
update frequently, but I am not sure. The ugly codes I wrote are in R
directory. Data in Table 1 (In China) and Table 2 (World including
China) in the situation reports are in table1.csv, table2.csv and
tables.rdata in data directory.

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

Here, I load Table 1 and Table 2, which I managed to scratch from WHO
situation reports. Beware Table 1 (in\_china) includes total, but Table
2 (world) does not include subtotal or total, as I cut them.

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
    ##  1 United States           30804.  4897958            159
    ##  2 Brazil                  20016.  2962442            148
    ##  3 India                   14547.  2153010            148
    ##  4 Russia                   6162.   887536            144
    ##  5 South Africa             3841.   553188            144
    ##  6 Mexico                   3282.   469407            143
    ##  7 Peru                     3220.   463875            144
    ##  8 Colombia                 2567.   367196            143
    ##  9 Chile                    2540.   371023            146
    ## 10 Bangladesh               2040.   255113            125
    ## 11 United Kingdom           1972.   309767            157
    ## 12 Iran                     1967.   324692            165
    ## 13 Spain                    1964.   314362            160
    ## 14 Pakistan                 1945.   284103            146
    ## 15 Saudi Arabia             1940.   287262            148
    ## 16 Turkey                   1663.   239622            144
    ## 17 Argentina                1659.   235677            142
    ## 18 Italy                    1488.   250103            168
    ## 19 Germany                  1340.   215891            161
    ## 20 France                   1157.   185353            160

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            152.               22155.            146
    ##  2 Peru                             108.               15511.            144
    ##  3 Brazil                            99.5              14731.            148
    ##  4 United States                     99.3              15788.            159
    ##  5 South Africa                      78.4              11290.            144
    ##  6 Saudi Arabia                      75.4              11164.            148
    ##  7 Israel                            73.2              10864.            148
    ##  8 Bolivia                           67.4               8836.            131
    ##  9 Dominican Republic                57.5               8019.            139
    ## 10 Sweden                            55.1               8615.            156
    ## 11 Kyrgyzstan                        54.8               7247.            132
    ## 12 Colombia                          53.7               7684.            143
    ## 13 Belarus                           53.6               7097.            132
    ## 14 Kazakhstan                        52.6               7167.            136
    ## 15 Belgium                           45.1               7047.            156
    ## 16 Ecuador                           43.9               6326.            144
    ## 17 Russia                            43.8               6308.            144
    ## 18 Honduras                          43.8               5837.            133
    ## 19 Spain                             42.2               6760.            160
    ## 20 Argentina                         40.1               5701.            142

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         513     1801
    ##  2 France                 16.3       30201   185353
    ##  3 United Kingdom         15.0       46566   309767
    ##  4 Italy                  14.1       35203   250103
    ##  5 Belgium                13.5        9870    73308
    ##  6 Hungary                12.9         602     4653
    ##  7 Mexico                 10.9       51311   469407
    ##  8 Netherlands            10.6        6157    57987
    ##  9 Spain                   9.07      28503   314362
    ## 10 Chad                    8.07         76      942
    ## 11 Canada                  7.54       8970   118985
    ## 12 Sweden                  7.00       5763    82323
    ## 13 Sudan                   6.50        773    11894
    ## 14 Ecuador                 6.32       5916    93572
    ## 15 Niger                   5.96         69     1157
    ## 16 Iran                    5.63      18264   324692
    ## 17 China                   5.26       4688    89151
    ## 18 Egypt                   5.24       4992    95314
    ## 19 Mali                    4.87        125     2565
    ## 20 Switzerland             4.71       1711    36362

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 949.       9870   10.4 
    ##  2 United Kingdom          747.      46566   62.3 
    ##  3 Peru                    690.      20649   29.9 
    ##  4 Spain                   613.      28503   46.5 
    ##  5 Sweden                  603.       5763    9.56
    ##  6 Chile                   598.      10011   16.7 
    ##  7 Italy                   583.      35203   60.3 
    ##  8 United States           516.     159930  310.  
    ##  9 Brazil                  495.      99572  201.  
    ## 10 France                  466.      30201   64.8 
    ## 11 Mexico                  456.      51311  112.  
    ## 12 Ecuador                 400.       5916   14.8 
    ## 13 Netherlands             370.       6157   16.6 
    ## 14 Bolivia                 354.       3524    9.95
    ## 15 Kyrgyzstan              266.       1468    5.51
    ## 16 Canada                  266.       8970   33.7 
    ## 17 Colombia                256.      12250   47.8 
    ## 18 Iran                    237.      18264   76.9 
    ## 19 Switzerland             226.       1711    7.58
    ## 20 South Africa            208.      10210   49

EOL
