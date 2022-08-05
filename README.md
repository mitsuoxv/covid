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

Updated: 2022-08-06

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
    ##  1 United States          102493. 90706508            885
    ##  2 India                   50466. 44107588            874
    ##  3 Brazil                  38859. 33924061            873
    ##  4 France                  37214. 33009294            887
    ##  5 Germany                 35072. 31178705            889
    ##  6 United Kingdom          26406. 23369355            885
    ##  7 Italy                   23729. 21213559            894
    ##  8 South Korea             22601. 20273011            897
    ##  9 Russia                  21462. 18672422            870
    ## 10 Turkey                  18264. 15889495            870
    ## 11 Japan                   15177. 13598290            896
    ## 12 Spain                   14950. 13245996            886
    ## 13 Vietnam                 12454. 10785122            866
    ## 14 Argentina               10913.  9560307            876
    ## 15 Australia               10894.  9554380            877
    ## 16 Netherlands              9475.  8347295            881
    ## 17 Iran                     8317.  7418615            892
    ## 18 Mexico                   7766.  6803190            876
    ## 19 Colombia                 7210.  6265798            869
    ## 20 Indonesia                7127.  6229315            874

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        713.             625081.            877
    ##  2 Denmark                       672.             590644.            879
    ##  3 Austria                       669.             587662.            879
    ##  4 Switzerland                   589.             521551.            885
    ##  5 France                        575.             509651.            887
    ##  6 Portugal                      574.             501642.            874
    ##  7 Netherlands                   569.             501490.            881
    ##  8 Australia                     506.             444064.            877
    ##  9 Belgium                       482.             426540.            884
    ## 10 South Korea                   467.             418668.            897
    ## 11 Greece                        464.             406783.            876
    ## 12 Czech Republic                435.             381485.            876
    ## 13 Germany                       429.             381147.            889
    ## 14 United Kingdom                424.             374819.            885
    ## 15 Italy                         393.             351565.            894
    ## 16 Slovakia                      384.             333989.            870
    ## 17 Serbia                        337.             292534.            869
    ## 18 United States                 330.             292382.            885
    ## 19 Norway                        329.             290766.            883
    ## 20 Spain                         321.             284824.            886

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2151    11877
    ##  2 Sudan                 7.86       4958    63074
    ##  3 Syria                 5.58       3150    56419
    ##  4 Peru                  5.45     214431  3932838
    ##  5 Somalia               5.04       1361    27020
    ##  6 Mexico                4.82     328006  6803190
    ##  7 Egypt                 4.81      24775   514891
    ##  8 Afghanistan           4.16       7752   186393
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.41        311     9119
    ## 11 Myanmar               3.16      19434   614158
    ## 12 Bulgaria              3.08      37424  1214925
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.72      19220   707109
    ## 15 Chad                  2.60        193     7437
    ## 16 Haiti                 2.59        838    32296
    ## 17 Algeria               2.57       6877   267902
    ## 18 Tunisia               2.57      29105  1134660
    ## 19 South Africa          2.55     101982  4004555
    ## 20 Indonesia             2.52     157060  6229315

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7170.     214431   29.9 
    ##  2 Bulgaria               5235.      37424    7.15
    ##  3 Hungary                4697.      46886    9.98
    ##  4 Czech Republic         3870.      40544   10.5 
    ##  5 Slovakia               3712.      20248    5.46
    ##  6 Chile                  3565.      59698   16.7 
    ##  7 Brazil                 3378.     679275  201.  
    ##  8 United States          3294.    1021995  310.  
    ##  9 Argentina              3129.     129369   41.3 
    ## 10 Belgium                3104.      32296   10.4 
    ## 11 Poland                 3030.     116645   38.5 
    ## 12 Paraguay               3015.      19220    6.38
    ## 13 Romania                3011.      66117   22.0 
    ## 14 United Kingdom         2968.     185052   62.3 
    ## 15 Colombia               2947.     140845   47.8 
    ## 16 Mexico                 2916.     328006  112.  
    ## 17 Italy                  2863.     172729   60.3 
    ## 18 Greece                 2852.      31377   11   
    ## 19 Tunisia                2749.      29105   10.6 
    ## 20 Russia                 2720.     382651  141.

EOL
