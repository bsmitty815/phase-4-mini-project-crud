class SpicesController < ApplicationController

    # to make a controller in the terminal
    # rails g controller spices --no-test-framework

    # GET
    def index
        #returns an array of all spices
        spices = Spice.all
        render json: spices
    end

    # POST
    def create
        # creates a new spice
        # returns the spice data
        # returns a status code of 201 (created)
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH
    def update
        # updates the spice with the matching id
        # returns the spice data
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        # else
        #     render json: { error: "Spice not found" }, status: :not_found
        end
    end

    # DELETE
    def destroy
        # deletes the spice with the matching id
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        # else
        #     render json: { error: "Spice not found" }, status: :not_found
        end
    end



    private

    #setting up all the paramas that we want created/updated
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end


end
