WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-08-16

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
    ##  1 United States          102162. 91435449            895
    ##  2 India                   50077. 44268381            884
    ##  3 Brazil                  38615. 34096935            883
    ##  4 France                  37023. 33210018            897
    ##  5 Germany                 35078. 31535337            899
    ##  6 United Kingdom          26169. 23421278            895
    ##  7 Italy                   23783. 21499531            904
    ##  8 South Korea             23614. 21418036            907
    ##  9 Russia                  21485. 18907231            880
    ## 10 Turkey                  18518. 16295817            880
    ## 11 Japan                   17235. 15615251            906
    ## 12 Spain                   14837. 13294139            896
    ## 13 Vietnam                 12975. 11365784            876
    ## 14 Australia               11003.  9760150            887
    ## 15 Argentina               10838.  9602534            886
    ## 16 Netherlands              9385.  8362564            891
    ## 17 Iran                     8287.  7475173            902
    ## 18 Mexico                   7760.  6875708            886
    ## 19 Colombia                 7143.  6278998            879
    ## 20 Indonesia                7107.  6282774            884

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        708.             627593.            887
    ##  2 Austria                       669.             594529.            889
    ##  3 Denmark                       667.             593014.            889
    ##  4 Switzerland                   586.             524409.            895
    ##  5 France                        572.             512750.            897
    ##  6 Portugal                      570.             503527.            884
    ##  7 Netherlands                   564.             502407.            891
    ##  8 Australia                     511.             453628.            887
    ##  9 South Korea                   488.             442314.            907
    ## 10 Belgium                       479.             428096.            894
    ## 11 Greece                        470.             416152.            886
    ## 12 Czech Republic                432.             382994.            886
    ## 13 Germany                       429.             385507.            899
    ## 14 United Kingdom                420.             375651.            895
    ## 15 Italy                         394.             356305.            904
    ## 16 Slovakia                      381.             335069.            880
    ## 17 Serbia                        342.             300456.            879
    ## 18 United States                 329.             294732.            895
    ## 19 Norway                        326.             291025.            893
    ## 20 Spain                         319.             285859.            896

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11903
    ##  2 Sudan                 7.86       4961    63147
    ##  3 Syria                 5.57       3158    56728
    ##  4 Peru                  5.38     214788  3992728
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24786   515198
    ##  7 Mexico                4.78     328437  6875708
    ##  8 Afghanistan           4.10       7758   189045
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.40        311     9138
    ## 11 Myanmar               3.16      19435   614389
    ## 12 Bulgaria              3.06      37488  1226419
    ## 13 Malawi                3.05       2670    87630
    ## 14 Paraguay              2.71      19289   710890
    ## 15 Chad                  2.59        193     7442
    ## 16 Haiti                 2.57        838    32577
    ## 17 Tunisia               2.56      29153  1139241
    ## 18 Algeria               2.56       6878   268866
    ## 19 South Africa          2.54     101982  4008164
    ## 20 Indonesia             2.50     157226  6282774

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7182.     214788   29.9 
    ##  2 Bulgaria               5244.      37488    7.15
    ##  3 Hungary                4705.      46966    9.98
    ##  4 Czech Republic         3880.      40647   10.5 
    ##  5 Slovakia               3722.      20306    5.46
    ##  6 Chile                  3577.      59896   16.7 
    ##  7 Brazil                 3385.     680786  201.  
    ##  8 United States          3305.    1025353  310.  
    ##  9 Argentina              3131.     129440   41.3 
    ## 10 Belgium                3111.      32364   10.4 
    ## 11 Poland                 3033.     116773   38.5 
    ## 12 Paraguay               3025.      19289    6.38
    ## 13 Romania                3021.      66348   22.0 
    ## 14 United Kingdom         2985.     186087   62.3 
    ## 15 Colombia               2952.     141075   47.8 
    ## 16 Mexico                 2920.     328437  112.  
    ## 17 Italy                  2885.     174060   60.3 
    ## 18 Greece                 2884.      31722   11   
    ## 19 Tunisia                2753.      29153   10.6 
    ## 20 Russia                 2723.     383178  141.

EOL
