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

Updated: 2022-10-14

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
    ##  1 United States          100075. 95472135            954
    ##  2 India                   47318. 44621319            943
    ##  3 Brazil                  36870. 34731539            942
    ##  4 France                  36606. 34995909            956
    ##  5 Germany                 35911. 34403129            958
    ##  6 South Korea             25934. 25052677            966
    ##  7 United Kingdom          24880. 23735277            954
    ##  8 Italy                   23826. 22944496            963
    ##  9 Russia                  22645. 21264080            939
    ## 10 Japan                   22394. 21610500            965
    ## 11 Turkey                  18019. 16919638            939
    ## 12 Spain                   14075. 13441941            955
    ## 13 Vietnam                 12289. 11489881            935
    ## 14 Australia               10852. 10266007            946
    ## 15 Argentina               10279.  9713594            945
    ## 16 Netherlands              8910.  8465021            950
    ## 17 China                    8228.  8219677            999
    ## 18 Iran                     7860.  7553169            961
    ## 19 Mexico                   7512.  7098525            945
    ## 20 Indonesia                6842.  6452078            943

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       680.             644988.            948
    ##  2 Israel                        671.             635155.            946
    ##  3 Denmark                       638.             604476.            948
    ##  4 Switzerland                   573.             546690.            954
    ##  5 France                        565.             540324.            956
    ##  6 Portugal                      547.             515704.            943
    ##  7 South Korea                   536.             517375.            966
    ##  8 Netherlands                   535.             508562.            950
    ##  9 Australia                     504.             477139.            946
    ## 10 Greece                        484.             456954             945
    ## 11 Belgium                       462.             439827.            953
    ## 12 Germany                       439.             420565.            958
    ## 13 Czech Republic                418.             394832.            945
    ## 14 United Kingdom                399.             380688.            954
    ## 15 Italy                         395.             380251.            963
    ## 16 Slovakia                      361.             338894.            939
    ## 17 Serbia                        346.             324501.            938
    ## 18 United States                 323.             307743.            954
    ## 19 Norway                        307.             292098.            952
    ## 20 Spain                         303.             289037.            955

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.83       4963    63375
    ##  3 Syria                 5.52       3163    57329
    ##  4 Peru                  5.23     216819  4149079
    ##  5 Somalia               5.00       1361    27223
    ##  6 Egypt                 4.81      24797   515388
    ##  7 Mexico                4.65     330233  7098525
    ##  8 Afghanistan           3.89       7807   200779
    ##  9 Ecuador               3.57      35900  1006070
    ## 10 Niger                 3.33        314     9416
    ## 11 Myanmar               3.10      19468   627328
    ## 12 Malawi                3.05       2682    88047
    ## 13 Bulgaria              2.98      37771  1268035
    ## 14 Paraguay              2.73      19595   717039
    ## 15 Tunisia               2.55      29254  1145930
    ## 16 Chad                  2.55        193     7581
    ## 17 Algeria               2.54       6881   270707
    ## 18 South Africa          2.54     102194  4022107
    ## 19 Haiti                 2.54        857    33761
    ## 20 Sri Lanka             2.50      16768   670896

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7250.     216819   29.9 
    ##  2 Bulgaria               5284.      37771    7.15
    ##  3 Hungary                4777.      47680    9.98
    ##  4 Czech Republic         3945.      41332   10.5 
    ##  5 Slovakia               3757.      20496    5.46
    ##  6 Chile                  3663.      61350   16.7 
    ##  7 Brazil                 3416.     686963  201.  
    ##  8 United States          3391.    1052114  310.  
    ##  9 Belgium                3148.      32746   10.4 
    ## 10 Argentina              3143.     129958   41.3 
    ## 11 Paraguay               3073.      19595    6.38
    ## 12 United Kingdom         3062.     190888   62.3 
    ## 13 Poland                 3061.     117847   38.5 
    ## 14 Romania                3056.      67103   22.0 
    ## 15 Greece                 3028.      33313   11   
    ## 16 Colombia               2967.     141807   47.8 
    ## 17 Italy                  2945.     177719   60.3 
    ## 18 Mexico                 2936.     330233  112.  
    ## 19 Tunisia                2763.      29254   10.6 
    ## 20 Russia                 2762.     388610  141.

EOL
