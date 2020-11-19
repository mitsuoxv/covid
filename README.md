WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2020-11-20

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           42936. 11249228            262
    ##  2 India                   35833.  8958483            250
    ##  3 Brazil                  23459.  5911758            252
    ##  4 Russia                   8193.  2015608            246
    ##  5 France                   7710.  2027727            263
    ##  6 Spain                    5567.  1458591            262
    ##  7 United Kingdom           5480.  1430345            261
    ##  8 Argentina                5380.  1329005            247
    ##  9 Colombia                 4923.  1211128            246
    ## 10 Italy                    4712.  1272352            270
    ## 11 Mexico                   4110.  1011153            246
    ## 12 Peru                     3805.   939931            247
    ## 13 Germany                  3242.   855916            264
    ## 14 Poland                   3091.   772823            250
    ## 15 South Africa             3065.   757144            247
    ## 16 Iran                     2992.   801894            268
    ## 17 Ukraine                  2431.   583510            240
    ## 18 Chile                    2155.   534558            248
    ## 19 Iraq                     2107.   526852            250
    ## 20 Belgium                  2098.   545691            260

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      202.               52455.            260
    ##  2 Czech Republic               180.               45369.            252
    ##  3 Israel                       176.               44299.            252
    ##  4 Switzerland                  141.               36878.            262
    ##  5 United States                138.               36261.            262
    ##  6 Argentina                    130.               32146.            247
    ##  7 Chile                        129.               31921.            248
    ##  8 Peru                         127.               31428.            247
    ##  9 Spain                        120.               31364.            262
    ## 10 France                       119.               31307.            263
    ## 11 Brazil                       117.               29397.            252
    ## 12 Netherlands                  107.               27700.            258
    ## 13 Jordan                       106.               25585.            242
    ## 14 Austria                      105.               26963.            256
    ## 15 Colombia                     103.               25343.            246
    ## 16 Portugal                      88.0              22107.            251
    ## 17 United Kingdom                87.9              22941.            261
    ## 18 Poland                        80.3              20073.            250
    ## 19 Sweden                        79.9              20558.            257
    ## 20 Italy                         78.1              21086.            270

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         604     2072
    ##  2 Mexico                  9.79      99026  1011153
    ##  3 Sudan                   7.81       1175    15047
    ##  4 Ecuador                 7.16      13052   182250
    ##  5 Chad                    6.25        101     1616
    ##  6 Bolivia                 6.18       8866   143473
    ##  7 Egypt                   5.82       6495   111613
    ##  8 Iran                    5.35      42941   801894
    ##  9 Niger                   5.26         70     1331
    ## 10 Syria                   5.17        358     6919
    ## 11 China                   5.13       4749    92513
    ## 12 Tanzania                4.13         21      509
    ## 13 Peru                    3.76      35317   939931
    ## 14 Afghanistan             3.75       1645    43851
    ## 15 United Kingdom          3.72      53274  1430345
    ## 16 Italy                   3.71      47217  1272352
    ## 17 Canada                  3.62      11086   306468
    ## 18 Mali                    3.54        141     3980
    ## 19 Nicaragua               3.47        159     4583
    ## 20 Guatemala               3.44       4008   116381

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1444.      15025   10.4 
    ##  2 Peru                   1181.      35317   29.9 
    ##  3 Bolivia                 891.       8866    9.95
    ##  4 Chile                   890.      14897   16.7 
    ##  5 Ecuador                 882.      13052   14.8 
    ##  6 Mexico                  880.      99026  112.  
    ##  7 Spain                   877.      40769   46.5 
    ##  8 Argentina               873.      36106   41.3 
    ##  9 United Kingdom          854.      53274   62.3 
    ## 10 Brazil                  829.     166699  201.  
    ## 11 United States           795.     246746  310.  
    ## 12 Italy                   783.      47217   60.3 
    ## 13 Colombia                719.      34381   47.8 
    ## 14 France                  716.      46351   64.8 
    ## 15 Sweden                  661.       6321    9.56
    ## 16 Czech Republic          643.       6740   10.5 
    ## 17 Iran                    558.      42941   76.9 
    ## 18 Netherlands             522.       8686   16.6 
    ## 19 Switzerland             445.       3377    7.58
    ## 20 Romania                 429.       9429   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
