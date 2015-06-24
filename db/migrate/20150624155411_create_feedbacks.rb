class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :file

      t.timestamps null: false
    end
  end
end
