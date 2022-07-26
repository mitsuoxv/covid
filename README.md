WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-27

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          102069. 89310454            875
    ##  2 India                   50834. 43920451            864
    ##  3 Brazil                  38924. 33591356            863
    ##  4 France                  37146. 32576885            877
    ##  5 Germany                 34672. 30476605            879
    ##  6 United Kingdom          26529. 23213017            875
    ##  7 Italy                   23398. 20684182            884
    ##  8 South Korea             21811. 19346764            887
    ##  9 Russia                  21564. 18545009            860
    ## 10 Turkey                  18051. 15524071            860
    ## 11 Spain                   15074. 13204863            876
    ## 12 Japan                   12980. 11500595            886
    ## 13 Vietnam                 12579. 10767948            856
    ## 14 Argentina               10979.  9507562            866
    ## 15 Australia               10541.  9139047            867
    ## 16 Netherlands              9547.  8315835            871
    ## 17 Iran                     8319.  7337928            882
    ## 18 Mexico                   7649.  6624310            866
    ## 19 Colombia                 7273.  6247634            859
    ## 20 Indonesia                7151.  6178873            864

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        715.             620066.            867
    ##  2 Denmark                       675.             586874.            869
    ##  3 Austria                       665.             578138.            869
    ##  4 Switzerland                   587.             513534.            875
    ##  5 Portugal                      577.             498663.            864
    ##  6 Netherlands                   574.             499600.            871
    ##  7 France                        574.             502975.            877
    ##  8 Australia                     490.             424761.            867
    ##  9 Belgium                       484.             422778.            874
    ## 10 South Korea                   450.             399540.            887
    ## 11 Greece                        442.             382797.            866
    ## 12 Czech Republic                438.             379177.            866
    ## 13 United Kingdom                425.             372311.            875
    ## 14 Germany                       424.             372564.            879
    ## 15 Italy                         388.             342792.            884
    ## 16 Slovakia                      387.             332427.            860
    ## 17 Norway                        333.             290353.            873
    ## 18 Serbia                        331.             284412.            859
    ## 19 United States                 329.             287882.            875
    ## 20 Spain                         324.             283939.            876

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2149    11849
    ##  2 Sudan                 7.87       4957    63006
    ##  3 Syria                 5.61       3150    56156
    ##  4 Peru                  5.57     214028  3839099
    ##  5 Somalia               5.05       1361    26957
    ##  6 Mexico                4.94     327089  6624310
    ##  7 Egypt                 4.81      24765   514659
    ##  8 Afghanistan           4.19       7739   184852
    ##  9 Ecuador               3.78      35786   946487
    ## 10 Niger                 3.42        311     9104
    ## 11 Myanmar               3.17      19434   613951
    ## 12 Bulgaria              3.12      37342  1198359
    ## 13 Malawi                3.05       2651    86823
    ## 14 Paraguay              2.73      19147   701060
    ## 15 Haiti                 2.61        838    32131
    ## 16 Chad                  2.60        193     7430
    ## 17 Tunisia               2.60      28942  1114370
    ## 18 Algeria               2.58       6876   266839
    ## 19 South Africa          2.55     101943  4002133
    ## 20 Indonesia             2.54     156929  6178873

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7156.     214028   29.9 
    ##  2 Bulgaria               5224.      37342    7.15
    ##  3 Hungary                4682.      46736    9.98
    ##  4 Czech Republic         3857.      40403   10.5 
    ##  5 Slovakia               3703.      20201    5.46
    ##  6 Chile                  3546.      59383   16.7 
    ##  7 Brazil                 3366.     676964  201.  
    ##  8 United States          3279.    1017171  310.  
    ##  9 Argentina              3127.     129278   41.3 
    ## 10 Belgium                3093.      32179   10.4 
    ## 11 Poland                 3027.     116524   38.5 
    ## 12 Paraguay               3003.      19147    6.38
    ## 13 Romania                2999.      65862   22.0 
    ## 14 Colombia               2942.     140603   47.8 
    ## 15 United Kingdom         2931.     182727   62.3 
    ## 16 Mexico                 2908.     327089  112.  
    ## 17 Italy                  2834.     170979   60.3 
    ## 18 Greece                 2792.      30707   11   
    ## 19 Tunisia                2733.      28942   10.6 
    ## 20 Russia                 2717.     382236  141.

EOL
