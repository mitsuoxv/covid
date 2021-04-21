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

Updated: 2021-04-22

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
    ##  1 United States           75860. 31406215            414
    ##  2 India                   38749. 15616130            403
    ##  3 Brazil                  34588. 13973695            404
    ##  4 France                  12637.  5257093            416
    ##  5 Russia                  11847.  4727125            399
    ##  6 Turkey                  10989.  4384624            399
    ##  7 United Kingdom          10612.  4393311            414
    ##  8 Italy                    9198.  3891063            423
    ##  9 Spain                    8279.  3435840            415
    ## 10 Germany                  7645.  3188192            417
    ## 11 Argentina                6820.  2714475            398
    ## 12 Poland                   6745.  2718493            403
    ## 13 Colombia                 6684.  2667136            399
    ## 14 Mexico                   5781.  2306910            399
    ## 15 Iran                     5432.  2286927            421
    ## 16 Ukraine                  5023.  1974118            393
    ## 17 Peru                     4269.  1707787            400
    ## 18 Indonesia                4017.  1614849            402
    ## 19 Czech Republic           3975.  1609861            405
    ## 20 South Africa             3930.  1568366            399

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             153671.            405
    ##  2 Israel                        282.             113873.            404
    ##  3 Jordan                        273.             108034.            395
    ##  4 United States                 245.             101234.            414
    ##  5 Sweden                        234.              95944.            410
    ##  6 Serbia                        228.              90940.            398
    ##  7 Belgium                       222.              91806.            413
    ##  8 Netherlands                   208.              85177.            410
    ##  9 Switzerland                   203.              83963.            414
    ## 10 France                        195.              81168.            416
    ## 11 Portugal                      193.              77899.            404
    ## 12 Hungary                       191.              75873.            397
    ## 13 Spain                         178.              73880.            415
    ## 14 Austria                       177.              72402.            409
    ## 15 Poland                        175.              70610.            403
    ## 16 Slovakia                      174.              69198.            398
    ## 17 Brazil                        172.              69485.            404
    ## 18 United Kingdom                170.              70464.            414
    ## 19 Chile                         169.              67861.            401
    ## 20 Argentina                     165.              65657.            398

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.2        1139     5922
    ##  2 Mexico                9.21     212466  2306910
    ##  3 Syria                 6.85       1468    21433
    ##  4 Sudan                 6.70       2222    33157
    ##  5 Egypt                 5.88      12820   218041
    ##  6 Somalia               5.10        680    13324
    ##  7 Ecuador               4.91      17744   361154
    ##  8 China                 4.70       4856   103371
    ##  9 Afghanistan           4.39       2557    58214
    ## 10 Bolivia               4.36      12666   290362
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1554    37875
    ## 13 Bulgaria              3.97      15518   390911
    ## 14 Niger                 3.72        191     5140
    ## 15 Chad                  3.58        169     4723
    ## 16 South Africa          3.44      53887  1568366
    ## 17 Tunisia               3.43       9918   289230
    ## 18 Hungary               3.40      25787   757360
    ## 19 Guatemala             3.39       7279   214700
    ## 20 Peru                  3.37      57537  1707787

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2741.      28711   10.5 
    ##  2 Hungary                2583.      25787    9.98
    ##  3 Belgium                2291.      23834   10.4 
    ##  4 Bulgaria               2171.      15518    7.15
    ##  5 Slovakia               2072.      11304    5.46
    ##  6 United Kingdom         2042.     127307   62.3 
    ##  7 Italy                  1949.     117633   60.3 
    ##  8 Peru                   1924.      57537   29.9 
    ##  9 Mexico                 1889.     212466  112.  
    ## 10 Brazil                 1863.     374682  201.  
    ## 11 United States          1813.     562435  310.  
    ## 12 Spain                  1660.      77216   46.5 
    ## 13 Poland                 1649.      63473   38.5 
    ## 14 Portugal               1588.      16951   10.7 
    ## 15 France                 1558.     100917   64.8 
    ## 16 Chile                  1512.      25317   16.7 
    ## 17 Sweden                 1447.      13825    9.56
    ## 18 Argentina              1439.      59476   41.3 
    ## 19 Colombia               1439.      68748   47.8 
    ## 20 Jordan                 1307.       8372    6.41

EOL
