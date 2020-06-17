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

Updated: 2020-06-18

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
    ##  1 United States           19792.  2098106            106
    ##  2 Brazil                   9349.   888271             95
    ##  3 Russia                   6079.   553301             91
    ##  4 India                    3726.   354065             95
    ##  5 United Kingdom           2866.   298140            104
    ##  6 Peru                     2559.   232992             91
    ##  7 Spain                    2282.   244328            107
    ##  8 Italy                    2064.   237500            115
    ##  9 Turkey                   1990.   181298             91
    ## 10 Chile                    1982.   184449             93
    ## 11 Germany                  1732.   187184            108
    ## 12 Iran                     1717.   192439            112
    ## 13 Mexico                   1668.   150264             90
    ## 14 Pakistan                 1662.   154760             93
    ## 15 Saudi Arabia             1434.   136315             95
    ## 16 France                   1429.   153045            107
    ## 17 Bangladesh               1311.    94481             72
    ## 18 Canada                   1021.    99147             97
    ## 19 South Africa              838.    76334             91
    ## 20 Belarus                   699.    55369             79

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            118.               11014.             93
    ##  2 Peru                              85.6               7791.             91
    ##  3 Belarus                           72.2               5717.             79
    ##  4 United States                     63.8               6763.            106
    ##  5 Belgium                           56.0               5782.            103
    ##  6 Saudi Arabia                      55.7               5298.             95
    ##  7 Sweden                            54.0               5580.            103
    ##  8 Spain                             49.1               5254.            107
    ##  9 Brazil                            46.5               4417.             95
    ## 10 United Kingdom                    46.0               4782.            104
    ## 11 Russia                            43.2               3932.             91
    ## 12 Switzerland                       39.5               4097.            103
    ## 13 Portugal                          36.3               3497.             96
    ## 14 Ecuador                           35.5               3241.             91
    ## 15 Italy                             34.2               3936.            115
    ## 16 Canada                            30.3               2944.             97
    ## 17 Netherlands                       28.6               2949.            103
    ## 18 Dominican Republic                27.7               2411.             86
    ## 19 Israel                            27.1               2600.             95
    ## 20 Turkey                            25.6               2330.             91

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  24.2         215      889
    ##  2 France                 19.3       29481   153045
    ##  3 Belgium                16.1        9663    60155
    ##  4 Italy                  14.5       34405   237500
    ##  5 United Kingdom         14.1       41969   298140
    ##  6 Hungary                13.9         567     4078
    ##  7 Netherlands            12.4        6070    49087
    ##  8 Mexico                 11.7       17580   150264
    ##  9 Spain                  11.1       27136   244328
    ## 10 Sweden                  9.26       4939    53323
    ## 11 Chad                    8.68         74      853
    ## 12 Ecuador                 8.28       3970    47943
    ## 13 Canada                  8.25       8175    99147
    ## 14 Algeria                 7.07        788    11147
    ## 15 Niger                   6.50         66     1016
    ## 16 Romania                 6.41       1437    22415
    ## 17 Sudan                   6.16        477     7740
    ## 18 Burkina Faso            5.92         53      895
    ## 19 Greece                  5.88        185     3148
    ## 20 Mali                    5.62        106     1885

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                929.        9663   10.4 
    ##  2 United Kingdom         673.       41969   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  570.       34405   60.3 
    ##  5 Sweden                 517.        4939    9.56
    ##  6 France                 455.       29481   64.8 
    ##  7 United States          374.      115980  310.  
    ##  8 Netherlands            365.        6070   16.6 
    ##  9 Ecuador                268.        3970   14.8 
    ## 10 Canada                 243.        8175   33.7 
    ## 11 Peru                   229.        6860   29.9 
    ## 12 Switzerland            221.        1677    7.58
    ## 13 Brazil                 219.       43959  201.  
    ## 14 Chile                  202.        3383   16.7 
    ## 15 Mexico                 156.       17580  112.  
    ## 16 Portugal               143.        1522   10.7 
    ## 17 Iran                   118.        9065   76.9 
    ## 18 Denmark                109.         598    5.48
    ## 19 Germany                108.        8830   81.8 
    ## 20 Austria                 83.0        681    8.20

EOL
