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

Updated: 2020-09-13

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
    ##  1 United States           32687.  6341309            194
    ##  2 India                   25604.  4659984            182
    ##  3 Brazil                  23034.  4238446            184
    ##  4 Russia                   5906.  1057362            179
    ##  5 Peru                     3966.   710067            179
    ##  6 Colombia                 3902    694664            178
    ##  7 Mexico                   3664.   652364            178
    ##  8 South Africa             3610.   646398            179
    ##  9 Argentina                2928.   524198            179
    ## 10 Spain                    2856.   554143            194
    ## 11 Chile                    2391.   430535            180
    ## 12 Bangladesh               2091.   334762            160
    ## 13 Iran                     1988.   397801            200
    ## 14 United Kingdom           1873.   361681            193
    ## 15 Saudi Arabia             1772.   324407            183
    ## 16 France                   1747.   344345            197
    ## 17 Pakistan                 1671.   300955            180
    ## 18 Turkey                   1609.   288126            179
    ## 19 Iraq                     1552.   282672            182
    ## 20 Italy                    1402.   284796            203

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            143.               25709.            180
    ##  2 Peru                             133.               23742.            179
    ##  3 Brazil                           115.               21076.            184
    ##  4 United States                    105.               20440.            194
    ##  5 Israel                           104.               19338.            185
    ##  6 Colombia                          81.6              14536.            178
    ##  7 Bolivia                           75.6              12486.            165
    ##  8 South Africa                      73.7              13192.            179
    ##  9 Argentina                         70.8              12679.            179
    ## 10 Saudi Arabia                      68.9              12607.            183
    ## 11 Spain                             61.4              11916.            194
    ## 12 Dominican Republic                60.0              10407.            173
    ## 13 Iraq                              52.3               9527.            182
    ## 14 Kazakhstan                        51.6               8839.            171
    ## 15 Honduras                          49.2               8236.            167
    ## 16 Kyrgyzstan                        48.9               8138.            166
    ## 17 Sweden                            47.6               9053.            190
    ## 18 Belgium                           45.7               8790.            192
    ## 19 Belarus                           45.5               7618.            167
    ## 20 Ecuador                           42.7               7654.            179

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         583     2011
    ##  2 Italy                  12.5       35597   284796
    ##  3 United Kingdom         11.5       41614   361681
    ##  4 Belgium                10.8        9919    91443
    ##  5 Mexico                 10.7       69649   652364
    ##  6 Ecuador                 9.50      10749   113206
    ##  7 France                  8.93      30734   344345
    ##  8 Netherlands             7.83       6243    79706
    ##  9 Chad                    7.31         79     1081
    ## 10 Canada                  6.79       9163   134924
    ## 11 Sweden                  6.76       5846    86505
    ## 12 Sudan                   6.19        834    13470
    ## 13 Niger                   5.86         69     1178
    ## 14 Bolivia                 5.79       7193   124205
    ## 15 Hungary                 5.78        631    10909
    ## 16 Iran                    5.76      22913   397801
    ## 17 Egypt                   5.57       5607   100708
    ## 18 Spain                   5.36      29699   554143
    ## 19 China                   5.23       4740    90643
    ## 20 Mali                    4.40        128     2912

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1015.      30344   29.9 
    ##  2 Belgium                 953.       9919   10.4 
    ##  3 Ecuador                 727.      10749   14.8 
    ##  4 Bolivia                 723.       7193    9.95
    ##  5 Chile                   708.      11850   16.7 
    ##  6 United Kingdom          667.      41614   62.3 
    ##  7 Brazil                  644.     129522  201.  
    ##  8 Spain                   639.      29699   46.5 
    ##  9 Mexico                  619.      69649  112.  
    ## 10 United States           615.     190787  310.  
    ## 11 Sweden                  612.       5846    9.56
    ## 12 Italy                   590.      35597   60.3 
    ## 13 France                  475.      30734   64.8 
    ## 14 Colombia                466.      22275   47.8 
    ## 15 Netherlands             375.       6243   16.6 
    ## 16 South Africa            314.      15378   49   
    ## 17 Iran                    298.      22913   76.9 
    ## 18 Canada                  272.       9163   33.7 
    ## 19 Argentina               266.      10994   41.3 
    ## 20 Iraq                    266.       7881   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
