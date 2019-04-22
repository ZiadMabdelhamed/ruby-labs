class ItemTestsController < ApplicationController
  before_action :set_item_test, only: [:show, :update, :destroy]

  # GET /item_tests
  def index
    @item_tests = ItemTest.all

    render json: @item_tests
  end

  # GET /item_tests/1
  def show
    render json: @item_test
  end

  # POST /item_tests
  def create
    @item_test = ItemTest.new(item_test_params)

    if @item_test.save
      render json: @item_test, status: :created, location: @item_test
    else
      render json: @item_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_tests/1
  def update
    if @item_test.update(item_test_params)
      render json: @item_test
    else
      render json: @item_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_tests/1
  def destroy
    @item_test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_test
      @item_test = ItemTest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_test_params
      params.require(:item_test).permit(:name, :description)
    end
end
