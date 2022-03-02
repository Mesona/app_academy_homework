# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  Actor.find_by(name: 'Angelina Jolie')
  # Actor.where("name LIKE 'Angelina Jolie'")

end

def top_titles
  Movie.select([:id, :title]).where("score >= '9'")

end

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  title = "Star Wars"
  Movie.where("title LIKE ?", "#{title}%").select([:id, :title, :yr])

end


def below_average_years
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'

  # Still needs work
  # Movie.select("yr", "COUNT(title)").where("score < '5'")

end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!

  Actor.all.order('name ASC').limit(10)
end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'

  Movie.where('title LIKE \'Pulp Fiction\'').joins(:actors)
end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'

  # ALSO NOT WORKING
  # Movie.select([:id, :title, :yr]).joins(:actors).where('name LIKE \'Uma Therman\'')

end
