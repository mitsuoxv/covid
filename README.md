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

Updated: 2021-12-03

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
    ##  1 United States           75559. 48282078            639
    ##  2 India                   55106. 34606541            628
    ##  3 Brazil                  35126. 22094459            629
    ##  4 United Kingdom          16081. 10276011            639
    ##  5 Russia                  15550.  9703107            624
    ##  6 Turkey                  14131.  8818144            624
    ##  7 France                  11686.  7490677            641
    ##  8 Iran                     9476.  6121757            646
    ##  9 Germany                  9310.  5977208            642
    ## 10 Argentina                8556.  5330748            623
    ## 11 Colombia                 8124.  5069644            624
    ## 12 Spain                    8085.  5174720            640
    ## 13 Italy                    7783.  5043620            648
    ## 14 Indonesia                6778.  4256998            628
    ## 15 Mexico                   6171.  3887873            630
    ## 16 Poland                   5727.  3596491            628
    ## 17 Ukraine                  5605.  3463872            618
    ## 18 South Africa             4770.  2976613            624
    ## 19 Philippines              4511.  2833038            628
    ## 20 Netherlands              4191.  2661691            635

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                332.             209363.            630
    ##  2 Israel                        290.             182797.            630
    ##  3 Serbia                        275.             171144.            623
    ##  4 Belgium                       269.             171724.            638
    ##  5 United Kingdom                258.             164816.            639
    ##  6 Netherlands                   252.             159909.            635
    ##  7 United States                 244.             155632.            639
    ##  8 Jordan                        241.             149676.            620
    ##  9 Austria                       225.             142499.            633
    ## 10 Switzerland                   211.             134589.            639
    ## 11 Argentina                     207.             128939.            623
    ## 12 Slovakia                      205.             127859.            624
    ## 13 Sweden                        199.             126362.            635
    ## 14 Turkey                        182.             113338.            624
    ## 15 Hungary                       181.             112675.            622
    ## 16 France                        180.             115653.            641
    ## 17 Brazil                        175.             109866.            629
    ## 18 Spain                         174.             111270.            640
    ## 19 Portugal                      172.             107898.            629
    ## 20 Colombia                      170.             106082.            624

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.5        1950    10006
    ##  2 Peru                 9.00     201176  2236351
    ##  3 Mexico               7.57     294246  3887873
    ##  4 Sudan                7.29       3164    43385
    ##  5 Ecuador              6.31      33250   526870
    ##  6 Somalia              5.77       1327    23016
    ##  7 Egypt                5.71      20537   359516
    ##  8 Syria                5.71       2755    48267
    ##  9 Afghanistan          4.64       7309   157359
    ## 10 China                4.45       5697   128022
    ## 11 Bulgaria             4.09      28542   697162
    ## 12 Malawi               3.72       2306    61926
    ## 13 Niger                3.70        259     7007
    ## 14 Myanmar              3.66      19111   522825
    ## 15 Bolivia              3.56      19188   538647
    ## 16 Paraguay             3.56      16472   463058
    ## 17 Tunisia              3.54      25376   717710
    ## 18 Mali                 3.49        610    17501
    ## 19 Zimbabwe             3.48       4707   135337
    ## 20 Indonesia            3.38     143850  4256998

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6727.     201176   29.9 
    ##  2 Bulgaria               3993.      28542    7.15
    ##  3 Hungary                3499.      34931    9.98
    ##  4 Czech Republic         3180.      33317   10.5 
    ##  5 Brazil                 3057.     614681  201.  
    ##  6 Argentina              2820.     116589   41.3 
    ##  7 Colombia               2689.     128528   47.8 
    ##  8 Slovakia               2678.      14606    5.46
    ##  9 Mexico                 2616.     294246  112.  
    ## 10 Belgium                2602.      27072   10.4 
    ## 11 Paraguay               2584.      16472    6.38
    ## 12 Romania                2578.      56618   22.0 
    ## 13 United States          2503.     776505  310.  
    ## 14 Tunisia                2396.      25376   10.6 
    ## 15 United Kingdom         2328.     145140   62.3 
    ## 16 Chile                  2290.      38356   16.7 
    ## 17 Ecuador                2248.      33250   14.8 
    ## 18 Italy                  2220.     133931   60.3 
    ## 19 Poland                 2199.      84656   38.5 
    ## 20 Russia                 1973.     277640  141.

EOL
