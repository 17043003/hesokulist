class Api::V1::HouseholdsController < ApplicationController
    def index
        datas = Household
        .select(:id, :spent_date, :amount)
        .where(spent_date: Date.current.in_time_zone.all_month)

        render json: { status: "ok", datas: datas }
    end

    def show
        data = Household
        .select(:id, :spent_date, :amount, :memo)
        .find_by(spent_date: params[:date])
        
        render json: { status: "ok", data: data }
    end
end
