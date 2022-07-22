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

Updated: 2022-07-23

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
    ##  1 United States          102090. 88920929            871
    ##  2 India                   50959. 43825185            860
    ##  3 Brazil                  38945. 33454294            859
    ##  4 France                  37091. 32380954            873
    ##  5 Germany                 34559. 30239122            875
    ##  6 United Kingdom          26651. 23213017            871
    ##  7 Italy                   23258. 20467349            880
    ##  8 Russia                  21633. 18517779            856
    ##  9 South Korea             21605. 19077659            883
    ## 10 Turkey                  18135. 15524071            856
    ## 11 Spain                   15060. 13132159            872
    ## 12 Vietnam                 12633. 10763694            852
    ## 13 Japan                   12228. 10785505            882
    ## 14 Argentina               10981.  9465827            862
    ## 15 Australia               10390.  8966804            863
    ## 16 Netherlands              9575.  8301277            867
    ## 17 Iran                     8302.  7289542            878
    ## 18 Mexico                   7567.  6523019            862
    ## 19 Colombia                 7279.  6223497            855
    ## 20 Indonesia                7156.  6154494            860

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        715.             617430.            863
    ##  2 Denmark                       678.             586530.            865
    ##  3 Austria                       663.             573384.            865
    ##  4 Switzerland                   590.             513534.            871
    ##  5 Portugal                      579.             497530.            860
    ##  6 Netherlands                   575.             498725.            867
    ##  7 France                        573.             499950.            873
    ##  8 Belgium                       484.             421160.            870
    ##  9 Australia                     483.             416755.            863
    ## 10 South Korea                   446.             393982.            883
    ## 11 Greece                        444.             382797.            862
    ## 12 Czech Republic                439.             378415.            862
    ## 13 United Kingdom                427.             372311.            871
    ## 14 Germany                       422.             369661.            875
    ## 15 Slovakia                      388.             331882.            856
    ## 16 Italy                         385.             339199.            880
    ## 17 Norway                        334.             290188.            869
    ## 18 Serbia                        330.             282115.            855
    ## 19 United States                 329.             286626.            871
    ## 20 Spain                         324.             282376.            872

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11849
    ##  2 Sudan                 7.88       4955    62914
    ##  3 Peru                  5.65     213894  3787887
    ##  4 Syria                 5.62       3150    56027
    ##  5 Somalia               5.06       1361    26912
    ##  6 Mexico                5.01     326764  6523019
    ##  7 Egypt                 4.81      24750   514413
    ##  8 Afghanistan           4.20       7737   184069
    ##  9 Ecuador               3.81      35781   940179
    ## 10 Niger                 3.42        311     9104
    ## 11 Myanmar               3.17      19434   613887
    ## 12 Bulgaria              3.13      37319  1192284
    ## 13 Malawi                3.05       2651    86823
    ## 14 Paraguay              2.77      19083   688820
    ## 15 Haiti                 2.61        838    32131
    ## 16 Chad                  2.60        193     7430
    ## 17 Tunisia               2.60      28942  1114370
    ## 18 Algeria               2.58       6875   266654
    ## 19 Indonesia             2.55     156880  6154494
    ## 20 South Africa          2.55     101942  4001816

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7152.     213894   29.9 
    ##  2 Bulgaria               5220.      37319    7.15
    ##  3 Hungary                4682.      46736    9.98
    ##  4 Czech Republic         3855.      40380   10.5 
    ##  5 Slovakia               3702.      20193    5.46
    ##  6 Chile                  3536.      59216   16.7 
    ##  7 Brazil                 3363.     676217  201.  
    ##  8 United States          3275.    1015897  310.  
    ##  9 Argentina              3125.     129202   41.3 
    ## 10 Belgium                3087.      32118   10.4 
    ## 11 Poland                 3026.     116498   38.5 
    ## 12 Romania                2998.      65839   22.0 
    ## 13 Paraguay               2993.      19083    6.38
    ## 14 Colombia               2937.     140365   47.8 
    ## 15 United Kingdom         2931.     182727   62.3 
    ## 16 Mexico                 2905.     326764  112.  
    ## 17 Italy                  2826.     170527   60.3 
    ## 18 Greece                 2792.      30707   11   
    ## 19 Tunisia                2733.      28942   10.6 
    ## 20 Russia                 2716.     382080  141.

EOL
