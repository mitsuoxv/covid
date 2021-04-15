WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2021-04-16

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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

## Read data from WHO

WHO offers [Data Table in its Dashboard](https://covid19.who.int/table).
I use the data from
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

I also use the data, like area name and population, from
<https://countrycode.org/>.

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/). One exception
is “West Europe”, which I make by combining “Western”, “Northern” and
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76053. 31029700            408
    ##  2 India                   35452. 14074564            397
    ##  3 Brazil                  34171. 13599994            398
    ##  4 France                  12366.  5069999            410
    ##  5 Russia                  11896.  4675153            393
    ##  6 United Kingdom          10731.  4378309            408
    ##  7 Turkey                  10243.  4025557            393
    ##  8 Italy                    9134.  3809193            417
    ##  9 Spain                    8281.  3387022            409
    ## 10 Germany                  7478.  3073442            411
    ## 11 Poland                   6655.  2642242            397
    ## 12 Argentina                6579.  2579000            392
    ## 13 Colombia                 6537.  2569314            393
    ## 14 Mexico                   5817.  2286133            393
    ## 15 Iran                     5165.  2143794            415
    ## 16 Ukraine                  4919.  1903765            387
    ## 17 Peru                     4212.  1659707            394
    ## 18 Indonesia                3998.  1583182            396
    ## 19 Czech Republic           3994.  1593847            399
    ## 20 South Africa             3973.  1561559            393

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             152143.            399
    ##  2 Israel                        286.             113748.            398
    ##  3 Jordan                        271.             105536.            389
    ##  4 United States                 245.             100021.            408
    ##  5 Sweden                        229.              92653.            404
    ##  6 Serbia                        226.              88756.            392
    ##  7 Belgium                       221.              89908.            407
    ##  8 Netherlands                   204.              82272.            404
    ##  9 Switzerland                   202.              82457.            408
    ## 10 Portugal                      195.              77637.            398
    ## 11 France                        191.              78279.            410
    ## 12 Hungary                       189.              73831.            391
    ## 13 Spain                         178.              72830.            409
    ## 14 Austria                       176.              70762.            403
    ## 15 Slovakia                      175.              68552.            392
    ## 16 Poland                        173.              68630.            397
    ## 17 United Kingdom                172.              70223.            408
    ## 18 Brazil                        170.              67627.            398
    ## 19 Chile                         165.              65343.            395
    ## 20 Argentina                     159.              62380.            392

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1084     5586
    ##  2 Mexico                9.20     210294  2286133
    ##  3 Syria                 6.82       1402    20555
    ##  4 Sudan                 6.66       2194    32932
    ##  5 Egypt                 5.90      12570   212961
    ##  6 Somalia               5.11        656    12837
    ##  7 Ecuador               4.96      17400   350539
    ##  8 China                 4.71       4856   103185
    ##  9 Afghanistan           4.40       2533    57534
    ## 10 Bolivia               4.40      12496   284183
    ## 11 Zimbabwe              4.14       1548    37369
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.91      14871   380576
    ## 14 Niger                 3.72        190     5113
    ## 15 Chad                  3.58        167     4662
    ## 16 Guatemala             3.44       7057   205322
    ## 17 South Africa          3.43      53498  1561559
    ## 18 Tunisia               3.43       9480   276727
    ## 19 Mali                  3.36        419    12467
    ## 20 Malawi                3.35       1134    33891

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2695.      28229   10.5 
    ##  2 Hungary                2457.      24521    9.98
    ##  3 Belgium                2269.      23603   10.4 
    ##  4 Bulgaria               2080.      14871    7.15
    ##  5 United Kingdom         2040.     127161   62.3 
    ##  6 Slovakia               1994.      10877    5.46
    ##  7 Italy                  1915.     115557   60.3 
    ##  8 Mexico                 1870.     210294  112.  
    ##  9 Peru                   1855.      55489   29.9 
    ## 10 United States          1799.     558238  310.  
    ## 11 Brazil                 1782.     358425  201.  
    ## 12 Spain                  1650.      76756   46.5 
    ## 13 Portugal               1586.      16931   10.7 
    ## 14 Poland                 1574.      60612   38.5 
    ## 15 France                 1531.      99145   64.8 
    ## 16 Chile                  1466.      24548   16.7 
    ## 17 Sweden                 1436.      13720    9.56
    ## 18 Argentina              1407.      58174   41.3 
    ## 19 Colombia               1391.      66482   47.8 
    ## 20 Switzerland            1291.       9790    7.58

EOL
