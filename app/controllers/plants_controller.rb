class PlantsController < ApplicationController
    def index
        plants = Plant.limit 2
        render json: plants
    end

    def show
        single_plant = Plant.find_by(id: params[:id])
        render json: single_plant
    end

    def create
        new_plant = Plant.create(plant_params)
        render json: new_plant, status: :created
    end

    def plant_params
        params.permit(:name, :image, :price)
    end
end
