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

Updated: 2021-03-23

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
    ##  1 United States           76817. 29497998            384
    ##  2 Brazil                  31953. 11950459            374
    ##  3 India                   31222. 11646081            373
    ##  4 Russia                  12103.  4466153            369
    ##  5 United Kingdom          11189.  4296587            384
    ##  6 France                  10910.  4211410            386
    ##  7 Italy                    8591.  3376376            393
    ##  8 Spain                    8327.  3206116            385
    ##  9 Turkey                   8165.  3013122            369
    ## 10 Germany                  6892.  2667225            387
    ## 11 Colombia                 6317.  2331187            369
    ## 12 Argentina                6091.  2241739            368
    ## 13 Mexico                   5945.  2193639            369
    ## 14 Poland                   5558.  2073129            373
    ## 15 Iran                     4606.  1801065            391
    ## 16 Ukraine                  4281.  1554256            363
    ## 17 South Africa             4167.  1537852            369
    ## 18 Peru                     3948.  1460779            370
    ## 19 Indonesia                3925.  1460184            372
    ## 20 Czech Republic           3918.  1469547            375

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                374.             140277.            375
    ##  2 Israel                        300.             112145.            374
    ##  3 United States                 248.              95083.            384
    ##  4 Jordan                        229.              83572.            365
    ##  5 Belgium                       210.              80458.            383
    ##  6 Sweden                        205.              77886.            380
    ##  7 Portugal                      205.              76534.            374
    ##  8 Serbia                        204.              75036.            368
    ##  9 Switzerland                   198.              76231.            384
    ## 10 Netherlands                   190.              72187.            380
    ## 11 United Kingdom                179.              68912.            384
    ## 12 Spain                         179.              68940.            385
    ## 13 Slovakia                      174.              64027.            368
    ## 14 France                        168.              65023.            386
    ## 15 Austria                       165.              62360.            379
    ## 16 Brazil                        159.              59424.            374
    ## 17 Hungary                       158.              58169.            367
    ## 18 Chile                         150.              55650.            371
    ## 19 Argentina                     147.              54223.            368
    ## 20 Poland                        144.              53848.            373

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               22.0         752     3422
    ##  2 Mexico               9.02     197827  2193639
    ##  3 Syria                6.68       1163    17411
    ##  4 Sudan                6.38       1986    31147
    ##  5 Egypt                5.93      11598   195418
    ##  6 Ecuador              5.26      16451   312598
    ##  7 China                4.73       4849   102539
    ##  8 Bolivia              4.56      12051   264411
    ##  9 Afghanistan          4.39       2464    56153
    ## 10 Somalia              4.25        429    10085
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.12       1512    36665
    ## 13 Bulgaria             3.96      12019   303423
    ## 14 Mali                 3.94        368     9330
    ## 15 Niger                3.76        185     4918
    ## 16 Guatemala            3.57       6700   187911
    ## 17 Chad                 3.55        157     4420
    ## 18 Tunisia              3.48       8546   245706
    ## 19 Iran                 3.43      61797  1801065
    ## 20 Peru                 3.43      50085  1460779

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2355.      24667   10.5 
    ##  2 Belgium                2183.      22707   10.4 
    ##  3 United Kingdom         2023.     126155   62.3 
    ##  4 Hungary                1848.      18451    9.98
    ##  5 Mexico                 1759.     197827  112.  
    ##  6 Italy                  1739.     104942   60.3 
    ##  7 United States          1730.     536781  310.  
    ##  8 Bulgaria               1681.      12019    7.15
    ##  9 Peru                   1675.      50085   29.9 
    ## 10 Slovakia               1669.       9104    5.46
    ## 11 Portugal               1570.      16762   10.7 
    ## 12 Spain                  1565.      72793   46.5 
    ## 13 Brazil                 1456.     292752  201.  
    ## 14 France                 1417.      91751   64.8 
    ## 15 Sweden                 1388.      13262    9.56
    ## 16 Chile                  1330.      22279   16.7 
    ## 17 Argentina              1319.      54517   41.3 
    ## 18 Colombia               1295.      61907   47.8 
    ## 19 Poland                 1282.      49365   38.5 
    ## 20 Switzerland            1247.       9455    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
