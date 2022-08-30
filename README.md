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

Updated: 2022-08-31

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
    ##  1 United States          102147. 92953690            910
    ##  2 India                   49409. 44418585            899
    ##  3 Brazil                  38290. 34384747            898
    ##  4 France                  36696. 33466622            912
    ##  5 Germany                 35116. 32095854            914
    ##  6 United Kingdom          25817. 23493327            910
    ##  7 South Korea             25100. 23142479            922
    ##  8 Italy                   23737. 21814856            919
    ##  9 Russia                  21768. 19482648            895
    ## 10 Japan                   20231. 18632422            921
    ## 11 Turkey                  18628. 16671848            895
    ## 12 Spain                   14635. 13332976            911
    ## 13 Vietnam                 12801. 11405711            891
    ## 14 Australia               11093. 10005838            902
    ## 15 Argentina               10742.  9678225            901
    ## 16 Netherlands              9254.  8383824            906
    ## 17 Iran                     8207.  7525628            917
    ## 18 Mexico                   7785.  7014510            901
    ## 19 Indonesia                7062.  6349175            899
    ## 20 Colombia                 7046.  6299595            894

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        698.             629866.            902
    ##  2 Austria                       668.             603493.            904
    ##  3 Denmark                       660.             596546.            904
    ##  4 Switzerland                   581.             529038.            910
    ##  5 France                        567.             516712.            912
    ##  6 Portugal                      564.             507041.            899
    ##  7 Netherlands                   556.             503684.            906
    ##  8 South Korea                   518.             477927.            922
    ##  9 Australia                     516.             465047.            902
    ## 10 Greece                        475.             428366.            901
    ## 11 Belgium                       474.             430868.            909
    ## 12 Germany                       429.             392359.            914
    ## 13 Czech Republic                428.             385501.            901
    ## 14 United Kingdom                414.             376807.            910
    ## 15 Italy                         393.             361530.            919
    ## 16 Slovakia                      376.             336182.            895
    ## 17 Serbia                        347.             309833.            894
    ## 18 United States                 329.             299626.            910
    ## 19 Norway                        321.             291414.            908
    ## 20 Spain                         315.             286694.            911

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11926
    ##  2 Sudan                 7.85       4961    63228
    ##  3 Syria                 5.55       3163    57008
    ##  4 Peru                  5.26     215639  4099785
    ##  5 Somalia               5.04       1361    27020
    ##  6 Egypt                 4.81      24794   515308
    ##  7 Mexico                4.70     329390  7014510
    ##  8 Afghanistan           4.03       7777   193004
    ##  9 Ecuador               3.60      35832   995111
    ## 10 Niger                 3.34        312     9329
    ## 11 Myanmar               3.16      19437   615030
    ## 12 Malawi                3.05       2673    87718
    ## 13 Bulgaria              3.03      37599  1241273
    ## 14 Paraguay              2.72      19478   715162
    ## 15 Chad                  2.56        193     7536
    ## 16 Tunisia               2.56      29233  1143167
    ## 17 Algeria               2.55       6878   270235
    ## 18 South Africa          2.54     102084  4011431
    ## 19 Haiti                 2.52        841    33381
    ## 20 Sri Lanka             2.49      16692   669819

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7210.     215639   29.9 
    ##  2 Bulgaria               5259.      37599    7.15
    ##  3 Hungary                4728.      47191    9.98
    ##  4 Czech Republic         3895.      40805   10.5 
    ##  5 Slovakia               3730.      20349    5.46
    ##  6 Chile                  3609.      60435   16.7 
    ##  7 Brazil                 3399.     683494  201.  
    ##  8 United States          3330.    1033207  310.  
    ##  9 Argentina              3137.     129711   41.3 
    ## 10 Belgium                3126.      32516   10.4 
    ## 11 Paraguay               3055.      19478    6.38
    ## 12 Poland                 3040.     117059   38.5 
    ## 13 Romania                3035.      66639   22.0 
    ## 14 United Kingdom         3011.     187761   62.3 
    ## 15 Colombia               2961.     141519   47.8 
    ## 16 Greece                 2940.      32335   11   
    ## 17 Mexico                 2929.     329390  112.  
    ## 18 Italy                  2907.     175407   60.3 
    ## 19 Tunisia                2761.      29233   10.6 
    ## 20 Russia                 2731.     384254  141.

EOL
