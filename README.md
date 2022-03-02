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

Updated: 2022-03-03

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
    ##  1 United States          107418. 78307631            729
    ##  2 India                   59803. 42938599            718
    ##  3 Brazil                  40038. 28787620            719
    ##  4 France                  30250. 22112589            731
    ##  5 United Kingdom          26043. 18985572            729
    ##  6 Russia                  23239. 16592824            714
    ##  7 Germany                 20565. 15053624            732
    ##  8 Turkey                  19815. 14148450            714
    ##  9 Italy                   17385. 12829972            738
    ## 10 Spain                   15118. 11036085            730
    ## 11 Argentina               12488.  8904176            713
    ## 12 Iran                     9593.  7060741            736
    ## 13 Netherlands              8825.  6398114            725
    ## 14 Colombia                 8494.  6064583            714
    ## 15 Poland                   7931.  5694767            718
    ## 16 Indonesia                7841.  5630096            718
    ## 17 Mexico                   7651.  5508629            720
    ## 18 Ukraine                  6849.  4849022            708
    ## 19 Japan                    6848.  5067735            740
    ## 20 Philippines              5102.  3663059            718

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       702.             507549.            723
    ##  2 Israel                        687.             495623.            721
    ##  3 Netherlands                   530.             384387.            725
    ##  4 Switzerland                   508.             370210.            729
    ##  5 Czech Republic                477.             343598.            720
    ##  6 Belgium                       471.             342578.            728
    ##  7 France                        467.             341410.            731
    ##  8 Austria                       459.             331954.            723
    ##  9 Portugal                      426.             306634.            719
    ## 10 United Kingdom                418.             304508.            729
    ## 11 Slovakia                      378.             269641.            714
    ## 12 Serbia                        365.             260572.            713
    ## 13 Jordan                        360.             255690.            710
    ## 14 Sweden                        353.             256196.            725
    ## 15 United States                 346.             252416.            729
    ## 16 Norway                        341.             247987.            727
    ## 17 Spain                         325.             237305.            730
    ## 18 Greece                        308.             221716.            720
    ## 19 Argentina                     302.             215372.            713
    ## 20 Italy                         288.             212627.            738

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.1        2135    11771
    ##  2 Sudan                6.36       3910    61512
    ##  3 Peru                 5.99     210672  3517260
    ##  4 Mexico               5.78     318149  5508629
    ##  5 Syria                5.63       3079    54664
    ##  6 Somalia              5.12       1348    26351
    ##  7 Egypt                4.97      24110   485093
    ##  8 Afghanistan          4.38       7609   173879
    ##  9 Ecuador              4.26      35223   827760
    ## 10 Myanmar              3.28      19372   590237
    ## 11 Bulgaria             3.26      35637  1093920
    ## 12 Paraguay             2.86      18367   641767
    ## 13 Tunisia              2.78      27824   999441
    ## 14 Haiti                2.70        820    30340
    ## 15 Indonesia            2.65     149036  5630096
    ## 16 Honduras             2.61      10775   412733
    ## 17 El Salvador          2.61       4074   156364
    ## 18 Sri Lanka            2.51      16244   646948
    ## 19 Hungary              2.46      44134  1793120
    ## 20 Bolivia              2.40      21438   893395

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7044.     210672   29.9 
    ##  2 Bulgaria               4985.      35637    7.15
    ##  3 Hungary                4421.      44134    9.98
    ##  4 Czech Republic         3698.      38741   10.5 
    ##  5 Slovakia               3404.      18567    5.46
    ##  6 Brazil                 3229.     649333  201.  
    ##  7 Argentina              3054.     126257   41.3 
    ##  8 United States          3041.     943293  310.  
    ##  9 Poland                 2906.     111864   38.5 
    ## 10 Colombia               2904.     138767   47.8 
    ## 11 Belgium                2903.      30199   10.4 
    ## 12 Romania                2895.      63578   22.0 
    ## 13 Paraguay               2881.      18367    6.38
    ## 14 Mexico                 2829.     318149  112.  
    ## 15 Tunisia                2628.      27824   10.6 
    ## 16 United Kingdom         2592.     161630   62.3 
    ## 17 Italy                  2569.     155000   60.3 
    ## 18 Chile                  2531.      42381   16.7 
    ## 19 Russia                 2510.     353230  141.  
    ## 20 Ecuador                2381.      35223   14.8

EOL
