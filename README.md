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

Updated: 2021-02-14

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
    ##  1 United States           77938. 27122583            348
    ##  2 India                   32419. 10892746            336
    ##  3 Brazil                  28739.  9713909            338
    ##  4 Russia                  12222.  4057698            332
    ##  5 United Kingdom          11567.  4013803            347
    ##  6 France                   9655.  3369672            349
    ##  7 Spain                    8714.  3041454            349
    ##  8 Turkey                   7747.  2572190            332
    ##  9 Italy                    7576.  2697296            356
    ## 10 Germany                  6652.  2328447            350
    ## 11 Colombia                 6565.  2179641            332
    ## 12 Argentina                6031.  2008345            333
    ## 13 Mexico                   5929.  1968566            332
    ## 14 Poland                   4713.  1583621            336
    ## 15 South Africa             4467.  1487681            333
    ## 16 Iran                     4247.  1503753            354
    ## 17 Ukraine                  3889.  1268049            326
    ## 18 Peru                     3640.  1212309            333
    ## 19 Indonesia                3577.  1201859            336
    ## 20 Czech Republic           3203.  1082849            338

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                306.             103365.            338
    ##  2 Israel                        284.              95879.            337
    ##  3 United States                 251.              87427.            348
    ##  4 Portugal                      217.              73176.            337
    ##  5 Switzerland                   205.              70982.            347
    ##  6 Belgium                       204.              70674.            346
    ##  7 Spain                         187.              65399.            349
    ##  8 Sweden                        186.              63669.            343
    ##  9 United Kingdom                186.              64377.            347
    ## 10 Netherlands                   179.              61378.            343
    ## 11 Serbia                        172.              56893.            331
    ## 12 Jordan                        163.              53622.            328
    ## 13 Austria                       152.              52086.            342
    ## 14 Slovakia                      152.              50212.            331
    ## 15 France                        149.              52026.            349
    ## 16 Argentina                     146.              48577.            333
    ## 17 Brazil                        143.              48303.            338
    ## 18 Colombia                      137.              45609.            332
    ## 19 Chile                         137.              45888.            334
    ## 20 Italy                         126.              44701.            356

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.8         617     2140
    ##  2 Mexico               8.70     171234  1968566
    ##  3 Syria                6.58        971    14765
    ##  4 Sudan                6.18       1849    29933
    ##  5 Ecuador              5.78      15220   263517
    ##  6 Egypt                5.74       9899   172602
    ##  7 China                4.77       4837   101496
    ##  8 Bolivia              4.72      11044   233854
    ##  9 Afghanistan          4.38       2427    55473
    ## 10 Bulgaria             4.19       9594   229010
    ## 11 Mali                 4.14        340     8218
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             3.97       1393    35045
    ## 14 Iran                 3.91      58809  1503753
    ## 15 Guatemala            3.64       6057   166283
    ## 16 Niger                3.61        169     4678
    ## 17 Greece               3.57       6077   170244
    ## 18 Peru                 3.55      43045  1212309
    ## 19 Hungary              3.53      13636   385755
    ## 20 Chad                 3.53        127     3597

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2076.      21599   10.4 
    ##  2 United Kingdom         1865.     116287   62.3 
    ##  3 Czech Republic         1724.      18058   10.5 
    ##  4 Italy                  1542.      93045   60.3 
    ##  5 Mexico                 1523.     171234  112.  
    ##  6 United States          1520.     471635  310.  
    ##  7 Peru                   1439.      43045   29.9 
    ##  8 Portugal               1408.      15034   10.7 
    ##  9 Spain                  1381.      64217   46.5 
    ## 10 Hungary                1366.      13636    9.98
    ## 11 Bulgaria               1342.       9594    7.15
    ## 12 Sweden                 1301.      12428    9.56
    ## 13 France                 1251.      81033   64.8 
    ## 14 Argentina              1206.      49874   41.3 
    ## 15 Colombia               1192.      56983   47.8 
    ## 16 Switzerland            1185.       8982    7.58
    ## 17 Brazil                 1175.     236201  201.  
    ## 18 Chile                  1155.      19345   16.7 
    ## 19 Bolivia                1110.      11044    9.95
    ## 20 Poland                 1057.      40709   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
