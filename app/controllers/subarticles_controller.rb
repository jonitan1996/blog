class SubarticlesController < ApplicationController
	def index
  		@subarticles = Subarticle.all
  		@articles = Article.all
	end
	def new
		@subarticle = Subarticle.new
			@articles = Article.all

	end
	def create



	  @subarticle = Subarticle.new(article_params)
	 
	  if @subarticle.save
	  	add_subarticle
	  end

	  redirect_to @subarticle



	end

	def add_subarticle
		params[:area].each do |area|
			@subarticles = Articles_subarticle.new(:article_id => area, :subarticle_id => @subarticle.id)
			@subarticles.save
		end
			


	end


	def edit
  @subarticle = Subarticle.find(params[:id])
end

def update
  @subarticle = Subarticle.find(params[:id])
 
  if @subarticle.update(article_params)
    redirect_to @subarticle
  else
    render 'edit'
  end
end
def destroy
  @subarticle = Subarticle.find(params[:id])
  @subarticle.destroy
 
  redirect_to articles_path
end

def show
  @subarticle = Subarticle.find(params[:id])
end
	  private
  		def article_params
    		params.require(:subarticle).permit(:title, :text, :area)
  		end
end
