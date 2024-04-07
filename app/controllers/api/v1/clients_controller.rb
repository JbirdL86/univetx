module Api::V1
    class ClientsController < ApplicationController

        def index
            users = Client.all
            
            render json: users, status: 200
        end
        
        def show
            @user = Client.find_by(client_id: params[:id])
            render json: ClientSerializer.new(@user).serializable_hash.to_json
        end
    end
end