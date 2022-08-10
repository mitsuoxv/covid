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

Updated: 2022-08-11

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
    ##  1 United States          102415. 91149143            890
    ##  2 India                   50274. 44190697            879
    ##  3 Brazil                  38765. 34035780            878
    ##  4 France                  37144. 33132519            892
    ##  5 Germany                 35100. 31379757            894
    ##  6 United Kingdom          26258. 23369355            890
    ##  7 Italy                   23769. 21368480            899
    ##  8 South Korea             23111. 20845973            902
    ##  9 Russia                  21452. 18770657            875
    ## 10 Turkey                  18624. 16295817            875
    ## 11 Japan                   16224. 14618271            901
    ## 12 Spain                   14905. 13280557            891
    ## 13 Vietnam                 13033. 11351563            871
    ## 14 Australia               10980.  9684624            882
    ## 15 Argentina               10899.  9602534            881
    ## 16 Netherlands              9432.  8356803            886
    ## 17 Iran                     8301.  7446144            897
    ## 18 Mexico                   7786.  6859970            881
    ## 19 Colombia                 7184.  6278998            874
    ## 20 Indonesia                7123.  6261605            879

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        710.             626567.            882
    ##  2 Denmark                       669.             591885.            884
    ##  3 Austria                       668.             590949.            884
    ##  4 Switzerland                   589.             524409.            890
    ##  5 France                        573.             511554.            892
    ##  6 Portugal                      572.             502753.            879
    ##  7 Netherlands                   567.             502061.            886
    ##  8 Australia                     510.             450118.            882
    ##  9 Belgium                       481.             427263.            889
    ## 10 South Korea                   477.             430501.            902
    ## 11 Greece                        472.             416152.            881
    ## 12 Czech Republic                434.             382307.            881
    ## 13 Germany                       429.             383605.            894
    ## 14 United Kingdom                421.             374819.            890
    ## 15 Italy                         394.             354133.            899
    ## 16 Slovakia                      382.             334586.            875
    ## 17 Serbia                        339.             296561.            874
    ## 18 United States                 330.             293809.            890
    ## 19 Norway                        328.             290904.            888
    ## 20 Spain                         320.             285567.            891

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11903
    ##  2 Sudan                 7.86       4960    63128
    ##  3 Syria                 5.57       3155    56604
    ##  4 Peru                  5.41     214694  3970336
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24781   515082
    ##  7 Mexico                4.79     328342  6859970
    ##  8 Afghanistan           4.12       7753   187966
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.41        311     9125
    ## 11 Myanmar               3.16      19434   614240
    ## 12 Bulgaria              3.07      37460  1221519
    ## 13 Malawi                3.05       2670    87617
    ## 14 Paraguay              2.71      19289   710890
    ## 15 Chad                  2.59        193     7442
    ## 16 Haiti                 2.58        838    32464
    ## 17 Tunisia               2.57      29105  1134660
    ## 18 Algeria               2.56       6878   268356
    ## 19 South Africa          2.55     101982  4004555
    ## 20 Indonesia             2.51     157149  6261605

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7179.     214694   29.9 
    ##  2 Bulgaria               5240.      37460    7.15
    ##  3 Hungary                4705.      46966    9.98
    ##  4 Czech Republic         3876.      40601   10.5 
    ##  5 Slovakia               3717.      20274    5.46
    ##  6 Chile                  3573.      59840   16.7 
    ##  7 Brazil                 3382.     680166  201.  
    ##  8 United States          3300.    1023774  310.  
    ##  9 Argentina              3131.     129440   41.3 
    ## 10 Belgium                3108.      32329   10.4 
    ## 11 Poland                 3032.     116717   38.5 
    ## 12 Paraguay               3025.      19289    6.38
    ## 13 Romania                3016.      66236   22.0 
    ## 14 United Kingdom         2968.     185052   62.3 
    ## 15 Colombia               2952.     141075   47.8 
    ## 16 Mexico                 2919.     328342  112.  
    ## 17 Greece                 2884.      31722   11   
    ## 18 Italy                  2874.     173426   60.3 
    ## 19 Tunisia                2749.      29105   10.6 
    ## 20 Russia                 2721.     382902  141.

EOL
