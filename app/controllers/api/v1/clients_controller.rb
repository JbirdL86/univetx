module Api::V1
    class ClientsController < ApplicationController
        before_action :authenticate_user!

        def index
            clients = Client.all            
            clients_json = ClientSerializer.new(clients).serializable_hash.to_json
            
            render json: clients_json, status: 200
        end
        
        def show
            begin
                @user = Client.find(params[:id])
                render json: ClientSerializer.new(@user).serializable_hash.to_json, status: :ok # Use :ok for 200
            rescue ActiveRecord::RecordNotFound

                render json: { error: "Client not found" }, status: :not_found # or status: 404
            end
        end
    end
end