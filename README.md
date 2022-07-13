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

Updated: 2022-07-14

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
    ##  1 United States          101709. 87673034            862
    ##  2 India                   51316. 43669850            851
    ##  3 Brazil                  38753. 32940507            850
    ##  4 France                  36576. 31601751            864
    ##  5 Germany                 33843. 29308100            866
    ##  6 United Kingdom          26548. 22884446            862
    ##  7 Italy                   22580. 19667320            871
    ##  8 Russia                  21809. 18472239            847
    ##  9 South Korea             21284. 18602109            874
    ## 10 Turkey                  17922. 15180444            847
    ## 11 Spain                   15102. 13032841            863
    ## 12 Vietnam                 12758. 10755381            843
    ## 13 Japan                   11238.  9810874            873
    ## 14 Argentina               11050.  9426171            853
    ## 15 Australia               10014.  8551884            854
    ## 16 Netherlands              9620.  8253854            858
    ## 17 Iran                     8349.  7255017            869
    ## 18 Mexico                   7345.  6265311            853
    ## 19 Colombia                 7327.  6198848            846
    ## 20 Indonesia                7192.  6120169            851

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        712.             608123.            854
    ##  2 Denmark                       681.             582931.            856
    ##  3 Austria                       654.             559538.            856
    ##  4 Switzerland                   588.             506997.            862
    ##  5 Portugal                      579.             492463.            851
    ##  6 Netherlands                   578.             495876.            858
    ##  7 France                        565.             487919.            864
    ##  8 Belgium                       482.             415275.            861
    ##  9 Australia                     465.             397471.            854
    ## 10 Czech Republic                442.             376649.            853
    ## 11 South Korea                   440.             384161.            874
    ## 12 United Kingdom                426.             367041.            862
    ## 13 Germany                       414.             358280.            866
    ## 14 Greece                        410.             349377.            853
    ## 15 Slovakia                      390.             330498.            847
    ## 16 Italy                         374.             325940.            871
    ## 17 Norway                        337.             289690.            860
    ## 18 Serbia                        329.             278440.            846
    ## 19 United States                 328.             282604.            862
    ## 20 Spain                         325.             280240.            863

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11832
    ##  2 Sudan                 7.89       4955    62795
    ##  3 Peru                  5.80     213695  3683213
    ##  4 Syria                 5.63       3150    55955
    ##  5 Mexico                5.20     326097  6265311
    ##  6 Somalia               5.06       1361    26900
    ##  7 Egypt                 4.81      24725   514182
    ##  8 Afghanistan           4.22       7728   183272
    ##  9 Ecuador               3.88      35755   922166
    ## 10 Niger                 3.42        311     9096
    ## 11 Myanmar               3.17      19434   613773
    ## 12 Bulgaria              3.16      37279  1180636
    ## 13 Malawi                3.05       2649    86750
    ## 14 Paraguay              2.83      19036   673829
    ## 15 Tunisia               2.65      28823  1087030
    ## 16 Haiti                 2.62        837    31980
    ## 17 Chad                  2.60        193     7427
    ## 18 Algeria               2.58       6875   266274
    ## 19 Indonesia             2.56     156818  6120169
    ## 20 South Africa          2.55     101880  3997975

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7145.     213695   29.9 
    ##  2 Bulgaria               5215.      37279    7.15
    ##  3 Hungary                4678.      46696    9.98
    ##  4 Czech Republic         3851.      40340   10.5 
    ##  5 Slovakia               3697.      20166    5.46
    ##  6 Chile                  3516.      58878   16.7 
    ##  7 Brazil                 3350.     673758  201.  
    ##  8 United States          3260.    1011363  310.  
    ##  9 Argentina              3124.     129145   41.3 
    ## 10 Belgium                3077.      32015   10.4 
    ## 11 Poland                 3025.     116464   38.5 
    ## 12 Romania                2996.      65797   22.0 
    ## 13 Paraguay               2986.      19036    6.38
    ## 14 Colombia               2934.     140202   47.8 
    ## 15 Mexico                 2899.     326097  112.  
    ## 16 United Kingdom         2899.     180718   62.3 
    ## 17 Italy                  2807.     169390   60.3 
    ## 18 Greece                 2771.      30476   11   
    ## 19 Tunisia                2722.      28823   10.6 
    ## 20 Russia                 2713.     381711  141.

EOL
