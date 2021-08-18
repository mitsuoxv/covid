WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-08-19

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           67855. 36777391            542
    ##  2 India                   61850. 32285857            522
    ##  3 Brazil                  38965. 20378570            523
    ##  4 Russia                  12864.  6663473            518
    ##  5 United Kingdom          11861.  6322245            533
    ##  6 France                  11839.  6334234            535
    ##  7 Turkey                  11811.  6118508            518
    ##  8 Argentina                9842.  5088271            517
    ##  9 Colombia                 9403.  4870922            518
    ## 10 Spain                    8864.  4733602            534
    ## 11 Iran                     8365   4517243            540
    ## 12 Italy                    8209.  4449606            542
    ## 13 Indonesia                7457.  3892479            522
    ## 14 Germany                  7155.  3835375            536
    ## 15 Mexico                   6001.  3108438            518
    ## 16 Poland                   5528.  2885883            522
    ## 17 South Africa             5066.  2624254            518
    ## 18 Ukraine                  4431.  2268666            512
    ## 19 Peru                     4112.  2134365            519
    ## 20 Netherlands              3604.  1906434            529

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                305.             160063.            524
    ##  2 Israel                        248.             130423.            525
    ##  3 Jordan                        239.             122629.            514
    ##  4 Argentina                     238.             123074.            517
    ##  5 Sweden                        220.             116468.            529
    ##  6 United States                 219.             118548.            542
    ##  7 Netherlands                   216.             114535.            529
    ##  8 Belgium                       209.             111181.            532
    ##  9 Colombia                      197.             101923.            518
    ## 10 Brazil                        194.             101334.            523
    ## 11 Serbia                        193.             100045.            517
    ## 12 Spain                         191.             101785.            534
    ## 13 United Kingdom                190.             101402.            533
    ## 14 Chile                         187.              97354.            520
    ## 15 Switzerland                   183.              97720.            533
    ## 16 France                        183.              97798.            535
    ## 17 Portugal                      180.              94285.            523
    ## 18 Hungary                       157.              81212.            516
    ## 19 Austria                       154.              81153.            528
    ## 20 Turkey                        152.              78640.            518

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.2        1407     7347
    ##  2 Peru                 9.25     197487  2134365
    ##  3 Mexico               8.00     248652  3108438
    ##  4 Sudan                7.40       2784    37616
    ##  5 Syria                7.33       1942    26479
    ##  6 Ecuador              6.46      31985   495115
    ##  7 Egypt                5.82      16630   285577
    ##  8 Somalia              5.44        892    16399
    ##  9 China                4.63       5669   122482
    ## 10 Afghanistan          4.62       7043   152363
    ## 11 Bulgaria             4.22      18395   435940
    ## 12 Myanmar              3.78      13623   360291
    ## 13 Bolivia              3.77      18198   483025
    ## 14 Hungary              3.71      30045   810658
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.64        535    14702
    ## 17 Tunisia              3.50      21926   626750
    ## 18 Chad                 3.49        174     4984
    ## 19 Zimbabwe             3.43       4156   121046
    ## 20 Niger                3.42        196     5734

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6603.     197487   29.9 
    ##  2 Hungary                3010.      30045    9.98
    ##  3 Czech Republic         2900.      30378   10.5 
    ##  4 Brazil                 2832.     569492  201.  
    ##  5 Argentina              2639.     109105   41.3 
    ##  6 Colombia               2586.     123580   47.8 
    ##  7 Bulgaria               2573.      18395    7.15
    ##  8 Belgium                2432.      25299   10.4 
    ##  9 Paraguay               2424.      15455    6.38
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2211.     248652  112.  
    ## 12 Chile                  2176.      36438   16.7 
    ## 13 Ecuador                2163.      31985   14.8 
    ## 14 Italy                  2130.     128510   60.3 
    ## 15 United Kingdom         2103.     131149   62.3 
    ## 16 Tunisia                2071.      21926   10.6 
    ## 17 United States          1991.     617628  310.  
    ## 18 Poland                 1956.      75307   38.5 
    ## 19 Bolivia                1829.      18198    9.95
    ## 20 Spain                  1779.      82739   46.5

EOL
