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

Updated: 2021-08-20

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
    ##  1 United States           68000. 36924023            543
    ##  2 India                   61801. 32322258            523
    ##  3 Brazil                  38962. 20416183            524
    ##  4 Russia                  12879.  6684531            519
    ##  5 United Kingdom          11902.  6355891            534
    ##  6 France                  11870.  6362616            536
    ##  7 Turkey                  11827.  6138452            519
    ##  8 Argentina                9838.  5096443            518
    ##  9 Colombia                 9391.  4874169            519
    ## 10 Spain                    8870.  4745558            535
    ## 11 Iran                     8422.  4556417            541
    ## 12 Italy                    8207.  4456765            543
    ## 13 Indonesia                7515.  3930300            523
    ## 14 Germany                  7158.  3843775            537
    ## 15 Mexico                   6018.  3123252            519
    ## 16 Poland                   5518.  2886079            523
    ## 17 South Africa             5084.  2638981            519
    ## 18 Ukraine                  4425.  2270226            513
    ## 19 Peru                     4107.  2135827            520
    ## 20 Netherlands              3602.  1909211            530

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                305.             160083.            525
    ##  2 Israel                        250.             131460.            526
    ##  3 Jordan                        238.             122768.            515
    ##  4 Argentina                     238.             123272.            518
    ##  5 Sweden                        220.             116606.            530
    ##  6 United States                 219.             119020.            543
    ##  7 Netherlands                   216.             114702.            530
    ##  8 Belgium                       209.             111445.            533
    ##  9 Colombia                      197.             101991.            519
    ## 10 Brazil                        194.             101521.            524
    ## 11 Serbia                        193.             100249.            518
    ## 12 United Kingdom                191.             101941.            534
    ## 13 Spain                         191.             102042.            535
    ## 14 Chile                         187.              97383.            521
    ## 15 Switzerland                   184.              98152.            534
    ## 16 France                        183.              98236.            536
    ## 17 Portugal                      180.              94565.            524
    ## 18 Hungary                       157.              81224.            517
    ## 19 Austria                       154.              81311.            529
    ## 20 Turkey                        152.              78896.            519

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.1        1411     7372
    ##  2 Peru                 9.25     197539  2135827
    ##  3 Mexico               7.99     249529  3123252
    ##  4 Sudan                7.40       2784    37616
    ##  5 Syria                7.33       1942    26479
    ##  6 Ecuador              6.46      31985   495115
    ##  7 Egypt                5.82      16638   285700
    ##  8 Somalia              5.44        892    16399
    ##  9 China                4.63       5669   122542
    ## 10 Afghanistan          4.62       7047   152411
    ## 11 Bulgaria             4.21      18411   437327
    ## 12 Myanmar              3.81      13945   365759
    ## 13 Bolivia              3.77      18222   483731
    ## 14 Hungary              3.71      30046   810781
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.64        535    14715
    ## 17 Tunisia              3.53      22304   632328
    ## 18 Chad                 3.49        174     4984
    ## 19 Zimbabwe             3.44       4181   121498
    ## 20 Malawi               3.42       2012    58861

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6605.     197539   29.9 
    ##  2 Hungary                3010.      30046    9.98
    ##  3 Czech Republic         2900.      30382   10.5 
    ##  4 Brazil                 2837.     570598  201.  
    ##  5 Argentina              2646.     109405   41.3 
    ##  6 Colombia               2588.     123688   47.8 
    ##  7 Bulgaria               2575.      18411    7.15
    ##  8 Belgium                2432.      25305   10.4 
    ##  9 Paraguay               2427.      15473    6.38
    ## 10 Slovakia               2300.      12547    5.46
    ## 11 Mexico                 2219.     249529  112.  
    ## 12 Chile                  2177.      36456   16.7 
    ## 13 Ecuador                2163.      31985   14.8 
    ## 14 Italy                  2131.     128579   60.3 
    ## 15 Tunisia                2106.      22304   10.6 
    ## 16 United Kingdom         2105.     131260   62.3 
    ## 17 United States          1994.     618468  310.  
    ## 18 Poland                 1956.      75311   38.5 
    ## 19 Bolivia                1832.      18222    9.95
    ## 20 Spain                  1782.      82883   46.5

EOL
