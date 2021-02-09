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
-   [Save data](#save-data)

Updated: 2021-02-10

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
    ##  1 United States           77751. 26746377            344
    ##  2 India                   32672. 10847304            332
    ##  3 Brazil                  28517.  9524640            334
    ##  4 Russia                  12189.  3998216            328
    ##  5 United Kingdom          11544.  3959788            343
    ##  6 France                   9524.  3285786            345
    ##  7 Spain                    8444.  2913425            345
    ##  8 Turkey                   7742.  2539559            328
    ##  9 Italy                    7513.  2644707            352
    ## 10 Germany                  6624.  2291924            346
    ## 11 Colombia                 6577.  2157216            328
    ## 12 Argentina                6019.  1980347            329
    ## 13 Mexico                   5890.  1932145            328
    ## 14 Poland                   4688.  1556685            332
    ## 15 South Africa             4491.  1477511            329
    ## 16 Iran                     4210.  1473756            350
    ## 17 Ukraine                  3881.  1249646            322
    ## 18 Peru                     3607.  1186698            329
    ## 19 Indonesia                3512.  1166079            332
    ## 20 Czech Republic           3129.  1045132            334

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                299.              99764.            334
    ##  2 Israel                        282.              93978.            333
    ##  3 United States                 251.              86214.            344
    ##  4 Portugal                      216.              71929.            333
    ##  5 Switzerland                   205.              70249.            343
    ##  6 Belgium                       204.              69834.            342
    ##  7 United Kingdom                185.              63511.            343
    ##  8 Spain                         182.              62646.            345
    ##  9 Sweden                        181.              61539.            339
    ## 10 Netherlands                   179.              60558.            339
    ## 11 Serbia                        171.              55800.            327
    ## 12 Jordan                        162.              52573.            324
    ## 13 Austria                       152.              51365.            338
    ## 14 Slovakia                      148.              48727.            328
    ## 15 France                        147.              50731.            345
    ## 16 Argentina                     146.              47900.            329
    ## 17 Brazil                        142.              47362.            334
    ## 18 Colombia                      138.              45139.            328
    ## 19 Chile                         137.              45105.            330
    ## 20 Italy                         125.              43830.            352

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         616     2134
    ##  2 Mexico               8.60     166200  1932145
    ##  3 Syria                6.58        958    14551
    ##  4 Sudan                6.15       1835    29851
    ##  5 Ecuador              5.81      15013   258607
    ##  6 Egypt                5.70       9699   170207
    ##  7 China                4.77       4831   101363
    ##  8 Bolivia              4.74      10796   227967
    ##  9 Afghanistan          4.36       2414    55384
    ## 10 Bulgaria             4.19       9420   224849
    ## 11 Mali                 4.14        339     8181
    ## 12 Tanzania             4.13         21      509
    ## 13 Iran                 3.97      58536  1473756
    ## 14 Zimbabwe             3.86       1339    34658
    ## 15 Greece               3.64       5997   164575
    ## 16 Guatemala            3.63       5922   163247
    ## 17 Niger                3.59        166     4621
    ## 18 Peru                 3.57      42308  1186698
    ## 19 Chad                 3.56        125     3508
    ## 20 Hungary              3.50      13249   378734

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2059.      21423   10.4 
    ##  2 United Kingdom         1809.     112798   62.3 
    ##  3 Czech Republic         1670.      17497   10.5 
    ##  4 Italy                  1518.      91580   60.3 
    ##  5 United States          1483.     459993  310.  
    ##  6 Mexico                 1478.     166200  112.  
    ##  7 Peru                   1415.      42308   29.9 
    ##  8 Portugal               1345.      14354   10.7 
    ##  9 Hungary                1327.      13249    9.98
    ## 10 Bulgaria               1318.       9420    7.15
    ## 11 Spain                  1307.      60802   46.5 
    ## 12 Sweden                 1268.      12115    9.56
    ## 13 France                 1220.      79016   64.8 
    ## 14 Argentina              1189.      49171   41.3 
    ## 15 Colombia               1172.      55993   47.8 
    ## 16 Switzerland            1170.       8872    7.58
    ## 17 Brazil                 1151.     231534  201.  
    ## 18 Chile                  1138.      19056   16.7 
    ## 19 Bolivia                1085.      10796    9.95
    ## 20 Poland                 1022.      39360   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
