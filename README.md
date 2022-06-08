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

Updated: 2022-06-09

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
    ##  1 United States          101556. 83987071            827
    ##  2 India                   52929. 43190282            816
    ##  3 Brazil                  38276. 31195118            815
    ##  4 France                  34691. 28759314            829
    ##  5 Germany                 31989. 26583016            831
    ##  6 United Kingdom          27024. 22349187            827
    ##  7 Russia                  22613. 18362105            812
    ##  8 South Korea             21678. 18188200            839
    ##  9 Italy                   20984. 17543136            836
    ## 10 Turkey                  18563. 15073722            812
    ## 11 Spain                   15020. 12436538            828
    ## 12 Vietnam                 13276. 10727005            808
    ## 13 Argentina               11340.  9276618            818
    ## 14 Japan                   10707.  8972654            838
    ## 15 Netherlands              9836.  8095313            823
    ## 16 Australia                9123.  7471599            819
    ## 17 Iran                     8672.  7232929            834
    ## 18 Colombia                 7533.  6109105            811
    ## 19 Indonesia                7423.  6057660            816
    ## 20 Poland                   7364.  6009205            816

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       697.             572696.            821
    ##  2 Israel                        691.             565931.            819
    ##  3 Austria                       640.             525056.            821
    ##  4 Netherlands                   591.             486351.            823
    ##  5 Switzerland                   585.             483808.            827
    ##  6 Portugal                      559.             456439.            816
    ##  7 France                        536.             444033.            829
    ##  8 Belgium                       485.             400336.            826
    ##  9 Czech Republic                458.             374365.            818
    ## 10 South Korea                   448.             375614.            839
    ## 11 United Kingdom                433.             358456.            827
    ## 12 Australia                     424.             347262.            819
    ## 13 Slovakia                      404.             328249.            812
    ## 14 Germany                       391.             324967.            831
    ## 15 Greece                        387.             316253.            818
    ## 16 Italy                         348.             290737.            836
    ## 17 Norway                        347.             286455.            825
    ## 18 Serbia                        339.             274910.            811
    ## 19 Jordan                        328.             264905.            808
    ## 20 United States                 327.             270723.            827

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.93       4950    62444
    ##  3 Peru                 5.95     213269  3585767
    ##  4 Syria                5.64       3150    55900
    ##  5 Mexico               5.61     325023  5792317
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24719   513975
    ##  8 Afghanistan          4.26       7709   180784
    ##  9 Ecuador              4.03      35649   885318
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37184  1166316
    ## 12 Myanmar              3.17      19434   613397
    ## 13 Malawi               3.07       2642    86001
    ## 14 Paraguay             2.90      18911   651268
    ## 15 Tunisia              2.75      28648  1043540
    ## 16 Haiti                2.70        835    30940
    ## 17 Chad                 2.60        193     7418
    ## 18 Algeria              2.59       6875   265900
    ## 19 Indonesia            2.59     156624  6057660
    ## 20 Honduras             2.56      10900   425471

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7131.     213269   29.9 
    ##  2 Bulgaria               5201.      37184    7.15
    ##  3 Hungary                4665.      46571    9.98
    ##  4 Czech Republic         3846.      40295   10.5 
    ##  5 Slovakia               3686.      20107    5.46
    ##  6 Chile                  3463.      57997   16.7 
    ##  7 Brazil                 3317.     667041  201.  
    ##  8 United States          3221.     999343  310.  
    ##  9 Argentina              3120.     128973   41.3 
    ## 10 Belgium                3057.      31799   10.4 
    ## 11 Poland                 3022.     116362   38.5 
    ## 12 Romania                2992.      65697   22.0 
    ## 13 Paraguay               2966.      18911    6.38
    ## 14 Colombia               2927.     139867   47.8 
    ## 15 Mexico                 2890.     325023  112.  
    ## 16 United Kingdom         2871.     178998   62.3 
    ## 17 Italy                  2769.     167089   60.3 
    ## 18 Greece                 2723.      29951   11   
    ## 19 Tunisia                2705.      28648   10.6 
    ## 20 Russia                 2699.     379736  141.

EOL
