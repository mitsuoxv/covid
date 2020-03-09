#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# libraries
library(shiny)
library(tidyverse)

# load data
load("data/tables.rdata")

# tidy data
outside_china <- table2 %>% 
  gather(key = "concept", value = "value", -area, -publish_date)

in_china <- table1 %>% 
  gather(key = "concept", value = "value", -region, -publish_date)

# create menus
area_menu <- unique(table2$area) %>% sort()

concept_menu <- names(table2)[2:5]

region_menu <- unique(table1$region)

# menu to title
lookup <- tibble(
  menu = concept_menu,
  title = c(
    "Confirmed cases (new)",
    "Deaths (new)",
    "Confirmed cases (cumulative)",
    "Deaths (cumulative)"
  )
)



# Define UI for application
ui <- navbarPage("WHO, Covid-19 situation report",
                 tabPanel("Outside China",
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("select_area1", label = h4("Select area1"),
                                          choices = area_menu, selected = "Japan"),
                              
                              selectInput("select_area2", label = h4("Select area2"),
                                          choices = area_menu, selected = "Singapore"),
                              
                              hr(),
                              
                              selectInput("select_concept_area", label = h4("Select concept"),
                                          choices = concept_menu, selected = "new_conf"),
                              
                              hr(),
                              
                              # Show source and Shiny app creator
                              a(href = "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/",
                                "Source: WHO"),
                              br(),
                              a(href = "https://mitsuoxv.rbind.io/",
                                "Shiny app creator: Mitsuo Shiota")
                            ),
                            
                            # Show a plot of the generated line chart
                            mainPanel(
                              plotOutput("plot1")
                            )
                          )
                 ),
                 tabPanel("In China",
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("select_region1", label = h4("Select region1"),
                                          choices = region_menu, selected = "Total"),
                              
                              selectInput("select_region2", label = h4("Select region2"),
                                          choices = region_menu, selected = "Hubei"),
                              
                              hr(),
                              
                              selectInput("select_concept_region", label = h4("Select concept"),
                                          choices = concept_menu, selected = "new_conf"),
                              
                              hr(),
                              
                              # Show source and Shiny app creator
                              a(href = "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/",
                                "Source: WHO"),
                              br(),
                              a(href = "https://mitsuoxv.rbind.io/",
                                "Shiny app creator: Mitsuo Shiota")
                            ),
                            
                            # Show a plot of the generated line chart
                            mainPanel(
                              plotOutput("plot_region")
                            )
                          ),
             )
)


# Define server logic required to draw a chart
server <- function(input, output) {
  chart_data_area <- reactive({
    outside_china %>% 
      filter(area %in% c(input$select_area1, input$select_area2),
             concept == input$select_concept_area)
  })
  
  output$plot1 <- renderPlot({
    chart_data_area() %>% 
      ggplot(aes(publish_date, value, color = area)) +
      geom_hline(yintercept = 0, color = "white", size = 2) +
      geom_line(size = 1) +
      labs(
        title = lookup[lookup$menu == input$select_concept_area, "title"] %>% as.character(),
        x = "published date", 
        caption = str_c("Latest: ", max(chart_data_area()$publish_date))
      ) +
      ylab(NULL) +
      theme(legend.position = "top",
            plot.title = element_text(size = rel(2)))
  })



    
  chart_data_region <- reactive({
    in_china %>% 
      filter(region %in% c(input$select_region1, input$select_region2),
             concept == input$select_concept_region)
  })
  
  output$plot_region <- renderPlot({
    chart_data_region() %>% 
      ggplot(aes(publish_date, value, color = region)) +
      geom_hline(yintercept = 0, color = "white", size = 2) +
      geom_line(size = 1) +
      labs(
        title = lookup[lookup$menu == input$select_concept_region, "title"] %>% as.character(),
        x = "published date", 
        caption = str_c("Latest: ", max(chart_data_region()$publish_date))
      ) +
      ylab(NULL) +
      theme(legend.position = "top",
            plot.title = element_text(size = rel(2)))
  })

}

# Run the application 
shinyApp(ui = ui, server = server)
