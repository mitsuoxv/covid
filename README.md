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

Updated: 2022-02-26

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
    ##  1 United States          107805. 78050838            724
    ##  2 India                   60160. 42894345            713
    ##  3 Brazil                  39895. 28484890            714
    ##  4 France                  30137. 21879794            726
    ##  5 United Kingdom          25930. 18773168            724
    ##  6 Russia                  22640. 16052028            709
    ##  7 Germany                 19806. 14399012            727
    ##  8 Turkey                  19522. 13840998            709
    ##  9 Italy                   17259. 12651251            733
    ## 10 Spain                   15103. 10949997            725
    ## 11 Argentina               12540.  8878486            708
    ## 12 Iran                     9592.  7011932            731
    ## 13 Netherlands              8659.  6234953            720
    ## 14 Colombia                 8539.  6054307            709
    ## 15 Poland                   7907.  5637646            713
    ## 16 Indonesia                7654.  5457775            713
    ## 17 Mexico                   7630.  5455237            715
    ## 18 Ukraine                  6858.  4821288            703
    ## 19 Japan                    6463.  4750496            735
    ## 20 South Africa             5173.  3667560            709

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        684.             489988.            716
    ##  2 Denmark                       684.             490821.            718
    ##  3 Netherlands                   520.             374584.            720
    ##  4 Switzerland                   498.             360889.            724
    ##  5 Czech Republic                475.             339782.            715
    ##  6 Belgium                       470.             340063.            723
    ##  7 France                        465.             337816.            726
    ##  8 Austria                       441.             316480.            718
    ##  9 Portugal                      424.             302648.            714
    ## 10 United Kingdom                416.             301101.            724
    ## 11 Slovakia                      368.             260595.            709
    ## 12 Serbia                        365.             258725.            708
    ## 13 Jordan                        356.             250791.            705
    ## 14 Sweden                        354.             255115.            720
    ## 15 United States                 347.             251588.            724
    ## 16 Norway                        328.             236849.            722
    ## 17 Spain                         325.             235454.            725
    ## 18 Argentina                     303.             214751.            708
    ## 19 Greece                        301.             215400.            715
    ## 20 Italy                         286.             209665.            733

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2130    11751
    ##  2 Sudan                 6.36       3901    61376
    ##  3 Peru                  5.99     209927  3503892
    ##  4 Mexico                5.81     316941  5455237
    ##  5 Syria                 5.66       3059    54040
    ##  6 Somalia               5.12       1348    26313
    ##  7 Egypt                 5.03      23889   475341
    ##  8 Afghanistan           4.38       7578   173047
    ##  9 Ecuador               4.29      35172   820541
    ## 10 Niger                 3.50        306     8746
    ## 11 Myanmar               3.35      19353   578446
    ## 12 Bulgaria              3.26      35357  1083425
    ## 13 Malawi                3.06       2612    85276
    ## 14 Paraguay              2.86      18281   638153
    ## 15 Tunisia               2.78      27640   992574
    ## 16 China                 2.78       5913   212966
    ## 17 El Salvador           2.75       4058   147786
    ## 18 Indonesia             2.70     147586  5457775
    ## 19 Haiti                 2.70        820    30336
    ## 20 South Africa          2.70      99018  3667560

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7019.     209927   29.9 
    ##  2 Bulgaria               4946.      35357    7.15
    ##  3 Hungary                4383.      43752    9.98
    ##  4 Czech Republic         3674.      38491   10.5 
    ##  5 Slovakia               3368.      18375    5.46
    ##  6 Brazil                 3214.     646419  201.  
    ##  7 Argentina              3045.     125872   41.3 
    ##  8 United States          3014.     935093  310.  
    ##  9 Colombia               2895.     138364   47.8 
    ## 10 Belgium                2893.      30101   10.4 
    ## 11 Poland                 2885.     111056   38.5 
    ## 12 Romania                2872.      63073   22.0 
    ## 13 Paraguay               2867.      18281    6.38
    ## 14 Mexico                 2818.     316941  112.  
    ## 15 Tunisia                2610.      27640   10.6 
    ## 16 United Kingdom         2584.     161104   62.3 
    ## 17 Italy                  2552.     154013   60.3 
    ## 18 Chile                  2496.      41795   16.7 
    ## 19 Russia                 2483.     349365  141.  
    ## 20 Ecuador                2378.      35172   14.8

EOL
