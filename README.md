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

Updated: 2021-08-24

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
    ##  1 United States           68383. 37405329            547
    ##  2 India                   61573. 32449306            527
    ##  3 Brazil                  38933. 20556487            528
    ##  4 Russia                  12938.  6766541            523
    ##  5 United Kingdom          12068.  6492910            538
    ##  6 France                  11932.  6443609            540
    ##  7 Turkey                  11884.  6215663            523
    ##  8 Argentina                9829.  5130852            522
    ##  9 Colombia                 9344.  4886897            523
    ## 10 Spain                    8850.  4770453            539
    ## 11 Iran                     8582.  4677114            545
    ## 12 Italy                    8198.  4484613            547
    ## 13 Indonesia                7569.  3989060            527
    ## 14 Germany                  7157.  3871865            541
    ## 15 Mexico                   6152.  3217415            523
    ## 16 Poland                   5478.  2886805            527
    ## 17 South Africa             5145.  2690973            523
    ## 18 Ukraine                  4400.  2275171            517
    ## 19 Peru                     4086.  2141235            524
    ## 20 Netherlands              3593.  1918769            534

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                303.             160139.            529
    ##  2 Israel                        255.             135248.            530
    ##  3 Argentina                     238.             124104.            522
    ##  4 Jordan                        237.             123219.            519
    ##  5 United States                 220.             120572.            547
    ##  6 Sweden                        219.             116848.            534
    ##  7 Netherlands                   216.             115276.            534
    ##  8 Belgium                       208.             111864.            537
    ##  9 Colombia                      196.             102258.            523
    ## 10 Brazil                        194.             102219.            528
    ## 11 Serbia                        194.             101066.            522
    ## 12 United Kingdom                194.             104139.            538
    ## 13 Spain                         190.             102577.            539
    ## 14 Chile                         186.              97562.            525
    ## 15 Switzerland                   185.              99676.            538
    ## 16 France                        184.              99487.            540
    ## 17 Portugal                      181.              95487.            528
    ## 18 Hungary                       156.              81258.            521
    ## 19 Austria                       154.              81918.            533
    ## 20 Turkey                        153.              79889.            523

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1418     7509
    ##  2 Peru                 9.24     197818  2141235
    ##  3 Mexico               7.86     252927  3217415
    ##  4 Sudan                7.40       2784    37639
    ##  5 Syria                7.33       1964    26799
    ##  6 Ecuador              6.46      31985   495115
    ##  7 Egypt                5.82      16671   286352
    ##  8 Somalia              5.42        897    16535
    ##  9 Afghanistan          4.64       7076   152583
    ## 10 China                4.63       5676   122698
    ## 11 Bulgaria             4.19      18475   441295
    ## 12 Myanmar              3.86      14499   375871
    ## 13 Bolivia              3.76      18296   486394
    ## 14 Hungary              3.70      30052   811121
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        536    14758
    ## 17 Tunisia              3.52      22537   640897
    ## 18 Chad                 3.49        174     4985
    ## 19 Malawi               3.49       2074    59471
    ## 20 Zimbabwe             3.46       4249   122652

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6614.     197818   29.9 
    ##  2 Hungary                3011.      30052    9.98
    ##  3 Czech Republic         2900.      30385   10.5 
    ##  4 Brazil                 2855.     574209  201.  
    ##  5 Argentina              2666.     110217   41.3 
    ##  6 Colombia               2597.     124121   47.8 
    ##  7 Bulgaria               2584.      18475    7.15
    ##  8 Paraguay               2439.      15550    6.38
    ##  9 Belgium                2434.      25320   10.4 
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2249.     252927  112.  
    ## 12 Chile                  2189.      36650   16.7 
    ## 13 Ecuador                2163.      31985   14.8 
    ## 14 Italy                  2134.     128751   60.3 
    ## 15 Tunisia                2128.      22537   10.6 
    ## 16 United Kingdom         2111.     131640   62.3 
    ## 17 United States          2006.     622459  310.  
    ## 18 Poland                 1956.      75316   38.5 
    ## 19 Bolivia                1839.      18296    9.95
    ## 20 Spain                  1788.      83136   46.5

EOL
