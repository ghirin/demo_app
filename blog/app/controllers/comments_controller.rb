class CommentsController < ApplicationController
	
	def create
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.create(comment_params)
	    redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:article_id])
	    @comment = @article.comments.find(params[:id])
	    @comment.destroy
	    redirect_to article_path(@article)
	end
	
	def update
       @article = Article.find(params[:id])
       @article.update(article_params)
       flash.notice = "Article '#{@article.title}' Updated!"
       redirect_to article_path(@article)
    end

	private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end