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

Updated: 2022-06-02

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
    ##  1 United States          101449. 83188551            820
    ##  2 India                   53351. 43160832            809
    ##  3 Brazil                  38339. 30977661            808
    ##  4 France                  34839. 28638186            822
    ##  5 Germany                 31991. 26360953            824
    ##  6 United Kingdom          27196. 22300591            820
    ##  7 Russia                  22777. 18335514            805
    ##  8 South Korea             21778. 18119415            832
    ##  9 Italy                   21015. 17421410            829
    ## 10 Turkey                  18724. 15072747            805
    ## 11 Spain                   15055. 12360256            821
    ## 12 Vietnam                 13382. 10719379            801
    ## 13 Argentina               11382.  9230573            811
    ## 14 Japan                   10650.  8850282            831
    ## 15 Netherlands              9909.  8085869            816
    ## 16 Australia                8956.  7272057            812
    ## 17 Iran                     8745.  7232034            827
    ## 18 Colombia                 7591.  6103455            804
    ## 19 Indonesia                7485.  6055341            809
    ## 20 Poland                   7426.  6007840            809

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       703.             572009.            814
    ##  2 Israel                        693.             562759.            812
    ##  3 Austria                       642.             522850.            814
    ##  4 Netherlands                   595.             485784.            816
    ##  5 Switzerland                   588.             482463.            820
    ##  6 Portugal                      546.             441855.            809
    ##  7 France                        538.             442163.            822
    ##  8 Belgium                       487.             399169.            819
    ##  9 Czech Republic                461.             374217.            811
    ## 10 South Korea                   450.             374193.            832
    ## 11 United Kingdom                436.             357677.            820
    ## 12 Australia                     416.             337988.            812
    ## 13 Slovakia                      408.             328094.            805
    ## 14 Germany                       391.             322252.            824
    ## 15 Greece                        387.             313930.            811
    ## 16 Norway                        350.             286128.            818
    ## 17 Italy                         348.             288719.            829
    ## 18 Serbia                        342.             274676.            804
    ## 19 Jordan                        331.             264853.            801
    ## 20 United States                 327.             268149.            820

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4942    62374
    ##  3 Peru                 5.95     213186  3580347
    ##  4 Syria                5.64       3150    55893
    ##  5 Mexico               5.63     324925  5775660
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24718   513944
    ##  8 Afghanistan          4.27       7705   180347
    ##  9 Ecuador              4.06      35637   877282
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37148  1165167
    ## 12 Myanmar              3.17      19434   613348
    ## 13 Malawi               3.07       2640    85973
    ## 14 Paraguay             2.90      18894   650661
    ## 15 Tunisia              2.75      28641  1042872
    ## 16 Haiti                2.71        835    30818
    ## 17 Chad                 2.60        193     7417
    ## 18 Indonesia            2.59     156594  6055341
    ## 19 Algeria              2.59       6875   265877
    ## 20 Honduras             2.56      10899   425304

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7128.     213186   29.9 
    ##  2 Bulgaria               5196.      37148    7.15
    ##  3 Hungary                4663.      46547    9.98
    ##  4 Czech Republic         3846.      40288   10.5 
    ##  5 Slovakia               3685.      20100    5.46
    ##  6 Chile                  3457.      57892   16.7 
    ##  7 Brazil                 3314.     666516  201.  
    ##  8 United States          3214.     997161  310.  
    ##  9 Argentina              3118.     128889   41.3 
    ## 10 Belgium                3052.      31754   10.4 
    ## 11 Poland                 3021.     116326   38.5 
    ## 12 Romania                2991.      65684   22.0 
    ## 13 Paraguay               2963.      18894    6.38
    ## 14 Colombia               2926.     139854   47.8 
    ## 15 Mexico                 2889.     324925  112.  
    ## 16 United Kingdom         2865.     178659   62.3 
    ## 17 Italy                  2763.     166697   60.3 
    ## 18 Greece                 2713.      29845   11   
    ## 19 Tunisia                2705.      28641   10.6 
    ## 20 Russia                 2695.     379200  141.

EOL
