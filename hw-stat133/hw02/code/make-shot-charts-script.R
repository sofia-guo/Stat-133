<<<<<<< HEAD
#Title: GSW Shot Chart Creation 
#Description: Code to create charts for GSW player shots
#Input(s): shots-data.csv 
#Output: PDF's of each player's shot charts

#import court image
library('jpeg')
library('grid')
court_file <- '../images/nba-court.jpg'
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'npc')
)

#shot chats with court background
library(ggplot2)
klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

stephen_shot_chart <- ggplot(data = stephen) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

draymond_shot_chart <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

#save charts in images folder
ggsave('../images/andre-iguodala-shot-chart.pdf', andre_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/stephen-curry-shot-chart.pdf', stephen_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/klay-thompson-shot-chart.pdf', klay_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/kevin-durant-shot-chart.pdf', kevin_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/draymond-green-shot-chart.pdf', draymond_shot_chart, width = 6.5, height = 5, units = 'in')

#facetted shot chart
shots_chart <- ggplot(data = shotsdata) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') + facet_wrap(~ name)
  theme_minimal()
ggsave('../images/gsw-shot-charts.pdf', shots_chart, width = 8, height = 7, units = 'in')

=======
#Title: GSW Shot Chart Creation 
#Description: Code to create charts for GSW player shots
#Input(s): shots-data.csv 
#Output: PDF's of each player's shot charts

#import court image
library('jpeg')
library('grid')
court_file <- '../images/nba-court.jpg'
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'npc')
)

#shot chats with court background
library(ggplot2)
klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

stephen_shot_chart <- ggplot(data = stephen) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

kevin_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

draymond_shot_chart <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

andre_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

#save charts in images folder
ggsave('../images/andre-iguodala-shot-chart.pdf', andre_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/stephen-curry-shot-chart.pdf', stephen_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/klay-thompson-shot-chart.pdf', klay_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/kevin-durant-shot-chart.pdf', kevin_shot_chart, width = 6.5, height = 5, units = 'in')
ggsave('../images/draymond-green-shot-chart.pdf', draymond_shot_chart, width = 6.5, height = 5, units = 'in')

#facetted shot chart
shots_chart <- ggplot(data = shotsdata) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x, y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') + facet_wrap(~ name)
  theme_minimal()
ggsave('../images/gsw-shot-charts.pdf', shots_chart, width = 8, height = 7, units = 'in')

>>>>>>> 98aebd82c21e4ca13d630d895fdffb40db07cde1
