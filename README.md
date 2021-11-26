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

Updated: 2021-11-27

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           75517. 47802459            633
    ##  2 India                   55555. 34555431            622
    ##  3 Brazil                  35382. 22043112            623
    ##  4 United Kingdom          15832. 10021501            633
    ##  5 Russia                  15377.  9502879            618
    ##  6 Turkey                  14040.  8676639            618
    ##  7 France                  11472.  7285128            635
    ##  8 Iran                     9520.  6092822            640
    ##  9 Germany                  8884.  5650170            636
    ## 10 Argentina                8622.  5319867            617
    ## 11 Colombia                 8180.  5055253            618
    ## 12 Spain                    8077.  5121100            634
    ## 13 Italy                    7739.  4968341            642
    ## 14 Indonesia                6841.  4255268            622
    ## 15 Mexico                   6205.  3872263            624
    ## 16 Poland                   5564.  3461066            622
    ## 17 Ukraine                  5556.  3400340            612
    ## 18 South Africa             4777.  2952500            618
    ## 19 Philippines              4549.  2829618            622
    ## 20 Malaysia                 4161.  2608979            627

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                320.             199490.            624
    ##  2 Israel                        292.             182379.            624
    ##  3 Serbia                        275.             169393.            617
    ##  4 Belgium                       255.             161479.            632
    ##  5 United Kingdom                254.             160734.            633
    ##  6 United States                 243.             154086.            633
    ##  7 Netherlands                   242.             152246.            629
    ##  8 Jordan                        236.             144880.            614
    ##  9 Austria                       215.             134970.            627
    ## 10 Argentina                     209.             128676.            617
    ## 11 Switzerland                   203.             128522.            633
    ## 12 Sweden                        199.             125230.            629
    ## 13 Slovakia                      193.             119383.            618
    ## 14 Turkey                        180.             111519.            618
    ## 15 France                        177.             112480.            635
    ## 16 Brazil                        176.             109611.            623
    ## 17 Hungary                       174.             107082.            616
    ## 18 Spain                         174.             110117.            634
    ## 19 Colombia                      171.             105781.            618
    ## 20 Portugal                      170.             106148.            623

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1943     9977
    ##  2 Peru                 9.02     200961  2228212
    ##  3 Mexico               7.57     293186  3872263
    ##  4 Sudan                7.40       3114    42056
    ##  5 Ecuador              6.32      33128   524432
    ##  6 Somalia              5.76       1324    22969
    ##  7 Syria                5.72       2719    47558
    ##  8 Egypt                5.70      20109   353024
    ##  9 Afghanistan          4.65       7307   157144
    ## 10 China                4.46       5697   127631
    ## 11 Bulgaria             4.07      27891   684922
    ## 12 Malawi               3.72       2304    61872
    ## 13 Myanmar              3.66      19058   520213
    ## 14 Niger                3.63        251     6921
    ## 15 Bolivia              3.59      19104   532631
    ## 16 Paraguay             3.54      16365   462453
    ## 17 Tunisia              3.54      25356   716702
    ## 18 Zimbabwe             3.52       4704   133774
    ## 19 Mali                 3.51        601    17145
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6720.     200961   29.9 
    ##  2 Bulgaria               3902.      27891    7.15
    ##  3 Hungary                3393.      33866    9.98
    ##  4 Czech Republic         3116.      32643   10.5 
    ##  5 Brazil                 3050.     613339  201.  
    ##  6 Argentina              2817.     116458   41.3 
    ##  7 Colombia               2683.     128236   47.8 
    ##  8 Mexico                 2607.     293186  112.  
    ##  9 Slovakia               2599.      14177    5.46
    ## 10 Belgium                2576.      26793   10.4 
    ## 11 Paraguay               2567.      16365    6.38
    ## 12 Romania                2542.      55829   22.0 
    ## 13 United States          2487.     771529  310.  
    ## 14 Tunisia                2395.      25356   10.6 
    ## 15 United Kingdom         2317.     144433   62.3 
    ## 16 Chile                  2282.      38218   16.7 
    ## 17 Ecuador                2240.      33128   14.8 
    ## 18 Italy                  2212.     133486   60.3 
    ## 19 Poland                 2146.      82607   38.5 
    ## 20 Russia                 1921.     270292  141.

EOL
