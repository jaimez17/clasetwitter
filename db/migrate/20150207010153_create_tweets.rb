class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :url
      t.text :message

      t.timestamps null: false
    end
  end
end
