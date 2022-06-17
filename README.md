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

Updated: 2022-06-18

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
    ##  1 United States          101684. 85007630            836
    ##  2 India                   52449. 43270577            825
    ##  3 Brazil                  38364. 31611769            824
    ##  4 France                  34742. 29114200            838
    ##  5 Germany                 32291. 27124689            840
    ##  6 United Kingdom          26866. 22460453            836
    ##  7 Russia                  22402. 18391797            821
    ##  8 South Korea             21537. 18263643            848
    ##  9 Italy                   21034. 17773764            845
    ## 10 Turkey                  18375. 15085742            821
    ## 11 Spain                   14995. 12551142            837
    ## 12 Vietnam                 13139. 10734925            817
    ## 13 Argentina               11262.  9313453            827
    ## 14 Japan                   10754.  9108323            847
    ## 15 Netherlands              9758.  8118400            832
    ## 16 Australia                9323.  7719719            828
    ## 17 Iran                     8581.  7234221            843
    ## 18 Colombia                 7461.  6117847            820
    ## 19 Indonesia                7352.  6065644            825
    ## 20 Poland                   7286.  6010919            825

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        692.             573296.            828
    ##  2 Denmark                       692.             574290.            830
    ##  3 Austria                       639.             530154.            830
    ##  4 Netherlands                   586.             487738.            832
    ##  5 Switzerland                   581.             485988.            836
    ##  6 Portugal                      568.             468882.            825
    ##  7 France                        536.             449512.            838
    ##  8 Belgium                       482.             402570.            835
    ##  9 Czech Republic                453.             374640.            827
    ## 10 South Korea                   445.             377172.            848
    ## 11 Australia                     433.             358794.            828
    ## 12 United Kingdom                431.             360241.            836
    ## 13 Slovakia                      400.             328504.            821
    ## 14 Germany                       395.             331589.            840
    ## 15 Greece                        387.             320460.            827
    ## 16 Italy                         349.             294559.            845
    ## 17 Norway                        344.             287123.            834
    ## 18 Serbia                        336.             275241.            820
    ## 19 United States                 328.             274012.            836
    ## 20 Jordan                        324.             264968.            817

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4950    62489
    ##  3 Peru                 5.94     213350  3593625
    ##  4 Syria                5.63       3150    55909
    ##  5 Mexico               5.57     325271  5843190
    ##  6 Somalia              5.10       1361    26675
    ##  7 Egypt                4.81      24720   514008
    ##  8 Afghanistan          4.25       7710   181320
    ##  9 Ecuador              4.00      35659   891064
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37219  1167706
    ## 12 Myanmar              3.17      19434   613467
    ## 13 Malawi               3.07       2643    86162
    ## 14 Paraguay             2.90      18932   652044
    ## 15 Tunisia              2.74      28655  1044426
    ## 16 Haiti                2.70        837    31054
    ## 17 Chad                 2.60        193     7420
    ## 18 Algeria              2.58       6875   265964
    ## 19 Indonesia            2.58     156679  6065644
    ## 20 Honduras             2.56      10902   425655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7134.     213350   29.9 
    ##  2 Bulgaria               5206.      37219    7.15
    ##  3 Hungary                4668.      46594    9.98
    ##  4 Czech Republic         3848.      40307   10.5 
    ##  5 Slovakia               3689.      20126    5.46
    ##  6 Chile                  3474.      58171   16.7 
    ##  7 Brazil                 3325.     668693  201.  
    ##  8 United States          3233.    1002946  310.  
    ##  9 Argentina              3120.     128994   41.3 
    ## 10 Belgium                3062.      31856   10.4 
    ## 11 Poland                 3023.     116390   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2969.      18932    6.38
    ## 14 Colombia               2927.     139894   47.8 
    ## 15 Mexico                 2892.     325271  112.  
    ## 16 United Kingdom         2879.     179472   62.3 
    ## 17 Italy                  2778.     167617   60.3 
    ## 18 Greece                 2732.      30057   11   
    ## 19 Tunisia                2706.      28655   10.6 
    ## 20 Russia                 2703.     380333  141.

EOL
