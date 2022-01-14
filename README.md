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

Updated: 2022-01-15

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
    ##  1 United States           92336. 62973416            682
    ##  2 India                   54519. 36582129            671
    ##  3 Brazil                  33804. 22716091            672
    ##  4 United Kingdom          22011. 14967821            680
    ##  5 France                  18864. 12903125            684
    ##  6 Russia                  16112. 10747125            667
    ##  7 Turkey                  15398. 10270349            667
    ##  8 Italy                   11802.  8155645            691
    ##  9 Spain                   11611.  7930528            683
    ## 10 Germany                 11438.  7835451            685
    ## 11 Argentina               10200.  6793119            666
    ## 12 Iran                     9020.  6214781            689
    ## 13 Colombia                 8112.  5410698            667
    ## 14 Poland                   6381.  4281482            671
    ## 15 Indonesia                6363.  4269740            671
    ## 16 Mexico                   6262.  4214253            673
    ## 17 Ukraine                  5654.  3737510            661
    ## 18 South Africa             5317.  3546808            667
    ## 19 Netherlands              5111.  3465463            678
    ## 20 Philippines              4608.  3092409            671

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                365.             245699.            673
    ##  2 United Kingdom                353.             240067.            680
    ##  3 Israel                        345.             232380.            674
    ##  4 Belgium                       336.             228689.            681
    ##  5 Switzerland                   315.             214647.            682
    ##  6 Netherlands                   307.             208198.            678
    ##  7 United States                 298.             202988.            682
    ##  8 France                        291.             199219.            684
    ##  9 Serbia                        286.             190592.            666
    ## 10 Denmark                       285.             192631.            676
    ## 11 Jordan                        256.             169863.            663
    ## 12 Austria                       251.             169735.            676
    ## 13 Spain                         250.             170527.            683
    ## 14 Portugal                      247.             166212.            672
    ## 15 Argentina                     247.             164310.            666
    ## 16 Slovakia                      240.             160293.            667
    ## 17 Sweden                        237.             160613.            678
    ## 18 Greece                        218.             146624.            673
    ## 19 Hungary                       200.             132941.            665
    ## 20 Turkey                        198.             132003.            667

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1987    10233
    ##  2 Peru                 8.33     203193  2440349
    ##  3 Mexico               7.14     300764  4214253
    ##  4 Sudan                6.73       3358    49916
    ##  5 Ecuador              5.90      34122   578525
    ##  6 Syria                5.80       2936    50580
    ##  7 Egypt                5.57      22042   395688
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.65       7376   158602
    ## 10 China                4.21       5700   135299
    ## 11 Bulgaria             3.96      31922   806977
    ## 12 Myanmar              3.62      19298   532725
    ## 13 Niger                3.44        286     8306
    ## 14 Paraguay             3.43      16697   486523
    ## 15 Tunisia              3.40      25731   756155
    ## 16 Indonesia            3.38     144163  4269740
    ## 17 Romania              3.15      59150  1875887
    ## 18 El Salvador          3.11       3829   123025
    ## 19 Hungary              3.03      40237  1327014
    ## 20 Malawi               2.99       2445    81890

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6794.     203193   29.9 
    ##  2 Bulgaria               4465.      31922    7.15
    ##  3 Hungary                4031.      40237    9.98
    ##  4 Czech Republic         3513.      36799   10.5 
    ##  5 Slovakia               3151.      17188    5.46
    ##  6 Brazil                 3085.     620371  201.  
    ##  7 Argentina              2850.     117808   41.3 
    ##  8 Belgium                2748.      28589   10.4 
    ##  9 Colombia               2731.     130529   47.8 
    ## 10 United States          2705.     839043  310.  
    ## 11 Romania                2694.      59150   22.0 
    ## 12 Mexico                 2674.     300764  112.  
    ## 13 Poland                 2645.     101841   38.5 
    ## 14 Paraguay               2619.      16697    6.38
    ## 15 Tunisia                2430.      25731   10.6 
    ## 16 United Kingdom         2427.     151342   62.3 
    ## 17 Chile                  2349.      39331   16.7 
    ## 18 Italy                  2323.     140188   60.3 
    ## 19 Ecuador                2307.      34122   14.8 
    ## 20 Russia                 2274.     319911  141.

EOL
