class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
	has_and_belongs_to_many :subarticles, foreign_key: "article_id", join_table: "articles_subarticles", association_foreign_key: "subarticle_id"

	
end
