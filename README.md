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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-06-16

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
    ##  1 United States          101568. 84708007            834
    ##  2 India                   52546. 43245517            823
    ##  3 Brazil                  38317. 31497038            822
    ##  4 France                  34700. 29009234            836
    ##  5 Germany                 32228. 27007429            838
    ##  6 United Kingdom          26885. 22422615            834
    ##  7 Russia                  22448. 18385098            819
    ##  8 South Korea             21570. 18248479            846
    ##  9 Italy                   21001. 17703887            843
    ## 10 Turkey                  18419. 15085742            819
    ## 11 Spain                   14988. 12515127            835
    ## 12 Vietnam                 13170. 10733285            815
    ## 13 Argentina               11289.  9313453            825
    ## 14 Japan                   10741.  9075966            845
    ## 15 Netherlands              9772.  8110818            830
    ## 16 Australia                9181.  7583518            826
    ## 17 Iran                     8602.  7234042            841
    ## 18 Colombia                 7479.  6117847            818
    ## 19 Indonesia                7367.  6063251            823
    ## 20 Poland                   7303.  6010643            823

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       693.             574067.            828
    ##  2 Israel                        692.             571373.            826
    ##  3 Austria                       638.             528337.            828
    ##  4 Netherlands                   587.             487283.            830
    ##  5 Switzerland                   583.             485988.            834
    ##  6 Portugal                      567.             467005.            823
    ##  7 France                        536.             447892.            836
    ##  8 Belgium                       482.             401561.            833
    ##  9 Czech Republic                454.             374565.            825
    ## 10 South Korea                   445.             376858.            846
    ## 11 United Kingdom                431.             359634.            834
    ## 12 Australia                     427.             352464.            826
    ## 13 Slovakia                      401.             328440.            819
    ## 14 Germany                       394.             330155.            838
    ## 15 Greece                        387.             318965.            825
    ## 16 Italy                         348.             293401.            843
    ## 17 Norway                        345.             286944.            832
    ## 18 Serbia                        336.             275152.            818
    ## 19 United States                 327.             273047.            834
    ## 20 Jordan                        325.             264968.            815

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4950    62489
    ##  3 Peru                 5.94     213338  3591816
    ##  4 Syria                5.63       3150    55908
    ##  5 Mexico               5.58     325205  5825532
    ##  6 Somalia              5.10       1361    26675
    ##  7 Egypt                4.81      24720   514008
    ##  8 Afghanistan          4.25       7710   181236
    ##  9 Ecuador              4.00      35659   890852
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37206  1167314
    ## 12 Myanmar              3.17      19434   613460
    ## 13 Malawi               3.07       2642    86107
    ## 14 Paraguay             2.90      18932   652044
    ## 15 Tunisia              2.74      28655  1044426
    ## 16 Haiti                2.70        837    31054
    ## 17 Chad                 2.60        193     7420
    ## 18 Algeria              2.59       6875   265937
    ## 19 Indonesia            2.58     156670  6063251
    ## 20 Honduras             2.56      10902   425655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7133.     213338   29.9 
    ##  2 Bulgaria               5205.      37206    7.15
    ##  3 Hungary                4668.      46594    9.98
    ##  4 Czech Republic         3847.      40303   10.5 
    ##  5 Slovakia               3688.      20119    5.46
    ##  6 Chile                  3471.      58119   16.7 
    ##  7 Brazil                 3323.     668180  201.  
    ##  8 United States          3229.    1001895  310.  
    ##  9 Argentina              3120.     128994   41.3 
    ## 10 Belgium                3060.      31835   10.4 
    ## 11 Poland                 3023.     116387   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2969.      18932    6.38
    ## 14 Colombia               2927.     139894   47.8 
    ## 15 Mexico                 2892.     325205  112.  
    ## 16 United Kingdom         2877.     179363   62.3 
    ## 17 Italy                  2776.     167505   60.3 
    ## 18 Greece                 2730.      30033   11   
    ## 19 Tunisia                2706.      28655   10.6 
    ## 20 Russia                 2702.     380203  141.

EOL
