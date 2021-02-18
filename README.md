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

Updated: 2021-02-19

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
    ##  1 United States           77879. 27491574            353
    ##  2 India                   32112. 10950201            341
    ##  3 Brazil                  28927.  9921981            343
    ##  4 Russia                  12242.  4125598            337
    ##  5 United Kingdom          11566.  4071189            352
    ##  6 France                   9756.  3453645            354
    ##  7 Spain                    8777.  3107172            354
    ##  8 Turkey                   7742.  2609359            337
    ##  9 Italy                    7622.  2751657            361
    ## 10 Germany                  6649.  2360606            355
    ## 11 Colombia                 6536.  2202598            337
    ## 12 Argentina                6015.  2033060            338
    ## 13 Mexico                   5948.  2004575            337
    ## 14 Poland                   4734.  1614446            341
    ## 15 South Africa             4427.  1496439            338
    ## 16 Iran                     4295.  1542076            359
    ## 17 Ukraine                  3888.  1287141            331
    ## 18 Peru                     3682.  1244729            338
    ## 19 Indonesia                3647.  1243646            341
    ## 20 Czech Republic           3274.  1123252            343

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                313.             107221.            343
    ##  2 Israel                        291.              99407.            342
    ##  3 United States                 251.              88616.            353
    ##  4 Portugal                      217.              74081.            342
    ##  5 Belgium                       204.              71506.            351
    ##  6 Switzerland                   203.              71616.            352
    ##  7 Spain                         189.              66812.            354
    ##  8 Sweden                        187.              65101.            348
    ##  9 United Kingdom                185.              65297.            352
    ## 10 Netherlands                   179.              62370.            348
    ## 11 Serbia                        173.              58066.            336
    ## 12 Jordan                        166.              55424.            333
    ## 13 Slovakia                      156.              52322.            336
    ## 14 Austria                       152.              52909.            347
    ## 15 France                        151.              53323.            354
    ## 16 Argentina                     145.              49175.            338
    ## 17 Brazil                        144.              49338.            343
    ## 18 Chile                         138.              46835.            339
    ## 19 Colombia                      137.              46089.            337
    ## 20 Italy                         126.              45602.            361

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.7         619     2155
    ##  2 Mexico               8.78     175986  2004575
    ##  3 Syria                6.58        987    15001
    ##  4 Sudan                6.19       1864    30115
    ##  5 Egypt                5.78      10150   175677
    ##  6 Ecuador              5.74      15394   268219
    ##  7 China                4.77       4842   101604
    ##  8 Bolivia              4.74      11274   237706
    ##  9 Afghanistan          4.37       2430    55557
    ## 10 Bulgaria             4.18       9744   233242
    ## 11 Mali                 4.14        342     8256
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.00       1418    35423
    ## 14 Iran                 3.84      59184  1542076
    ## 15 Guatemala            3.65       6164   168880
    ## 16 Niger                3.61        170     4715
    ## 17 Hungary              3.56      13931   391170
    ## 18 Greece               3.55       6194   174659
    ## 19 Chad                 3.54        132     3724
    ## 20 Peru                 3.54      44056  1244729

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2095.      21793   10.4 
    ##  2 United Kingdom         1908.     118933   62.3 
    ##  3 Czech Republic         1789.      18739   10.5 
    ##  4 Italy                  1567.      94540   60.3 
    ##  5 Mexico                 1565.     175986  112.  
    ##  6 United States          1561.     484379  310.  
    ##  7 Peru                   1473.      44056   29.9 
    ##  8 Portugal               1466.      15649   10.7 
    ##  9 Spain                  1426.      66316   46.5 
    ## 10 Hungary                1396.      13931    9.98
    ## 11 Bulgaria               1363.       9744    7.15
    ## 12 Sweden                 1315.      12569    9.56
    ## 13 France                 1277.      82692   64.8 
    ## 14 Argentina              1220.      50432   41.3 
    ## 15 Colombia               1213.      57949   47.8 
    ## 16 Brazil                 1198.     240940  201.  
    ## 17 Switzerland            1197.       9077    7.58
    ## 18 Chile                  1174.      19659   16.7 
    ## 19 Slovakia               1150.       6271    5.46
    ## 20 Bolivia                1133.      11274    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
