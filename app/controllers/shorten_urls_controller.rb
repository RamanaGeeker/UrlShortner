class ShortenUrlsController < ApplicationController
  before_action :set_shorten_url, only: %i[ show ]
  skip_before_action :verify_authenticity_token, only: [:create, :login]

  # GET /shorten_urls or /shorten_urls.json
  def index
    @shorten_urls = ShortenUrl.all
    render json: @shorten_urls
  end

  # GET /shorten_urls/1 or /shorten_urls/1.json
  def show
    render json: @shorten_url
  end

  # GET /shorten_urls/new
  def create
    @shorten_url = ShortenUrl.new(shorten_url_params)
    if @shorten_url.save
      render json: @shorten_url
    else
      render json: @shorten_url.errors
    end
  end

  def redirect_to_original
    short_url = params[:shortened_url]
    url = ShortenUrl.find_by(short_url: short_url)

    if url
      redirect_to url.original_url, status: :moved_permanently
    else
      render json: { error: "Shortened URL not found" }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorten_url
      @shorten_url = ShortenUrl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shorten_url_params
      params.require(:shorten_url).permit(:original_url, :short_url)
    end
end
