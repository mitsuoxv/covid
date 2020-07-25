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

Updated: 2020-07-26

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
    ##  1 United States           27845.  4009808            144
    ##  2 Brazil                  17198.  2287475            133
    ##  3 India                   10051.  1336861            133
    ##  4 Russia                   6253.   806720            129
    ##  5 South Africa             3270.   421996            129
    ##  6 Mexico                   2895.   370712            128
    ##  7 Peru                     2876.   371096            129
    ##  8 Chile                    2604.   341304            131
    ##  9 United Kingdom           2097.   297918            142
    ## 10 Pakistan                 2074.   271887            131
    ## 11 Bangladesh               1987.   218658            110
    ## 12 Saudi Arabia             1975.   262772            133
    ## 13 Iran                     1909.   286523            150
    ## 14 Spain                    1878.   272421            145
    ## 15 Colombia                 1768.   226373            128
    ## 16 Turkey                   1737.   224252            129
    ## 17 Italy                    1604.   245590            153
    ## 18 Germany                  1403.   204964            146
    ## 19 France                   1166.   169222            145
    ## 20 Argentina                1165.   148027            127

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               20381.            131
    ##  2 Peru                              96.2              12408.            129
    ##  3 United States                     89.8              12925.            144
    ##  4 Brazil                            85.5              11375.            133
    ##  5 Saudi Arabia                      76.8              10212.            133
    ##  6 South Africa                      66.7               8612.            129
    ##  7 Belarus                           58.9               6902.            117
    ##  8 Sweden                            58.5               8267.            141
    ##  9 Bolivia                           56.5               6560.            116
    ## 10 Israel                            55.4               7393.            133
    ## 11 Kyrgyzstan                        48.3               5672.            117
    ## 12 Dominican Republic                48.3               6014.            124
    ## 13 Russia                            44.4               5734.            129
    ## 14 Belgium                           44.3               6258.            141
    ## 15 Kazakhstan                        43.2               5230.            121
    ## 16 Ecuador                           41.3               5345.            129
    ## 17 Spain                             40.4               5858.            145
    ## 18 Honduras                          39.0               4619.            118
    ## 19 Colombia                          37.0               4737.            128
    ## 20 Portugal                          34.7               4655.            134

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.5         462     1678
    ##  2 France                 17.8       30078   169222
    ##  3 United Kingdom         15.3       45677   297918
    ##  4 Belgium                15.1        9817    65106
    ##  5 Italy                  14.3       35097   245590
    ##  6 Hungary                13.5         596     4424
    ##  7 Netherlands            11.7        6139    52595
    ##  8 Mexico                 11.3       41908   370712
    ##  9 Spain                  10.4       28432   272421
    ## 10 Chad                    8.20         75      915
    ## 11 Canada                  7.88       8874   112672
    ## 12 Sweden                  7.21       5697    78997
    ## 13 Ecuador                 6.92       5468    79049
    ## 14 Sudan                   6.33        715    11302
    ## 15 Niger                   6.14         69     1124
    ## 16 Syria                   5.76         35      608
    ## 17 China                   5.37       4657    86660
    ## 18 Iran                    5.34      15289   286523
    ## 19 Romania                 5.07       2150    42394
    ## 20 Switzerland             4.99       1699    34067

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 944.       9817   10.4 
    ##  2 United Kingdom          733.      45677   62.3 
    ##  3 Spain                   611.      28432   46.5 
    ##  4 Sweden                  596.       5697    9.56
    ##  5 Peru                    590.      17654   29.9 
    ##  6 Italy                   582.      35097   60.3 
    ##  7 Chile                   532.       8914   16.7 
    ##  8 France                  464.      30078   64.8 
    ##  9 United States           463.     143663  310.  
    ## 10 Brazil                  418.      84082  201.  
    ## 11 Mexico                  373.      41908  112.  
    ## 12 Ecuador                 370.       5468   14.8 
    ## 13 Netherlands             369.       6139   16.6 
    ## 14 Canada                  263.       8874   33.7 
    ## 15 Bolivia                 242.       2407    9.95
    ## 16 Kyrgyzstan              227.       1249    5.51
    ## 17 Switzerland             224.       1699    7.58
    ## 18 Iran                    199.      15289   76.9 
    ## 19 Colombia                161.       7688   47.8 
    ## 20 Portugal                160.       1712   10.7

EOL
