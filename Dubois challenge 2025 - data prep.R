# Dubois visualization challenge
# 2025
# data prep 

# Challenge 1 ---- 

d1 <- read_csv("challenge01/data.csv") %>%
  set_names(nm=c("year", "value")) %>%
  set_labels(labels=c("Year","Land Value (Dollars)"),
                      force.labels=T) %>%
  as.tibble() %>%
  mutate(ln_val=log(value),
         scale=sqrt(ln_val))

write_csv(d1, "challenge01/challenge01.csv")

# Challenge 2 ---- 

d2 <- read_csv("challenge02/data.csv") %>%
  set_names(nm=c("year", "acres")) %>%
  set_labels(labels=c("Year","Land Owned (acres)"),
             force.labels=T) %>%
  as.tibble() %>%
  mutate(ln_acre=log(acres),
         scale=sqrt(ln_acre))

write_csv(d2, "challenge02/challenge02.csv")

# Challenge 3 ---- 

d3 <- read_csv("challenge03/data.csv") %>%
  set_names(nm=c("county","acres")) %>%
  set_labels(labels=c("Year","Land Owned (acres)")) 

library(wesanderson)
col <- wes_palette("AsteroidCity2")

d3 <- d3 %>%
  mutate(rank=7 - ntile(acres, 6),
         color=case_when(rank==1 ~ col[1],
                         rank==2 ~ col[2],
                         rank==3 ~ col[3],
                         rank==4 ~ col[4],
                         rank==5 ~ col[5],
                         rank==6 ~ col[6],
                         TRUE ~ NA_character_))

d3

write_csv(d3, "challenge03/challenge03.csv")


# Challenge 4 ---- 





library(flextable)

head(d)

d %>%
  flextable()

d <- as.data.frame(d) %>%
  remove_attributes()


str(d)
?strip_attributes


flextable(head(mtcars))


d

ot <- flextable(mtcars)

ot

ott <- flextable(d)

write_csv(d, "challenge01/challenge01.csv")

d2 <- read_csv("challenge01/challenge01.csv")

str(d2)
d

labels_vector <- setNames(
  unlist(d2$variables_labels),
  names(d2$variables_labels)
)

labelizor(d2, labels = labels_vector, part = "header")




flextable(d)

d2 <- d2 %>%
  as_tibble()

str(d2)

d2 %>%
  flextable()
