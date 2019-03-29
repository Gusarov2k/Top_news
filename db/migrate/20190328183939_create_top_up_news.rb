class CreateTopUpNews < ActiveRecord::Migration[5.2]
  def change
    create_table :top_up_news do |t|
      t.string :title
      t.string :announcement
      t.text :context
      t.datetime :created
    end
  end
end
