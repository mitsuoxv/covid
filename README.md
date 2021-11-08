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

Updated: 2021-11-09

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
    ##  1 United States           71767. 46146676            643
    ##  2 India                   56899. 34366987            604
    ##  3 Brazil                  36156. 21874324            605
    ##  4 United Kingdom          15125.  9301913            615
    ##  5 Russia                  14724.  8834495            600
    ##  6 Turkey                  13719.  8231679            600
    ##  7 France                  11333.  6992850            617
    ##  8 Iran                     9626.  5987814            622
    ##  9 Argentina                8842.  5296781            599
    ## 10 Colombia                 8355.  5012981            600
    ## 11 Spain                    8158.  5025640            616
    ## 12 Germany                  7739.  4782546            618
    ## 13 Italy                    7705.  4808047            624
    ## 14 Indonesia                7034.  4248409            604
    ## 15 Mexico                   6312.  3825404            606
    ## 16 Ukraine                  5199.  3088501            594
    ## 17 Poland                   5151.  3111534            604
    ## 18 South Africa             4873.  2923956            600
    ## 19 Philippines              4641.  2803213            604
    ## 20 Malaysia                 4115.  2506309            609

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        299.             181423.            606
    ##  2 Czech Republic                287.             173650.            606
    ##  3 Serbia                        269.             161069.            599
    ##  4 United Kingdom                243.             149192.            615
    ##  5 United States                 231.             148749.            643
    ##  6 Jordan                        229.             136693.            596
    ##  7 Belgium                       221.             135967.            614
    ##  8 Netherlands                   216.             132233.            611
    ##  9 Argentina                     214.             128117.            599
    ## 10 Sweden                        202.             123180.            611
    ## 11 Switzerland                   190.             116569.            615
    ## 12 Brazil                        180.             108772.            605
    ## 13 Austria                       176.             107423.            609
    ## 14 Turkey                        176.             105800.            600
    ## 15 Spain                         175.             108064.            616
    ## 16 France                        175.             107967.            617
    ## 17 Colombia                      175.             104896.            600
    ## 18 Portugal                      170.             102806.            605
    ## 19 Chile                         170.             102063.            602
    ## 20 Slovakia                      159.              95628.            600

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1909     9870
    ##  2 Peru                 9.08     200409  2206556
    ##  3 Mexico               7.57     289674  3825404
    ##  4 Sudan                7.41       2995    40433
    ##  5 Ecuador              6.35      32989   519386
    ##  6 Syria                5.81       2620    45096
    ##  7 Somalia              5.70       1294    22693
    ##  8 Egypt                5.65      19076   337485
    ##  9 Afghanistan          4.66       7287   156397
    ## 10 China                4.50       5696   126710
    ## 11 Bulgaria             3.96      25074   632762
    ## 12 Malawi               3.72       2302    61815
    ## 13 Myanmar              3.71      18821   506816
    ## 14 Bolivia              3.66      18964   517902
    ## 15 Tunisia              3.54      25276   713308
    ## 16 Paraguay             3.52      16259   461313
    ## 17 Mali                 3.52        576    16372
    ## 18 Zimbabwe             3.52       4685   133187
    ## 19 Hungary              3.45      31398   909998
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6701.     200409   29.9 
    ##  2 Bulgaria               3507.      25074    7.15
    ##  3 Hungary                3145.      31398    9.98
    ##  4 Brazil                 3030.     609388  201.  
    ##  5 Czech Republic         2964.      31053   10.5 
    ##  6 Argentina              2808.     116104   41.3 
    ##  7 Colombia               2668.     127488   47.8 
    ##  8 Mexico                 2576.     289674  112.  
    ##  9 Paraguay               2550.      16259    6.38
    ## 10 Belgium                2512.      26131   10.4 
    ## 11 Slovakia               2432.      13269    5.46
    ## 12 United States          2411.     747957  310.  
    ## 13 Tunisia                2387.      25276   10.6 
    ## 14 Romania                2311.      50755   22.0 
    ## 15 United Kingdom         2274.     141805   62.3 
    ## 16 Chile                  2261.      37862   16.7 
    ## 17 Ecuador                2230.      32989   14.8 
    ## 18 Italy                  2194.     132391   60.3 
    ## 19 Poland                 2020.      77760   38.5 
    ## 20 Bolivia                1906.      18964    9.95

EOL
