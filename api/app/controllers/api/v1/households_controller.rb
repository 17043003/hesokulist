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
        data = Household.find_or_initialize_by(spent_date: params[:spent_date])
        
        if data.update(household_params)
            render json: { status: "ok", messages: ["データを更新しました"] }
        else
            render json: { status: "ng", messages: data.errors&.full_messages }
        end
    end

    def destroy
        data = Household.find_by(spent_date: params[:spent_date])

        if data.present?
            if data.delete
                render json: { status: "ok", messages: ["データを削除しました"] }
            else
                render json: { status: "ng", messages: ["データ削除に失敗しました"] }
            end
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
