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

Updated: 2022-03-16

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          106191. 78793916            742
    ##  2 India                   58818. 42996062            731
    ##  3 Brazil                  40121. 29368776            732
    ##  4 France                  30679. 22824960            744
    ##  5 United Kingdom          26551. 19700956            742
    ##  6 Russia                  23952. 17412919            727
    ##  7 Germany                 23399. 17432617            745
    ##  8 Turkey                  20048. 14575178            727
    ##  9 Italy                   17847. 13402905            751
    ## 10 Spain                   15155. 11260125            743
    ## 11 Argentina               12364.  8976079            726
    ## 12 Netherlands              9775.  7214075            738
    ## 13 South Korea              9587.  7228550            754
    ## 14 Iran                     9515.  7126906            749
    ## 15 Vietnam                  8821.  6377438            723
    ## 16 Colombia                 8359.  6076819            727
    ## 17 Indonesia                8071.  5900124            731
    ## 18 Poland                   7984.  5836672            731
    ## 19 Japan                    7713.  5808242            753
    ## 20 Mexico                   7649.  5606827            733

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       733.             539478.            736
    ##  2 Israel                        690.             506788.            734
    ##  3 Netherlands                   587.             433408.            738
    ##  4 Switzerland                   556.             412545.            742
    ##  5 Austria                       533.             392430.            736
    ##  6 Czech Republic                481.             352886.            733
    ##  7 Belgium                       475.             351637.            741
    ##  8 France                        474.             352409.            744
    ##  9 Portugal                      437.             319690.            732
    ## 10 United Kingdom                426.             315982.            742
    ## 11 Slovakia                      400.             290768.            727
    ## 12 Serbia                        364.             264502.            726
    ## 13 Norway                        364.             269882.            741
    ## 14 Jordan                        363.             262238.            723
    ## 15 Sweden                        350.             258424.            738
    ## 16 United States                 342.             253983.            742
    ## 17 Greece                        330.             241663.            733
    ## 18 Spain                         326.             242122.            743
    ## 19 Argentina                     299.             217111.            726
    ## 20 Italy                         296.             222122.            751

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2139    11793
    ##  2 Sudan                 7.90       4874    61715
    ##  3 Peru                  5.98     211546  3536496
    ##  4 Mexico                5.73     321103  5606827
    ##  5 Syria                 5.63       3117    55399
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.90      24277   495373
    ##  8 Afghanistan           4.33       7645   176409
    ##  9 Ecuador               4.16      35347   849386
    ## 10 Niger                 3.51        308     8781
    ## 11 Bulgaria              3.24      36162  1115132
    ## 12 Myanmar               3.20      19411   606227
    ## 13 Malawi                3.07       2623    85504
    ## 14 Paraguay              2.87      18538   645883
    ## 15 Tunisia               2.73      28062  1029596
    ## 16 Haiti                 2.71        827    30461
    ## 17 South Africa          2.70      99725  3695175
    ## 18 El Salvador           2.62       4101   156364
    ## 19 Chad                  2.61        190     7269
    ## 20 Honduras              2.60      10834   416729

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7073.     211546   29.9 
    ##  2 Bulgaria               5058.      36162    7.15
    ##  3 Hungary                4473.      44653    9.98
    ##  4 Czech Republic         3743.      39216   10.5 
    ##  5 Slovakia               3479.      18979    5.46
    ##  6 Brazil                 3257.     655078  201.  
    ##  7 United States          3097.     960703  310.  
    ##  8 Argentina              3078.     127257   41.3 
    ##  9 Poland                 2951.     113622   38.5 
    ## 10 Romania                2932.      64381   22.0 
    ## 11 Belgium                2927.      30445   10.4 
    ## 12 Colombia               2915.     139297   47.8 
    ## 13 Paraguay               2908.      18538    6.38
    ## 14 Mexico                 2855.     321103  112.  
    ## 15 Tunisia                2650.      28062   10.6 
    ## 16 Chile                  2628.      44005   16.7 
    ## 17 United Kingdom         2612.     162873   62.3 
    ## 18 Italy                  2602.     156997   60.3 
    ## 19 Russia                 2572.     361902  141.  
    ## 20 Greece                 2421.      26635   11

EOL
