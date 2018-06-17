load('nba2017-salary-points.RData')
ls()
length(player)
typeof(points2)
tail(age)
mode(player)
summary(player)
class(player)
class(player)
four <- head(player, n=4)
player[seq(2, length(player),2)]

#extracting the values of a vector based on logical indexing
scored_four <- scored[1:4]

# elements greater than 100
scored_four[scored_four > 100]

# elements less than 100
scored_four[scored_four < 100]

# elements less than or equal to 10
scored_four[scored_four <= 10]

# elements different from 10
scored_four[scored_four != 10]

#players in position center of GSW
player[position == 'C'& team == 'GSW']

#players of both GSW and LAL
player[team == 'GSW' | team == 'LAL']

#players in positions Shooting Guard and Point Guards of Lakers
player[position == 'SG'| position == 'PG' & team == 'LAL']

#subset Small Forwards of GSW and LAL
player[position == 'SF' & team == 'GSW' | team == 'LAL']
