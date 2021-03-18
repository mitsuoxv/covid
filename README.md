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

Updated: 2021-03-19

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
    ##  1 United States           77002. 29260772            380
    ##  2 Brazil                  31361. 11603535            370
    ##  3 India                   31096. 11474605            369
    ##  4 Russia                  12132.  4428239            365
    ##  5 United Kingdom          11249.  4274583            380
    ##  6 France                  10670.  4076169            382
    ##  7 Italy                    8436.  3281810            389
    ##  8 Spain                    8415.  3206116            381
    ##  9 Turkey                   8028.  2930554            365
    ## 10 Germany                  6820.  2612268            383
    ## 11 Colombia                 6327.  2309600            365
    ## 12 Argentina                6071.  2210121            364
    ## 13 Mexico                   5942.  2169007            365
    ## 14 Poland                   5377.  1984248            369
    ## 15 Iran                     4576.  1771115            387
    ## 16 South Africa             4198.  1532497            365
    ## 17 Ukraine                  4189.  1504076            359
    ## 18 Indonesia                3905.  1437283            368
    ## 19 Peru                     3900.  1427604            366
    ## 20 Czech Republic           3878.  1439019            371

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                370.             137363.            371
    ##  2 Israel                        301.             111435.            370
    ##  3 United States                 248.              94319.            380
    ##  4 Jordan                        218.              78806.            361
    ##  5 Belgium                       207.              78645.            379
    ##  6 Portugal                      206.              76393.            370
    ##  7 Sweden                        204.              76609.            376
    ##  8 Switzerland                   199.              75770.            380
    ##  9 Serbia                        199.              72372.            364
    ## 10 Netherlands                   187.              70501.            376
    ## 11 Spain                         181.              68940.            381
    ## 12 United Kingdom                180.              68560.            380
    ## 13 Slovakia                      173.              63148.            364
    ## 14 France                        165.              62935.            382
    ## 15 Austria                       162.              60680.            375
    ## 16 Brazil                        156.              57699.            370
    ## 17 Hungary                       149.              54005.            363
    ## 18 Chile                         147.              54054.            367
    ## 19 Argentina                     147.              53458.            364
    ## 20 Italy                         140.              54388.            389

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               23.5         714     3041
    ##  2 Mexico               9.00     195119  2169007
    ##  3 Syria                6.68       1120    16776
    ##  4 Sudan                6.32       1959    30989
    ##  5 Egypt                5.93      11431   192840
    ##  6 Ecuador              5.33      16300   305598
    ##  7 China                4.73       4849   102450
    ##  8 Bolivia              4.60      11997   260988
    ##  9 Afghanistan          4.39       2462    56044
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.13       1508    36553
    ## 12 Somalia              4.08        392     9600
    ## 13 Mali                 4.06        363     8933
    ## 14 Bulgaria             4.02      11715   291769
    ## 15 Niger                3.77        185     4904
    ## 16 Guatemala            3.60       6619   183991
    ## 17 Chad                 3.58        156     4357
    ## 18 Tunisia              3.48       8463   243439
    ## 19 Iran                 3.47      61492  1771115
    ## 20 Peru                 3.46      49330  1427604

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2302.      24117   10.5 
    ##  2 Belgium                2172.      22600   10.4 
    ##  3 United Kingdom         2018.     125831   62.3 
    ##  4 Hungary                1766.      17628    9.98
    ##  5 Mexico                 1735.     195119  112.  
    ##  6 United States          1714.     531855  310.  
    ##  7 Italy                  1714.     103432   60.3 
    ##  8 Peru                   1649.      49330   29.9 
    ##  9 Bulgaria               1639.      11715    7.15
    ## 10 Slovakia               1616.       8814    5.46
    ## 11 Portugal               1566.      16722   10.7 
    ## 12 Spain                  1565.      72793   46.5 
    ## 13 France                 1403.      90893   64.8 
    ## 14 Brazil                 1403.     282127  201.  
    ## 15 Sweden                 1384.      13228    9.56
    ## 16 Argentina              1307.      54036   41.3 
    ## 17 Chile                  1303.      21816   16.7 
    ## 18 Colombia               1284.      61368   47.8 
    ## 19 Poland                 1257.      48388   38.5 
    ## 20 Switzerland            1242.       9415    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
