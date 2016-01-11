class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        #render plain: params[:article].inspect
        if @article.save 
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    def index
        @articles = Article.all
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update 
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
  def show
      @article = Article.find(params[:id])
  end
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
end