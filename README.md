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

Updated: 2022-05-20

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
    ##  1 United States          101644. 82027053            807
    ##  2 India                   54183. 43129563            796
    ##  3 Brazil                  38652. 30728286            795
    ##  4 France                  35108. 28402409            809
    ##  5 Germany                 31996. 25949175            811
    ##  6 United Kingdom          27519. 22207930            807
    ##  7 Russia                  23079. 18278617            792
    ##  8 South Korea             21809. 17861744            819
    ##  9 Italy                   21014. 17147477            816
    ## 10 Turkey                  19013. 15058627            792
    ## 11 Spain                   15073. 12179234            808
    ## 12 Vietnam                 13578. 10699965            788
    ## 13 Argentina               11448.  9135308            798
    ## 14 Japan                   10309.  8433124            818
    ## 15 Netherlands             10053.  8072716            803
    ## 16 Iran                     8881.  7229074            814
    ## 17 Australia                8381.  6696179            799
    ## 18 Colombia                 7706.  6095316            791
    ## 19 Indonesia                7603.  6051850            796
    ## 20 Poland                   7544.  6004786            796

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       713.             570804.            801
    ##  2 Israel                        700.             559699.            799
    ##  3 Austria                       649.             519581.            801
    ##  4 Netherlands                   604.             484993.            803
    ##  5 Switzerland                   595.             480491.            807
    ##  6 France                        542.             438523.            809
    ##  7 Belgium                       493.             397414.            806
    ##  8 Portugal                      491.             391396.            797
    ##  9 Czech Republic                469.             373930.            798
    ## 10 South Korea                   450.             368872.            819
    ## 11 United Kingdom                441.             356191.            807
    ## 12 Slovakia                      414.             327758.            792
    ## 13 Germany                       391.             317218.            811
    ## 14 Australia                     390.             311222.            799
    ## 15 Greece                        388.             309687.            798
    ## 16 Norway                        355.             285512.            805
    ## 17 Italy                         348.             284179.            816
    ## 18 Serbia                        347.             274204.            791
    ## 19 Jordan                        336.             264763.            788
    ## 20 United States                 328.             264405.            807

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11819
    ##  2 Sudan                 7.94       4937    62211
    ##  3 Peru                  5.96     213058  3573220
    ##  4 Mexico                5.64     324617  5752441
    ##  5 Syria                 5.64       3150    55873
    ##  6 Somalia               5.13       1361    26518
    ##  7 Egypt                 4.80      24690   513881
    ##  8 Afghanistan           4.29       7691   179447
    ##  9 Ecuador               4.08      35609   872465
    ## 10 Niger                 3.43        310     9031
    ## 11 Bulgaria              3.19      37071  1162724
    ## 12 Myanmar               3.17      19434   613182
    ## 13 Malawi                3.07       2637    85898
    ## 14 Paraguay              2.91      18881   649929
    ## 15 Tunisia               2.75      28628  1041789
    ## 16 Haiti                 2.72        835    30725
    ## 17 Chad                  2.60        193     7415
    ## 18 Algeria               2.59       6875   265834
    ## 19 Indonesia             2.59     156510  6051850
    ## 20 South Africa          2.58     100867  3908020

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7124.     213058   29.9 
    ##  2 Bulgaria               5186.      37071    7.15
    ##  3 Hungary                4653.      46446    9.98
    ##  4 Czech Republic         3843.      40260   10.5 
    ##  5 Slovakia               3680.      20073    5.46
    ##  6 Chile                  3449.      57754   16.7 
    ##  7 Brazil                 3308.     665216  201.  
    ##  8 United States          3202.     993438  310.  
    ##  9 Argentina              3115.     128776   41.3 
    ## 10 Belgium                3045.      31675   10.4 
    ## 11 Poland                 3019.     116242   38.5 
    ## 12 Romania                2989.      65636   22.0 
    ## 13 Paraguay               2961.      18881    6.38
    ## 14 Colombia               2926.     139821   47.8 
    ## 15 Mexico                 2886.     324617  112.  
    ## 16 United Kingdom         2850.     177666   62.3 
    ## 17 Italy                  2745.     165630   60.3 
    ## 18 Tunisia                2704.      28628   10.6 
    ## 19 Greece                 2693.      29619   11   
    ## 20 Russia                 2687.     378072  141.

EOL
