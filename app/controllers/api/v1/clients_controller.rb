module Api::V1
    class ClientsController < ApplicationController

        def index
            clients = Client.all            
            clients_json = ClientSerializer.new(clients).serializable_hash.to_json
            
            render json: clients_json, status: 200
        end
        
        def show
            @user = Client.find_by(client_id: params[:id])
            render json: ClientSerializer.new(@user).serializable_hash.to_json
        end
    end
end