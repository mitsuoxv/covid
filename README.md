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

Updated: 2022-06-10

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
    ##  1 United States          101601. 84125526            828
    ##  2 India                   52873. 43197522            817
    ##  3 Brazil                  38316. 31266163            816
    ##  4 France                  34714. 28813116            830
    ##  5 Germany                 32043. 26660085            832
    ##  6 United Kingdom          27008. 22363071            828
    ##  7 Russia                  22590. 18365879            813
    ##  8 South Korea             21667. 18200346            840
    ##  9 Italy                   20987. 17566061            837
    ## 10 Turkey                  18541. 15073722            813
    ## 11 Spain                   15002. 12436538            829
    ## 12 Vietnam                 13261. 10727918            809
    ## 13 Argentina               11327.  9276618            819
    ## 14 Japan                   10716.  8990929            839
    ## 15 Netherlands              9827.  8097174            824
    ## 16 Australia                9152.  7504845            820
    ## 17 Iran                     8662.  7233117            835
    ## 18 Colombia                 7523.  6109105            812
    ## 19 Indonesia                7416.  6058736            817
    ## 20 Poland                   7355.  6009479            817

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       697.             572861.            822
    ##  2 Israel                        691.             566591.            820
    ##  3 Austria                       639.             525425.            822
    ##  4 Netherlands                   590.             486463.            824
    ##  5 Switzerland                   584.             483808.            828
    ##  6 Portugal                      561.             458503.            817
    ##  7 France                        536.             444864.            830
    ##  8 Belgium                       484.             400336.            827
    ##  9 Czech Republic                457.             374404.            819
    ## 10 South Korea                   447.             375864.            840
    ## 11 United Kingdom                433.             358679.            828
    ## 12 Australia                     425.             348807.            820
    ## 13 Slovakia                      404.             328284.            813
    ## 14 Germany                       392.             325909.            832
    ## 15 Greece                        387.             316661.            819
    ## 16 Italy                         348.             291116.            837
    ## 17 Norway                        347.             286532.            826
    ## 18 Serbia                        339.             274945.            812
    ## 19 United States                 327.             271169.            828
    ## 20 Jordan                        327.             264905.            809

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.93       4950    62444
    ##  3 Peru                 5.95     213281  3586242
    ##  4 Syria                5.63       3150    55901
    ##  5 Mexico               5.61     325042  5797427
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24719   513975
    ##  8 Afghanistan          4.26       7709   180864
    ##  9 Ecuador              4.03      35649   885403
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37188  1166476
    ## 12 Myanmar              3.17      19434   613405
    ## 13 Malawi               3.07       2642    86001
    ## 14 Paraguay             2.90      18911   651268
    ## 15 Tunisia              2.75      28648  1043540
    ## 16 Haiti                2.70        835    30963
    ## 17 Chad                 2.60        193     7418
    ## 18 Algeria              2.59       6875   265909
    ## 19 Indonesia            2.59     156635  6058736
    ## 20 Honduras             2.56      10900   425471

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7131.     213281   29.9 
    ##  2 Bulgaria               5202.      37188    7.15
    ##  3 Hungary                4665.      46571    9.98
    ##  4 Czech Republic         3847.      40297   10.5 
    ##  5 Slovakia               3686.      20109    5.46
    ##  6 Chile                  3464.      58005   16.7 
    ##  7 Brazil                 3318.     667348  201.  
    ##  8 United States          3223.     999773  310.  
    ##  9 Argentina              3120.     128973   41.3 
    ## 10 Belgium                3057.      31799   10.4 
    ## 11 Poland                 3023.     116368   38.5 
    ## 12 Romania                2992.      65700   22.0 
    ## 13 Paraguay               2966.      18911    6.38
    ## 14 Colombia               2927.     139867   47.8 
    ## 15 Mexico                 2890.     325042  112.  
    ## 16 United Kingdom         2872.     179083   62.3 
    ## 17 Italy                  2770.     167169   60.3 
    ## 18 Greece                 2724.      29966   11   
    ## 19 Tunisia                2705.      28648   10.6 
    ## 20 Russia                 2699.     379813  141.

EOL
