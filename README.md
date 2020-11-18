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

Updated: 2020-11-19

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
    ##  1 United States           42472. 11085184            261
    ##  2 India                   35794.  8912907            249
    ##  3 Brazil                  23412.  5876464            251
    ##  4 Russia                   8130.  1991998            245
    ##  5 France                   7633.  2000060            262
    ##  6 Spain                    5588.  1458591            261
    ##  7 United Kingdom           5425.  1410736            260
    ##  8 Argentina                5359.  1318384            246
    ##  9 Colombia                 4919.  1205217            245
    ## 10 Italy                    4602.  1238072            269
    ## 11 Mexico                   4120.  1009396            245
    ## 12 Peru                     3813.   938268            246
    ## 13 Germany                  3168.   833307            263
    ## 14 South Africa             3066.   754256            246
    ## 15 Poland                   3023.   752940            249
    ## 16 Iran                     2953.   788473            267
    ## 17 Ukraine                  2385.   570153            239
    ## 18 Chile                    2160.   533610            247
    ## 19 Iraq                     2106.   524503            249
    ## 20 Belgium                  2086.   540509            259

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      201.               51957.            259
    ##  2 Czech Republic               179.               44842.            251
    ##  3 Israel                       176.               44186.            251
    ##  4 Switzerland                  138.               36075.            261
    ##  5 United States                137.               35732.            261
    ##  6 Argentina                    130.               31889.            246
    ##  7 Chile                        129.               31864.            247
    ##  8 Peru                         128.               31373.            246
    ##  9 Spain                        120.               31364.            261
    ## 10 France                       118.               30880.            262
    ## 11 Brazil                       116.               29221.            251
    ## 12 Netherlands                  107.               27423.            257
    ## 13 Colombia                     103.               25219.            245
    ## 14 Austria                      102.               26016.            255
    ## 15 Jordan                       101.               24347.            241
    ## 16 United Kingdom                87.0              22627.            260
    ## 17 Portugal                      86.2              21555.            250
    ## 18 Sweden                        78.6              20138.            256
    ## 19 Poland                        78.5              19557.            249
    ## 20 Italy                         76.3              20518.            269

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         604     2072
    ##  2 Mexico                  9.79      98861  1009396
    ##  3 Sudan                   7.81       1175    15047
    ##  4 Ecuador                 7.19      13025   181104
    ##  5 Chad                    6.28        101     1608
    ##  6 Bolivia                 6.18       8859   143371
    ##  7 Egypt                   5.82       6481   111284
    ##  8 Iran                    5.39      42461   788473
    ##  9 Niger                   5.28         70     1327
    ## 10 Syria                   5.18        354     6836
    ## 11 China                   5.13       4749    92490
    ## 12 Tanzania                4.13         21      509
    ## 13 Peru                    3.76      35271   938268
    ## 14 Afghanistan             3.75       1638    43628
    ## 15 Italy                   3.75      46464  1238072
    ## 16 United Kingdom          3.74      52745  1410736
    ## 17 Canada                  3.65      11027   302192
    ## 18 Mali                    3.54        141     3980
    ## 19 Nicaragua               3.47        159     4583
    ## 20 Guatemala               3.41       3947   115730

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1426.      14839   10.4 
    ##  2 Peru                   1179.      35271   29.9 
    ##  3 Bolivia                 891.       8859    9.95
    ##  4 Chile                   889.      14883   16.7 
    ##  5 Ecuador                 881.      13025   14.8 
    ##  6 Mexico                  879.      98861  112.  
    ##  7 Spain                   877.      40769   46.5 
    ##  8 Argentina               864.      35727   41.3 
    ##  9 United Kingdom          846.      52745   62.3 
    ## 10 Brazil                  826.     166014  201.  
    ## 11 United States           790.     245164  310.  
    ## 12 Italy                   770.      46464   60.3 
    ## 13 Colombia                716.      34223   47.8 
    ## 14 France                  709.      45938   64.8 
    ## 15 Sweden                  651.       6225    9.56
    ## 16 Czech Republic          626.       6558   10.5 
    ## 17 Iran                    552.      42461   76.9 
    ## 18 Netherlands             517.       8604   16.6 
    ## 19 Switzerland             434.       3293    7.58
    ## 20 Romania                 422.       9261   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
