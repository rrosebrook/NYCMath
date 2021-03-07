library(dplyr)
library(ggplot2)
library(gridExtra)

#Import file
data <- "D:\\NYS.csv"
NYS <- read.csv(data)
head(NYS)

NYSnoall <- NYS %>% filter(Grade != "All Grades")
NYSall <- NYS %>% filter(Grade == "All Grades")

NYS3 <- NYS %>% filter(Grade == "3")
NYS4 <- NYS %>% filter(Grade == "4")
NYS5 <- NYS %>% filter(Grade == "5")
NYS6 <- NYS %>% filter(Grade == "6")
NYS7 <- NYS %>% filter(Grade == "7")
NYS8 <- NYS %>% filter(Grade == "8")
NYS32006 <- NYS3 %>% filter(Year == "2006")
NYS82006 <- NYS8 %>% filter(Year == "2008")


#head(NYS3, 10)

x_axis_labels <- 2006:2011

head(NYSall)

p3 <- ggplot(NYS3, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 3") +
  coord_cartesian(ylim=c(600,725))

p32006 <- ggplot(NYS32006, aes(x=Category, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 3, 2006") +
  coord_cartesian(ylim=c(600,725))

p82006 <- ggplot(NYS82006, aes(x=Category, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 8, 2006") +
  coord_cartesian(ylim=c(600,725))

p4 <- ggplot(NYS4, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 4") +
  coord_cartesian(ylim=c(600,725))
p5 <- ggplot(NYS5, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 5") + 
  coord_cartesian(ylim=c(600,725))
p6 <- ggplot(NYS6, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 6") + 
  coord_cartesian(ylim=c(600,725))
p7 <- ggplot(NYS7, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 7") + 
  coord_cartesian(ylim=c(600,725))
p8 <- ggplot(NYS8, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) +
  labs(title="Grade 8") + 
  coord_cartesian(ylim=c(600,725))
pall <- ggplot(NYSall, aes(x=Year, y = Mean.Scale.Score, fill = Category)) +
  geom_bar(stat="identity", position = position_dodge()) + 
  labs(title="All Grades") + 
  coord_cartesian(ylim=c(600,725)) +
  theme(text = element_text(size=30)) 


pall + coord_cartesian(ylim=c(600,725)) +
  scale_x_continuous(labels = x_axis_labels, breaks = x_axis_labels)


p32006 + coord_cartesian(ylim=c(600,725)) +
  theme(text = element_text(size=30))
p82006 + coord_cartesian(ylim=c(600,725)) +
  theme(text = element_text(size=30)) 

grid.arrange(p32006, p82006, nrow = 1)

#p
p + coord_cartesian(ylim=c(650,725))
