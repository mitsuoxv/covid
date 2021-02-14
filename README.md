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

Updated: 2021-02-15

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
    ##  1 United States           77737. 27130272            349
    ##  2 India                   32359. 10904940            337
    ##  3 Brazil                  28806.  9765455            339
    ##  4 Russia                  12227.  4071883            333
    ##  5 United Kingdom          11572.  4027110            348
    ##  6 France                   9686.  3390070            350
    ##  7 Spain                    8690.  3041454            350
    ##  8 Turkey                   7747.  2579896            333
    ##  9 Italy                    7593.  2710819            357
    ## 10 Germany                  6651.  2334561            351
    ## 11 Colombia                 6562.  2185169            333
    ## 12 Argentina                6052.  2021553            334
    ## 13 Mexico                   5942.  1978954            333
    ## 14 Poland                   4715.  1588955            337
    ## 15 South Africa             4461.  1490063            334
    ## 16 Iran                     4256.  1510873            355
    ## 17 Ukraine                  3887.  1271143            327
    ## 18 Peru                     3654.  1220748            334
    ## 19 Indonesia                3592.  1210703            337
    ## 20 Czech Republic           3209.  1088009            339

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                306.             103857.            339
    ##  2 Israel                        290.              97960.            338
    ##  3 United States                 251.              87451.            349
    ##  4 Portugal                      217.              73443.            338
    ##  5 Belgium                       204.              70856.            347
    ##  6 Switzerland                   204.              70982.            348
    ##  7 Spain                         187.              65399.            350
    ##  8 United Kingdom                186.              64590.            348
    ##  9 Sweden                        185.              63669.            344
    ## 10 Netherlands                   179.              61630.            344
    ## 11 Serbia                        172.              57114.            332
    ## 12 Jordan                        164.              53816.            329
    ## 13 Slovakia                      152.              50639.            332
    ## 14 Austria                       152.              52248.            343
    ## 15 France                        150.              52341.            350
    ## 16 Argentina                     146.              48897.            334
    ## 17 Brazil                        143.              48559.            339
    ## 18 Chile                         138.              46123.            335
    ## 19 Colombia                      137.              45724.            333
    ## 20 Italy                         126.              44925.            357

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.8         617     2140
    ##  2 Mexico               8.72     172557  1978954
    ##  3 Syria                6.58        975    14820
    ##  4 Sudan                6.18       1849    29933
    ##  5 Ecuador              5.75      15269   265527
    ##  6 Egypt                5.74       9935   173202
    ##  7 China                4.77       4838   101515
    ##  8 Bolivia              4.72      11107   235098
    ##  9 Afghanistan          4.37       2427    55492
    ## 10 Bulgaria             4.19       9608   229516
    ## 11 Mali                 4.16        342     8226
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             3.98       1398    35104
    ## 14 Iran                 3.90      58883  1510873
    ## 15 Guatemala            3.65       6094   167071
    ## 16 Niger                3.60        169     4690
    ## 17 Greece               3.56       6103   171466
    ## 18 Peru                 3.54      43255  1220748
    ## 19 Hungary              3.54      13706   387462
    ## 20 Chad                 3.51        127     3622

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2080.      21634   10.4 
    ##  2 United Kingdom         1875.     116908   62.3 
    ##  3 Czech Republic         1732.      18143   10.5 
    ##  4 Italy                  1547.      93356   60.3 
    ##  5 Mexico                 1534.     172557  112.  
    ##  6 United States          1521.     471765  310.  
    ##  7 Peru                   1446.      43255   29.9 
    ##  8 Portugal               1422.      15183   10.7 
    ##  9 Spain                  1381.      64217   46.5 
    ## 10 Hungary                1373.      13706    9.98
    ## 11 Bulgaria               1344.       9608    7.15
    ## 12 Sweden                 1301.      12428    9.56
    ## 13 France                 1254.      81226   64.8 
    ## 14 Argentina              1214.      50188   41.3 
    ## 15 Colombia               1197.      57196   47.8 
    ## 16 Switzerland            1185.       8982    7.58
    ## 17 Brazil                 1181.     237489  201.  
    ## 18 Chile                  1161.      19443   16.7 
    ## 19 Bolivia                1117.      11107    9.95
    ## 20 Slovakia               1065.       5812    5.46

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
