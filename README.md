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

Updated: 2021-05-25

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           71894. 32783948            456
    ##  2 India                   61359. 26752447            436
    ##  3 Brazil                  36722. 16047439            437
    ##  4 France                  12964.  5820918            449
    ##  5 Turkey                  12005.  5186487            432
    ##  6 Russia                  11597.  5009911            432
    ##  7 United Kingdom           9983.  4462542            447
    ##  8 Italy                    9193.  4192183            456
    ##  9 Argentina                8154.  3514683            431
    ## 10 Germany                  8115.  3651640            450
    ## 11 Spain                    8106.  3631661            448
    ## 12 Colombia                 7432.  3210787            432
    ## 13 Poland                   6574.  2866181            436
    ## 14 Iran                     6239.  2832518            454
    ## 15 Mexico                   5544.  2395330            432
    ## 16 Ukraine                  5126.  2183855            426
    ## 17 Peru                     4436.  1920851            433
    ## 18 Indonesia                4081.  1775220            435
    ## 19 South Africa             3785.  1635465            432
    ## 20 Czech Republic           3785.  1658092            438

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                361.             158275.            438
    ##  2 Jordan                        266.             114022.            428
    ##  3 Israel                        261.             114133.            437
    ##  4 Sweden                        250.             110753.            443
    ##  5 United States                 232.             105675.            456
    ##  6 Belgium                       226.             100825.            446
    ##  7 Serbia                        224.              96658.            431
    ##  8 Netherlands                   221.              97701.            443
    ##  9 Switzerland                   202.              90261.            447
    ## 10 France                        200.              89873.            449
    ## 11 Argentina                     197.              85012.            431
    ## 12 Hungary                       187.              80312.            430
    ## 13 Chile                         183.              79415.            434
    ## 14 Brazil                        183.              79797.            437
    ## 15 Portugal                      181.              79170.            437
    ## 16 Austria                       176.              77682.            442
    ## 17 Spain                         174.              78090.            448
    ## 18 Poland                        171.              74446.            436
    ## 19 Slovakia                      165.              71284.            431
    ## 20 United Kingdom                160.              71574.            447

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1308     6662
    ##  2 Mexico                9.25     221597  2395330
    ##  3 Syria                 7.19       1734    24117
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.80      14721   253835
    ##  6 Somalia               5.24        767    14632
    ##  7 Ecuador               4.82      20193   418851
    ##  8 China                 4.54       4869   107195
    ##  9 Afghanistan           4.24       2812    66275
    ## 10 Bulgaria              4.20      17496   416646
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1586    38682
    ## 13 Bolivia               3.99      13910   348187
    ## 14 Niger                 3.94        212     5383
    ## 15 Hungary               3.68      29475   801672
    ## 16 Tunisia               3.65      12236   335345
    ## 17 Mali                  3.61        514    14241
    ## 18 Peru                  3.53      67807  1920851
    ## 19 Chad                  3.51        173     4924
    ## 20 South Africa          3.41      55802  1635465

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2953.      29475    9.98
    ##  2 Czech Republic         2866.      30028   10.5 
    ##  3 Bulgaria               2447.      17496    7.15
    ##  4 Belgium                2388.      24842   10.4 
    ##  5 Peru                   2267.      67807   29.9 
    ##  6 Slovakia               2254.      12296    5.46
    ##  7 Brazil                 2229.     448208  201.  
    ##  8 Italy                  2075.     125225   60.3 
    ##  9 United Kingdom         2049.     127721   62.3 
    ## 10 Mexico                 1970.     221597  112.  
    ## 11 Poland                 1895.      72945   38.5 
    ## 12 United States          1883.     584153  310.  
    ## 13 Argentina              1782.      73688   41.3 
    ## 14 Colombia               1762.      84228   47.8 
    ## 15 Spain                  1712.      79601   46.5 
    ## 16 Chile                  1703.      28518   16.7 
    ## 17 France                 1658.     107403   64.8 
    ## 18 Portugal               1594.      17017   10.7 
    ## 19 Sweden                 1503.      14366    9.56
    ## 20 Jordan                 1462.       9368    6.41

EOL
