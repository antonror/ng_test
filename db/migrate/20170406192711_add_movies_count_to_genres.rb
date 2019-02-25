class AddMoviesCountToGenres < ActiveRecord::Migration[5.0]
  def change
    change_table :genres do |t|
      t.integer :movies_count, default: 0
    end

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE genres
           SET movies_count = (SELECT count(1)
                                   FROM movies
                                  WHERE movies.genre_id = genres.id)
    SQL
  end
end
