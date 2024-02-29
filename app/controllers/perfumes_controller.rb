class PerfumesController < ApplicationController
  def index
    perfumes = Perfume.all
    render json: perfumes
  end

  def create
    perfume = Perfume.create(herb_params)
    if perfume.valid?
      render json: perfume
    else
      render json: perfume.errors, status: 422
    end
  end

  private
  def herb_params
    params.require(:perfume).permit(:name, :designer, :category, :top_notes, :middle_notes, :base_notes, :image, :user_id)
  end
end
