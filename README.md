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

Updated: 2022-11-02

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
    ##  1 United States           99080. 96206427            971
    ##  2 India                   46418. 44654638            962
    ##  3 France                  36683. 35766169            975
    ##  4 Germany                 36458. 35619687            977
    ##  5 Brazil                  36238. 34824866            961
    ##  6 South Korea             25946. 25557309            985
    ##  7 United Kingdom          24562. 23898489            973
    ##  8 Italy                   23962. 23531023            982
    ##  9 Japan                   22635. 22273251            984
    ## 10 Russia                  22374. 21434758            958
    ## 11 Turkey                  17661. 16919638            958
    ## 12 Spain                   13872. 13511768            974
    ## 13 Vietnam                 12057. 11502474            954
    ## 14 Australia               10741. 10364859            965
    ## 15 Argentina               10082.  9718875            964
    ## 16 China                    8789.  8947493           1018
    ## 17 Netherlands              8784.  8511830            969
    ## 18 Iran                     7712.  7557650            980
    ## 19 Mexico                   7376.  7110993            964
    ## 20 Indonesia                6754.  6497786            962

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       686.             662958.            967
    ##  2 Israel                        660.             636996.            965
    ##  3 Denmark                       629.             608059.            967
    ##  4 Switzerland                   571.             555526.            973
    ##  5 France                        566.             552216.            975
    ##  6 Portugal                      537.             516932.            962
    ##  7 South Korea                   536.             527797.            985
    ##  8 Netherlands                   528.             511375.            969
    ##  9 Australia                     499.             481733.            965
    ## 10 Greece                        484.             466836.            964
    ## 11 Belgium                       456.             443357.            972
    ## 12 Germany                       446.             435436.            977
    ## 13 Czech Republic                412.             396939.            964
    ## 14 Italy                         397.             389972.            982
    ## 15 United Kingdom                394.             383305.            973
    ## 16 Slovakia                      355.             339649.            958
    ## 17 Serbia                        342.             327320.            957
    ## 18 United States                 319.             310110.            971
    ## 19 Norway                        301.             292414.            971
    ## 20 Spain                         298.             290538.            974

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4972    63481
    ##  3 Syria                 5.51       3163    57360
    ##  4 Peru                  5.22     217005  4156078
    ##  5 Somalia               5.00       1361    27237
    ##  6 Egypt                 4.81      24798   515406
    ##  7 Mexico                4.65     330392  7110993
    ##  8 Afghanistan           3.85       7822   203063
    ##  9 Ecuador               3.56      35920  1008035
    ## 10 Niger                 3.33        314     9428
    ## 11 Myanmar               3.08      19482   631716
    ## 12 Malawi                3.05       2683    88073
    ## 13 Bulgaria              2.96      37880  1279082
    ## 14 Paraguay              2.73      19601   717955
    ## 15 Tunisia               2.55      29259  1146593
    ## 16 Chad                  2.55        194     7620
    ## 17 Algeria               2.54       6881   270836
    ## 18 South Africa          2.54     102311  4028160
    ## 19 Haiti                 2.53        857    33811
    ## 20 Sri Lanka             2.50      16780   671087

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7256.     217005   29.9 
    ##  2 Bulgaria               5299.      37880    7.15
    ##  3 Hungary                4802.      47938    9.98
    ##  4 Czech Republic         3971.      41602   10.5 
    ##  5 Slovakia               3778.      20609    5.46
    ##  6 Chile                  3683.      61677   16.7 
    ##  7 Brazil                 3422.     688092  201.  
    ##  8 United States          3418.    1060430  310.  
    ##  9 Belgium                3163.      32902   10.4 
    ## 10 Argentina              3144.     129991   41.3 
    ## 11 United Kingdom         3106.     193673   62.3 
    ## 12 Paraguay               3074.      19601    6.38
    ## 13 Poland                 3068.     118131   38.5 
    ## 14 Romania                3060.      67186   22.0 
    ## 15 Greece                 3052.      33574   11   
    ## 16 Italy                  2968.     179101   60.3 
    ## 17 Colombia               2968.     141837   47.8 
    ## 18 Mexico                 2938.     330392  112.  
    ## 19 Russia                 2774.     390247  141.  
    ## 20 Tunisia                2763.      29259   10.6

EOL
