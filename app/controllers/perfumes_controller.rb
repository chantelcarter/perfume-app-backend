class PerfumesController < ApplicationController
  def index
    perfumes = Perfume.all
    render json: perfumes
  end

  def create
    perfume = Perfume.create(perfume_params)
    if perfume.valid?
      render json: perfume
    else
      render json: perfume.errors, status: 422
    end
  end

  def update
    perfume = Perfume.find(params[:id])
    perfume.update(perfume_params)
    if perfume.valid?
      render json: perfume
    else
      render json: perfume.errors, status: 422
    end
  end

  def destroy
    perfume = Perfume.find(params[:id])
    if perfume.destroy
      render json: perfume
    else
      render json: perfume.errors, status: 422
    end
  end

  private
  def perfume_params
    params.require(:perfume).permit(:name, :designer, :category, :top_notes, :middle_notes, :base_notes, :image, :user_id)
  end
end
