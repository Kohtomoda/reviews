class MoviesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :set_movie, only: [:destroy] 
    
    
    def new
        @movie = Movie.new
    end
    
    def show
        @movie = Movie.includes(:user).find(params[:id])
        @comments = @movie.comments.includes(:user).all
        @comment  = @movie.comments.build(user_id: current_user.id) if current_user
    end
    
    def create
        @movie = current_user.movies.build(movies_params)
        if @movie.save
        flash[:success] = "作品を登録しました"
        redirect_to root_url
        else
        render 'static_pages'
        end
    end
    
    def destroy
        @movie.destroy
        redirect_to root_path, notice: '作品を削除しました'
    end
    
    private
    
    def movies_params
        params.require(:movie).permit(:title, :story, :image, :image_cache, :remove_image)
    end
    
    def set_movie
        @movie = Movie.find(params[:id])
    end
    
end
