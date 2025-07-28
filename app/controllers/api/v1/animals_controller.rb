module Api::V1
    class AnimalsController < ApplicationController

        def index
            animals = Animal.all            
            animals_json = AnimalSerializer.new(animals).serializable_hash.to_json
            
            render json: animals_json, status: 200
        end
        
        def show
            @an = Animal.find_by(id: params[:id])
            render json: Animal.new(@user).serializable_hash.to_json
        end
    end
end