class CreateSubarticles < ActiveRecord::Migration
  def change
    create_table :subarticles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
