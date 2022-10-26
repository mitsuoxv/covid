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

Updated: 2022-10-27

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
    ##  1 United States           99427. 95946824            965
    ##  2 India                   46700. 44645768            956
    ##  3 France                  36759. 35619600            969
    ##  4 Germany                 36440. 35383015            971
    ##  5 Brazil                  36433. 34793309            955
    ##  6 South Korea             25941. 25396155            979
    ##  7 United Kingdom          24669. 23855526            967
    ##  8 Italy                   23984. 23408393            976
    ##  9 Japan                   22552. 22055832            978
    ## 10 Russia                  22473. 21394360            952
    ## 11 Turkey                  17773. 16919638            952
    ## 12 Spain                   13934. 13488015            968
    ## 13 Vietnam                 12129. 11498047            948
    ## 14 Australia               10775. 10332884            959
    ## 15 Argentina               10143.  9717546            958
    ## 16 Netherlands              8832.  8505321            963
    ## 17 China                    8658.  8762389           1012
    ## 18 Iran                     7758.  7556854            974
    ## 19 Mexico                   7418.  7106865            958
    ## 20 Indonesia                6777.  6478720            956

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       686.             659189.            961
    ##  2 Israel                        664.             636379.            959
    ##  3 Denmark                       632.             607204.            961
    ##  4 Switzerland                   574.             555526.            967
    ##  5 France                        568.             549953.            969
    ##  6 Portugal                      540.             516002.            956
    ##  7 South Korea                   536.             524469.            979
    ##  8 Netherlands                   531.             510984.            963
    ##  9 Australia                     501.             480247.            959
    ## 10 Greece                        487.             466836.            958
    ## 11 Belgium                       458.             442881.            966
    ## 12 Germany                       445.             432543.            971
    ## 13 Czech Republic                414.             396430.            958
    ## 14 Italy                         397.             387939.            976
    ## 15 United Kingdom                396.             382616.            967
    ## 16 Slovakia                      357.             339468.            952
    ## 17 Serbia                        343.             326610.            951
    ## 18 United States                 320.             309274.            965
    ## 19 Norway                        303.             292289.            965
    ## 20 Spain                         300.             290028.            968

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4972    63473
    ##  3 Syria                 5.51       3163    57353
    ##  4 Peru                  5.22     216877  4152580
    ##  5 Somalia               5.00       1361    27237
    ##  6 Egypt                 4.81      24798   515401
    ##  7 Mexico                4.65     330331  7106865
    ##  8 Afghanistan           3.86       7820   202399
    ##  9 Ecuador               3.56      35908  1007553
    ## 10 Niger                 3.33        314     9425
    ## 11 Myanmar               3.09      19478   630902
    ## 12 Malawi                3.05       2683    88073
    ## 13 Bulgaria              2.97      37847  1276146
    ## 14 Paraguay              2.73      19598   717628
    ## 15 Tunisia               2.55      29257  1146152
    ## 16 Chad                  2.55        194     7620
    ## 17 Algeria               2.54       6881   270777
    ## 18 South Africa          2.54     102257  4026068
    ## 19 Haiti                 2.53        857    33811
    ## 20 Sri Lanka             2.50      16774   671015

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7252.     216877   29.9 
    ##  2 Bulgaria               5294.      37847    7.15
    ##  3 Hungary                4802.      47938    9.98
    ##  4 Czech Republic         3964.      41524   10.5 
    ##  5 Slovakia               3773.      20579    5.46
    ##  6 Chile                  3677.      61577   16.7 
    ##  7 Brazil                 3419.     687666  201.  
    ##  8 United States          3414.    1059255  310.  
    ##  9 Belgium                3161.      32883   10.4 
    ## 10 Argentina              3144.     129979   41.3 
    ## 11 United Kingdom         3090.     192682   62.3 
    ## 12 Paraguay               3074.      19598    6.38
    ## 13 Poland                 3067.     118073   38.5 
    ## 14 Romania                3059.      67168   22.0 
    ## 15 Greece                 3052.      33574   11   
    ## 16 Colombia               2968.     141827   47.8 
    ## 17 Italy                  2962.     178753   60.3 
    ## 18 Mexico                 2937.     330331  112.  
    ## 19 Russia                 2770.     389790  141.  
    ## 20 Tunisia                2763.      29257   10.6

EOL
