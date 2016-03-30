class MoviesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def index
        @movie = Movie.new
    end
    
    def new
        @movie = Movie.new
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
    
    private
    
    def movies_params
        params.require(:movie).permit(:title, :story)
    end
    
end
