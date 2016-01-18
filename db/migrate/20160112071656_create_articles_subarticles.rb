class CreateArticlesSubarticles < ActiveRecord::Migration
  def up
    create_table :articles_subarticles, :id=>false do |t|
    	 t.integer "article_id", :null => false
	 	 t.integer "subarticle_id", :null => false
    end
    add_index :articles_subarticles, :article_id
	add_index :articles_subarticles, :subarticle_id
  end
  def down
  	drop_table :articles_subarticles
  end
end
