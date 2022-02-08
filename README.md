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

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2022-02-08

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
    ##  1 United States          107259. 75725243            706
    ##  2 India                   60823. 42272014            695
    ##  3 Brazil                  38036. 26473273            696
    ##  4 France                  28538. 20204946            708
    ##  5 United Kingdom          25181. 17803329            707
    ##  6 Russia                  18787. 12982023            691
    ##  7 Turkey                  17710. 12237610            691
    ##  8 Italy                   16254. 11621736            715
    ##  9 Germany                 15681. 11117857            709
    ## 10 Spain                   14427. 10199717            707
    ## 11 Argentina               12449.  8589879            690
    ## 12 Iran                     9227.  6579266            713
    ## 13 Colombia                 8620.  5956350            691
    ## 14 Poland                   7461.  5185757            695
    ## 15 Mexico                   7376.  5141291            697
    ## 16 Netherlands              6969.  4892041            702
    ## 17 Indonesia                6536.  4542601            695
    ## 18 Ukraine                  6288.  4307437            685
    ## 19 South Africa             5244.  3623962            691
    ## 20 Philippines              5193.  3609568            695

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        626.             437020.            698
    ##  2 Denmark                       522.             365252.            700
    ##  3 Belgium                       449.             316835.            705
    ##  4 Czech Republic                444.             309631.            697
    ##  5 France                        441.             311957.            708
    ##  6 Switzerland                   440.             310644.            706
    ##  7 Netherlands                   419.             293905.            702
    ##  8 United Kingdom                404.             285546.            707
    ##  9 Portugal                      392.             273133.            696
    ## 10 Austria                       360.             252224.            700
    ## 11 Serbia                        349.             240760.            690
    ## 12 United States                 346.             244092.            706
    ## 13 Sweden                        341.             239411.            702
    ## 14 Spain                         310.             219321.            707
    ## 15 Jordan                        302.             207599.            687
    ## 16 Argentina                     301.             207770.            690
    ## 17 Slovakia                      299.             206603.            691
    ## 18 Italy                         269.             192603.            715
    ## 19 Greece                        267.             186168.            697
    ## 20 Norway                        253.             178043.            704

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.0        2028    11266
    ##  2 Peru                 6.18     206891  3349298
    ##  3 Sudan                6.09       3604    59194
    ##  4 Mexico               6.02     309417  5141291
    ##  5 Syria                5.79       3008    51915
    ##  6 Egypt                5.22      22936   439651
    ##  7 Somalia              5.12       1335    26067
    ##  8 Ecuador              4.53      34730   766398
    ##  9 Afghanistan          4.47       7432   166191
    ## 10 China                4.04       5700   141050
    ## 11 Myanmar              3.59      19310   537901
    ## 12 Niger                3.48        302     8686
    ## 13 Bulgaria             3.39      33770   995436
    ## 14 Indonesia            3.18     144636  4542601
    ## 15 Malawi               3.03       2571    84813
    ## 16 El Salvador          2.92       3942   135109
    ## 17 Paraguay             2.90      17558   605005
    ## 18 Tunisia              2.83      26679   944175
    ## 19 Haiti                2.72        804    29549
    ## 20 Chad                 2.65        190     7157

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6918.     206891   29.9 
    ##  2 Bulgaria               4724.      33770    7.15
    ##  3 Hungary                4205.      41975    9.98
    ##  4 Czech Republic         3578.      37478   10.5 
    ##  5 Slovakia               3295.      17973    5.46
    ##  6 Brazil                 3142.     631802  201.  
    ##  7 Argentina              2967.     122684   41.3 
    ##  8 United States          2881.     893870  310.  
    ##  9 Colombia               2836.     135518   47.8 
    ## 10 Belgium                2809.      29227   10.4 
    ## 11 Poland                 2769.     106607   38.5 
    ## 12 Romania                2762.      60642   22.0 
    ## 13 Paraguay               2754.      17558    6.38
    ## 14 Mexico                 2751.     309417  112.  
    ## 15 United Kingdom         2539.     158318   62.3 
    ## 16 Tunisia                2519.      26679   10.6 
    ## 17 Italy                  2466.     148771   60.3 
    ## 18 Russia                 2388.     336023  141.  
    ## 19 Chile                  2388.      39987   16.7 
    ## 20 Ecuador                2348.      34730   14.8

EOL
