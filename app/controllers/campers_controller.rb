class CampersController < ApplicationController
    def index 
        render json: Camper.all
    end

    def show 
        camper = Camper.find_by(id:params[:id])
        if camper 
            render json: camper, serializer: CamperActivitiesSerializer
        else 
            render json: {error: "No camper found"}
    end
end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: :created
        else 
            render json: {error: ["validation errors"]}, status: :unprocessable_entity
    end
end

    private
    def camper_params
        params.permit(:name,:age)  
    end

end
