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

Updated: 2022-08-05

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
    ##  1 United States          102447. 90563041            884
    ##  2 India                   50500. 44087037            873
    ##  3 Brazil                  38865. 33890428            872
    ##  4 France                  37218. 32975495            886
    ##  5 Germany                 35044. 31119199            888
    ##  6 United Kingdom          26436. 23369355            884
    ##  7 Italy                   23707. 21170600            893
    ##  8 South Korea             22500. 20160154            896
    ##  9 Russia                  21466. 18653867            869
    ## 10 Turkey                  18285. 15889495            869
    ## 11 Spain                   14967. 13245996            885
    ## 12 Japan                   14910. 13344898            895
    ## 13 Vietnam                 12468. 10785122            865
    ## 14 Argentina               10926.  9560307            875
    ## 15 Australia               10864.  9517174            876
    ## 16 Netherlands              9483.  8344857            880
    ## 17 Iran                     8326.  7418615            891
    ## 18 Mexico                   7752.  6782980            875
    ## 19 Colombia                 7219.  6265798            868
    ## 20 Indonesia                7135.  6229315            873

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        713.             624696.            876
    ##  2 Denmark                       672.             590337.            878
    ##  3 Austria                       668.             586908.            878
    ##  4 Switzerland                   590.             521551.            884
    ##  5 France                        575.             509129.            886
    ##  6 Portugal                      574.             501372.            873
    ##  7 Netherlands                   570.             501343.            880
    ##  8 Australia                     505.             442335.            876
    ##  9 Belgium                       482.             425377.            883
    ## 10 Greece                        465.             406783.            875
    ## 11 South Korea                   465.             416337.            896
    ## 12 Czech Republic                436.             381279.            875
    ## 13 Germany                       428.             380420.            888
    ## 14 United Kingdom                424.             374819.            884
    ## 15 Italy                         393.             350853.            893
    ## 16 Slovakia                      384.             333815.            869
    ## 17 Serbia                        336.             291653.            868
    ## 18 United States                 330.             291920.            884
    ## 19 Norway                        330.             290721.            882
    ## 20 Spain                         322.             284824.            885

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
    ##  4 Peru                  5.46     214407  3923744
    ##  5 Somalia               5.04       1361    27020
    ##  6 Mexico                4.83     327883  6782980
    ##  7 Egypt                 4.81      24775   514891
    ##  8 Afghanistan           4.16       7752   186393
    ##  9 Ecuador               3.72      35801   963668
    ## 10 Niger                 3.41        311     9115
    ## 11 Myanmar               3.16      19434   614158
    ## 12 Bulgaria              3.08      37420  1213429
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.72      19220   707109
    ## 15 Chad                  2.60        193     7437
    ## 16 Haiti                 2.59        838    32296
    ## 17 Algeria               2.57       6876   267657
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
    ##  1 Peru                   7169.     214407   29.9 
    ##  2 Bulgaria               5234.      37420    7.15
    ##  3 Hungary                4697.      46886    9.98
    ##  4 Czech Republic         3869.      40531   10.5 
    ##  5 Slovakia               3711.      20242    5.46
    ##  6 Chile                  3561.      59633   16.7 
    ##  7 Brazil                 3376.     679010  201.  
    ##  8 United States          3292.    1021355  310.  
    ##  9 Argentina              3129.     129369   41.3 
    ## 10 Belgium                3101.      32263   10.4 
    ## 11 Poland                 3029.     116628   38.5 
    ## 12 Paraguay               3015.      19220    6.38
    ## 13 Romania                3010.      66090   22.0 
    ## 14 United Kingdom         2968.     185052   62.3 
    ## 15 Colombia               2947.     140845   47.8 
    ## 16 Mexico                 2915.     327883  112.  
    ## 17 Italy                  2860.     172568   60.3 
    ## 18 Greece                 2852.      31377   11   
    ## 19 Tunisia                2749.      29105   10.6 
    ## 20 Russia                 2719.     382604  141.

EOL
