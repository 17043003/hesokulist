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

    def create
        data = Household.find_or_initialize_by(params[:spent_date])
        
        # if data.save
        if data.update(household_params)
            render json: { status: "ok", message: "データを更新しました", data: data }
        else
            render json: { status: "ng", message: "データの更新に失敗" }
        end
    end

    private def household_params
        params.require(:household).permit(
            :spent_date,
            :amount,
            :memo
        )
    end
end
