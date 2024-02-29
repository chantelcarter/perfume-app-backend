class PerfumesController < ApplicationController
  def index
    perfumes = Perfume.all
    render json: perfumes
  end
end
