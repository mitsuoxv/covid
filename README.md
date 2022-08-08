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

Updated: 2022-08-09

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
    ##  1 United States          102147. 90706508            888
    ##  2 India                   50356. 44161899            877
    ##  3 Brazil                  38726. 33924061            876
    ##  4 France                  37148. 33061414            890
    ##  5 Germany                 35009. 31228322            892
    ##  6 United Kingdom          26317. 23369355            888
    ##  7 Italy                   23761. 21313427            897
    ##  8 South Korea             22827. 20544420            900
    ##  9 Russia                  21455. 18730561            873
    ## 10 Turkey                  18666. 16295817            873
    ## 11 Japan                   15849. 14248541            899
    ## 12 Spain                   14922. 13266184            889
    ## 13 Vietnam                 13058. 11347518            869
    ## 14 Australia               10896.  9588977            880
    ## 15 Argentina               10876.  9560307            879
    ## 16 Netherlands              9445.  8349765            884
    ## 17 Iran                     8313.  7440422            895
    ## 18 Mexico                   7740.  6803190            879
    ## 19 Colombia                 7185.  6265798            872
    ## 20 Indonesia                7126.  6249403            877

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        711.             625905.            880
    ##  2 Denmark                       670.             590892.            882
    ##  3 Austria                       669.             589748.            882
    ##  4 Switzerland                   587.             521551.            888
    ##  5 France                        574.             510456.            890
    ##  6 Portugal                      572.             501920.            877
    ##  7 Netherlands                   567.             501638.            884
    ##  8 Australia                     506.             445672.            880
    ##  9 Belgium                       481.             426540.            887
    ## 10 South Korea                   471.             424273.            900
    ## 11 Greece                        463.             406783.            879
    ## 12 Czech Republic                434.             381792.            879
    ## 13 Germany                       428.             381754.            892
    ## 14 United Kingdom                422.             374819.            888
    ## 15 Italy                         394.             353220.            897
    ## 16 Slovakia                      383.             334256.            873
    ## 17 Serbia                        338.             294688.            872
    ## 18 United States                 329.             292382.            888
    ## 19 Norway                        328.             290801.            886
    ## 20 Spain                         321.             285258.            889

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11895
    ##  2 Sudan                 7.86       4960    63128
    ##  3 Syria                 5.58       3153    56519
    ##  4 Peru                  5.45     214431  3932838
    ##  5 Somalia               5.04       1361    27020
    ##  6 Mexico                4.82     328006  6803190
    ##  7 Egypt                 4.81      24781   515082
    ##  8 Afghanistan           4.14       7752   187442
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.41        311     9125
    ## 11 Myanmar               3.16      19434   614213
    ## 12 Bulgaria              3.07      37435  1217565
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.72      19220   707109
    ## 15 Chad                  2.60        193     7437
    ## 16 Haiti                 2.59        838    32296
    ## 17 Tunisia               2.57      29105  1134660
    ## 18 Algeria               2.56       6878   268254
    ## 19 South Africa          2.55     101982  4004555
    ## 20 Indonesia             2.51     157113  6249403

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7170.     214431   29.9 
    ##  2 Bulgaria               5237.      37435    7.15
    ##  3 Hungary                4697.      46886    9.98
    ##  4 Czech Republic         3872.      40566   10.5 
    ##  5 Slovakia               3715.      20263    5.46
    ##  6 Chile                  3565.      59698   16.7 
    ##  7 Brazil                 3378.     679275  201.  
    ##  8 United States          3294.    1021995  310.  
    ##  9 Argentina              3129.     129369   41.3 
    ## 10 Belgium                3104.      32296   10.4 
    ## 11 Poland                 3030.     116660   38.5 
    ## 12 Paraguay               3015.      19220    6.38
    ## 13 Romania                3014.      66179   22.0 
    ## 14 United Kingdom         2968.     185052   62.3 
    ## 15 Colombia               2947.     140845   47.8 
    ## 16 Mexico                 2916.     328006  112.  
    ## 17 Italy                  2869.     173136   60.3 
    ## 18 Greece                 2852.      31377   11   
    ## 19 Tunisia                2749.      29105   10.6 
    ## 20 Russia                 2721.     382786  141.

EOL
