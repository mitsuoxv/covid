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

Updated: 2022-08-04

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
    ##  1 United States          102348. 90373849            883
    ##  2 India                   50536. 44067144            872
    ##  3 Brazil                  38870. 33855964            871
    ##  4 France                  37224. 32942944            885
    ##  5 Germany                 34999. 31044554            887
    ##  6 United Kingdom          26393. 23304931            883
    ##  7 Italy                   23682. 21124644            892
    ##  8 South Korea             22405. 20052305            895
    ##  9 Russia                  21471. 18636741            868
    ## 10 Turkey                  18306. 15889495            868
    ## 11 Spain                   14984. 13245996            884
    ## 12 Japan                   14668. 13113301            894
    ## 13 Vietnam                 12480. 10783026            864
    ## 14 Argentina               10938.  9560307            874
    ## 15 Australia               10830.  9476160            875
    ## 16 Netherlands              9490.  8341941            879
    ## 17 Iran                     8326.  7410075            890
    ## 18 Mexico                   7736.  6761617            874
    ## 19 Colombia                 7227.  6265798            867
    ## 20 Indonesia                7129.  6216621            872

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        713.             624287.            875
    ##  2 Denmark                       673.             590003.            877
    ##  3 Austria                       668.             585887.            877
    ##  4 Switzerland                   591.             521551.            883
    ##  5 France                        575.             508627.            885
    ##  6 Portugal                      575.             501031.            872
    ##  7 Netherlands                   570.             501168.            879
    ##  8 Australia                     503.             440429.            875
    ##  9 Belgium                       482.             425377.            882
    ## 10 Greece                        465.             406783.            874
    ## 11 South Korea                   463.             414110.            895
    ## 12 Czech Republic                436.             381023.            874
    ## 13 Germany                       428.             379507.            887
    ## 14 United Kingdom                423.             373785.            883
    ## 15 Italy                         392.             350092.            892
    ## 16 Slovakia                      384.             333626.            868
    ## 17 Serbia                        335.             290810.            867
    ## 18 Norway                        330.             290675.            881
    ## 19 United States                 330.             291310.            883
    ## 20 Spain                         322.             284824.            884

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2151    11877
    ##  2 Sudan                 7.86       4958    63074
    ##  3 Syria                 5.59       3150    56386
    ##  4 Peru                  5.48     214364  3914506
    ##  5 Somalia               5.04       1361    27020
    ##  6 Mexico                4.85     327750  6761617
    ##  7 Egypt                 4.81      24775   514891
    ##  8 Afghanistan           4.16       7752   186156
    ##  9 Ecuador               3.72      35801   963668
    ## 10 Niger                 3.41        311     9115
    ## 11 Myanmar               3.16      19434   614146
    ## 12 Bulgaria              3.09      37414  1211728
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.72      19220   707109
    ## 15 Haiti                 2.60        838    32272
    ## 16 Chad                  2.60        193     7437
    ## 17 Algeria               2.57       6876   267546
    ## 18 Tunisia               2.57      29105  1134660
    ## 19 South Africa          2.55     101982  4004555
    ## 20 Indonesia             2.53     157028  6216621

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7168.     214364   29.9 
    ##  2 Bulgaria               5234.      37414    7.15
    ##  3 Hungary                4697.      46886    9.98
    ##  4 Czech Republic         3868.      40518   10.5 
    ##  5 Slovakia               3710.      20236    5.46
    ##  6 Chile                  3561.      59629   16.7 
    ##  7 Brazil                 3375.     678715  201.  
    ##  8 United States          3289.    1020405  310.  
    ##  9 Argentina              3129.     129369   41.3 
    ## 10 Belgium                3101.      32263   10.4 
    ## 11 Poland                 3029.     116608   38.5 
    ## 12 Paraguay               3015.      19220    6.38
    ## 13 Romania                3008.      66049   22.0 
    ## 14 United Kingdom         2950.     183953   62.3 
    ## 15 Colombia               2947.     140845   47.8 
    ## 16 Mexico                 2914.     327750  112.  
    ## 17 Italy                  2857.     172397   60.3 
    ## 18 Greece                 2852.      31377   11   
    ## 19 Tunisia                2749.      29105   10.6 
    ## 20 Russia                 2719.     382560  141.

EOL
