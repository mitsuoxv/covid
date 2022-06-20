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

Updated: 2022-06-21

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
    ##  1 United States          101320. 85007630            839
    ##  2 India                   52306. 43309473            828
    ##  3 Brazil                  38224. 31611769            827
    ##  4 France                  34679. 29164805            841
    ##  5 Germany                 32280. 27211896            843
    ##  6 United Kingdom          26785. 22472507            839
    ##  7 Russia                  22331. 18400927            824
    ##  8 South Korea             21481. 18280090            851
    ##  9 Italy                   21084. 17879160            848
    ## 10 Turkey                  18308. 15085742            824
    ## 11 Spain                   14956. 12563399            840
    ## 12 Vietnam                 13095. 10737640            820
    ## 13 Argentina               11221.  9313453            830
    ## 14 Japan                   10764.  9149733            850
    ## 15 Netherlands              9727.  8122258            835
    ## 16 Australia                9326.  7750080            831
    ## 17 Iran                     8552.  7234757            846
    ## 18 Colombia                 7433.  6117847            823
    ## 19 Indonesia                7330.  6069255            828
    ## 20 Poland                   7260.  6011286            828

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        694.             576369.            831
    ##  2 Denmark                       690.             574507.            833
    ##  3 Austria                       639.             532260.            833
    ##  4 Netherlands                   584.             487970.            835
    ##  5 Switzerland                   579.             485988.            839
    ##  6 Portugal                      566.             468882.            828
    ##  7 France                        535.             450294.            841
    ##  8 Belgium                       480.             402570.            838
    ##  9 Czech Republic                451.             374700.            830
    ## 10 South Korea                   444.             377511.            851
    ## 11 Australia                     433.             360205.            831
    ## 12 United Kingdom                430.             360434.            839
    ## 13 Slovakia                      399.             328576.            824
    ## 14 Germany                       395.             332655.            843
    ## 15 Greece                        388.             322283.            830
    ## 16 Italy                         349.             296305.            848
    ## 17 Norway                        343.             287236.            837
    ## 18 Serbia                        335.             275362.            823
    ## 19 United States                 327.             274012.            839
    ## 20 Jordan                        323.             265068.            820

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11823
    ##  2 Sudan                7.92       4950    62521
    ##  3 Peru                 5.94     213350  3593625
    ##  4 Syria                5.63       3150    55915
    ##  5 Mexico               5.57     325271  5843190
    ##  6 Somalia              5.10       1361    26675
    ##  7 Egypt                4.81      24722   514047
    ##  8 Afghanistan          4.25       7713   181666
    ##  9 Ecuador              4.00      35662   892176
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37224  1168127
    ## 12 Myanmar              3.17      19434   613494
    ## 13 Malawi               3.07       2644    86204
    ## 14 Paraguay             2.90      18932   652044
    ## 15 Tunisia              2.74      28655  1044426
    ## 16 Haiti                2.70        837    31054
    ## 17 Chad                 2.60        193     7420
    ## 18 Algeria              2.58       6875   265975
    ## 19 Indonesia            2.58     156695  6069255
    ## 20 Honduras             2.56      10903   425930

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7134.     213350   29.9 
    ##  2 Bulgaria               5207.      37224    7.15
    ##  3 Hungary                4668.      46594    9.98
    ##  4 Czech Republic         3848.      40308   10.5 
    ##  5 Slovakia               3691.      20137    5.46
    ##  6 Chile                  3474.      58171   16.7 
    ##  7 Brazil                 3325.     668693  201.  
    ##  8 United States          3233.    1002946  310.  
    ##  9 Argentina              3120.     128994   41.3 
    ## 10 Belgium                3062.      31856   10.4 
    ## 11 Poland                 3023.     116393   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2969.      18932    6.38
    ## 14 Colombia               2927.     139894   47.8 
    ## 15 Mexico                 2892.     325271  112.  
    ## 16 United Kingdom         2880.     179537   62.3 
    ## 17 Italy                  2780.     167721   60.3 
    ## 18 Greece                 2735.      30087   11   
    ## 19 Tunisia                2706.      28655   10.6 
    ## 20 Russia                 2704.     380517  141.

EOL
