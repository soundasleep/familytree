class SourcesController < ApplicationController
  def index
    @sources = Source.order(authority: :desc).all
  end

  def show
    @source = find_source
  end

  def new
    @source = Source.default
  end

  def create
    @source = Source.create!(source_params)
    redirect_to source_path(@source)
  end

  def edit
    @source = find_source
  end

  def update
    @source = find_source
    @source.update! source_params
    redirect_to source_path @source
  end

  private

  def find_source
    Source.find(params[:id])
  end

  def source_params
    params.require(:source).permit(:key, :description, :url, :authority)
  end
end
