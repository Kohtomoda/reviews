class CommentsController < ApplicationController
    
    def create
        @movie = Movie.find(params[:movie_id])
        @user = current_user
        @comment = @user.comments.build(comment_params)
        if @comment.save
        flash[:success] = "コメントしました"
        redirect_to movie_path(@movie)
        else
        render 'static_pages'
        end
    end
    
    
    def destroy
        @movie = Movie.find(params[:movie_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to movie_path(@movie)
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:commenter,:body,:movie_id,:user_id)
    end
    
end
