library("leaflet")

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map


leaflet(options = leafletOptions(minZoom = 5, maxZoom = 15)) %>%
  addTiles()


library(maps)
library(mapdata)
library(tidyverse)
map()



df = data.frame(Lat = 1:10, Long = rnorm(10))
leaflet(df) %>% addCircles() %>% addTiles()



leaflet() %>% addCircles(data = df)
leaflet() %>% addCircles(data = df, lat = ~ Lat, lng = ~ Long)



mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)


m = leaflet() %>% addTiles()
df = data.frame(
  lat = rnorm(100),
  lng = rnorm(100),
  size = runif(100, 5, 20),
  color = sample(colors(), 100)
)
m = leaflet(df) %>% addTiles()
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c('red'))
m



m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 5)
m %>% addTiles()


leaflet(data) %>% addTiles() %>% addMarkers(~data$lat, ~data$long)

cities <- world.cities %>%
  filter(country.etc == "Slovakia") %>%
  select(name, lat, long)







leaflet() %>%
  setView(lng = 19.89, lat = 48.74, zoom = 7.5) %>%
addMarkers(data = cities) %>%
  addTiles()


leaflet() %>%
  addTiles() %>%
  setView(lng = 19.89, lat = 48.74, zoom = 7.5) %>%
  addMarkers(data = cities, clusterOptions = markerClusterOptions())





# Some fake data
df <- sp::SpatialPointsDataFrame(
  cbind(
    (runif(20) - .5) * 10 - 90.620130,  # lng
    (runif(20) - .5) * 3.8 + 25.638077  # lat
  ),
  data.frame(type = factor(
    ifelse(runif(20) > 0.75, "pirate", "ship"),
    c("ship", "pirate")
  ))
)

leaflet(df) %>% addTiles() %>% addCircleMarkers()

# Create a palette that maps factor levels to colors
pal <- colorFactor(c("navy", "red"), domain = c("ship", "pirate"))

leaflet(df) %>% addTiles() %>%
  addCircleMarkers(
    radius = ~ifelse(type == "ship", 6, 10),
    color = ~pal(type),
    stroke = FALSE, fillOpacity = 0.5
  )












