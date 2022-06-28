WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-06-29

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
    ##  1 United States          101532. 85997455            847
    ##  2 India                   51936. 43418839            836
    ##  3 Brazil                  38417. 32078638            835
    ##  4 France                  34750. 29502885            849
    ##  5 Germany                 32802. 27914240            851
    ##  6 United Kingdom          26730. 22640582            847
    ##  7 Russia                  22144. 18424105            832
    ##  8 South Korea             21349. 18339319            859
    ##  9 Italy                   21331. 18259261            856
    ## 10 Turkey                  18145. 15096696            832
    ## 11 Spain                   14955. 12681820            848
    ## 12 Vietnam                 12976. 10744085            828
    ## 13 Argentina               11178.  9367172            838
    ## 14 Japan                   10799.  9265374            858
    ## 15 Netherlands              9686.  8165618            843
    ## 16 Australia                9563.  8023259            839
    ## 17 Iran                     8474.  7236713            854
    ## 18 Colombia                 7402.  6151354            831
    ## 19 Indonesia                7277.  6084063            836
    ## 20 Poland                   7193.  6013164            836

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        700.             587502.            839
    ##  2 Denmark                       686.             577030.            841
    ##  3 Austria                       642.             540271.            841
    ##  4 Netherlands                   582.             490575.            843
    ##  5 Switzerland                   578.             489236.            847
    ##  6 Portugal                      575.             480998.            836
    ##  7 France                        537.             455514.            849
    ##  8 Belgium                       480.             406154.            846
    ##  9 Czech Republic                448.             375181.            838
    ## 10 Australia                     444.             372902.            839
    ## 11 South Korea                   441.             378734.            859
    ## 12 United Kingdom                429.             363130.            847
    ## 13 Germany                       401.             341240.            851
    ## 14 Slovakia                      395.             328947.            832
    ## 15 Greece                        393.             329505.            838
    ## 16 Italy                         354.             302605.            856
    ## 17 Norway                        341.             288310.            845
    ## 18 Serbia                        332.             275948.            831
    ## 19 United States                 327.             277203.            847
    ## 20 Spain                         322.             272692.            848

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.92       4951    62551
    ##  3 Peru                 5.90     213462  3616929
    ##  4 Syria                5.63       3150    55923
    ##  5 Mexico               5.46     325580  5962615
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24723   514088
    ##  8 Afghanistan          4.24       7720   182250
    ##  9 Ecuador              3.96      35705   901739
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37247  1170686
    ## 12 Myanmar              3.17      19434   613577
    ## 13 Malawi               3.06       2645    86410
    ## 14 Paraguay             2.89      18963   655532
    ## 15 Tunisia              2.74      28670  1046703
    ## 16 Haiti                2.67        837    31301
    ## 17 Chad                 2.60        193     7425
    ## 18 Algeria              2.58       6875   266049
    ## 19 Indonesia            2.58     156728  6084063
    ## 20 Honduras             2.56      10904   426490

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7138.     213462   29.9 
    ##  2 Bulgaria               5210.      37247    7.15
    ##  3 Hungary                4671.      46626    9.98
    ##  4 Czech Republic         3848.      40314   10.5 
    ##  5 Slovakia               3692.      20142    5.46
    ##  6 Chile                  3490.      58445   16.7 
    ##  7 Brazil                 3334.     670405  201.  
    ##  8 United States          3243.    1006143  310.  
    ##  9 Argentina              3122.     129070   41.3 
    ## 10 Belgium                3067.      31903   10.4 
    ## 11 Poland                 3024.     116417   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2974.      18963    6.38
    ## 14 Colombia               2929.     139970   47.8 
    ## 15 Mexico                 2895.     325580  112.  
    ## 16 United Kingdom         2887.     180011   62.3 
    ## 17 Italy                  2787.     168165   60.3 
    ## 18 Greece                 2745.      30190   11   
    ## 19 Russia                 2708.     381002  141.  
    ## 20 Tunisia                2708.      28670   10.6

EOL
