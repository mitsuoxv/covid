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

Updated: 2021-11-25

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
    ##  1 United States           75435. 47599296            631
    ##  2 India                   55703. 34535763            620
    ##  3 Brazil                  35459. 22019870            621
    ##  4 United Kingdom          15741.  9932412            631
    ##  5 Russia                  15315.  9434393            616
    ##  6 Turkey                  14001.  8624580            616
    ##  7 France                  11405.  7219357            633
    ##  8 Iran                     9542.  6088009            638
    ##  9 Germany                  8671.  5497795            634
    ## 10 Argentina                8644.  5315989            615
    ## 11 Colombia                 8198.  5050255            616
    ## 12 Spain                    8075.  5103316            632
    ## 13 Italy                    7722.  4942135            640
    ## 14 Indonesia                6862.  4254443            620
    ## 15 Mexico                   6212.  3864278            622
    ## 16 Ukraine                  5520.  3367461            610
    ## 17 Poland                   5494.  3406129            620
    ## 18 South Africa             4757.  2930174            616
    ## 19 Philippines              4561.  2827820            620
    ## 20 Malaysia                 4155.  2597080            625

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                314.             195114.            622
    ##  2 Israel                        293.             182233.            622
    ##  3 Serbia                        274.             168671.            615
    ##  4 United Kingdom                252.             159305.            631
    ##  5 Belgium                       250.             157231.            630
    ##  6 United States                 243.             153431.            631
    ##  7 Netherlands                   238.             149489.            627
    ##  8 Jordan                        236.             144172.            612
    ##  9 Austria                       210.             131447.            625
    ## 10 Argentina                     209.             128582.            615
    ## 11 Switzerland                   200.             126338.            631
    ## 12 Sweden                        199.             124798.            627
    ## 13 Slovakia                      188.             115809.            616
    ## 14 Turkey                        180.             110850.            616
    ## 15 Brazil                        176.             109495.            621
    ## 16 France                        176.             111464.            633
    ## 17 Spain                         174.             109735.            632
    ## 18 Colombia                      172.             105676.            616
    ## 19 Hungary                       170.             104674.            614
    ## 20 Portugal                      170.             105500             621

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1942     9967
    ##  2 Peru                 9.03     200894  2225117
    ##  3 Mexico               7.57     292524  3864278
    ##  4 Sudan                7.42       3114    41959
    ##  5 Ecuador              6.32      33128   524432
    ##  6 Somalia              5.76       1324    22969
    ##  7 Syria                5.72       2714    47448
    ##  8 Egypt                5.69      20052   352123
    ##  9 Afghanistan          4.65       7305   157015
    ## 10 China                4.47       5697   127572
    ## 11 Bulgaria             4.07      27658   679983
    ## 12 Malawi               3.72       2304    61865
    ## 13 Myanmar              3.67      19041   519102
    ## 14 Bolivia              3.60      19080   530369
    ## 15 Niger                3.58        246     6877
    ## 16 Paraguay             3.54      16363   462331
    ## 17 Tunisia              3.54      25354   716609
    ## 18 Mali                 3.53        601    17025
    ## 19 Zimbabwe             3.52       4703   133707
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6717.     200894   29.9 
    ##  2 Bulgaria               3869.      27658    7.15
    ##  3 Hungary                3358.      33519    9.98
    ##  4 Czech Republic         3094.      32408   10.5 
    ##  5 Brazil                 3047.     612782  201.  
    ##  6 Argentina              2815.     116382   41.3 
    ##  7 Colombia               2681.     128138   47.8 
    ##  8 Mexico                 2601.     292524  112.  
    ##  9 Slovakia               2577.      14056    5.46
    ## 10 Belgium                2567.      26705   10.4 
    ## 11 Paraguay               2566.      16363    6.38
    ## 12 Romania                2522.      55386   22.0 
    ## 13 United States          2477.     768565  310.  
    ## 14 Tunisia                2394.      25354   10.6 
    ## 15 United Kingdom         2312.     144137   62.3 
    ## 16 Chile                  2279.      38161   16.7 
    ## 17 Ecuador                2240.      33128   14.8 
    ## 18 Italy                  2210.     133330   60.3 
    ## 19 Poland                 2122.      81688   38.5 
    ## 20 Bolivia                1918.      19080    9.95

EOL
