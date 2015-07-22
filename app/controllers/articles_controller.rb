class ArticlesController < ApplicationController
	#GET /articles
	def index
		#Obtiene todos los registros de la tabla que corresponde a este modelo
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		#REgistro por Id
		@article = Article.find(params[:id])
	end
	#GET /articles/new
	def new
		@article= Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	#POST /Articles
	def create
		@article= Article.new(article_params)
		 
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy # Destruye el objeto de la base de datos
		redirect_to articles_path
	end

	#PUT /article
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def article_params
		params.require(:article).permit(:title,:body)
	end

end