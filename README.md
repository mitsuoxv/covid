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

Updated: 2022-08-10

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
    ##  1 United States          102373. 91010168            889
    ##  2 India                   50313. 44174650            878
    ##  3 Brazil                  38789. 34018371            877
    ##  4 France                  37143. 33094289            891
    ##  5 Germany                 35058. 31307020            893
    ##  6 United Kingdom          26287. 23369355            889
    ##  7 Italy                   23748. 21325402            898
    ##  8 South Korea             22968. 20694239            901
    ##  9 Russia                  21449. 18746886            874
    ## 10 Turkey                  18645. 16295817            874
    ## 11 Japan                   16024. 14421539            900
    ## 12 Spain                   14906. 13266184            890
    ## 13 Vietnam                 13045. 11349223            870
    ## 14 Australia               10963.  9658087            881
    ## 15 Argentina               10912.  9602534            880
    ## 16 Netherlands              9440.  8354641            885
    ## 17 Iran                     8308.  7443801            896
    ## 18 Mexico                   7795.  6859970            880
    ## 19 Colombia                 7192.  6278998            873
    ## 20 Indonesia                7125.  6255679            878

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        711.             626252.            881
    ##  2 Denmark                       670.             591533.            883
    ##  3 Austria                       668.             590231.            883
    ##  4 Switzerland                   587.             521551.            889
    ##  5 France                        573.             510964.            891
    ##  6 Portugal                      572.             502405.            878
    ##  7 Netherlands                   567.             501931.            885
    ##  8 Australia                     510.             448884.            881
    ##  9 Belgium                       481.             427263.            888
    ## 10 South Korea                   474.             427367.            901
    ## 11 Greece                        462.             406783.            880
    ## 12 Czech Republic                434.             382075.            880
    ## 13 Germany                       429.             382716.            893
    ## 14 United Kingdom                422.             374819.            889
    ## 15 Italy                         394.             353419.            898
    ## 16 Slovakia                      383.             334416.            874
    ## 17 Serbia                        339.             295572.            873
    ## 18 United States                 330.             293361.            889
    ## 19 Norway                        328.             290859.            887
    ## 20 Spain                         321.             285258.            890

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11903
    ##  2 Sudan                 7.86       4960    63128
    ##  3 Syria                 5.57       3153    56564
    ##  4 Peru                  5.41     214637  3966898
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24781   515082
    ##  7 Mexico                4.79     328342  6859970
    ##  8 Afghanistan           4.13       7753   187685
    ##  9 Ecuador               3.67      35811   975234
    ## 10 Niger                 3.41        311     9125
    ## 11 Myanmar               3.16      19434   614240
    ## 12 Bulgaria              3.07      37451  1219883
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.71      19289   710890
    ## 15 Chad                  2.60        193     7437
    ## 16 Haiti                 2.58        838    32464
    ## 17 Tunisia               2.57      29105  1134660
    ## 18 Algeria               2.56       6878   268254
    ## 19 South Africa          2.55     101982  4004555
    ## 20 Indonesia             2.51     157131  6255679

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7177.     214637   29.9 
    ##  2 Bulgaria               5239.      37451    7.15
    ##  3 Hungary                4697.      46886    9.98
    ##  4 Czech Republic         3874.      40587   10.5 
    ##  5 Slovakia               3716.      20269    5.46
    ##  6 Chile                  3573.      59835   16.7 
    ##  7 Brazil                 3381.     679996  201.  
    ##  8 United States          3299.    1023445  310.  
    ##  9 Argentina              3131.     129440   41.3 
    ## 10 Belgium                3108.      32329   10.4 
    ## 11 Poland                 3031.     116686   38.5 
    ## 12 Paraguay               3025.      19289    6.38
    ## 13 Romania                3014.      66193   22.0 
    ## 14 United Kingdom         2968.     185052   62.3 
    ## 15 Colombia               2952.     141075   47.8 
    ## 16 Mexico                 2919.     328342  112.  
    ## 17 Italy                  2871.     173249   60.3 
    ## 18 Greece                 2852.      31377   11   
    ## 19 Tunisia                2749.      29105   10.6 
    ## 20 Russia                 2721.     382846  141.

EOL
