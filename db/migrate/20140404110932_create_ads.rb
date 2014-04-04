class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :url
      t.string :image_url
      t.string :name

      t.timestamps
    end
  end
end
