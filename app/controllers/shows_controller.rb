class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show update destroy ]

  def index
    @shows = Show.all
    genre_sections = %w[drama comedy miniseries adult_animation anime kids_and_family docuseries reality variety co_productions episodic continuations one_time_specials]
    formatted_shows = {}
    genre_sections.each do |genre|
      matched_shows = @shows.where(genre: genre.gsub('_', ' ').titleize).limit(12)
      next if matched_shows.empty?
      formatted_shows[genre] = matched_shows
    end

    render json: formatted_shows
  end

  def show
    render json: @show
  end

  def genre_shows
    shows = Show.where(genre: params[:genre].titleize)

    render json: shows
  end

  def search_shows
    shows = Show.where(title: params[:string].split(','))
    render json: shows
  end

  def all_shows
    shows = Show.all.pluck(:title)
    render json: shows
  end

  def create
    @show = Show.new(show_params)

    if @show.save
      render json: @show, status: :created, location: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  def update
    if @show.update(show_params)
      render json: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @show.destroy
  end

  private

  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.fetch(:title, :genre, :description, :canceled_description, :premiere, :finale, :seasons, :runtime, :canceled)
  end
end
