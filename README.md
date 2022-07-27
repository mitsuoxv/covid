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

Updated: 2022-07-28

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
    ##  1 United States          102087. 89428046            876
    ##  2 India                   50796. 43938764            865
    ##  3 Brazil                  38914. 33621965            864
    ##  4 France                  37203. 32664720            878
    ##  5 Germany                 34771. 30598385            880
    ##  6 United Kingdom          26499. 23213017            876
    ##  7 Italy                   23472. 20772833            885
    ##  8 South Korea             21900. 19446946            888
    ##  9 Russia                  21549. 18554036            861
    ## 10 Turkey                  18030. 15524071            861
    ## 11 Spain                   15055. 13203228            877
    ## 12 Japan                   13169. 11680821            887
    ## 13 Vietnam                 12565. 10767948            857
    ## 14 Argentina               10966.  9507562            867
    ## 15 Australia               10582.  9185633            868
    ## 16 Netherlands              9541.  8320281            872
    ## 17 Iran                     8323.  7348963            883
    ## 18 Mexico                   7645.  6628541            867
    ## 19 Colombia                 7265.  6247634            860
    ## 20 Indonesia                7143.  6178873            865

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        715.             620815.            868
    ##  2 Denmark                       676.             588058.            870
    ##  3 Austria                       666.             579292.            870
    ##  4 Switzerland                   592.             518489.            876
    ##  5 Portugal                      577.             499143.            865
    ##  6 France                        574.             504331.            878
    ##  7 Netherlands                   573.             499867.            872
    ##  8 Australia                     492.             426926.            868
    ##  9 Belgium                       483.             422778.            875
    ## 10 Greece                        456.             395402.            867
    ## 11 South Korea                   452.             401609.            888
    ## 12 Czech Republic                438.             379507.            867
    ## 13 Germany                       425.             374053.            880
    ## 14 United Kingdom                425.             372311.            876
    ## 15 Italy                         389.             344261.            885
    ## 16 Slovakia                      386.             332632.            861
    ## 17 Norway                        332.             290403.            874
    ## 18 Serbia                        332.             285243.            860
    ## 19 United States                 329.             288261.            876
    ## 20 Spain                         324.             283904.            877

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11849
    ##  2 Sudan                 7.87       4957    63006
    ##  3 Syria                 5.61       3150    56188
    ##  4 Peru                  5.57     214071  3845093
    ##  5 Somalia               5.05       1361    26957
    ##  6 Mexico                4.93     327109  6628541
    ##  7 Egypt                 4.81      24765   514659
    ##  8 Afghanistan           4.18       7742   185086
    ##  9 Ecuador               3.75      35793   954844
    ## 10 Niger                 3.42        311     9104
    ## 11 Myanmar               3.17      19434   613980
    ## 12 Bulgaria              3.11      37350  1200550
    ## 13 Malawi                3.05       2651    86823
    ## 14 Paraguay              2.73      19147   701060
    ## 15 Haiti                 2.61        838    32131
    ## 16 Chad                  2.60        193     7432
    ## 17 Algeria               2.58       6876   266916
    ## 18 Tunisia               2.57      29041  1128693
    ## 19 South Africa          2.55     101955  4002981
    ## 20 Indonesia             2.54     156929  6178873

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7158.     214071   29.9 
    ##  2 Bulgaria               5225.      37350    7.15
    ##  3 Hungary                4687.      46790    9.98
    ##  4 Czech Republic         3858.      40420   10.5 
    ##  5 Slovakia               3704.      20206    5.46
    ##  6 Chile                  3547.      59393   16.7 
    ##  7 Brazil                 3367.     677143  201.  
    ##  8 United States          3279.    1017366  310.  
    ##  9 Argentina              3127.     129278   41.3 
    ## 10 Belgium                3093.      32179   10.4 
    ## 11 Poland                 3027.     116535   38.5 
    ## 12 Paraguay               3003.      19147    6.38
    ## 13 Romania                3001.      65894   22.0 
    ## 14 Colombia               2942.     140603   47.8 
    ## 15 United Kingdom         2931.     182727   62.3 
    ## 16 Mexico                 2908.     327109  112.  
    ## 17 Italy                  2838.     171232   60.3 
    ## 18 Greece                 2818.      30999   11   
    ## 19 Tunisia                2743.      29041   10.6 
    ## 20 Russia                 2717.     382272  141.

EOL
