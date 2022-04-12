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

Updated: 2022-04-13

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
    ##  1 United States          103438. 79647331            770
    ##  2 India                   56702. 43036928            759
    ##  3 Brazil                  39779. 30152402            758
    ##  4 France                  33939. 26201038            772
    ##  5 Germany                 29548. 22840776            773
    ##  6 United Kingdom          28105. 21641008            770
    ##  7 Russia                  23866. 18018825            755
    ##  8 South Korea             19994. 15635274            782
    ##  9 Turkey                  19822. 14965867            755
    ## 10 Italy                   19667. 15320753            779
    ## 11 Spain                   15081. 11627487            771
    ## 12 Vietnam                 13649. 10250160            751
    ## 13 Argentina               11895.  9052536            761
    ## 14 Netherlands             10438.  7995537            766
    ## 15 Iran                     9259.  7194768            777
    ## 16 Japan                    9056.  7072699            781
    ## 17 Colombia                 8074.  6088034            754
    ## 18 Indonesia                7952.  6035358            759
    ## 19 Poland                   7879.  5980220            759
    ## 20 Mexico                   7520.  5722933            761

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       737.             562903.            764
    ##  2 Israel                        715.             544981.            762
    ##  3 Austria                       645.             492912.            764
    ##  4 Netherlands                   627.             480357.            766
    ##  5 Switzerland                   602.             463277.            770
    ##  6 France                        524.             404534.            772
    ##  7 Belgium                       493.             379105.            769
    ##  8 Czech Republic                485.             369270.            761
    ##  9 Portugal                      454.             345304.            760
    ## 10 United Kingdom                451.             347098.            770
    ## 11 Slovakia                      426.             321646.            755
    ## 12 South Korea                   413.             322892.            782
    ## 13 Greece                        380.             289141.            761
    ## 14 Norway                        368.             282668.            768
    ## 15 Germany                       361.             279219.            773
    ## 16 Serbia                        359.             271008.            754
    ## 17 Jordan                        352.             264544.            751
    ## 18 Sweden                        340.             260779.            766
    ## 19 United States                 333.             256734.            770
    ## 20 Italy                         326.             253906.            779

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2147    11814
    ##  2 Sudan                 7.94       4925    62034
    ##  3 Peru                  5.98     212486  3551540
    ##  4 Mexico                5.66     323725  5722933
    ##  5 Syria                 5.64       3146    55745
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.79      24522   511977
    ##  8 Afghanistan           4.31       7675   178191
    ##  9 Ecuador               4.10      35508   865263
    ## 10 Niger                 3.48        308     8846
    ## 11 Bulgaria              3.20      36730  1146279
    ## 12 Myanmar               3.17      19434   612406
    ## 13 Malawi                3.07       2628    85705
    ## 14 Paraguay              2.89      18734   648446
    ## 15 Tunisia               2.74      28425  1037358
    ## 16 Haiti                 2.73        835    30586
    ## 17 South Africa          2.68     100098  3732628
    ## 18 Chad                  2.60        192     7378
    ## 19 Algeria               2.59       6874   265727
    ## 20 Honduras              2.58      10888   421268

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7105.     212486   29.9 
    ##  2 Bulgaria               5138.      36730    7.15
    ##  3 Hungary                4589.      45812    9.98
    ##  4 Czech Republic         3810.      39917   10.5 
    ##  5 Slovakia               3596.      19618    5.46
    ##  6 Chile                  3409.      57081   16.7 
    ##  7 Brazil                 3288.     661258  201.  
    ##  8 United States          3153.     978118  310.  
    ##  9 Argentina              3101.     128198   41.3 
    ## 10 Poland                 3005.     115696   38.5 
    ## 11 Belgium                2988.      31079   10.4 
    ## 12 Romania                2970.      65210   22.0 
    ## 13 Paraguay               2938.      18734    6.38
    ## 14 Colombia               2924.     139719   47.8 
    ## 15 Mexico                 2878.     323725  112.  
    ## 16 United Kingdom         2728.     170107   62.3 
    ## 17 Tunisia                2684.      28425   10.6 
    ## 18 Italy                  2666.     160863   60.3 
    ## 19 Russia                 2646.     372245  141.  
    ## 20 Greece                 2564.      28205   11

EOL
