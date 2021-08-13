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

Updated: 2021-08-14

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
    ##  1 United States           67224. 36099344            537
    ##  2 India                   62123. 32117826            517
    ##  3 Brazil                  39083. 20245085            518
    ##  4 Russia                  12782.  6557068            513
    ##  5 France                  11783.  6244939            530
    ##  6 Turkey                  11732.  6018485            513
    ##  7 United Kingdom          11703.  6179510            528
    ##  8 Argentina                9869.  5052884            512
    ##  9 Colombia                 9459.  4852323            513
    ## 10 Spain                    8843.  4677883            529
    ## 11 Italy                    8231.  4420429            537
    ## 12 Iran                     8075.  4320266            535
    ## 13 Indonesia                7359.  3804943            517
    ## 14 Germany                  7176.  3810641            531
    ## 15 Mexico                   5888.  3020596            513
    ## 16 Poland                   5580.  2884974            517
    ## 17 South Africa             5007.  2568511            513
    ## 18 Ukraine                  4465.  2263864            507
    ## 19 Peru                     4141.  2128516            514
    ## 20 Netherlands              3616.  1894667            524

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                308.             159972.            519
    ##  2 Israel                        242.             126056.            520
    ##  3 Jordan                        239.             121667.            509
    ##  4 Argentina                     239.             122218.            512
    ##  5 Sweden                        221.             116066.            524
    ##  6 Netherlands                   217.             113828.            524
    ##  7 United States                 217.             116362.            537
    ##  8 Belgium                       209.             110339.            527
    ##  9 Colombia                      198.             101534.            513
    ## 10 Brazil                        194.             100670.            518
    ## 11 Serbia                        194.              99274.            512
    ## 12 Spain                         190.             100587.            529
    ## 13 Chile                         189.              97130.            515
    ## 14 United Kingdom                188.              99112.            528
    ## 15 Switzerland                   182.              96299.            528
    ## 16 France                        182.              96420.            530
    ## 17 Portugal                      180.              93289.            518
    ## 18 Hungary                       159.              81178.            511
    ## 19 Austria                       154.              80615.            523
    ## 20 Turkey                        151.              77354.            513

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1392     7213
    ##  2 Peru                 9.26     197146  2128516
    ##  3 Mexico               8.15     246203  3020596
    ##  4 Sudan                7.40       2780    37543
    ##  5 Syria                7.36       1927    26165
    ##  6 Ecuador              6.46      31837   493148
    ##  7 Egypt                5.82      16597   284966
    ##  8 Somalia              5.37        864    16103
    ##  9 China                4.64       5665   122168
    ## 10 Afghanistan          4.61       7000   151770
    ## 11 Bulgaria             4.25      18321   431292
    ## 12 Bolivia              3.77      18109   480229
    ## 13 Hungary              3.71      30038   810316
    ## 14 Myanmar              3.70      12879   348186
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.64        534    14670
    ## 17 Chad                 3.49        174     4981
    ## 18 Tunisia              3.45      21310   618124
    ## 19 Niger                3.43        196     5716
    ## 20 Zimbabwe             3.41       4047   118754

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6592.     197146   29.9 
    ##  2 Hungary                3009.      30038    9.98
    ##  3 Czech Republic         2899.      30372   10.5 
    ##  4 Brazil                 2813.     565748  201.  
    ##  5 Argentina              2622.     108388   41.3 
    ##  6 Colombia               2573.     122953   47.8 
    ##  7 Bulgaria               2563.      18321    7.15
    ##  8 Belgium                2431.      25285   10.4 
    ##  9 Paraguay               2410.      15363    6.38
    ## 10 Slovakia               2300.      12544    5.46
    ## 11 Mexico                 2189.     246203  112.  
    ## 12 Chile                  2164.      36243   16.7 
    ## 13 Ecuador                2153.      31837   14.8 
    ## 14 Italy                  2127.     128334   60.3 
    ## 15 United Kingdom         2096.     130701   62.3 
    ## 16 Tunisia                2012.      21310   10.6 
    ## 17 United States          1980.     614267  310.  
    ## 18 Poland                 1956.      75297   38.5 
    ## 19 Bolivia                1820.      18109    9.95
    ## 20 Spain                  1772.      82407   46.5

EOL
