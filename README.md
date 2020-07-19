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

Updated: 2020-07-20

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
    ##  1 United States           25681.  3544143            138
    ##  2 Brazil                  16112.  2046328            127
    ##  3 India                    8484.  1077618            127
    ##  4 Russia                   6272.   771546            123
    ##  5 South Africa             2852.   350879            123
    ##  6 Peru                     2808.   345537            123
    ##  7 Mexico                   2715.   331298            122
    ##  8 Chile                    2630.   328846            125
    ##  9 United Kingdom           2161.   294070            136
    ## 10 Pakistan                 2106.   263496            125
    ## 11 Saudi Arabia             1955.   248416            127
    ## 12 Bangladesh               1942.   202066            104
    ## 13 Iran                     1885.   271606            144
    ## 14 Spain                    1872.   260255            139
    ## 15 Turkey                   1777.   218717            123
    ## 16 Italy                    1660.   244216            147
    ## 17 Colombia                 1492.   182140            122
    ## 18 Germany                  1439.   201574            140
    ## 19 France                   1180.   164247            139
    ## 20 Argentina                 985.   119301            121

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               19637.            125
    ##  2 Peru                              93.9              11554.            123
    ##  3 United States                     82.8              11424.            138
    ##  4 Brazil                            80.1              10176.            127
    ##  5 Saudi Arabia                      76.0               9654.            127
    ##  6 Belarus                           61.2               6810.            111
    ##  7 Sweden                            59.8               8087.            135
    ##  8 South Africa                      58.2               7161.            123
    ##  9 Israel                            51.2               6533.            127
    ## 10 Bolivia                           51.2               5640.            110
    ## 11 Belgium                           45.3               6124.            135
    ## 12 Russia                            44.6               5484.            123
    ## 13 Dominican Republic                44.2               5244.            118
    ## 14 Kyrgyzstan                        40.7               4535.            111
    ## 15 Ecuador                           40.3               4961.            123
    ## 16 Spain                             40.2               5596.            139
    ## 17 Kazakhstan                        39.8               4585.            115
    ## 18 Honduras                          35.4               3973.            112
    ## 19 Portugal                          35.3               4533.            128
    ## 20 United Kingdom                    34.7               4717.            136

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.0         444     1585
    ##  2 France                 18.3       30046   164247
    ##  3 United Kingdom         15.4       45273   294070
    ##  4 Belgium                15.4        9800    63706
    ##  5 Italy                  14.3       35042   244216
    ##  6 Hungary                13.8         596     4315
    ##  7 Netherlands            11.9        6129    51526
    ##  8 Mexico                 11.6       38310   331298
    ##  9 Spain                  10.9       28420   260255
    ## 10 Chad                    8.44         75      889
    ## 11 Canada                  8.06       8839   109669
    ## 12 Sweden                  7.27       5619    77281
    ## 13 Ecuador                 7.20       5282    73382
    ## 14 Sudan                   6.32        680    10762
    ## 15 Niger                   6.25         69     1104
    ## 16 Romania                 5.48       2009    36691
    ## 17 China                   5.41       4653    85937
    ## 18 Iran                    5.15      13979   271606
    ## 19 Burkina Faso            5.06         53     1047
    ## 20 Switzerland             5.05       1687    33406

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 942.       9800   10.4 
    ##  2 United Kingdom          726.      45273   62.3 
    ##  3 Spain                   611.      28420   46.5 
    ##  4 Sweden                  588.       5619    9.56
    ##  5 Italy                   581.      35042   60.3 
    ##  6 Chile                   504.       8445   16.7 
    ##  7 France                  464.      30046   64.8 
    ##  8 United States           444.     137674  310.  
    ##  9 Peru                    428.      12799   29.9 
    ## 10 Brazil                  387.      77851  201.  
    ## 11 Netherlands             368.       6129   16.6 
    ## 12 Ecuador                 357.       5282   14.8 
    ## 13 Mexico                  341.      38310  112.  
    ## 14 Canada                  262.       8839   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 206.       2049    9.95
    ## 17 Iran                    182.      13979   76.9 
    ## 18 Kyrgyzstan              168.        923    5.51
    ## 19 Portugal                158.       1684   10.7 
    ## 20 Colombia                132.       6288   47.8

EOL
