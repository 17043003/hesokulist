class Api::V1::HouseholdsController < ApplicationController
    def index
        render json: { status: "ok", id: 1 }
    end
end
