WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-06-14

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
    ##  1 United States          101313. 84292712            832
    ##  2 India                   52655. 43230101            821
    ##  3 Brazil                  38190. 31315777            820
    ##  4 France                  34709. 28947795            834
    ##  5 Germany                 32068. 26809245            836
    ##  6 United Kingdom          26879. 22363071            832
    ##  7 Russia                  22496. 18379583            817
    ##  8 South Korea             21598. 18229288            844
    ##  9 Italy                   20991. 17653375            841
    ## 10 Turkey                  18450. 15073722            817
    ## 11 Spain                   14981. 12478994            833
    ## 12 Vietnam                 13200. 10731812            813
    ## 13 Argentina               11272.  9276618            823
    ## 14 Japan                   10737.  9051732            843
    ## 15 Netherlands              9785.  8101839            828
    ## 16 Australia                9184.  7568100            824
    ## 17 Iran                     8622.  7233688            839
    ## 18 Colombia                 7487.  6109105            816
    ## 19 Indonesia                7382.  6061079            821
    ## 20 Poland                   7320.  6010090            821

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       694.             573193.            826
    ##  2 Israel                        691.             569298.            824
    ##  3 Austria                       639.             527464.            826
    ##  4 Netherlands                   588.             486743.            828
    ##  5 Switzerland                   581.             483808.            832
    ##  6 Portugal                      561.             460578.            821
    ##  7 France                        536.             446943.            834
    ##  8 Belgium                       482.             400870.            831
    ##  9 Czech Republic                455.             374478.            823
    ## 10 South Korea                   446.             376462.            844
    ## 11 United Kingdom                431.             358679.            832
    ## 12 Australia                     427.             351747.            824
    ## 13 Slovakia                      402.             328363.            817
    ## 14 Germany                       392.             327732.            836
    ## 15 Greece                        387.             318226.            823
    ## 16 Italy                         348.             292563.            841
    ## 17 Norway                        345.             286698.            830
    ## 18 Serbia                        337.             275069.            816
    ## 19 United States                 327.             271708.            832
    ## 20 Jordan                        326.             264905.            813

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11822
    ##  2 Sudan                7.92       4950    62475
    ##  3 Peru                 5.95     213289  3587142
    ##  4 Syria                5.63       3150    55906
    ##  5 Mexico               5.60     325055  5802672
    ##  6 Somalia              5.12       1361    26565
    ##  7 Egypt                4.81      24720   514008
    ##  8 Afghanistan          4.26       7710   181120
    ##  9 Ecuador              4.02      35649   886223
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37196  1166901
    ## 12 Myanmar              3.17      19434   613452
    ## 13 Malawi               3.07       2642    86058
    ## 14 Paraguay             2.90      18911   651268
    ## 15 Tunisia              2.75      28648  1043540
    ## 16 Haiti                2.70        835    30963
    ## 17 Chad                 2.60        193     7418
    ## 18 Algeria              2.59       6875   265925
    ## 19 Indonesia            2.58     156652  6061079
    ## 20 Honduras             2.56      10902   425564

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7132.     213289   29.9 
    ##  2 Bulgaria               5203.      37196    7.15
    ##  3 Hungary                4665.      46571    9.98
    ##  4 Czech Republic         3847.      40302   10.5 
    ##  5 Slovakia               3688.      20116    5.46
    ##  6 Chile                  3466.      58036   16.7 
    ##  7 Brazil                 3320.     667647  201.  
    ##  8 United States          3226.    1000850  310.  
    ##  9 Argentina              3120.     128973   41.3 
    ## 10 Belgium                3058.      31816   10.4 
    ## 11 Poland                 3023.     116371   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2966.      18911    6.38
    ## 14 Colombia               2927.     139867   47.8 
    ## 15 Mexico                 2890.     325055  112.  
    ## 16 United Kingdom         2872.     179083   62.3 
    ## 17 Italy                  2774.     167391   60.3 
    ## 18 Greece                 2729.      30020   11   
    ## 19 Tunisia                2705.      28648   10.6 
    ## 20 Russia                 2701.     380076  141.

EOL
