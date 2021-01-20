class Api::V1::UsersController < ApplicationController
    def signup
        user = User.new(user_params)
        if user.save
            render json: { status: "ok", message: "ユーザー登録しました" }
        else
            render json: { status: "ng", message: "登録に失敗しました" }
        end
    end

    private def user_params
        params.require(:user).permit(
            :name,
            :email
        )
    end
end
