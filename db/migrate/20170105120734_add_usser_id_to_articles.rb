class AddUsserIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :usser, foreign_key: true
  end
end
