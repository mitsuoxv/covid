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

Updated: 2020-07-12

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
    ##  1 United States           23825.  3097300            130
    ##  2 Brazil                  14753.  1755779            119
    ##  3 India                    6898.   820916            119
    ##  4 Russia                   6264.   720547            115
    ##  5 Peru                     2750.   316448            115
    ##  6 Chile                    2642.   309274            117
    ##  7 Mexico                   2475.   282283            114
    ##  8 United Kingdom           2250.   288137            128
    ##  9 South Africa             2179.   250687            115
    ## 10 Pakistan                 2104.   246351            117
    ## 11 Spain                    1937.   253908            131
    ## 12 Saudi Arabia             1902.   226486            119
    ## 13 Bangladesh               1858.   178443             96
    ## 14 Iran                     1857.   252720            136
    ## 15 Turkey                   1833.   210965            115
    ## 16 Italy                    1745.   242639            139
    ## 17 Germany                  1503.   198556            132
    ## 18 France                   1230.   161275            131
    ## 19 Colombia                 1174.   133973            114
    ## 20 Canada                    882.   106805            121

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               18468.            117
    ##  2 Peru                              92.0              10581.            115
    ##  3 United States                     76.8               9984.            130
    ##  4 Saudi Arabia                      73.9               8802.            119
    ##  5 Brazil                            73.4               8731.            119
    ##  6 Belarus                           64.6               6671.            103
    ##  7 Sweden                            61.6               7838.            127
    ##  8 Belgium                           47.2               6005.            127
    ##  9 Russia                            44.5               5121.            115
    ## 10 South Africa                      44.5               5116.            115
    ## 11 Bolivia                           43.4               4435.            102
    ## 12 Spain                             41.7               5460.            131
    ## 13 Israel                            40.3               4817.            119
    ## 14 Ecuador                           38.6               4449.            115
    ## 15 Dominican Republic                38.6               4267.            110
    ## 16 United Kingdom                    36.1               4621.            128
    ## 17 Portugal                          35.6               4279.            120
    ## 18 Kazakhstan                        34.3               3680.            107
    ## 19 Switzerland                       33.6               4301.            127
    ## 20 Honduras                          31.6               3302.            104

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.3         355     1352
    ##  2 France                 18.5       29907   161275
    ##  3 Belgium                15.7        9782    62469
    ##  4 United Kingdom         15.5       44650   288137
    ##  5 Italy                  14.4       34938   242639
    ##  6 Hungary                14.0         593     4223
    ##  7 Netherlands            12.1        6127    50785
    ##  8 Mexico                 11.9       33526   282283
    ##  9 Spain                  11.2       28403   253908
    ## 10 Chad                    8.47         74      874
    ## 11 Canada                  8.19       8749   106805
    ## 12 Ecuador                 7.57       4983    65801
    ## 13 Sweden                  7.38       5526    74898
    ## 14 Sudan                   6.36        649    10204
    ## 15 Niger                   6.19         68     1099
    ## 16 Romania                 5.89       1847    31381
    ## 17 Algeria                 5.46        996    18242
    ## 18 China                   5.44       4648    85487
    ## 19 Burkina Faso            5.29         54     1020
    ## 20 Greece                  5.17        193     3732

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9782   10.4 
    ##  2 United Kingdom          716.      44650   62.3 
    ##  3 Spain                   611.      28403   46.5 
    ##  4 Italy                   579.      34938   60.3 
    ##  5 Sweden                  578.       5526    9.56
    ##  6 France                  462.      29907   64.8 
    ##  7 United States           428.     132683  310.  
    ##  8 Chile                   405.       6781   16.7 
    ##  9 Peru                    378.      11314   29.9 
    ## 10 Netherlands             368.       6127   16.6 
    ## 11 Brazil                  344.      69184  201.  
    ## 12 Ecuador                 337.       4983   14.8 
    ## 13 Mexico                  298.      33526  112.  
    ## 14 Canada                  260.       8749   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Bolivia                 165.       1638    9.95
    ## 17 Iran                    162.      12447   76.9 
    ## 18 Portugal                154.       1646   10.7 
    ## 19 Denmark                 111.        609    5.48
    ## 20 Germany                 111.       9060   81.8

EOL
