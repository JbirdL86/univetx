module Api::V1
    class AnimalsController < ApplicationController
        before_action :authenticate_user!

        def index
            animals = Animal.all            
            animals_json = AnimalSerializer.new(animals).serializable_hash.to_json
            
            render json: animals_json, status: 200
        end
        
        def show
            @an = Animal.find_by(id: params[:id])
            render json: Animal.new(@an).serializable_hash.to_json
        end
    end
end