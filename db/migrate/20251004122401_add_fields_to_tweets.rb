class AddFieldsToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :title, :string
    add_column :tweets, :limit, :string
    add_column :tweets, :about, :text
  end
end
