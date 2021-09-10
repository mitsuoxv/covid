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

Updated: 2021-09-11

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
    ##  1 United States           71381. 40330381            565
    ##  2 India                   60871. 33174954            545
    ##  3 Brazil                  38329. 20928008            546
    ##  4 Russia                  13128.  7102625            541
    ##  5 United Kingdom          12827.  7132076            556
    ##  6 Turkey                  12182.  6590414            541
    ##  7 France                  11964.  6675975            558
    ##  8 Argentina                9658.  5215332            540
    ##  9 Iran                     9303.  5237799            563
    ## 10 Colombia                 9100.  4923197            541
    ## 11 Spain                    8802.  4903021            557
    ## 12 Italy                    8125.  4590941            565
    ## 13 Indonesia                7630.  4158731            545
    ## 14 Germany                  7261.  4059081            559
    ## 15 Mexico                   6405.  3465171            541
    ## 16 Poland                   5307.  2892642            545
    ## 17 South Africa             5255.  2843042            541
    ## 18 Ukraine                  4319.  2310554            535
    ## 19 Peru                     3980.  2157536            542
    ## 20 Philippines              3967.  2161892            545

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                294.             160603.            547
    ##  2 Israel                        285.             156164.            547
    ##  3 Jordan                        234.             125537.            537
    ##  4 Argentina                     234.             126147.            540
    ##  5 United States                 230.             130000.            565
    ##  6 Sweden                        215.             118936.            552
    ##  7 Netherlands                   214.             117990.            552
    ##  8 Belgium                       208.             115671.            555
    ##  9 United Kingdom                206.             114391.            556
    ## 10 Serbia                        202.             108969.            540
    ## 11 Brazil                        191.             104066.            546
    ## 12 Colombia                      190.             103017.            541
    ## 13 Switzerland                   190.             105749.            556
    ## 14 Spain                         189.             105428.            557
    ## 15 France                        185.             103075.            558
    ## 16 Chile                         181.              98089.            543
    ## 17 Portugal                      180.              98551.            546
    ## 18 Turkey                        157.              84705.            541
    ## 19 Austria                       155.              85322.            550
    ## 20 Hungary                       151.              81620.            539

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.7        1549     8267
    ##  2 Peru                 9.20     198595  2157536
    ##  3 Mexico               7.66     265420  3465171
    ##  4 Sudan                7.36       2791    37931
    ##  5 Syria                7.10       2055    28952
    ##  6 Ecuador              6.42      32365   504257
    ##  7 Egypt                5.78      16824   291172
    ##  8 Somalia              5.60       1005    17947
    ##  9 Afghanistan          4.65       7164   153962
    ## 10 China                4.61       5686   123386
    ## 11 Bulgaria             4.14      19387   468300
    ## 12 Myanmar              3.83      16353   427516
    ## 13 Bolivia              3.75      18541   493914
    ## 14 Hungary              3.69      30086   814732
    ## 15 Tanzania             3.66         50     1367
    ## 16 Malawi               3.65       2229    60995
    ## 17 Mali                 3.62        542    14969
    ## 18 Zimbabwe             3.59       4521   126056
    ## 19 Tunisia              3.54      24041   680074
    ## 20 Paraguay             3.49      16020   459062

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6640.     198595   29.9 
    ##  2 Hungary                3014.      30086    9.98
    ##  3 Brazil                 2906.     584421  201.  
    ##  4 Czech Republic         2903.      30413   10.5 
    ##  5 Argentina              2732.     112962   41.3 
    ##  6 Bulgaria               2712.      19387    7.15
    ##  7 Colombia               2625.     125427   47.8 
    ##  8 Paraguay               2513.      16020    6.38
    ##  9 Belgium                2446.      25447   10.4 
    ## 10 Mexico                 2360.     265420  112.  
    ## 11 Slovakia               2302.      12558    5.46
    ## 12 Tunisia                2270.      24041   10.6 
    ## 13 Chile                  2219.      37159   16.7 
    ## 14 Ecuador                2188.      32365   14.8 
    ## 15 Italy                  2151.     129766   60.3 
    ## 16 United Kingdom         2147.     133841   62.3 
    ## 17 United States          2093.     649292  310.  
    ## 18 Poland                 1959.      75417   38.5 
    ## 19 Bolivia                1864.      18541    9.95
    ## 20 Spain                  1832.      85218   46.5

EOL
