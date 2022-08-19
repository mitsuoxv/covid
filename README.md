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

Updated: 2022-08-20

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
    ##  1 United States          102457. 92108785            899
    ##  2 India                   49904. 44314618            888
    ##  3 Brazil                  38583. 34223207            887
    ##  4 France                  36957. 33298468            901
    ##  5 Germany                 35185. 31771884            903
    ##  6 United Kingdom          26097. 23461239            899
    ##  7 South Korea             24149. 22000037            911
    ##  8 Italy                   23768. 21581917            908
    ##  9 Russia                  21536. 19037664            884
    ## 10 Turkey                  18859. 16671848            884
    ## 11 Japan                   18047. 16423053            910
    ## 12 Spain                   14785. 13306301            900
    ## 13 Vietnam                 12928. 11376571            880
    ## 14 Australia               11078.  9870705            891
    ## 15 Argentina               10824.  9633732            890
    ## 16 Netherlands              9352.  8370501            895
    ## 17 Iran                     8271.  7493317            906
    ## 18 Mexico                   7808.  6949653            890
    ## 19 Colombia                 7119.  6286392            883
    ## 20 Indonesia                7102.  6306686            888

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        705.             628406.            891
    ##  2 Austria                       669.             597069.            893
    ##  3 Denmark                       666.             594665.            893
    ##  4 Switzerland                   586.             526802.            899
    ##  5 France                        571.             514116.            901
    ##  6 Portugal                      568.             504719.            888
    ##  7 Netherlands                   562.             502884.            895
    ##  8 Australia                     515.             458766.            891
    ##  9 South Korea                   499.             454334.            911
    ## 10 Belgium                       478.             429308.            898
    ## 11 Greece                        475.             423158.            890
    ## 12 Czech Republic                431.             383951.            890
    ## 13 Germany                       430.             388399.            903
    ## 14 United Kingdom                419.             376292.            899
    ## 15 Italy                         394.             357670.            908
    ## 16 Slovakia                      380.             335510.            884
    ## 17 Serbia                        344.             303763.            883
    ## 18 United States                 330.             296902.            899
    ## 19 Norway                        324.             291216.            898
    ## 20 Spain                         318.             286120.            900

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2152    11914
    ##  2 Sudan                 7.86       4961    63147
    ##  3 Syria                 5.56       3160    56797
    ##  4 Peru                  5.32     215159  4046670
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24786   515198
    ##  7 Mexico                4.73     328871  6949653
    ##  8 Afghanistan           4.09       7759   189710
    ##  9 Ecuador               3.64      35811   983615
    ## 10 Niger                 3.40        312     9183
    ## 11 Myanmar               3.16      19437   614541
    ## 12 Malawi                3.05       2673    87718
    ## 13 Bulgaria              3.05      37527  1231909
    ## 14 Paraguay              2.72      19357   712907
    ## 15 Chad                  2.59        193     7456
    ## 16 Haiti                 2.56        838    32703
    ## 17 Tunisia               2.56      29189  1141135
    ## 18 Algeria               2.55       6878   269556
    ## 19 South Africa          2.54     101982  4008988
    ## 20 Indonesia             2.49     157343  6306686

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7194.     215159   29.9 
    ##  2 Bulgaria               5249.      37527    7.15
    ##  3 Hungary                4717.      47083    9.98
    ##  4 Czech Republic         3885.      40700   10.5 
    ##  5 Slovakia               3727.      20329    5.46
    ##  6 Chile                  3585.      60043   16.7 
    ##  7 Brazil                 3391.     682010  201.  
    ##  8 United States          3316.    1028619  310.  
    ##  9 Argentina              3134.     129566   41.3 
    ## 10 Belgium                3118.      32436   10.4 
    ## 11 Paraguay               3036.      19357    6.38
    ## 12 Poland                 3035.     116860   38.5 
    ## 13 Romania                3026.      66441   22.0 
    ## 14 United Kingdom         3000.     187018   62.3 
    ## 15 Colombia               2956.     141287   47.8 
    ## 16 Mexico                 2924.     328871  112.  
    ## 17 Greece                 2912.      32028   11   
    ## 18 Italy                  2891.     174447   60.3 
    ## 19 Tunisia                2757.      29189   10.6 
    ## 20 Russia                 2725.     383427  141.

EOL
