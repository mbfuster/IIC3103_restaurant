class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
    @ingredient
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render 'show.json'
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if params[:burger_id]
      @burger = Burger.find(params[:burger_id])
      @burger.ingredients << @ingredient
      #render 'burger.json'

    elsif @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    if params[:burger_id]
      @burger = Burger.find(params[:burger_id])
      @burger.ingredients.delete(@ingredient)
    else
      @ingredient.destroy
    end
  end

  private

  #  def get_burger
  #    @burger = Burger.find(params[:burger_id])
  #  end
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.tap { |p| p[:name] = p[:nombre];
        p[:description] = p[:descripcion]}.permit(:name, :description)
    end
end
