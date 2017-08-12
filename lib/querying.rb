def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books
  WHERE series_id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters WHERE length(motto) = (SELECT MAX(LENGTH(motto)) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, count(*) AS spec FROM characters
  GROUP BY species
  ORDER BY spec DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors
  JOIN series ON author_id = authors.id
  JOIN subgenres ON subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
  JOIN characters ON series_id = series.id
  GROUP BY series_id, species HAVING species = 'human'
  ORDER BY count(*) DESC LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT
    characters.name,
    count(*) AS books_count
  FROM characters
    JOIN character_books ON character_id = characters.id
  GROUP BY character_id
  ORDER BY books_count
    DESC, characters.name"
end
