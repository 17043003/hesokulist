class Api::V1::HouseholdsController < ApplicationController
    def index
        datas = Household.all
        render json: { status: "ok", datas: datas }
    end
end
