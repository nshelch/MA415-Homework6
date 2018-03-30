library(ggmap)
library(tidyverse)

# simple mapping with ggmap

# grab a center/zoom map and compute its bounding box
gc <- geocode("white house, washington dc")
map <- get_map(gc)
bb <- attr(map, "bb")
bbox <- bb2bbox(bb)


ggmap(map) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc, color = "red", size = 3
  )

map <- get_map(gc, zoom=16)

ggmap(map) +
  geom_point(
    aes(x = lon, y = lat),
    data = gc, color = "blue", size = 3
  )



#set the location
map1 <- get_googlemap(location = "massachusetts", source = "google")
ggmap(map1, extent = "normal"   )

#set the center
map2 <- get_map(location = c(-71.2, 42.4))
ggmap(map2)


#set the center
map2 <- get_googlemap(center = c(-71.2, 42.4),zoom = 8)
ggmap(map2)

# map2 <- get_navermap(center = c(-71.2, 42.4),zoom = 8,)

# map2 <- get_cloudmademap(center = c(-71.2, 42.4),zoom = 8)


#set the zoom
map3 <- get_map("Boston University", zoom= 17)
ggmap(map3)

map3 <- getgoogle_map("Boston University", zoom= 17)
ggmap(map3)



map3 <- get_map("Boston University", maptype = "hybrid",zoom= 17)
ggmap(map3)


map3 <- get_map("Boston University", maptype = "watercolor",zoom= 17)
ggmap(map3)




from <- "Boston University"
to <- "Burlington, Vermont"
route_df <- route(from, to, structure = "route")

map10 <- get_map("Boston, MA", zoom = 8)
ggmap(map10) +  
  geom_path(
  aes(x = lon, y = lat), colour = "red", size = 1.5,
  data = route_df, lineend = "round"
)





###########################################
## maps library


# library(maps)
# map.ma <- map_data(state = "Massachusetts")

map.ma <- map('state', fill = TRUE, col = palette())


data(stateMapEnv)
data(state.carto.center)


map('usa')

# NYC
a <- map.where("state", -73.8, 41)
a

b <- map.where("world",-73.8, 41)
b



# Auckland
map.where("nz", 174.6, -36.92)
# find both in the world
map.where(x = c(174.6, -73.8), y = c(-36.92, 41))
# with a map object:
m = map("state", "new york", fill = TRUE, plot = FALSE)
map.where(m, -74, 41.2)

####################################################################


map.europe <- map_data("world")



map.europe <- as.data.frame(map.europe)

ggplot() +
  geom_polygon(data = map.europe, aes(x = long, y = lat, group = group))



  geom_point(data = df.euro_cities, 
             aes(x = lon, y = lat, size = population), 
             color = "red", alpha = .3) +
  coord_cartesian(xlim = c(-9,45), ylim = c(32,70))




