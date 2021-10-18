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

Updated: 2021-10-19

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
    ##  1 United States           71511. 44408612            621
    ##  2 India                   58535. 34067719            582
    ##  3 Brazil                  37046. 21597949            583
    ##  4 United Kingdom          14173.  8404473            593
    ##  5 Russia                  13828.  7992687            578
    ##  6 Turkey                  13201.  7630163            578
    ##  7 France                  11539.  6865883            595
    ##  8 Iran                     9622.  5773419            600
    ##  9 Argentina                9131.  5268653            577
    ## 10 Colombia                 8608.  4975656            578
    ## 11 Spain                    8387.  4982139            594
    ## 12 Italy                    7833.  4715464            602
    ## 13 Germany                  7338.  4373789            596
    ## 14 Indonesia                7276.  4234758            582
    ## 15 Mexico                   6468.  3738749            578
    ## 16 Poland                   5051.  2939590            582
    ## 17 South Africa             5045.  2916179            578
    ## 18 Philippines              4662.  2713455            582
    ## 19 Ukraine                  4607.  2635170            572
    ## 20 Malaysia                 4062.  2384542            587

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        306.             178877.            584
    ##  2 Czech Republic                279.             163128.            584
    ##  3 Serbia                        246.             142108.            577
    ##  4 United States                 231.             143146.            621
    ##  5 Jordan                        228.             131123.            574
    ##  6 United Kingdom                227.             134798.            593
    ##  7 Argentina                     221.             127437.            577
    ##  8 Netherlands                   208.             122800.            589
    ##  9 Belgium                       208.             123029.            592
    ## 10 Sweden                        206.             121593.            589
    ## 11 Switzerland                   189.             112255.            593
    ## 12 Brazil                        184.             107397.            583
    ## 13 Spain                         180.             107129.            594
    ## 14 Colombia                      180.             104115.            578
    ## 15 France                        178.             106007.            595
    ## 16 Portugal                      173.             101100.            583
    ## 17 Chile                         171.              99479.            580
    ## 18 Turkey                        170.              98069.            578
    ## 19 Austria                       160.              93856.            587
    ## 20 Hungary                       145.              83462.            576

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1802     9512
    ##  2 Peru                 9.14     199746  2186246
    ##  3 Mexico               7.57     283193  3738749
    ##  4 Sudan                7.54       2976    39485
    ##  5 Ecuador              6.41      32848   512071
    ##  6 Syria                6.18       2391    38705
    ##  7 Egypt                5.64      17926   317585
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7238   155739
    ## 10 China                4.55       5695   125226
    ## 11 Bulgaria             4.12      22231   539619
    ## 12 Myanmar              3.76      18359   487853
    ## 13 Bolivia              3.72      18811   505157
    ## 14 Malawi               3.71       2292    61712
    ## 15 Hungary              3.64      30351   833115
    ## 16 Mali                 3.57        557    15604
    ## 17 Tunisia              3.53      25085   710773
    ## 18 Paraguay             3.52      16207   460277
    ## 19 Zimbabwe             3.52       4657   132333
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6679.     199746   29.9 
    ##  2 Bulgaria               3110.      22231    7.15
    ##  3 Hungary                3041.      30351    9.98
    ##  4 Brazil                 2991.     601574  201.  
    ##  5 Czech Republic         2916.      30545   10.5 
    ##  6 Argentina              2796.     115582   41.3 
    ##  7 Colombia               2652.     126726   47.8 
    ##  8 Paraguay               2542.      16207    6.38
    ##  9 Mexico                 2518.     283193  112.  
    ## 10 Belgium                2475.      25747   10.4 
    ## 11 Tunisia                2369.      25085   10.6 
    ## 12 Slovakia               2355.      12846    5.46
    ## 13 United States          2305.     715179  310.  
    ## 14 Chile                  2244.      37583   16.7 
    ## 15 United Kingdom         2222.     138527   62.3 
    ## 16 Ecuador                2221.      32848   14.8 
    ## 17 Italy                  2180.     131517   60.3 
    ## 18 Poland                 1977.      76112   38.5 
    ## 19 Romania                1903.      41781   22.0 
    ## 20 Bolivia                1891.      18811    9.95

EOL
