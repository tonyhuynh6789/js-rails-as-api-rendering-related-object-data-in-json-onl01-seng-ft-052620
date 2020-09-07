class SightingsController < ApplicationController

    def show 
        sightings = Sighting.all 
        render json: sighting, include: [:bird, :location]
        render json: sighting.to_json(include: [:bird, :location])

    end 

    def show 
        sighting = Sighting.find_by(id: params[:id])

        render json: sighting.to_json(:include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at, :created_at])
    end 
end


