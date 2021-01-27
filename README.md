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

Updated: 2021-01-28

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
    ##  1 United States           75680. 25050308            331
    ##  2 India                   33509. 10689527            319
    ##  3 Brazil                  27636.  8871393            321
    ##  4 Russia                  11983.  3774672            315
    ##  5 United Kingdom          11181.  3689750            330
    ##  6 France                   9126.  3029792            332
    ##  7 Spain                    7921.  2629817            332
    ##  8 Turkey                   7753.  2442350            315
    ##  9 Italy                    7333.  2485956            339
    ## 10 Germany                  6490.  2161279            333
    ## 11 Colombia                 6437.  2027746            315
    ## 12 Argentina                5933.  1874801            316
    ## 13 Mexico                   5624.  1771740            315
    ## 14 Poland                   4669.  1489512            319
    ## 15 South Africa             4505.  1423578            316
    ## 16 Iran                     4111.  1385706            337
    ## 17 Ukraine                  3886.  1200883            309
    ## 18 Peru                     3489.  1102795            316
    ## 19 Indonesia                3173.  1012350            319
    ## 20 Czech Republic           2978.   956155            321

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                284.              91271.            321
    ##  2 Israel                        258.              82690.            320
    ##  3 United States                 244.              80747.            331
    ##  4 Switzerland                   204.              67664.            331
    ##  5 Belgium                       204.              66965.            329
    ##  6 Portugal                      191.              61247.            320
    ##  7 United Kingdom                179.              59180.            330
    ##  8 Sweden                        179.              58214.            326
    ##  9 Netherlands                   176.              57487.            326
    ## 10 Spain                         170.              56548.            332
    ## 11 Serbia                        168.              52718.            314
    ## 12 Jordan                        162.              50294.            311
    ## 13 Austria                       151.              49229.            325
    ## 14 Argentina                     143.              45347.            316
    ## 15 France                        141.              46779.            332
    ## 16 Slovakia                      140.              44252.            315
    ## 17 Brazil                        137.              44114.            321
    ## 18 Colombia                      135.              42430.            315
    ## 19 Chile                         133.              42188.            317
    ## 20 Italy                         122.              41199.            339

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2123
    ##  2 Mexico               8.48     150273  1771740
    ##  3 Syria                6.50        895    13762
    ##  4 Ecuador              6.06      14668   242146
    ##  5 Sudan                6.04       1750    28994
    ##  6 Egypt                5.56       9067   163129
    ##  7 Bolivia              4.96      10051   202818
    ##  8 China                4.80       4816   100431
    ##  9 Afghanistan          4.36       2389    54854
    ## 10 Iran                 4.15      57560  1385706
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12       8916   216416
    ## 13 Mali                 4.08        327     8006
    ## 14 Greece               3.71       5692   153226
    ## 15 Peru                 3.62      39887  1102795
    ## 16 Chad                 3.60        116     3225
    ## 17 Guatemala            3.53       5486   155459
    ## 18 Italy                3.48      86422  2485956
    ## 19 Niger                3.45        151     4374
    ## 20 Zimbabwe             3.45       1103    32004

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2007.      20879   10.4 
    ##  2 United Kingdom         1606.     100162   62.3 
    ##  3 Czech Republic         1507.      15791   10.5 
    ##  4 Italy                  1432.      86422   60.3 
    ##  5 United States          1347.     417889  310.  
    ##  6 Mexico                 1336.     150273  112.  
    ##  7 Peru                   1334.      39887   29.9 
    ##  8 Bulgaria               1247.       8916    7.15
    ##  9 Hungary                1222.      12198    9.98
    ## 10 Spain                  1221.      56799   46.5 
    ## 11 Sweden                 1177.      11247    9.56
    ## 12 France                 1138.      73713   64.8 
    ## 13 Argentina              1138.      47034   41.3 
    ## 14 Switzerland            1113.       8441    7.58
    ## 15 Colombia               1083.      51747   47.8 
    ## 16 Brazil                 1082.     217664  201.  
    ## 17 Chile                  1076.      18023   16.7 
    ## 18 Portugal               1031.      11012   10.7 
    ## 19 Bolivia                1010.      10051    9.95
    ## 20 Ecuador                 992.      14668   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
