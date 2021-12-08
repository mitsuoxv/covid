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

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-12-09

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
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           75942. 48982584            645
    ##  2 India                   54664. 34656822            634
    ##  3 Brazil                  34878. 22147476            635
    ##  4 United Kingdom          16372. 10560345            645
    ##  5 Russia                  15707.  9895597            630
    ##  6 Turkey                  14196.  8943837            630
    ##  7 France                  11978.  7749620            647
    ##  8 Germany                  9709.  6291621            648
    ##  9 Iran                     9419.  6141335            652
    ## 10 Argentina                8494.  5343153            629
    ## 11 Spain                    8122.  5246767            646
    ## 12 Colombia                 8068.  5082762            630
    ## 13 Italy                    7850.  5134318            654
    ## 14 Indonesia                6716.  4258076            634
    ## 15 Mexico                   6135.  3902015            636
    ## 16 Poland                   5887.  3732589            634
    ## 17 Ukraine                  5641.  3519981            624
    ## 18 South Africa             4843.  3051222            630
    ## 19 Philippines              4472.  2835154            634
    ## 20 Netherlands              4354.  2790830            641

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                343.             217851.            636
    ##  2 Israel                        288.             183255.            636
    ##  3 Belgium                       281.             180696.            644
    ##  4 Serbia                        274.             172517.            629
    ##  5 United Kingdom                263.             169376.            645
    ##  6 Netherlands                   262.             167668.            641
    ##  7 Jordan                        246.             154229.            626
    ##  8 United States                 245.             157890.            645
    ##  9 Austria                       230.             146862.            639
    ## 10 Switzerland                   219.             141583.            645
    ## 11 Slovakia                      218.             137300.            630
    ## 12 Argentina                     205.             129239.            629
    ## 13 Sweden                        199.             127624.            641
    ## 14 Hungary                       186.             117084.            628
    ## 15 France                        185.             119651.            647
    ## 16 Turkey                        182.             114953.            630
    ## 17 Spain                         175.             112819.            646
    ## 18 Brazil                        173.             110130.            635
    ## 19 Portugal                      173.             109818.            635
    ## 20 Colombia                      169.             106356.            630

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1955    10043
    ##  2 Peru                 8.97     201421  2245146
    ##  3 Mexico               7.57     295313  3902015
    ##  4 Sudan                7.23       3201    44247
    ##  5 Ecuador              6.32      33488   529456
    ##  6 Somalia              5.77       1331    23051
    ##  7 Syria                5.71       2788    48801
    ##  8 Egypt                5.71      20821   364922
    ##  9 Afghanistan          4.65       7317   157508
    ## 10 China                4.43       5697   128602
    ## 11 Bulgaria             4.12      29163   707885
    ## 12 Niger                3.73        265     7099
    ## 13 Malawi               3.72       2307    62015
    ## 14 Myanmar              3.65      19152   525005
    ## 15 Paraguay             3.56      16479   463427
    ## 16 Tunisia              3.54      25407   718696
    ## 17 Bolivia              3.53      19247   544666
    ## 18 Mali                 3.42        619    18113
    ## 19 Indonesia            3.38     143893  4258076
    ## 20 Zimbabwe             3.24       4718   145632

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6735.     201421   29.9 
    ##  2 Bulgaria               4079.      29163    7.15
    ##  3 Hungary                3611.      36048    9.98
    ##  4 Czech Republic         3249.      34034   10.5 
    ##  5 Brazil                 3062.     615744  201.  
    ##  6 Argentina              2822.     116680   41.3 
    ##  7 Slovakia               2767.      15095    5.46
    ##  8 Colombia               2696.     128821   47.8 
    ##  9 Belgium                2630.      27360   10.4 
    ## 10 Mexico                 2626.     295313  112.  
    ## 11 Romania                2608.      57260   22.0 
    ## 12 Paraguay               2585.      16479    6.38
    ## 13 United States          2525.     783433  310.  
    ## 14 Tunisia                2399.      25407   10.6 
    ## 15 United Kingdom         2339.     145826   62.3 
    ## 16 Chile                  2301.      38535   16.7 
    ## 17 Ecuador                2264.      33488   14.8 
    ## 18 Poland                 2254.      86796   38.5 
    ## 19 Italy                  2227.     134386   60.3 
    ## 20 Russia                 2024.     284823  141.

EOL
