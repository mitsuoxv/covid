USA, Covid-19 situation by state
================
Mitsuo Shiota
2020-05-26

- <a href="#summary" id="toc-summary">Summary</a>
- <a href="#us-cumulative-deahts-per-population-by-red-or-blue-states"
  id="toc-us-cumulative-deahts-per-population-by-red-or-blue-states">U.S.
  cumulative deahts per population by red or blue states</a>
- <a href="#fastest-spreading-states-in-the-last-14-days"
  id="toc-fastest-spreading-states-in-the-last-14-days">Fastest spreading
  states in the last 14 days</a>
- <a href="#highest-fatality-rate-states"
  id="toc-highest-fatality-rate-states">Highest fatality rate states</a>
- <a href="#highest-deaths-per-population-states"
  id="toc-highest-deaths-per-population-states">Highest deaths per
  population states</a>

Updated: 2023-05-04

## Summary

I added the United States page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on May 25, 2020. I use data
of 50 states and 1 federal district (District of Columbia) from
[USAFacts
page](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).
It states, “All states updated case and death data daily early in the
pandemic, but many have slowed/stopped. As of spring 2022, dozens of
states update daily, others provide data once a week. Nebraska and
Missouri have stopped providing regular updates”.

I separate red or blue by state governors (in case of DC, a mayor),
according to [List of United States
governors](https://en.wikipedia.org/wiki/List_of_United_States_governors).
I download population data in data directory from [Census Bureau
page](https://www.census.gov/data/tables/time-series/demo/popest/2010s-state-total.html),
and use estimated population as of July 1, 2019.

    ## old-style crs object detected; please recreate object with a recent sf::st_crs()

![](USA_files/figure-gfm/map-1.png)<!-- -->

## U.S. cumulative deahts per population by red or blue states

There is a gap between red and blue states in cumulative deaths per
population, probably due to too vigorous “reopen economy” movements in
the red states in 2021.

![](USA_files/figure-gfm/chart1-1.png)<!-- -->

Populations in millions by red or blue are:

    ## # A tibble: 1 × 2
    ##   party pop_mil
    ##   <chr>   <dbl>
    ## 1 <NA>     328.

## Fastest spreading states in the last 14 days

Highest “increase_in_14_days”, which is an increase in cumulative
confirmed cases in the last 14 days, are:

![](USA_files/figure-gfm/spreading-1.png)<!-- -->

Above calculation might be unfair to populous states. Highest
“increase_std_in_14_days”, which is an increase in cumulative confirmed
cases in the last 14 days per 1 million population, are:

![](USA_files/figure-gfm/standardized-1.png)<!-- -->

## Highest fatality rate states

Among states with more than 10 cumulative deaths, highest
“fatality_rate”, which is cumulative deaths per 100 cumulative confirmed
cases, are:

![](USA_files/figure-gfm/fatality_rates-1.png)<!-- -->

## Highest deaths per population states

Highest “deaths_per_1m”, which is cumulative deaths per 1 million
population, are:

![](USA_files/figure-gfm/deaths_per_population-1.png)<!-- -->

EOL
