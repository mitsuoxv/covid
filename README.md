WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
-   [Save data](#save-data)

Updated: 2021-02-16

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
    ##  1 United States           78027. 27309503            350
    ##  2 India                   32297. 10916589            338
    ##  3 Brazil                  28852.  9809754            340
    ##  4 Russia                  12233.  4086090            334
    ##  5 United Kingdom          11570.  4038082            349
    ##  6 France                   9705.  3406616            351
    ##  7 Spain                    8665.  3041454            351
    ##  8 Turkey                   7742.  2586183            334
    ##  9 Italy                    7603.  2721879            358
    ## 10 Germany                  6645.  2338987            352
    ## 11 Colombia                 6557.  2190116            334
    ## 12 Argentina                6047.  2025798            335
    ## 13 Mexico                   5954.  1988695            334
    ## 14 Poland                   4708.  1591497            338
    ## 15 South Africa             4453.  1491807            335
    ## 16 Iran                     4264.  1518263            356
    ## 17 Ukraine                  3882.  1273475            328
    ## 18 Peru                     3663.  1227205            335
    ## 19 Indonesia                3621.  1223930            338
    ## 20 Czech Republic           3208.  1090860            340

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                306.             104129.            340
    ##  2 Israel                        289.              97960.            339
    ##  3 United States                 252.              88029.            350
    ##  4 Portugal                      217.              73600.            339
    ##  5 Belgium                       204.              71002.            348
    ##  6 Switzerland                   203.              70982.            349
    ##  7 Spain                         186.              65399.            351
    ##  8 United Kingdom                186.              64766.            349
    ##  9 Sweden                        185.              63669.            345
    ## 10 Netherlands                   179.              61837.            345
    ## 11 Serbia                        172.              57303.            333
    ## 12 Jordan                        164.              54198.            330
    ## 13 Slovakia                      153.              51009.            333
    ## 14 Austria                       152.              52394.            344
    ## 15 France                        150.              52597.            351
    ## 16 Argentina                     146.              49000.            335
    ## 17 Brazil                        143.              48780.            340
    ## 18 Chile                         138.              46351.            336
    ## 19 Colombia                      137.              45828.            334
    ## 20 Italy                         126.              45109.            358

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.8         618     2149
    ##  2 Mexico               8.74     173771  1988695
    ##  3 Syria                6.58        978    14863
    ##  4 Sudan                6.18       1849    29933
    ##  5 Egypt                5.75       9994   173813
    ##  6 Ecuador              5.73      15321   267223
    ##  7 China                4.76       4838   101536
    ##  8 Bolivia              4.73      11155   236036
    ##  9 Afghanistan          4.37       2427    55514
    ## 10 Bulgaria             4.19       9624   229697
    ## 11 Mali                 4.16        342     8229
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             3.98       1400    35172
    ## 14 Iran                 3.88      58945  1518263
    ## 15 Guatemala            3.66       6124   167279
    ## 16 Niger                3.60        169     4695
    ## 17 Greece               3.56       6126   172128
    ## 18 Peru                 3.54      43491  1227205
    ## 19 Hungary              3.54      13752   388799
    ## 20 Chad                 3.51        128     3645

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2082.      21662   10.4 
    ##  2 United Kingdom         1879.     117166   62.3 
    ##  3 Czech Republic         1742.      18250   10.5 
    ##  4 Italy                  1551.      93577   60.3 
    ##  5 United States          1549.     480464  310.  
    ##  6 Mexico                 1545.     173771  112.  
    ##  7 Peru                   1454.      43491   29.9 
    ##  8 Portugal               1435.      15321   10.7 
    ##  9 Spain                  1381.      64217   46.5 
    ## 10 Hungary                1378.      13752    9.98
    ## 11 Bulgaria               1346.       9624    7.15
    ## 12 Sweden                 1301.      12428    9.56
    ## 13 France                 1257.      81393   64.8 
    ## 14 Argentina              1215.      50236   41.3 
    ## 15 Colombia               1202.      57425   47.8 
    ## 16 Brazil                 1186.     238532  201.  
    ## 17 Switzerland            1185.       8982    7.58
    ## 18 Chile                  1167.      19541   16.7 
    ## 19 Bolivia                1121.      11155    9.95
    ## 20 Slovakia               1091.       5952    5.46

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
