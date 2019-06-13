class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit, :update, :show, :destroy]
    helper_method :current_user, :logged_in?


    def new
        @article = current_user.articles.build
    end

    def create
        # render plain: params[:article].inspect
        @article = current_user.articles.new(article_params)
        if @article.save
            redirect_to article_path(@article), notice: "Article added"
        else
            render 'new'
        end
    end

    def edit
        set_article
    end

    def update
        set_article
        @article = current_user.articles.find(params[:id])
        if @article.update(article_params)
            redirect_to article_path(@article), notice: "Article was updated"
        else
            render 'edit', notice: "Article was not updated"
        end
    end

    def index
        @articles = Article.all
    end

    def show
        set_article
        @comments = @article.comments
    end

    def destroy
        set_article
        @article = current_user.articles.find(params[:id])
        if @article.destroy
            redirect_to articles_path, notice: "Article was deleted"
        else
            redirect_to articles_edit
        end
    end

    
    private

        def article_params
            params.require(:article).permit(:title, :description)
        end

        def set_article
            @article = Article.find(params[:id])
        end
end