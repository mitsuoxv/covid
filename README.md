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

Updated: 2022-07-22

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
    ##  1 United States          102009. 88747875            870
    ##  2 India                   50994. 43803619            859
    ##  3 Brazil                  38925. 33397814            858
    ##  4 France                  37042. 32300330            872
    ##  5 Germany                 34475. 30131303            874
    ##  6 United Kingdom          26681. 23213017            870
    ##  7 Italy                   23192. 20385814            879
    ##  8 Russia                  21650. 18511120            855
    ##  9 South Korea             21552. 19009080            882
    ## 10 Turkey                  18157. 15524071            855
    ## 11 Spain                   15077. 13132159            871
    ## 12 Vietnam                 12648. 10763694            851
    ## 13 Japan                   12037. 10604679            881
    ## 14 Argentina               10994.  9465827            861
    ## 15 Australia               10325.  8900082            862
    ## 16 Netherlands              9580.  8296783            866
    ## 17 Iran                     8312.  7289542            877
    ## 18 Mexico                   7536.  6488358            861
    ## 19 Colombia                 7287.  6223497            854
    ## 20 Indonesia                7158.  6149084            859

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        715.             616653.            862
    ##  2 Denmark                       678.             586145.            864
    ##  3 Austria                       662.             571840.            864
    ##  4 Switzerland                   590.             513534.            870
    ##  5 Portugal                      579.             497067.            859
    ##  6 Netherlands                   576.             498455.            866
    ##  7 France                        572.             498705.            872
    ##  8 Belgium                       485.             421160.            869
    ##  9 Australia                     480.             413654.            862
    ## 10 South Korea                   445.             392566.            882
    ## 11 Greece                        445.             382797.            861
    ## 12 Czech Republic                439.             378157.            861
    ## 13 United Kingdom                428.             372311.            870
    ## 14 Germany                       421.             368343.            874
    ## 15 Slovakia                      388.             331696.            855
    ## 16 Italy                         384.             337847.            879
    ## 17 Norway                        334.             290188.            868
    ## 18 Serbia                        330.             281536.            854
    ## 19 United States                 329.             286069.            870
    ## 20 Spain                         324.             282376.            871

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11849
    ##  2 Sudan                 7.88       4955    62914
    ##  3 Peru                  5.67     213870  3773733
    ##  4 Syria                 5.62       3150    56027
    ##  5 Somalia               5.06       1361    26912
    ##  6 Mexico                5.03     326657  6488358
    ##  7 Egypt                 4.81      24750   514413
    ##  8 Afghanistan           4.20       7737   184069
    ##  9 Ecuador               3.82      35774   936227
    ## 10 Niger                 3.42        311     9104
    ## 11 Myanmar               3.17      19434   613871
    ## 12 Bulgaria              3.13      37313  1190644
    ## 13 Malawi                3.05       2651    86823
    ## 14 Paraguay              2.77      19083   688820
    ## 15 Haiti                 2.61        838    32131
    ## 16 Chad                  2.60        193     7430
    ## 17 Tunisia               2.60      28942  1114370
    ## 18 Algeria               2.58       6875   266542
    ## 19 Indonesia             2.55     156875  6149084
    ## 20 South Africa          2.55     101935  4000894

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7151.     213870   29.9 
    ##  2 Bulgaria               5219.      37313    7.15
    ##  3 Hungary                4682.      46736    9.98
    ##  4 Czech Republic         3854.      40370   10.5 
    ##  5 Slovakia               3701.      20188    5.46
    ##  6 Chile                  3532.      59146   16.7 
    ##  7 Brazil                 3361.     675871  201.  
    ##  8 United States          3272.    1015093  310.  
    ##  9 Argentina              3125.     129202   41.3 
    ## 10 Belgium                3088.      32123   10.4 
    ## 11 Poland                 3026.     116492   38.5 
    ## 12 Romania                2998.      65836   22.0 
    ## 13 Paraguay               2993.      19083    6.38
    ## 14 Colombia               2937.     140365   47.8 
    ## 15 United Kingdom         2931.     182727   62.3 
    ## 16 Mexico                 2904.     326657  112.  
    ## 17 Italy                  2823.     170370   60.3 
    ## 18 Greece                 2792.      30707   11   
    ## 19 Tunisia                2733.      28942   10.6 
    ## 20 Russia                 2715.     382039  141.

EOL
