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

Updated: 2021-08-11

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
    ##  1 United States           66775. 35657845            534
    ##  2 India                   62253. 31998158            514
    ##  3 Brazil                  39156. 20165672            515
    ##  4 Russia                  12728.  6491288            510
    ##  5 France                  11692.  6161607            527
    ##  6 Turkey                  11651.  5942271            510
    ##  7 United Kingdom          11608.  6094247            525
    ##  8 Argentina                9860.  5018895            509
    ##  9 Colombia                 9488.  4838984            510
    ## 10 Spain                    8798.  4627770            526
    ## 11 Italy                    8241.  4400617            534
    ## 12 Iran                     7894.  4199537            532
    ## 13 Indonesia                7235.  3718821            514
    ## 14 Germany                  7186.  3794429            528
    ## 15 Mexico                   5827.  2971817            510
    ## 16 Poland                   5611.  2884361            514
    ## 17 South Africa             4981.  2540222            510
    ## 18 Ukraine                  4484.  2260232            504
    ## 19 Peru                     4159.  2125345            511
    ## 20 Netherlands              3623.  1887831            521

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                310.             159906.            516
    ##  2 Jordan                        240.             121443.            506
    ##  3 Israel                        239.             123514.            517
    ##  4 Argentina                     238.             121396.            509
    ##  5 Sweden                        222.             115587.            521
    ##  6 Netherlands                   218.             113417.            521
    ##  7 United States                 215.             114939.            534
    ##  8 Belgium                       209.             109716.            524
    ##  9 Colombia                      199.             101255.            510
    ## 10 Brazil                        195.             100275.            515
    ## 11 Serbia                        194.              98907.            509
    ## 12 Chile                         189.              96994.            512
    ## 13 Spain                         189.              99509.            526
    ## 14 United Kingdom                186.              97745.            525
    ## 15 Switzerland                   182.              95490.            525
    ## 16 France                        181.              95133.            527
    ## 17 Portugal                      180.              92550.            515
    ## 18 Hungary                       160.              81151.            508
    ## 19 Austria                       154.              80328.            520
    ## 20 Turkey                        150.              76375.            510

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1389     7161
    ##  2 Peru                 9.27     196950  2125345
    ##  3 Mexico               8.22     244420  2971817
    ##  4 Sudan                7.41       2780    37528
    ##  5 Syria                7.36       1922    26116
    ##  6 Ecuador              6.46      31788   491831
    ##  7 Egypt                5.82      16582   284789
    ##  8 Somalia              5.38        858    15939
    ##  9 China                4.65       5661   121837
    ## 10 Afghanistan          4.61       6961   151013
    ## 11 Bulgaria             4.26      18278   428823
    ## 12 Bolivia              3.76      17983   478063
    ## 13 Hungary              3.71      30037   810046
    ## 14 Tanzania             3.66         50     1367
    ## 15 Mali                 3.65        534    14648
    ## 16 Myanmar              3.62      12234   337561
    ## 17 Chad                 3.49        174     4980
    ## 18 Niger                3.45        196     5682
    ## 19 Tunisia              3.44      21089   613628
    ## 20 Paraguay             3.36      15293   455120

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6585.     196950   29.9 
    ##  2 Hungary                3009.      30037    9.98
    ##  3 Czech Republic         2899.      30369   10.5 
    ##  4 Brazil                 2800.     563151  201.  
    ##  5 Argentina              2599.     107459   41.3 
    ##  6 Colombia               2562.     122458   47.8 
    ##  7 Bulgaria               2557.      18278    7.15
    ##  8 Belgium                2429.      25274   10.4 
    ##  9 Paraguay               2399.      15293    6.38
    ## 10 Slovakia               2299.      12543    5.46
    ## 11 Mexico                 2173.     244420  112.  
    ## 12 Chile                  2156.      36107   16.7 
    ## 13 Ecuador                2149.      31788   14.8 
    ## 14 Italy                  2125.     128242   60.3 
    ## 15 United Kingdom         2091.     130357   62.3 
    ## 16 Tunisia                1992.      21089   10.6 
    ## 17 United States          1973.     612060  310.  
    ## 18 Poland                 1955.      75285   38.5 
    ## 19 Bolivia                1808.      17983    9.95
    ## 20 Spain                  1766.      82125   46.5

EOL
