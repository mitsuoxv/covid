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

Updated: 2021-03-13

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
    ##  1 United States           77380. 28940137            374
    ##  2 India                   31154. 11308846            363
    ##  3 Brazil                  30775. 11202305            364
    ##  4 Russia                  12174.  4370617            359
    ##  5 United Kingdom          11341.  4241681            374
    ##  6 France                  10429.  3921613            376
    ##  7 Spain                    8475.  3178356            375
    ##  8 Italy                    8222.  3149017            383
    ##  9 Turkey                   7899.  2835989            359
    ## 10 Germany                  6752.  2545781            377
    ## 11 Colombia                 6367.  2285960            359
    ## 12 Argentina                6083.  2177898            358
    ## 13 Mexico                   5973.  2144558            359
    ## 14 Poland                   5147.  1868297            363
    ## 15 Iran                     4523.  1723470            381
    ## 16 South Africa             4261.  1525648            358
    ## 17 Ukraine                  4075.  1438468            353
    ## 18 Indonesia                3867.  1403722            363
    ## 19 Peru                     3854.  1387457            360
    ## 20 Czech Republic           3772.  1376998            365

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                360.             131443.            365
    ##  2 Israel                        301.             109635.            364
    ##  3 United States                 249.              93285.            374
    ##  4 Portugal                      209.              76112.            364
    ##  5 Belgium                       206.              76719.            373
    ##  6 Jordan                        201.              71351.            355
    ##  7 Sweden                        200.              74006.            370
    ##  8 Switzerland                   200.              74744.            374
    ##  9 Serbia                        191.              68523.            358
    ## 10 Netherlands                   185.              68417.            370
    ## 11 Spain                         182.              68343.            375
    ## 12 United Kingdom                182.              68032.            374
    ## 13 Slovakia                      171.              61205.            358
    ## 14 France                        161.              60548.            376
    ## 15 Austria                       159.              58705.            369
    ## 16 Brazil                        153.              55704.            364
    ## 17 Argentina                     147.              52679.            358
    ## 18 Chile                         144.              52161.            361
    ## 19 Hungary                       140.              49908.            357
    ## 20 Italy                         136.              52188.            383

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               25.0         668     2671
    ##  2 Mexico               8.98     192488  2144558
    ##  3 Syria                6.67       1085    16257
    ##  4 Sudan                6.28       1940    30873
    ##  5 Egypt                5.91      11169   189000
    ##  6 Ecuador              5.43      16105   296841
    ##  7 China                4.74       4849   102203
    ##  8 Bolivia              4.63      11884   256462
    ##  9 Afghanistan          4.39       2454    55959
    ## 10 Tanzania             4.13         21      509
    ## 11 Zimbabwe             4.10       1492    36377
    ## 12 Mali                 4.09        359     8782
    ## 13 Bulgaria             4.07      11094   272700
    ## 14 Somalia              3.83        338     8820
    ## 15 Niger                3.71        180     4853
    ## 16 Guatemala            3.61       6531   181143
    ## 17 Chad                 3.56        151     4246
    ## 18 Iran                 3.54      61016  1723470
    ## 19 Peru                 3.48      48323  1387457
    ## 20 Tunisia              3.46       8313   239977

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2183.      22865   10.5 
    ##  2 Belgium                2150.      22370   10.4 
    ##  3 United Kingdom         2008.     125168   62.3 
    ##  4 Mexico                 1711.     192488  112.  
    ##  5 United States          1694.     525495  310.  
    ##  6 Italy                  1677.     101184   60.3 
    ##  7 Hungary                1666.      16627    9.98
    ##  8 Peru                   1616.      48323   29.9 
    ##  9 Portugal               1558.      16635   10.7 
    ## 10 Bulgaria               1552.      11094    7.15
    ## 11 Spain                  1550.      72085   46.5 
    ## 12 Slovakia               1530.       8346    5.46
    ## 13 France                 1379.      89342   64.8 
    ## 14 Sweden                 1372.      13111    9.56
    ## 15 Brazil                 1346.     270656  201.  
    ## 16 Argentina              1294.      53493   41.3 
    ## 17 Chile                  1276.      21362   16.7 
    ## 18 Colombia               1272.      60773   47.8 
    ## 19 Switzerland            1233.       9348    7.58
    ## 20 Poland                 1214.      46724   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
