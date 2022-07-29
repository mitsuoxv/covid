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

Updated: 2022-07-30

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
    ##  1 United States          102282. 89803788            878
    ##  2 India                   50726. 43979730            867
    ##  3 Brazil                  38919. 33704393            866
    ##  4 France                  37237. 32768452            880
    ##  5 Germany                 34906. 30787309            882
    ##  6 United Kingdom          26543. 23304931            878
    ##  7 Italy                   23560. 20898059            887
    ##  8 South Korea             22045. 19620517            890
    ##  9 Russia                  21526. 18576973            863
    ## 10 Turkey                  17988. 15524071            863
    ## 11 Spain                   15021. 13203228            879
    ## 12 Japan                   13631. 12118112            889
    ## 13 Vietnam                 12541. 10772980            859
    ## 14 Argentina               10941.  9507562            869
    ## 15 Australia               10667.  9280010            870
    ## 16 Netherlands              9529.  8328084            874
    ## 17 Iran                     8316.  7359489            885
    ## 18 Mexico                   7695.  6686954            869
    ## 19 Colombia                 7248.  6247634            862
    ## 20 Indonesia                7148.  6197495            867

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        715.             621970.            870
    ##  2 Denmark                       675.             588675.            872
    ##  3 Austria                       667.             581846.            872
    ##  4 Switzerland                   591.             518489.            878
    ##  5 Portugal                      576.             499796.            867
    ##  6 France                        575.             505933.            880
    ##  7 Netherlands                   572.             500335.            874
    ##  8 Australia                     496.             431312.            870
    ##  9 Belgium                       484.             424325.            877
    ## 10 South Korea                   455.             405193.            890
    ## 11 Greece                        455.             395402.            869
    ## 12 Czech Republic                437.             380039.            869
    ## 13 Germany                       427.             376363.            882
    ## 14 United Kingdom                426.             373785.            878
    ## 15 Italy                         390.             346337.            887
    ## 16 Slovakia                      386.             332928.            863
    ## 17 Serbia                        333.             286888.            862
    ## 18 Norway                        332.             290500.            876
    ## 19 United States                 330.             289472.            878
    ## 20 Spain                         323.             283904.            879

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11849
    ##  2 Sudan                 7.87       4957    63006
    ##  3 Syria                 5.60       3150    56214
    ##  4 Peru                  5.53     214120  3873702
    ##  5 Somalia               5.05       1361    26957
    ##  6 Mexico                4.90     327412  6686954
    ##  7 Egypt                 4.81      24765   514659
    ##  8 Afghanistan           4.18       7743   185272
    ##  9 Ecuador               3.74      35797   958075
    ## 10 Niger                 3.42        311     9104
    ## 11 Myanmar               3.17      19434   614009
    ## 12 Bulgaria              3.10      37360  1204264
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.73      19147   701060
    ## 15 Haiti                 2.60        838    32223
    ## 16 Chad                  2.60        193     7432
    ## 17 Algeria               2.57       6876   267194
    ## 18 Tunisia               2.57      29041  1128693
    ## 19 South Africa          2.55     101977  4004201
    ## 20 Indonesia             2.53     156970  6197495

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7160.     214120   29.9 
    ##  2 Bulgaria               5226.      37360    7.15
    ##  3 Hungary                4687.      46790    9.98
    ##  4 Czech Republic         3861.      40448   10.5 
    ##  5 Slovakia               3706.      20216    5.46
    ##  6 Chile                  3552.      59477   16.7 
    ##  7 Brazil                 3370.     677804  201.  
    ##  8 United States          3284.    1018670  310.  
    ##  9 Argentina              3127.     129278   41.3 
    ## 10 Belgium                3098.      32228   10.4 
    ## 11 Poland                 3027.     116556   38.5 
    ## 12 Paraguay               3003.      19147    6.38
    ## 13 Romania                3003.      65935   22.0 
    ## 14 United Kingdom         2950.     183953   62.3 
    ## 15 Colombia               2942.     140603   47.8 
    ## 16 Mexico                 2911.     327412  112.  
    ## 17 Italy                  2844.     171638   60.3 
    ## 18 Greece                 2818.      30999   11   
    ## 19 Tunisia                2743.      29041   10.6 
    ## 20 Russia                 2717.     382352  141.

EOL
