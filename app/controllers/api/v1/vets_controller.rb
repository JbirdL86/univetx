module Api::V1
    class VetsController < ApplicationController
        before_action :authenticate_user!

        def index
            vets = Vet.all            
            vets_json = VetSerializer.new(vets).serializable_hash.to_json
            
            render json: vets_json, status: :ok
        end
        
        def show
            begin
                @user = Vet.find_by(id: params[:id])
                render json: VetSerializer.new(@user).serializable_hash.to_json
            rescue ActiveRecord::RecordNotFound
                render json: { error: "Vet not found" }, status: :not_found
            end
        end
    end
end