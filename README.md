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

Updated: 2022-09-02

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
    ##  1 United States          102211. 93216822            912
    ##  2 India                   49319. 44436339            901
    ##  3 Brazil                  38238. 34414011            900
    ##  4 France                  36666. 33513220            914
    ##  5 Germany                 35136. 32184553            916
    ##  6 United Kingdom          25792. 23522244            912
    ##  7 South Korea             25246. 23327897            924
    ##  8 Italy                   23743. 21867757            921
    ##  9 Russia                  21827. 19578730            897
    ## 10 Japan                   20519. 18939344            923
    ## 11 Turkey                  18586. 16671848            897
    ## 12 Spain                   14614. 13342530            913
    ## 13 Vietnam                 12779. 11411679            893
    ## 14 Australia               11096. 10031133            904
    ## 15 Argentina               10718.  9678225            903
    ## 16 Netherlands              9236.  8386307            908
    ## 17 Iran                     8192.  7528961            919
    ## 18 Mexico                   7768.  7014510            903
    ## 19 Indonesia                7062.  6362902            901
    ## 20 Colombia                 7031.  6299595            896

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        697.             630104.            904
    ##  2 Austria                       667.             604674.            906
    ##  3 Denmark                       659.             596865.            906
    ##  4 Switzerland                   582.             531048.            912
    ##  5 France                        566.             517432.            914
    ##  6 Portugal                      563.             507646.            901
    ##  7 Netherlands                   555.             503833.            908
    ##  8 South Korea                   521.             481756.            924
    ##  9 Australia                     516.             466223.            904
    ## 10 Greece                        479.             432984.            903
    ## 11 Belgium                       473.             430868.            911
    ## 12 Germany                       430.             393443.            916
    ## 13 Czech Republic                427.             385902.            903
    ## 14 United Kingdom                414.             377271.            912
    ## 15 Italy                         393.             362407.            921
    ## 16 Slovakia                      375.             336337.            897
    ## 17 Serbia                        347.             310857.            896
    ## 18 United States                 329.             300474.            912
    ## 19 Norway                        320.             291468.            910
    ## 20 Spain                         314.             286899.            913

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11926
    ##  2 Sudan                 7.85       4961    63228
    ##  3 Syria                 5.54       3163    57043
    ##  4 Peru                  5.26     215745  4102641
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24794   515308
    ##  7 Mexico                4.70     329390  7014510
    ##  8 Afghanistan           4.02       7778   193520
    ##  9 Ecuador               3.60      35843   995968
    ## 10 Myanmar               3.16      19437   615221
    ## 11 Niger                 3.14        312     9931
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.03      37603  1242910
    ## 14 Paraguay              2.72      19478   715162
    ## 15 Chad                  2.56        193     7536
    ## 16 Tunisia               2.56      29234  1143862
    ## 17 Algeria               2.54       6878   270272
    ## 18 South Africa          2.54     102084  4011657
    ## 19 Haiti                 2.52        841    33381
    ## 20 Sri Lanka             2.49      16698   669957

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7214.     215745   29.9 
    ##  2 Bulgaria               5260.      37603    7.15
    ##  3 Hungary                4738.      47291    9.98
    ##  4 Czech Republic         3897.      40829   10.5 
    ##  5 Slovakia               3732.      20357    5.46
    ##  6 Chile                  3610.      60451   16.7 
    ##  7 Brazil                 3400.     683851  201.  
    ##  8 United States          3335.    1034719  310.  
    ##  9 Argentina              3137.     129711   41.3 
    ## 10 Belgium                3126.      32516   10.4 
    ## 11 Paraguay               3055.      19478    6.38
    ## 12 Poland                 3042.     117119   38.5 
    ## 13 Romania                3038.      66709   22.0 
    ## 14 United Kingdom         3019.     188242   62.3 
    ## 15 Colombia               2961.     141519   47.8 
    ## 16 Greece                 2959.      32552   11   
    ## 17 Mexico                 2929.     329390  112.  
    ## 18 Italy                  2910.     175595   60.3 
    ## 19 Tunisia                2761.      29234   10.6 
    ## 20 Russia                 2732.     384441  141.

EOL
