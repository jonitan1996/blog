class ArticlesController < ApplicationController
  

	def index
	  	@articles = Article.all
	  	@articles = Article.page(params[:page]).per(1)
	  
	  	@subarticles = Subarticle.all
	end

	def edit
	  	@article = Article.find(params[:id])
	end

	 

	def show
	  	@article = Article.find(params[:id])

	end

	def search
		@article = Article.all


		@q = params[:q]
		@fecha = params[:fecha]
		
		if @fecha
@fecha_ini = @fecha + " 00:00:00.000000"
		@fecha_fin = @fecha + " 23.59.59.999999"
		end

		

		if @q
			@busqueda = Article.select("articles.title, articles.id").joins(:articles_subarticles, :subarticles).where("articles.title like '%#{@q}%' OR articles.text like '%#{@q}%'").where("subarticles.title like '%#{@q}%' OR subarticles.text like '%#{@q}%'").where("articles.created_at  between '#{@fecha_ini}' and '#{@fecha_fin}'")

		else
			@busqueda = Article.select("articles.title, articles.id")
		end

		
		
		

	end

	def new
 		@article = Article.new
	end
 
	def create
		@article = Article.new(article_params)
	 
		if @article.save
	    	redirect_to @article
		else
			render 'new'
		end
	end

	def update
 		@article = Article.find(params[:id])
 
	  	if @article.update(article_params)
			redirect_to @article
	 	else
	   	 	render 'edit'
	  	end
	end

	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
  		redirect_to articles_path
	end
	 

	private
	  	def article_params
	   	 	params.require(:article).permit(:title, :text)
	  	end
  	

  	
 
end
