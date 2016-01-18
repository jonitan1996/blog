class Subarticle < ActiveRecord::Base
	has_and_belongs_to_many :articles,  foreign_key: "subarticle_id", join_table: "articles_subarticles", association_foreign_key: "article_id"

end
