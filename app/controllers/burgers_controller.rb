class BurgersController < ApplicationController
  alias_attribute :nombre, :name
  before_action :set_burger, only: [:show, :update, :destroy]

  # GET /burgers
  def index
    @burgers = Burger.all
  end

  # GET /burgers/1
  def show
    @burger
  end

  # POST /burgers
  def create
    @burger = Burger.new(burger_params)

    if @burger.save
      render "show.json"
    else
      render json: @burger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /burgers/1
  def update
    if @burger.update(update_burger_params)
      render "show.json"
    else
      render json: @burger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /burgers/1
  def destroy
    @burger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_burger
      @burger = Burger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def burger_params

      params.tap { |p| p[:name] = p[:nombre];
        p[:price] = p[:precio];
        p[:description] = p[:descripcion];
        p[:image] = p[:imagen]}.permit(:name, :price, :description, :image)

    end

    def update_burger_params
      new_params = {}
      if params[:precio]
        new_params[:price]=params[:precio]
      end
      if params[:nombre]
        new_params[:name]=params[:nombre]
      end
      if params[:descripcion]
        new_params[:description]=params[:descripcion]
      end
      if params[:imagen]
        new_params[:image]=params[:imagen]
      end
      #new_params.permit(:name, :price, :description, :image)
      new_params
    end
end
