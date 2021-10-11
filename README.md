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

Updated: 2021-10-12

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
    ##  1 India                   58978. 33971607            576
    ##  2 United Kingdom          13891.  8154310            587
    ##  3 Russia                  13644.  7804774            572
    ##  4 Turkey                  13015.  7444552            572
    ##  5 France                  11611.  6839116            589
    ##  6 Iran                     9601.  5702890            594
    ##  7 Spain                    8454.  4971311            588
    ##  8 Italy                    7886.  4700316            596
    ##  9 Indonesia                7341.  4228552            576
    ## 10 Germany                  7311.  4313384            590
    ## 11 South Africa             5091.  2912145            572
    ## 12 Poland                   5075   2923304            576
    ## 13 Philippines              4629.  2666562            576
    ## 14 Ukraine                  4505.  2550089            566
    ## 15 Malaysia                 4027.  2339594            581
    ## 16 Iraq                     3513.  2023761            576
    ## 17 Netherlands              3471.  2023691            583
    ## 18 Thailand                 2988.  1720919            576
    ## 19 Czech Republic           2941.  1700078            578
    ## 20 Japan                    2861.  1710973            598

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             177596.            578
    ##  2 Czech Republic                281.             162283.            578
    ##  3 Serbia                        240.             136853.            571
    ##  4 Jordan                        229.             130086.            568
    ##  5 United Kingdom                223.             130786.            587
    ##  6 Netherlands                   209.             121580.            583
    ##  7 Sweden                        208.             121163.            583
    ##  8 Belgium                       207.             121225.            586
    ##  9 Switzerland                   190.             111443.            587
    ## 10 Spain                         182.             106896.            588
    ## 11 France                        179.             105593.            589
    ## 12 Portugal                      175.             100722.            577
    ## 13 Turkey                        167.              95683.            572
    ## 14 Austria                       159.              92332.            581
    ## 15 Hungary                       146.              83095.            570
    ## 16 Malaysia                      142.              82745.            581
    ## 17 Slovakia                      137.              78088.            571
    ## 18 Poland                        132.              75930.            576
    ## 19 Italy                         131.              77897.            596
    ## 20 Bulgaria                      128.              72860.            571

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.0        1778     9369
    ##  2 Sudan                 7.61       2953    38827
    ##  3 Syria                 6.34       2341    36953
    ##  4 Egypt                 5.66      17695   312413
    ##  5 Somalia               5.55       1180    21269
    ##  6 Afghanistan           4.65       7226   155509
    ##  7 China                 4.55       5695   125055
    ##  8 Bulgaria              4.16      21656   520862
    ##  9 Myanmar               3.78      18162   479848
    ## 10 Malawi                3.71       2290    61676
    ## 11 Hungary               3.65      30303   829456
    ## 12 Mali                  3.57        553    15472
    ## 13 Tunisia               3.53      25028   709834
    ## 14 Zimbabwe              3.52       4637   131796
    ## 15 Chad                  3.44        174     5061
    ## 16 Indonesia             3.38     142716  4228552
    ## 17 Niger                 3.34        204     6115
    ## 18 South Africa          3.03      88317  2912145
    ## 19 Slovakia              2.99      12735   425971
    ## 20 Romania               2.90      39629  1365788

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                3036.      30303    9.98
    ##  2 Bulgaria               3029.      21656    7.15
    ##  3 Czech Republic         2912.      30504   10.5 
    ##  4 Belgium                2468.      25675   10.4 
    ##  5 Tunisia                2364.      25028   10.6 
    ##  6 Slovakia               2335.      12735    5.46
    ##  7 United Kingdom         2209.     137735   62.3 
    ##  8 Italy                  2176.     131301   60.3 
    ##  9 Poland                 1971.      75869   38.5 
    ## 10 Spain                  1864.      86701   46.5 
    ## 11 Romania                1805.      39629   22.0 
    ## 12 South Africa           1802.      88317   49   
    ## 13 France                 1772.     114752   64.8 
    ## 14 Portugal               1690.      18041   10.7 
    ## 15 Jordan                 1687.      10811    6.41
    ## 16 Iran                   1594.     122592   76.9 
    ## 17 Sweden                 1560.      14905    9.56
    ## 18 Russia                 1545.     217372  141.  
    ## 19 Switzerland            1409.      10684    7.58
    ## 20 Greece                 1376.      15135   11

EOL
