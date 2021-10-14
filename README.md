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

Updated: 2021-10-15

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           71700. 44311292            618
    ##  2 India                   58758. 34020730            579
    ##  3 Brazil                  37224. 21590097            580
    ##  4 United Kingdom          14022.  8272887            590
    ##  5 Russia                  13727.  7892980            575
    ##  6 Turkey                  13113.  7540223            575
    ##  7 France                  11571.  6850008            592
    ##  8 Iran                     9618.  5742083            597
    ##  9 Argentina                9176.  5267339            574
    ## 10 Colombia                 8651.  4974400            575
    ## 11 Spain                    8427.  4980206            591
    ## 12 Italy                    7858.  4707087            599
    ## 13 Germany                  7323.  4342640            593
    ## 14 Indonesia                7309.  4232099            579
    ## 15 Mexico                   6491.  3732429            575
    ## 16 South Africa             5067.  2913880            575
    ## 17 Poland                   5062.  2931064            579
    ## 18 Philippines              4647.  2690455            579
    ## 19 Ukraine                  4564.  2597275            569
    ## 20 Malaysia                 4044.  2361529            584

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        307.             178385.            581
    ##  2 Czech Republic                280.             162699.            581
    ##  3 Serbia                        243.             139485.            574
    ##  4 United States                 231.             142832.            618
    ##  5 Jordan                        229.             130676.            571
    ##  6 United Kingdom                225.             132688.            590
    ##  7 Argentina                     222.             127405.            574
    ##  8 Netherlands                   208.             122139.            586
    ##  9 Belgium                       208.             122337.            589
    ## 10 Sweden                        207.             121440.            586
    ## 11 Switzerland                   190.             112001.            590
    ## 12 Brazil                        185.             107358.            580
    ## 13 Spain                         181.             107087.            591
    ## 14 Colombia                      181.             104089.            575
    ## 15 France                        179.             105762.            592
    ## 16 Portugal                      174.             100898.            580
    ## 17 Chile                         172.              99407.            577
    ## 18 Turkey                        169.              96913.            575
    ## 19 Austria                       159.              92984.            584
    ## 20 Hungary                       145.              83337.            573

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1789     9439
    ##  2 Peru                 9.14     199727  2185355
    ##  3 Mexico               7.58     282773  3732429
    ##  4 Sudan                7.55       2976    39416
    ##  5 Ecuador              6.41      32848   512071
    ##  6 Syria                6.26       2366    37794
    ##  7 Egypt                5.65      17806   314977
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7234   155627
    ## 10 China                4.55       5695   125143
    ## 11 Bulgaria             4.14      22004   531129
    ## 12 Myanmar              3.77      18255   484317
    ## 13 Bolivia              3.73      18806   504601
    ## 14 Malawi               3.71       2292    61699
    ## 15 Hungary              3.65      30341   831866
    ## 16 Mali                 3.57        555    15537
    ## 17 Tunisia              3.53      25053   710322
    ## 18 Paraguay             3.52      16207   460244
    ## 19 Zimbabwe             3.52       4648   132108
    ## 20 Chad                 3.44        174     5065

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6678.     199727   29.9 
    ##  2 Bulgaria               3078.      22004    7.15
    ##  3 Hungary                3040.      30341    9.98
    ##  4 Brazil                 2990.     601398  201.  
    ##  5 Czech Republic         2914.      30524   10.5 
    ##  6 Argentina              2795.     115547   41.3 
    ##  7 Colombia               2651.     126692   47.8 
    ##  8 Paraguay               2542.      16207    6.38
    ##  9 Mexico                 2514.     282773  112.  
    ## 10 Belgium                2473.      25726   10.4 
    ## 11 Tunisia                2366.      25053   10.6 
    ## 12 Slovakia               2345.      12791    5.46
    ## 13 United States          2298.     712874  310.  
    ## 14 Chile                  2244.      37578   16.7 
    ## 15 Ecuador                2221.      32848   14.8 
    ## 16 United Kingdom         2215.     138080   62.3 
    ## 17 Italy                  2178.     131421   60.3 
    ## 18 Poland                 1974.      76018   38.5 
    ## 19 Bolivia                1891.      18806    9.95
    ## 20 Spain                  1868.      86869   46.5

EOL
