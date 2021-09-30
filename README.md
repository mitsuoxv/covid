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

Updated: 2021-10-01

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
    ##  1 United States           73448. 42966938            585
    ##  2 India                   59717. 33739980            565
    ##  3 Brazil                  37777. 21381790            566
    ##  4 United Kingdom          13492.  7771298            576
    ##  5 Russia                  13388.  7511026            561
    ##  6 Turkey                  12700.  7124966            561
    ##  7 France                  11754.  6794096            578
    ##  8 Iran                     9559.  5572962            583
    ##  9 Argentina                9381.  5253765            560
    ## 10 Colombia                 8831.  4954376            561
    ## 11 Spain                    8590.  4956691            577
    ## 12 Italy                    7980.  4668261            585
    ## 13 Indonesia                7460.  4215104            565
    ## 14 Germany                  7301.  4227501            579
    ## 15 Mexico                   6498.  3645599            561
    ## 16 South Africa             5171.  2900994            561
    ## 17 Poland                   5145.  2907071            565
    ## 18 Philippines              4488.  2535732            565
    ## 19 Ukraine                  4366.  2423379            555
    ## 20 Malaysia                 3917.  2232960            570

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             173869.            567
    ##  2 Czech Republic                285.             161463.            567
    ##  3 United States                 237.             138499.            585
    ##  4 Jordan                        231.             128435.            557
    ##  5 Serbia                        227.             127224.            560
    ##  6 Argentina                     227.             127077.            560
    ##  7 United Kingdom                216.             124643.            576
    ##  8 Sweden                        211.             120557.            572
    ##  9 Netherlands                   210.             120237.            572
    ## 10 Belgium                       208.             119468.            575
    ## 11 Switzerland                   191.             110231.            576
    ## 12 Brazil                        188.             106322.            566
    ## 13 Colombia                      185.             103670.            561
    ## 14 Spain                         185.             106582.            577
    ## 15 France                        181.             104898.            578
    ## 16 Portugal                      177.             100087.            566
    ## 17 Chile                         175.              98731.            563
    ## 18 Turkey                        163.              91576.            561
    ## 19 Austria                       158.              89872.            570
    ## 20 Hungary                       147.              82419.            559

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1715     9039
    ##  2 Peru                 9.17     199329  2174219
    ##  3 Mexico               7.58     276376  3645599
    ##  4 Sudan                7.42       2842    38283
    ##  5 Syria                6.60       2238    33933
    ##  6 Ecuador              6.43      32762   509238
    ##  7 Egypt                5.69      17294   303783
    ##  8 Somalia              5.56       1111    19980
    ##  9 Afghanistan          4.64       7204   155174
    ## 10 China                4.57       5691   124629
    ## 11 Bulgaria             4.16      20812   500112
    ## 12 Myanmar              3.82      17735   464076
    ## 13 Bolivia              3.75      18716   499648
    ## 14 Malawi               3.71       2281    61552
    ## 15 Hungary              3.67      30190   822705
    ## 16 Mali                 3.61        548    15195
    ## 17 Zimbabwe             3.54       4616   130485
    ## 18 Paraguay             3.52      16193   459899
    ## 19 Tunisia              3.52      24842   706314
    ## 20 Chad                 3.45        174     5039

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6665.     199329   29.9 
    ##  2 Hungary                3024.      30190    9.98
    ##  3 Brazil                 2961.     595446  201.  
    ##  4 Bulgaria               2911.      20812    7.15
    ##  5 Czech Republic         2908.      30459   10.5 
    ##  6 Argentina              2783.     115038   41.3 
    ##  7 Colombia               2641.     126219   47.8 
    ##  8 Paraguay               2540.      16193    6.38
    ##  9 Belgium                2460.      25595   10.4 
    ## 10 Mexico                 2457.     276376  112.  
    ## 11 Tunisia                2346.      24842   10.6 
    ## 12 Slovakia               2317.      12637    5.46
    ## 13 Chile                  2237.      37455   16.7 
    ## 14 United States          2218.     688099  310.  
    ## 15 Ecuador                2215.      32762   14.8 
    ## 16 United Kingdom         2190.     136525   62.3 
    ## 17 Italy                  2169.     130870   60.3 
    ## 18 Poland                 1965.      75650   38.5 
    ## 19 Bolivia                1881.      18716    9.95
    ## 20 Spain                  1858.      86397   46.5

EOL
