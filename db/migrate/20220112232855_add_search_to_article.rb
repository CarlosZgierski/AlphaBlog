class AddSearchToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :search, :text
  end
end
