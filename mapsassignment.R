library(ggmap)
library(tidyverse)
library(magick)



gc <- geocode("Bude")
crooklets <- geocode("Crooklets Beach, Bude")
summerleaze <- geocode("Summerleaze Beach, Bude")
cricket <- geocode("Bude North Cornwall Cricket Club, Bude")
pub <- geocode("Bar 35, Bude")

Budepath <- get_map("Bude North Cornwall Cricket Club,Bude", zoom = 8)
Wbude<- get_map(gc,source ="stamen",maptype ="watercolor",zoom = 13,crop=FALSE)
Rbude <-get_googlemap(center = c(lon = -4.543678, lat = 50.82664),maptype ="roadmap",zoom = 14)

geocomb <- rbind(crooklets, summerleaze, cricket, pub)
geopath <- rbind(cricket, pub)
from <- "Bude North Cornwall Cricket Club, Bude"
to <- "Bar 35, Bude"
route_df <- route(from, to, structure = "route")

#Watermap#
watermap <- ggmap(Wbude) +
  geom_point(aes(x = lon, y = lat),
    data = geocomb, color = c("red","green","blue","yellow"), size =3 ) + 
  labs(title="Interesting Places to Visit in Bude", 
       x="Longitude",
       y = "Latitude") +
  geom_path(
    aes(x = lon, y = lat), colour = "black", size = 1.5,
    data = route_df, lineend = "round"
  )

watermap

dev.copy(png,'watermap.png')
dev.off()

#Roadmap#
roadmap <- ggmap(Rbude) +
  geom_point(
    aes(x = lon, y = lat ),
    data = geocomb, color = c("red","green","blue","yellow"), size = 3)+
  geom_path(
    aes(x = lon, y = lat), colour = "black", size = 1.5,
    data = route_df, lineend = "round"
  ) + 
  labs(title="Interesting Places to Visit in Bude", 
       x="Longitude",
       y = "Latitude")
roadmap
dev.copy(png,'roadmap.png')
dev.off()

#images of bude Bude Beaches#
BudeBeaches <- image_scale(image_read('https://www.visitbude.info/wp-content/uploads/2015/04/Black-Rock-Beach.jpg'))
print(BudeBeaches)

image_write(BudeBeaches, path = "BudeBeaches.jpg", format = "jpg")

#Images of Bude Sea Pool#
BudeSeaPool <- image_scale(image_read('https://www.visitengland.com/sites/default/files/styles/experience_page_consumer_gallery_image/public/bude_sea_pool_-_credit_rob_keir.jpg?itok=gDX730Ss', "x275"))
print(BudeSeaPool)

image_write(BudeSeaPool, "BudeSeaPool.jpg", format="jpg")


#Images of Bude North Cornwall Cricket Club#
Budecricket <- image_scale(image_read('https://www.telegraph.co.uk/content/dam/Travel/galleries/travel/destinations/europe/uk/Englands-most-beautiful-cricket-grounds/cricket-bude_3378037a.jpg?imwidth=1400', "x275"))
print(Budecricket)

image_write(Budecricket, "Budecricket.jpg", format = "jpg")

# Bar 35
Budebar <- image_scale(image_read('http://listofpubs.co.uk/uploads/320627/0.jpg', "x275"))
print(Budebar)

image_write(Budebar, "Budebar.jpg", format = "jpg")



