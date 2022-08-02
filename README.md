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

Updated: 2022-08-03

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
    ##  1 United States          102309. 90236371            882
    ##  2 India                   50574. 44050009            871
    ##  3 Brazil                  38889. 33833900            870
    ##  4 France                  37204. 32888425            884
    ##  5 Germany                 34940. 30956873            886
    ##  6 United Kingdom          26423. 23304931            882
    ##  7 Italy                   23636. 21059545            891
    ##  8 South Korea             22296. 19932439            894
    ##  9 Russia                  21479. 18622103            867
    ## 10 Turkey                  18327. 15889495            867
    ## 11 Spain                   14979. 13226579            883
    ## 12 Japan                   14465. 12917500            893
    ## 13 Vietnam                 12491. 10779632            863
    ## 14 Argentina               10951.  9560307            873
    ## 15 Australia               10801.  9440433            874
    ## 16 Netherlands              9497.  8338642            878
    ## 17 Iran                     8325.  7400725            889
    ## 18 Mexico                   7745.  6761617            873
    ## 19 Colombia                 7235.  6265798            866
    ## 20 Indonesia                7137.  6216621            871

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        714.             623801.            874
    ##  2 Denmark                       673.             589647.            876
    ##  3 Austria                       668.             584927.            876
    ##  4 Switzerland                   588.             518489.            882
    ##  5 France                        574.             507785.            884
    ##  6 Portugal                      574.             500087.            871
    ##  7 Netherlands                   571.             500970.            878
    ##  8 Australia                     502.             438768.            874
    ##  9 Belgium                       483.             425377.            881
    ## 10 South Korea                   460.             411635.            894
    ## 11 Greece                        453.             395402.            873
    ## 12 Czech Republic                436.             380728.            873
    ## 13 Germany                       427.             378435.            886
    ## 14 United Kingdom                424.             373785.            882
    ## 15 Italy                         392.             349013.            891
    ## 16 Slovakia                      385.             333428.            867
    ## 17 Serbia                        335.             289865.            866
    ## 18 Norway                        330.             290627.            880
    ## 19 United States                 330.             290867.            882
    ## 20 Spain                         322.             284406.            883

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2151    11877
    ##  2 Sudan                 7.86       4958    63074
    ##  3 Syria                 5.59       3150    56353
    ##  4 Peru                  5.48     214303  3909870
    ##  5 Somalia               5.04       1361    27020
    ##  6 Mexico                4.85     327750  6761617
    ##  7 Egypt                 4.81      24775   514891
    ##  8 Afghanistan           4.17       7751   185930
    ##  9 Ecuador               3.72      35801   963668
    ## 10 Niger                 3.41        311     9114
    ## 11 Myanmar               3.16      19434   614128
    ## 12 Bulgaria              3.09      37404  1209777
    ## 13 Malawi                3.05       2664    87365
    ## 14 Paraguay              2.72      19220   707109
    ## 15 Chad                  2.60        193     7432
    ## 16 Haiti                 2.60        838    32272
    ## 17 Tunisia               2.57      29041  1128693
    ## 18 Algeria               2.57       6876   267454
    ## 19 South Africa          2.55     101982  4004555
    ## 20 Indonesia             2.53     157028  6216621

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7166.     214303   29.9 
    ##  2 Bulgaria               5232.      37404    7.15
    ##  3 Hungary                4687.      46790    9.98
    ##  4 Czech Republic         3866.      40500   10.5 
    ##  5 Slovakia               3709.      20232    5.46
    ##  6 Chile                  3560.      59622   16.7 
    ##  7 Brazil                 3374.     678514  201.  
    ##  8 United States          3288.    1020010  310.  
    ##  9 Argentina              3129.     129369   41.3 
    ## 10 Belgium                3101.      32263   10.4 
    ## 11 Poland                 3028.     116570   38.5 
    ## 12 Paraguay               3015.      19220    6.38
    ## 13 Romania                3006.      66011   22.0 
    ## 14 United Kingdom         2950.     183953   62.3 
    ## 15 Colombia               2947.     140845   47.8 
    ## 16 Mexico                 2914.     327750  112.  
    ## 17 Italy                  2854.     172207   60.3 
    ## 18 Greece                 2818.      30999   11   
    ## 19 Tunisia                2743.      29041   10.6 
    ## 20 Russia                 2719.     382517  141.

EOL
