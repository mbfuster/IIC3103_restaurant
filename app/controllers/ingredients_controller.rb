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
      if params[:id].to_i != 0
        @burger = Burger.find(params[:burger_id])
        @burger.ingredients << @ingredient
        render json: "Ingrediente agregado", status: :created
      else
        render json: "Id de hamburguesa inválido", status: :bad_request
      end
    elsif @ingredient.update(update_ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    if params[:burger_id]
      if params[:id].to_i != 0
        @burger = Burger.find(params[:burger_id])
        @burger.ingredients << @ingredient
        render json: "ingrediente retirado", status: :created
      else
        render json: "Id de hamburguesa inválido", status: :bad_request
      end
    else
      if  @ingredient.ingredient_on_burgers.any?
        render json: "Ingrediente no se puede borrar, se encuentra presente en una hamburguesa", status: :conflict
      else
        @ingredient.destroy
      end
    end
  end

  private

  #  def get_burger
  #    @burger = Burger.find(params[:burger_id])
  #  end
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      if params[:id].to_i != 0
        @ingredient = Ingredient.find(params[:id])
      else
        render json: "id invalido", status: :bad_request
      end
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.tap { |p| p[:name] = p[:nombre];
        p[:description] = p[:descripcion]}.permit(:name, :description)
    end
    def update_ingredient_params
      new_params = {}
      if params[:nombre]
        new_params[:name]=params[:nombre]
      end
      if params[:descripcion]
        new_params[:description]=params[:descripcion]
      end
      new_params
    end
end
