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

Updated: 2021-01-02

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
    ##  1 United States           63432. 19346790            305
    ##  2 India                   35108. 10286709            293
    ##  3 Brazil                  25827.  7619200            295
    ##  4 Russia                  11025.  3186336            289
    ##  5 France                   8419.  2576420            306
    ##  6 United Kingdom           8186.  2488784            304
    ##  7 Italy                    6732.  2107166            313
    ##  8 Spain                    6208.  1893502            305
    ##  9 Germany                  5676.  1742661            307
    ## 10 Colombia                 5628.  1626461            289
    ## 11 Argentina                5565.  1613928            290
    ## 12 Mexico                   4892.  1413935            289
    ## 13 Turkey                   4824.  1394314            289
    ## 14 Poland                   4456.  1305774            293
    ## 15 Iran                     3939.  1225143            311
    ## 16 Ukraine                  3761.  1064479            283
    ## 17 South Africa             3646.  1057561            290
    ## 18 Peru                     3491.  1012614            290
    ## 19 Netherlands              2649.   797516            301
    ## 20 Indonesia                2536.   743198            293

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                237.              69876.            295
    ##  2 Belgium                       205.              62145.            303
    ##  3 United States                 204.              62362.            305
    ##  4 Switzerland                   195.              59369.            305
    ##  5 Israel                        189.              55518.            294
    ##  6 Jordan                        161.              45964.            285
    ##  7 Serbia                        160.              46008.            288
    ##  8 Netherlands                   159.              47913.            301
    ##  9 Sweden                        153.              45771.            300
    ## 10 Austria                       146.              43798.            299
    ## 11 Argentina                     135.              39037.            290
    ## 12 Spain                         133.              40715.            305
    ## 13 Portugal                      132.              38748.            294
    ## 14 United Kingdom                131.              39917.            304
    ## 15 France                        130.              39779.            306
    ## 16 Brazil                        128.              37887.            295
    ## 17 Chile                         125.              36364.            291
    ## 18 Colombia                      118.              34034.            289
    ## 19 Slovakia                      117.              33824.            289
    ## 20 Peru                          117.              33859.            290

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Yemen                                    29.1         611     2103
    ##  2 Mexico                                    8.83     124897  1413935
    ##  3 Ecuador                                   6.60      14034   212512
    ##  4 Sudan                                     6.30       1468    23316
    ##  5 Syria                                     6.22        711    11434
    ##  6 Bolivia                                   5.78       9149   158372
    ##  7 Egypt                                     5.53       7631   138062
    ##  8 China                                     4.95       4789    96762
    ##  9 Chad                                      4.92        104     2113
    ## 10 Iran                                      4.51      55223  1225143
    ## 11 Afghanistan                               4.19       2201    52513
    ## 12 Tanzania                                  4.13         21      509
    ## 13 Mali                                      3.79        269     7090
    ## 14 Bulgaria                                  3.75       7576   202266
    ## 15 Peru                                      3.72      37621  1012614
    ## 16 Italy                                     3.52      74159  2107166
    ## 17 Guatemala                                 3.49       4813   138012
    ## 18 Greece                                    3.48       4838   138850
    ## 19 Nicaragua                                 3.42        165     4829
    ## 20 Democratic Republic of the Congo          3.40        591    17374

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1877.      19528   10.4 
    ##  2 Peru                   1258.      37621   29.9 
    ##  3 Italy                  1229.      74159   60.3 
    ##  4 United Kingdom         1179.      73512   62.3 
    ##  5 Czech Republic         1118.      11711   10.5 
    ##  6 Mexico                 1111.     124897  112.  
    ##  7 Spain                  1085.      50442   46.5 
    ##  8 United States          1082.     335789  310.  
    ##  9 Bulgaria               1060.       7576    7.15
    ## 10 Argentina              1044.      43163   41.3 
    ## 11 France                  992.      64254   64.8 
    ## 12 Chile                   992.      16608   16.7 
    ## 13 Hungary                 968.       9667    9.98
    ## 14 Brazil                  964.     193875  201.  
    ## 15 Ecuador                 949.      14034   14.8 
    ## 16 Switzerland             930.       7049    7.58
    ## 17 Bolivia                 920.       9149    9.95
    ## 18 Sweden                  913.       8727    9.56
    ## 19 Colombia                898.      42909   47.8 
    ## 20 Poland                  752.      28956   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
