class RecipesController < ApplicationController
    def index
        user = User.find_by(id: session[:user_id])
        if user
            render json: user.recipes, status: :created
        else
            render json: { errors: ["Unauthorized"] }, status: :unauthorized
        end
    end

    def create
        user = User.find_by(id: session[:user_id])
        if user
            recipe = Recipe.create(title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete], user_id: user.id)
            if recipe.valid?
                render json: recipe, status: :created
            else
                render json: { errors: [recipe.errors.full_messages] }, status: :unprocessable_entity
            end
        else
            render json: { errors: ["Unauthorized"] }, status: :unauthorized
        end
    end

    private
    # def recipe_params
    #     params.permit(:title, :instructions, :minutes_to_complete)
    # end
end
