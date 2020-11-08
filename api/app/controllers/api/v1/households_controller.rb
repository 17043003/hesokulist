class Api::V1::HouseholdsController < ApplicationController
    def index
        datas = Household
        .select(:spent_date, :amount, :memo)
        .where(spent_date: Date.current.in_time_zone.all_month)

        render json: { status: "ok", datas: datas }
    end
end
