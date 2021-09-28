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

Updated: 2021-09-29

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
    ##  1 United States           73153. 42648573            583
    ##  2 India                   59853. 33697581            563
    ##  3 Brazil                  37858. 21351972            564
    ##  4 United Kingdom          13417.  7701719            574
    ##  5 Russia                  13353.  7464708            559
    ##  6 Turkey                  12641.  7066688            559
    ##  7 France                  11775.  6782789            576
    ##  8 Iran                     9549.  5547990            581
    ##  9 Argentina                9409.  5250402            558
    ## 10 Colombia                 8858.  4951675            559
    ## 11 Spain                    8611.  4951640            575
    ## 12 Italy                    7996.  4662087            583
    ## 13 Indonesia                7477.  4209403            563
    ## 14 Germany                  7285.  4203571            577
    ## 15 Mexico                   6499.  3632800            559
    ## 16 Poland                   5159.  2904631            563
    ## 17 Philippines              4424.  2490858            563
    ## 18 Ukraine                  4343.  2401956            553
    ## 19 Malaysia                 3889.  2209194            568
    ## 20 Peru                     3880.  2173034            560

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        306.             172727.            565
    ##  2 Czech Republic                286.             161349.            565
    ##  3 United States                 236.             137473.            583
    ##  4 Jordan                        231.             128108.            555
    ##  5 Argentina                     228.             126996.            558
    ##  6 Serbia                        224.             124959.            558
    ##  7 United Kingdom                215.             123527.            574
    ##  8 Sweden                        211.             120283.            570
    ##  9 Netherlands                   211.             120029.            570
    ## 10 Belgium                       208.             119039.            573
    ## 11 Switzerland                   191.             109870.            574
    ## 12 Brazil                        188.             106174.            564
    ## 13 Colombia                      185.             103613.            559
    ## 14 Spain                         185.             106473.            575
    ## 15 France                        182.             104724.            576
    ## 16 Portugal                      177.              99960.            564
    ## 17 Chile                         176.              98669.            561
    ## 18 Turkey                        162.              90827.            559
    ## 19 Austria                       157.              89400.            568
    ## 20 Hungary                       148.              82301.            557

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1703     8988
    ##  2 Peru                 9.17     199292  2173034
    ##  3 Mexico               7.58     275450  3632800
    ##  4 Sudan                7.43       2841    38217
    ##  5 Syria                6.65       2215    33323
    ##  6 Ecuador              6.44      32747   508655
    ##  7 Egypt                5.70      17224   302327
    ##  8 Somalia              5.56       1111    19980
    ##  9 Afghanistan          4.64       7201   155093
    ## 10 China                4.57       5691   124538
    ## 11 Bulgaria             4.17      20638   495397
    ## 12 Myanmar              3.83      17583   459436
    ## 13 Bolivia              3.75      18700   498895
    ## 14 Hungary              3.67      30179   821526
    ## 15 Paraguay             3.52      16189   459828
    ## 16 Tunisia              3.51      24794   705474
    ## 17 Indonesia            3.36     141585  4209403
    ## 18 Slovakia             3.08      12606   409621
    ## 19 El Salvador          3.06       3197   104348
    ## 20 Romania              3.03      36658  1210810

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6664.     199292   29.9 
    ##  2 Hungary                3023.      30179    9.98
    ##  3 Brazil                 2956.     594443  201.  
    ##  4 Czech Republic         2907.      30454   10.5 
    ##  5 Bulgaria               2887.      20638    7.15
    ##  6 Argentina              2778.     114862   41.3 
    ##  7 Colombia               2640.     126145   47.8 
    ##  8 Paraguay               2539.      16189    6.38
    ##  9 Belgium                2458.      25568   10.4 
    ## 10 Mexico                 2449.     275450  112.  
    ## 11 Tunisia                2341.      24794   10.6 
    ## 12 Slovakia               2311.      12606    5.46
    ## 13 Chile                  2236.      37445   16.7 
    ## 14 Ecuador                2214.      32747   14.8 
    ## 15 United States          2202.     683243  310.  
    ## 16 United Kingdom         2185.     136208   62.3 
    ## 17 Italy                  2167.     130742   60.3 
    ## 18 Poland                 1964.      75601   38.5 
    ## 19 Bolivia                1880.      18700    9.95
    ## 20 Spain                  1856.      86298   46.5

EOL
