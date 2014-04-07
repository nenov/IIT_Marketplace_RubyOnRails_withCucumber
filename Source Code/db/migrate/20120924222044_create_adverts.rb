class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.boolean :reverse
      t.float :price
      t.timestamp :expiration_date
      t.string :user_id

      t.timestamps
    end
  end
end
