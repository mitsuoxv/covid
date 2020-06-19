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

Updated: 2020-06-20

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
    ##  1 United States           19899.  2149166            108
    ##  2 Brazil                   9848    955377             97
    ##  3 Russia                   6117.   569063             93
    ##  4 India                    3922.   380532             97
    ##  5 United Kingdom           2834.   300473            106
    ##  6 Peru                     2589.   240908             93
    ##  7 Chile                    2368.   225103             95
    ##  8 Spain                    2249.   245268            109
    ##  9 Italy                    2034.   238159            117
    ## 10 Turkey                   1977.   184031             93
    ## 11 Mexico                   1736.   159793             92
    ## 12 Pakistan                 1736.   165062             95
    ## 13 Iran                     1733.   197647            114
    ## 14 Germany                  1706.   187764            110
    ## 15 Saudi Arabia             1504    145991             97
    ## 16 France                   1407.   153557            109
    ## 17 Bangladesh               1381.   102292             74
    ## 18 Canada                   1007.    99853             99
    ## 19 South Africa              901.    83890             93
    ## 20 Belarus                   698.    56657             81

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            141.               13442.             95
    ##  2 Peru                              86.6               8055.             93
    ##  3 Belarus                           72.0               5850.             81
    ##  4 United States                     64.1               6928.            108
    ##  5 Saudi Arabia                      58.4               5674.             97
    ##  6 Sweden                            55.7               5865.            105
    ##  7 Belgium                           55.1               5801.            105
    ##  8 Brazil                            49.0               4751.             97
    ##  9 Spain                             48.4               5274.            109
    ## 10 United Kingdom                    45.4               4819.            106
    ## 11 Russia                            43.5               4044.             93
    ## 12 Switzerland                       38.8               4105.            105
    ## 13 Portugal                          36.3               3568.             98
    ## 14 Ecuador                           35.6               3319.             93
    ## 15 Italy                             33.7               3947.            117
    ## 16 Canada                            29.9               2965.             99
    ## 17 Dominican Republic                28.2               2509.             88
    ## 18 Netherlands                       28.1               2963.            105
    ## 19 Israel                            27.6               2703.             97
    ## 20 Bolivia                           25.9               2079.             80

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.3         249      913
    ##  2 France                 19.2       29537   153557
    ##  3 Belgium                16.0        9683    60348
    ##  4 Italy                  14.5       34514   238159
    ##  5 United Kingdom         14.1       42288   300473
    ##  6 Hungary                13.9         568     4081
    ##  7 Netherlands            12.3        6078    49319
    ##  8 Mexico                 11.9       19080   159793
    ##  9 Spain                  11.1       27136   245268
    ## 10 Sweden                  9.02       5053    56043
    ## 11 Chad                    8.67         74      854
    ## 12 Ecuador                 8.32       4087    49097
    ## 13 Canada                  8.27       8254    99853
    ## 14 Algeria                 7.12        811    11385
    ## 15 Niger                   6.57         67     1020
    ## 16 Romania                 6.38       1473    23080
    ## 17 Sudan                   6.07        487     8020
    ## 18 Burkina Faso            5.90         53      899
    ## 19 Greece                  5.83        188     3227
    ## 20 Mali                    5.61        107     1906

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                931.        9683   10.4 
    ##  2 United Kingdom         678.       42288   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  572.       34514   60.3 
    ##  5 Sweden                 529.        5053    9.56
    ##  6 France                 456.       29537   64.8 
    ##  7 United States          379.      117472  310.  
    ##  8 Netherlands            365.        6078   16.6 
    ##  9 Ecuador                276.        4087   14.8 
    ## 10 Canada                 245.        8254   33.7 
    ## 11 Peru                   243.        7257   29.9 
    ## 12 Brazil                 231.       46510  201.  
    ## 13 Chile                  229.        3841   16.7 
    ## 14 Switzerland            221.        1677    7.58
    ## 15 Mexico                 170.       19080  112.  
    ## 16 Portugal               143.        1524   10.7 
    ## 17 Iran                   121.        9272   76.9 
    ## 18 Denmark                109.         600    5.48
    ## 19 Germany                108.        8856   81.8 
    ## 20 Austria                 83.9        688    8.20

EOL
