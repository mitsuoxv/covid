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

Updated: 2020-08-28

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
    ##  1 United States           32133.  5719841            178
    ##  2 Brazil                  21845.  3669995            168
    ##  3 India                   19940.  3310234            166
    ##  4 Russia                   5984.   975576            163
    ##  5 South Africa             3777.   615701            163
    ##  6 Peru                     3725.   607382            163
    ##  7 Mexico                   3509.   568621            162
    ##  8 Colombia                 3469.   562128            162
    ##  9 Chile                    2452.   402365            164
    ## 10 Spain                    2358.   419849            178
    ## 11 Argentina                2206.   359638            163
    ## 12 Bangladesh               2097.   302147            144
    ## 13 Iran                     1986.   365606            184
    ## 14 Saudi Arabia             1861.   310836            167
    ## 15 United Kingdom           1857.   328850            177
    ## 16 Pakistan                 1795.   294638            164
    ## 17 Turkey                   1609.   262507            163
    ## 18 Italy                    1403.   262540            187
    ## 19 Germany                  1321.   237936            180
    ## 20 France                   1316.   238291            181

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            146.               24027.            164
    ##  2 Peru                             125.               20309.            163
    ##  3 Brazil                           109.               18249.            168
    ##  4 United States                    104.               18437.            178
    ##  5 Israel                            84.8              14263.            168
    ##  6 South Africa                      77.1              12565.            163
    ##  7 Bolivia                           74.8              11159.            149
    ##  8 Colombia                          72.6              11762.            162
    ##  9 Saudi Arabia                      72.3              12080.            167
    ## 10 Dominican Republic                59.8               9422.            157
    ## 11 Kazakhstan                        54.0               8384.            155
    ## 12 Argentina                         53.4               8699.            163
    ## 13 Kyrgyzstan                        52.5               7889.            150
    ## 14 Sweden                            52.0               9112.            175
    ## 15 Spain                             50.7               9028.            178
    ## 16 Belarus                           48.4               7328.            151
    ## 17 Honduras                          46.2               6994.            151
    ## 18 Ecuador                           45.8               7474.            163
    ## 19 Belgium                           45.2               7972.            176
    ## 20 Iraq                              43.8               7272.            166

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         561     1934
    ##  2 Italy                  13.5       35458   262540
    ##  3 France                 12.8       30411   238291
    ##  4 United Kingdom         12.6       41465   328850
    ##  5 Belgium                11.9        9879    82936
    ##  6 Hungary                11.6         614     5288
    ##  7 Mexico                 10.8       61450   568621
    ##  8 Netherlands             9.12       6206    68046
    ##  9 Chad                    7.72         77      998
    ## 10 Canada                  7.22       9090   125969
    ## 11 Spain                   6.90      28971   419849
    ## 12 Sweden                  6.68       5817    87072
    ## 13 Sudan                   6.31        819    12974
    ## 14 Niger                   5.88         69     1173
    ## 15 Ecuador                 5.80       6410   110549
    ## 16 Iran                    5.75      21020   365606
    ## 17 Egypt                   5.44       5317    97825
    ## 18 China                   5.23       4720    90271
    ## 19 Mali                    4.64        126     2717
    ## 20 Peru                    4.61      28001   607382

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 950.       9879   10.4 
    ##  2 Peru                    936.      28001   29.9 
    ##  3 United Kingdom          665.      41465   62.3 
    ##  4 Chile                   656.      10990   16.7 
    ##  5 Spain                   623.      28971   46.5 
    ##  6 Sweden                  609.       5817    9.56
    ##  7 Italy                   588.      35458   60.3 
    ##  8 Brazil                  580.     116580  201.  
    ##  9 United States           572.     177332  310.  
    ## 10 Mexico                  546.      61450  112.  
    ## 11 France                  470.      30411   64.8 
    ## 12 Bolivia                 469.       4664    9.95
    ## 13 Ecuador                 433.       6410   14.8 
    ## 14 Colombia                374.      17889   47.8 
    ## 15 Netherlands             373.       6206   16.6 
    ## 16 South Africa            276.      13502   49   
    ## 17 Iran                    273.      21020   76.9 
    ## 18 Canada                  270.       9090   33.7 
    ## 19 Switzerland             227.       1722    7.58
    ## 20 Iraq                    225.       6668   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
