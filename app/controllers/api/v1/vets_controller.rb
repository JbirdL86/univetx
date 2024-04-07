module Api::V1
    class VetsController < ApplicationController

        def index
            users = Vet.all
            
            render json: users, status: 200
        end
        
        def show
            @user = Vet.find_by(vet_id: params[:id])
            render json: VetSerializer.new(@user).serializable_hash.to_json
        end
    end
end