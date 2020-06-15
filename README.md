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

Updated: 2020-06-16

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
    ##  1 United States           19786.  2057838            104
    ##  2 Brazil                   9144.   850514             93
    ##  3 Russia                   6034.   537210             89
    ##  4 India                    3573.   332424             93
    ##  5 United Kingdom           2900.   295893            102
    ##  6 Peru                     2528.   225132             89
    ##  7 Spain                    2322.   243928            105
    ##  8 Italy                    2096.   236989            113
    ##  9 Turkey                   2001.   178239             89
    ## 10 Chile                    1914.   174293             91
    ## 11 Germany                  1758.   186461            106
    ## 12 Iran                     1703.   187427            110
    ## 13 Mexico                   1620.   142690             88
    ## 14 Pakistan                 1586.   144478             91
    ## 15 France                   1453.   152767            105
    ## 16 Saudi Arabia             1370.   127541             93
    ## 17 Bangladesh               1249.    87520             70
    ## 18 Canada                   1034.    98410             95
    ## 19 South Africa              786.    70038             89
    ## 20 Belarus                   699.    53973             77

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            114.               10408.             91
    ##  2 Peru                              84.5               7528.             89
    ##  3 Belarus                           72.2               5573.             77
    ##  4 United States                     63.8               6633.            104
    ##  5 Belgium                           57.0               5770.            101
    ##  6 Sweden                            53.3               5401.            101
    ##  7 Saudi Arabia                      53.3               4957.             93
    ##  8 Spain                             49.9               5245.            105
    ##  9 United Kingdom                    46.5               4746.            102
    ## 10 Brazil                            45.5               4229.             93
    ## 11 Russia                            42.9               3818.             89
    ## 12 Switzerland                       40.3               4094.            101
    ## 13 Portugal                          36.4               3437.             94
    ## 14 Ecuador                           35.4               3161.             89
    ## 15 Italy                             34.7               3928.            113
    ## 16 Canada                            30.7               2922.             95
    ## 17 Netherlands                       28.9               2931.            101
    ## 18 Israel                            27.5               2585.             93
    ## 19 Dominican Republic                27.5               2337.             84
    ## 20 Turkey                            25.7               2291.             89

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  22.5         165      732
    ##  2 France                 19.2       29343   152767
    ##  3 Belgium                16.1        9655    60029
    ##  4 Italy                  14.5       34345   236989
    ##  5 United Kingdom         14.1       41698   295893
    ##  6 Hungary                13.8         563     4076
    ##  7 Netherlands            12.4        6059    48783
    ##  8 Mexico                 11.8       16872   142690
    ##  9 Spain                  11.1       27136   243928
    ## 10 Sweden                  9.44       4874    51614
    ## 11 Chad                    8.59         73      850
    ## 12 Ecuador                 8.33       3896    46751
    ## 13 Canada                  8.24       8107    98410
    ## 14 Algeria                 7.02        767    10919
    ## 15 Niger                   6.73         66      980
    ## 16 Romania                 6.41       1410    21999
    ## 17 Sudan                   6.36        459     7220
    ## 18 Burkina Faso            5.93         53      894
    ## 19 Greece                  5.86        183     3121
    ## 20 Mali                    5.75        104     1809

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                928.        9655   10.4 
    ##  2 United Kingdom         669.       41698   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  569.       34345   60.3 
    ##  5 Sweden                 510.        4874    9.56
    ##  6 France                 453.       29343   64.8 
    ##  7 United States          371.      115112  310.  
    ##  8 Netherlands            364.        6059   16.6 
    ##  9 Ecuador                263.        3896   14.8 
    ## 10 Canada                 241.        8107   33.7 
    ## 11 Switzerland            221.        1676    7.58
    ## 12 Peru                   217.        6498   29.9 
    ## 13 Brazil                 212.       42720  201.  
    ## 14 Chile                  198.        3323   16.7 
    ## 15 Mexico                 150.       16872  112.  
    ## 16 Portugal               142.        1517   10.7 
    ## 17 Iran                   115.        8837   76.9 
    ## 18 Denmark                109.         597    5.48
    ## 19 Germany                107.        8791   81.8 
    ## 20 Austria                 82.5        677    8.20

EOL
