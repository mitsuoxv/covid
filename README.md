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

Updated: 2020-07-18

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

    ## `summarise()` regrouping output by 'publish_date' (override with `.groups` argument)

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           25533.  3472659            136
    ##  2 Brazil                  15733.  1966748            125
    ##  3 India                    8030.  1003832            125
    ##  4 Russia                   6273.   759203            121
    ##  5 Peru                     2790.   337724            121
    ##  6 South Africa             2679.   324221            121
    ##  7 Mexico                   2646.   317635            120
    ##  8 Chile                    2630.   323698            123
    ##  9 United Kingdom           2182.   292556            134
    ## 10 Pakistan                 2112.   259999            123
    ## 11 Saudi Arabia             1945.   243238            125
    ## 12 Bangladesh               1924.   196323            102
    ## 13 Spain                    1889.   258855            137
    ## 14 Iran                     1880.   267061            142
    ## 15 Turkey                   1791.   216873            121
    ## 16 Italy                    1680.   243736            145
    ## 17 Germany                  1454.   200843            138
    ## 18 Colombia                 1376.   165169            120
    ## 19 France                   1192.   163550            137
    ## 20 Argentina                 933.   111160            119

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               19329.            123
    ##  2 Peru                              93.3              11292.            121
    ##  3 United States                     82.3              11194.            136
    ##  4 Brazil                            78.2               9780.            125
    ##  5 Saudi Arabia                      75.6               9453.            125
    ##  6 Belarus                           62.0               6776.            109
    ##  7 Sweden                            60.4               8045.            133
    ##  8 South Africa                      54.7               6617.            121
    ##  9 Bolivia                           48.5               5249.            108
    ## 10 Israel                            48.2               6051.            125
    ## 11 Belgium                           45.6               6079.            133
    ## 12 Russia                            44.6               5396.            121
    ## 13 Dominican Republic                42.6               4962.            116
    ## 14 Spain                             40.6               5566.            137
    ## 15 Ecuador                           39.8               4825.            121
    ## 16 Kazakhstan                        38.5               4361.            113
    ## 17 Portugal                          35.4               4474.            126
    ## 18 United Kingdom                    35.0               4692.            134
    ## 19 Honduras                          34.1               3759.            110
    ## 20 Switzerland                       32.7               4380.            133

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.2         439     1556
    ##  2 France                 18.4       30032   163550
    ##  3 Belgium                15.5        9795    63238
    ##  4 United Kingdom         15.4       45119   292556
    ##  5 Italy                  14.4       35017   243736
    ##  6 Hungary                13.9         595     4279
    ##  7 Netherlands            11.9        6128    51296
    ##  8 Mexico                 11.6       36906   317635
    ##  9 Spain                  11.0       28416   258855
    ## 10 Chad                    8.47         75      886
    ## 11 Canada                  8.10       8810   108829
    ## 12 Ecuador                 7.30       5207    71365
    ## 13 Sweden                  7.28       5593    76877
    ## 14 Sudan                   6.35        668    10527
    ## 15 Niger                   6.26         69     1102
    ## 16 Romania                 5.63       1971    35003
    ## 17 China                   5.42       4651    85775
    ## 18 Burkina Faso            5.11         53     1038
    ## 19 Iran                    5.10      13608   267061
    ## 20 Switzerland             5.08       1687    33205

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 942.       9795   10.4 
    ##  2 United Kingdom          724.      45119   62.3 
    ##  3 Spain                   611.      28416   46.5 
    ##  4 Sweden                  585.       5593    9.56
    ##  5 Italy                   580.      35017   60.3 
    ##  6 France                  464.      30032   64.8 
    ##  7 United States           441.     136753  310.  
    ##  8 Chile                   435.       7290   16.7 
    ##  9 Peru                    415.      12417   29.9 
    ## 10 Brazil                  375.      75366  201.  
    ## 11 Netherlands             368.       6128   16.6 
    ## 12 Ecuador                 352.       5207   14.8 
    ## 13 Mexico                  328.      36906  112.  
    ## 14 Canada                  262.       8810   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 195.       1942    9.95
    ## 17 Iran                    177.      13608   76.9 
    ## 18 Portugal                157.       1679   10.7 
    ## 19 Colombia                122.       5814   47.8 
    ## 20 Iraq                    119.       3522   29.7

EOL
