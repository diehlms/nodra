class CommentsController < ApplicationController

  def index
    @comment = Comment.all 
  end

  def new
    user = session[:user_id]
    @comment = Comment.new(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
  end

  def show
    @comments = @article.comments
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @articleid = params[:id]
    if @comment.save
      flash[:notice] = "comment created."
      redirect_to '/articles'
    else
      flash[:error] = "Error creating comment."
      redirect_to '/articles'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "Comment updated."
    redirect_to '/articles'
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to '/articles'
  end

  private 

    def comment_params
      params.require(:comment).permit(:comment, :user_id, :article_id)
    end
  
end
