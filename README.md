WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2020-11-03

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           36867.  9032465            245
    ##  2 India                   35318.  8229313            233
    ##  3 Brazil                  23555.  5535605            235
    ##  4 Russia                   7227.  1655034            229
    ##  5 France                   5614.  1381098            246
    ##  6 Argentina                5073.  1166924            230
    ##  7 Spain                    4839.  1185678            245
    ##  8 Colombia                 4690.  1074184            229
    ##  9 United Kingdom           4241.  1034918            244
    ## 10 Mexico                   4039.   924962            229
    ## 11 Peru                     3923.   902503            230
    ## 12 South Africa             3160.   726823            230
    ## 13 Italy                    2803.   709335            253
    ## 14 Iran                     2472.   620491            251
    ## 15 Chile                    2215.   511864            231
    ## 16 Germany                  2206.   545027            247
    ## 17 Iraq                     2039.   475288            233
    ## 18 Bangladesh               1939    409252            211
    ## 19 Belgium                  1814.   440923            243
    ## 20 Ukraine                  1803.   402194            223

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           182.               42634.            234
    ##  2 Belgium                          174.               42384.            243
    ##  3 Czech Republic                   139.               32612.            235
    ##  4 Chile                            132.               30565.            231
    ##  5 Peru                             131.               30177.            230
    ##  6 Argentina                        123.               28225.            230
    ##  7 United States                    119.               29115.            245
    ##  8 Brazil                           117.               27526.            235
    ##  9 Spain                            104.               25495.            245
    ## 10 Colombia                          98.1              22477.            229
    ## 11 Netherlands                       89.6              21594.            241
    ## 12 France                            86.7              21324.            246
    ## 13 Switzerland                       82.7              20278.            245
    ## 14 Iraq                              68.7              16018.            233
    ## 15 United Kingdom                    68.0              16599.            244
    ## 16 Bolivia                           65.9              14251.            216
    ## 17 South Africa                      64.5              14833.            230
    ## 18 Libya                             60.7               9602.            158
    ## 19 Portugal                          57.7              13520.            234
    ## 20 Dominican Republic                57.7              12962.            224

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         601     2067
    ##  2 Mexico                  9.92      91753   924962
    ##  3 Ecuador                 7.50      12684   169194
    ##  4 Chad                    6.54         98     1498
    ##  5 Bolivia                 6.15       8725   141757
    ##  6 Sudan                   6.06        837    13819
    ##  7 Egypt                   5.83       6278   107736
    ##  8 Iran                    5.69      35298   620491
    ##  9 Niger                   5.65         69     1221
    ## 10 Italy                   5.47      38826   709335
    ## 11 China                   5.16       4746    91955
    ## 12 Syria                   5.04        292     5789
    ## 13 Sweden                  4.78       5938   124355
    ## 14 United Kingdom          4.51      46717  1034918
    ## 15 Canada                  4.32      10136   234511
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.82      34476   902503
    ## 18 Mali                    3.81        136     3565
    ## 19 Afghanistan             3.70       1536    41501
    ## 20 Nicaragua               3.53        156     4424

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1153.      34476   29.9 
    ##  2 Belgium                1128.      11737   10.4 
    ##  3 Bolivia                 877.       8725    9.95
    ##  4 Ecuador                 858.      12684   14.8 
    ##  5 Chile                   851.      14247   16.7 
    ##  6 Mexico                  816.      91753  112.  
    ##  7 Brazil                  795.     159884  201.  
    ##  8 Spain                   771.      35878   46.5 
    ##  9 Argentina               750.      31002   41.3 
    ## 10 United Kingdom          749.      46717   62.3 
    ## 11 United States           738.     228998  310.  
    ## 12 Colombia                655.      31314   47.8 
    ## 13 Italy                   643.      38826   60.3 
    ## 14 Sweden                  621.       5938    9.56
    ## 15 France                  567.      36704   64.8 
    ## 16 Iran                    459.      35298   76.9 
    ## 17 Netherlands             446.       7424   16.6 
    ## 18 South Africa            396.      19411   49   
    ## 19 Iraq                    370.      10966   29.7 
    ## 20 Israel                  342.       2517    7.35

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
