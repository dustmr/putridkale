class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    if params[:search] && params[:duration]
      @movies = Movie.search(params[:search], params[:duration])
    end
    render :search
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :poster, :remote_poster_url
    )
  end

  # def index
  #   @movies =[
  #     {
  #       title: "Boyhood",
  #       director: "Richard Linklater",
  #       runtime_in_minutes: 165,
  #       poster_image_url: "http://www.impawards.com/2014/posters/boyhood_xlg.jpg",
  #       release_date: 2014-07-11,
  #       description: <<-eos.gsub(/\s+/, " ").strip
  #          Epic in technical scale but breathlessly intimate in narrative scope, Boyhood is a sprawling investigation of the human condition.
  #       eos
  #     },
  #     {
  #       title: "Nightcrawler",
  #       director: "Dan Gilroy",
  #       runtime_in_minutes: 117,
  #       poster_image_url: "http://mediafiles.cineplex.com/Posters/320x470/Nightcrawler.jpg",
  #       release_date: 2014-10-31,
  #       description: <<-eos.gsub(/\s+/, " ").strip
  #          Restless, visually sleek, and powered by a lithe star performance from Jake Gyllenhaal, Nightcrawler offers dark, thought-provoking thrills.
  #       eos
  #     },
  #   ]
  # end

  # def show
  #   movies = [
  #     {
  #       title: "Boyhood",
  #       director: "Richard Linklater",
  #       runtime_in_minutes: 165,
  #       poster_image_url: "http://www.impawards.com/2014/posters/boyhood_xlg.jpg",
  #       release_date: 2014-07-11,
  #       description: <<-eos.gsub(/\s+/, " ").strip
  #          Epic in technical scale but breathlessly intimate in narrative scope, Boyhood is a sprawling investigation of the human condition.
  #         eos
  #     },
  #     {
  #       title: "Nightcrawler",
  #       director: "Dan Gilroy",
  #       runtime_in_minutes: 117,
  #       poster_image_url: "http://mediafiles.cineplex.com/Posters/320x470/Nightcrawler.jpg",
  #       release_date: 2014-10-31,
  #       description: <<-eos.gsub(/\s+/, " ").strip
  #          Restless, visually sleek, and powered by a lithe star performance from Jake Gyllenhaal, Nightcrawler offers dark, thought-provoking thrills.
  #       eos
  #     }   
  #   ]
  #   @movie = movies[params[:id].to_i]  
  # end

  



end
