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

Updated: 2022-03-09

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
    ##  1 United States          106864. 78545019            735
    ##  2 India                   59352. 42971308            724
    ##  3 Brazil                  40067. 29049013            725
    ##  4 France                  30371. 22383443            737
    ##  5 United Kingdom          26184. 19245305            735
    ##  6 Russia                  23724. 17081394            720
    ##  7 Germany                 21716. 16026216            738
    ##  8 Turkey                  19982. 14387340            720
    ##  9 Italy                   17538. 13048774            744
    ## 10 Spain                   15131. 11136425            736
    ## 11 Argentina               12438.  8942888            719
    ## 12 Iran                     9564.  7096318            742
    ## 13 Netherlands              9263.  6771643            731
    ## 14 Colombia                 8433.  6071704            720
    ## 15 Indonesia                8011.  5800253            724
    ## 16 Poland                   7956.  5760498            724
    ## 17 Mexico                   7665.  5564985            726
    ## 18 Japan                    7284.  5434108            746
    ## 19 Ukraine                  6834.  4879339            714
    ## 20 South Korea              6519.  4869691            747

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       719.             524487.            729
    ##  2 Israel                        689.             500753.            727
    ##  3 Netherlands                   557.             406827.            731
    ##  4 Switzerland                   527.             387214.            735
    ##  5 Austria                       488.             355804.            729
    ##  6 Czech Republic                479.             347701.            726
    ##  7 Belgium                       472.             346210.            734
    ##  8 France                        469.             345592.            737
    ##  9 Portugal                      431.             312646.            725
    ## 10 United Kingdom                420.             308673.            735
    ## 11 Slovakia                      385.             277344.            720
    ## 12 Serbia                        365.             262476.            719
    ## 13 Jordan                        361.             258257.            716
    ## 14 Norway                        356.             261189.            733
    ## 15 Sweden                        352.             257011.            731
    ## 16 United States                 344.             253181.            735
    ## 17 Spain                         325.             239462.            736
    ## 18 Greece                        315.             228828.            726
    ## 19 Argentina                     301.             216309.            719
    ## 20 Italy                         291.             216253.            744

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2138    11781
    ##  2 Sudan                 7.89       4865    61631
    ##  3 Peru                  5.98     211108  3527549
    ##  4 Mexico                5.75     319859  5564985
    ##  5 Syria                 5.63       3099    55085
    ##  6 Somalia               5.15       1359    26400
    ##  7 Egypt                 4.92      24222   491892
    ##  8 Afghanistan           4.36       7626   175000
    ##  9 Ecuador               4.22      35264   836216
    ## 10 Niger                 3.50        307     8767
    ## 11 Bulgaria              3.25      35923  1103788
    ## 12 Myanmar               3.23      19391   599619
    ## 13 Malawi                3.07       2619    85440
    ## 14 Paraguay              2.87      18471   643879
    ## 15 Tunisia               2.75      27959  1016894
    ## 16 Haiti                 2.71        825    30400
    ## 17 South Africa          2.70      99609  3685120
    ## 18 Chad                  2.62        190     7258
    ## 19 El Salvador           2.62       4091   156364
    ## 20 Honduras              2.61      10799   414311

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7059.     211108   29.9 
    ##  2 Bulgaria               5025.      35923    7.15
    ##  3 Hungary                4458.      44495    9.98
    ##  4 Czech Republic         3721.      38986   10.5 
    ##  5 Slovakia               3437.      18750    5.46
    ##  6 Brazil                 3243.     652143  201.  
    ##  7 Argentina              3068.     126842   41.3 
    ##  8 United States          3067.     951348  310.  
    ##  9 Poland                 2929.     112768   38.5 
    ## 10 Romania                2914.      63993   22.0 
    ## 11 Belgium                2912.      30296   10.4 
    ## 12 Colombia               2910.     139091   47.8 
    ## 13 Paraguay               2897.      18471    6.38
    ## 14 Mexico                 2844.     319859  112.  
    ## 15 Tunisia                2640.      27959   10.6 
    ## 16 United Kingdom         2601.     162147   62.3 
    ## 17 Italy                  2586.     156017   60.3 
    ## 18 Chile                  2581.      43226   16.7 
    ## 19 Russia                 2542.     357601  141.  
    ## 20 Greece                 2386       26246   11

EOL
