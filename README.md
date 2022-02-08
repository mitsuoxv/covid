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

Updated: 2022-02-09

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
    ##  1 United States          107341. 75890112            707
    ##  2 India                   60833. 42339611            696
    ##  3 Brazil                  38067. 26533010            697
    ##  4 France                  28562. 20250640            709
    ##  5 United Kingdom          25235. 17866636            708
    ##  6 Russia                  18999. 13147666            692
    ##  7 Turkey                  17824. 12334124            692
    ##  8 Italy                   16289. 11663338            716
    ##  9 Germany                 15898. 11287428            710
    ## 10 Spain                   14683. 10395472            708
    ## 11 Argentina               12468.  8615285            691
    ## 12 Iran                     9270.  6619085            714
    ## 13 Colombia                 8622.  5966706            692
    ## 14 Poland                   7496.  5217106            696
    ## 15 Mexico                   7380.  5151525            698
    ## 16 Netherlands              7069.  4969660            703
    ## 17 Indonesia                6580.  4580093            696
    ## 18 Ukraine                  6329.  4341790            686
    ## 19 South Africa             5239.  3625190            692
    ## 20 Philippines              5196.  3616387            696

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        634.             443017.            699
    ##  2 Denmark                       530.             371607.            701
    ##  3 Belgium                       455.             321526.            706
    ##  4 Switzerland                   452.             319656.            707
    ##  5 Czech Republic                448.             312464.            698
    ##  6 France                        441.             312662.            709
    ##  7 Netherlands                   425.             298568.            703
    ##  8 United Kingdom                405.             286561.            708
    ##  9 Portugal                      394.             274727.            697
    ## 10 Austria                       365.             255650.            701
    ## 11 Serbia                        351.             242317.            691
    ## 12 United States                 346.             244623.            707
    ## 13 Sweden                        341.             239411.            703
    ## 14 Spain                         316.             223530.            708
    ## 15 Jordan                        307.             210975.            688
    ## 16 Slovakia                      304.             210130.            692
    ## 17 Argentina                     302.             208385.            691
    ## 18 Italy                         270.             193293.            716
    ## 19 Greece                        269.             187881.            698
    ## 20 Norway                        253.             178384.            705

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2088    11553
    ##  2 Peru                  6.15     206984  3363489
    ##  3 Sudan                 6.13       3632    59294
    ##  4 Mexico                6.01     309546  5151525
    ##  5 Syria                 5.79       3011    52005
    ##  6 Egypt                 5.20      22993   441923
    ##  7 Somalia               5.11       1340    26203
    ##  8 Ecuador               4.52      34739   769149
    ##  9 Afghanistan           4.46       7442   166924
    ## 10 China                 4.02       5700   141817
    ## 11 Myanmar               3.59      19310   538409
    ## 12 Niger                 3.49        303     8691
    ## 13 Bulgaria              3.38      33946  1003448
    ## 14 Indonesia             3.16     144719  4580093
    ## 15 Malawi                3.03       2573    84844
    ## 16 El Salvador           2.93       3952   135109
    ## 17 Paraguay              2.90      17605   607947
    ## 18 Tunisia               2.82      26693   945453
    ## 19 Haiti                 2.72        804    29549
    ## 20 South Africa          2.65      96021  3625190

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6921.     206984   29.9 
    ##  2 Bulgaria               4748.      33946    7.15
    ##  3 Hungary                4214.      42069    9.98
    ##  4 Czech Republic         3584.      37549   10.5 
    ##  5 Slovakia               3299.      17995    5.46
    ##  6 Brazil                 3144.     632193  201.  
    ##  7 Argentina              2974.     122943   41.3 
    ##  8 United States          2886.     895389  310.  
    ##  9 Colombia               2841.     135757   47.8 
    ## 10 Belgium                2820.      29337   10.4 
    ## 11 Poland                 2776.     106894   38.5 
    ## 12 Romania                2765.      60723   22.0 
    ## 13 Paraguay               2761.      17605    6.38
    ## 14 Mexico                 2752.     309546  112.  
    ## 15 United Kingdom         2540.     158363   62.3 
    ## 16 Tunisia                2521.      26693   10.6 
    ## 17 Italy                  2471.     149097   60.3 
    ## 18 Russia                 2393.     336721  141.  
    ## 19 Chile                  2392.      40060   16.7 
    ## 20 Ecuador                2349.      34739   14.8

EOL
