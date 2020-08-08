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

Updated: 2020-08-09

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
    ##  1 United States           30613.  4836930            158
    ##  2 Brazil                  19810.  2912212            147
    ##  3 India                   14208.  2088611            147
    ##  4 Russia                   6169.   882347            143
    ##  5 South Africa             3814.   545476            143
    ##  6 Mexico                   3258.   462690            142
    ##  7 Peru                     3184.   455409            143
    ##  8 Chile                    2543.   368825            145
    ##  9 Colombia                 2518.   357710            142
    ## 10 Bangladesh               2035.   252502            124
    ## 11 United Kingdom           1980.   309009            156
    ## 12 Spain                    1976.   314362            159
    ## 13 Iran                     1966.   322567            164
    ## 14 Pakistan                 1954.   283469            145
    ## 15 Saudi Arabia             1943.   285793            147
    ## 16 Turkey                   1666.   238450            143
    ## 17 Argentina                1617.   228195            141
    ## 18 Italy                    1495.   249756            167
    ## 19 Germany                  1345.   215336            160
    ## 20 France                   1165.   185353            159

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            152.               22024.            145
    ##  2 Peru                             106.               15228.            143
    ##  3 United States                     98.7              15591.            158
    ##  4 Brazil                            98.5              14481.            147
    ##  5 South Africa                      77.8              11132.            143
    ##  6 Saudi Arabia                      75.5              11107.            147
    ##  7 Israel                            73.7              10864.            147
    ##  8 Bolivia                           66.7               8688.            130
    ##  9 Dominican Republic                57.1               7910.            138
    ## 10 Sweden                            55.5               8615.            155
    ## 11 Kyrgyzstan                        54.7               7186.            131
    ## 12 Belarus                           54.0               7085.            131
    ## 13 Kazakhstan                        53.0               7167.            135
    ## 14 Colombia                          52.7               7485.            142
    ## 15 Belgium                           45.0               6988.            155
    ## 16 Russia                            43.8               6271.            143
    ## 17 Ecuador                           43.4               6218.            143
    ## 18 Honduras                          43.3               5727.            132
    ## 19 Spain                             42.5               6760.            159
    ## 20 Argentina                         39.1               5520.            141

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         513     1800
    ##  2 France                 16.3       30201   185353
    ##  3 United Kingdom         15.1       46511   309009
    ##  4 Italy                  14.1       35190   249756
    ##  5 Belgium                13.6        9866    72691
    ##  6 Hungary                13.0         602     4621
    ##  7 Mexico                 10.9       50517   462690
    ##  8 Netherlands            10.7        6154    57501
    ##  9 Spain                   9.07      28503   314362
    ## 10 Chad                    8.07         76      942
    ## 11 Canada                  7.56       8966   118561
    ## 12 Sweden                  7.00       5763    82323
    ## 13 Sudan                   6.50        773    11894
    ## 14 Ecuador                 6.41       5897    91969
    ## 15 Niger                   5.98         69     1153
    ## 16 Iran                    5.62      18132   322567
    ## 17 China                   5.26       4688    89057
    ## 18 Egypt                   5.22       4971    95147
    ## 19 Mali                    4.88        125     2561
    ## 20 Switzerland             4.73       1711    36180

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 948.       9866   10.4 
    ##  2 United Kingdom          746.      46511   62.3 
    ##  3 Peru                    683.      20424   29.9 
    ##  4 Spain                   613.      28503   46.5 
    ##  5 Sweden                  603.       5763    9.56
    ##  6 Chile                   595.       9958   16.7 
    ##  7 Italy                   583.      35190   60.3 
    ##  8 United States           511.     158606  310.  
    ##  9 Brazil                  490.      98493  201.  
    ## 10 France                  466.      30201   64.8 
    ## 11 Mexico                  449.      50517  112.  
    ## 12 Ecuador                 399.       5897   14.8 
    ## 13 Netherlands             370.       6154   16.6 
    ## 14 Bolivia                 348.       3465    9.95
    ## 15 Canada                  266.       8966   33.7 
    ## 16 Kyrgyzstan              265.       1460    5.51
    ## 17 Colombia                250.      11939   47.8 
    ## 18 Iran                    236.      18132   76.9 
    ## 19 Switzerland             226.       1711    7.58
    ## 20 South Africa            202.       9909   49

EOL
