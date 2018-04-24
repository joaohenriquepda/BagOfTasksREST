class MatrixCalculatorsController < ApplicationController
  before_action :set_matrix_calculator, only: [:show, :update, :destroy]

  # GET /matrix_calculators
  def index
    @matrix_calculators = MatrixCalculator.last

    render json: @matrix_calculators
    
  end

  # GET /matrix_calculators/1
  def show
    render json: @matrix_calculator
  end

  # POST /matrix_calculators
  def create

    @matrix_calculator = MatrixCalculator.new(matrix_calculator_params)

    if @matrix_calculator.save

      matrixB1 = {key:"B1",row:[1,0,4]} 
      matrixB2 = {key:"B2",row:[-2,5,1]}
      matrixA1 = {key:"A1",row:[2,3,1]}
      matrixA2 = {key:"A2",row:[-1,0,2]}

      CalcMatrixJob.perform_later(matrixA2,@matrix_calculator.id)
      CalcMatrixBJob.perform_later(matrixB2,@matrix_calculator.id)
      CalcMatrixJob.perform_later(matrixA1,@matrix_calculator.id)
      CalcMatrixBJob.perform_later(matrixB1,@matrix_calculator.id)

      # CalcMatrixJob.perform_later(matrixA1,@matrix_calculator.id)
      # CalcMatrixBJob.perform_later(matrixB1,@matrix_calculator.id)
      # CalcMatrixJob.perform_later(matrixA2,@matrix_calculator.id)
      # CalcMatrixBJob.perform_later(matrixB2,@matrix_calculator.id)

      @matrix_calculator.matrixA = [matrixA1 , matrixA2]
      @matrix_calculator.matrixB = [matrixB1 , matrixB2]
      
      @matrix_calculator.save
      render json: @matrix_calculator, status: :created, location: @matrix_calculator
      
    else
      render json: @matrix_calculator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matrix_calculators/1
  def update
    if @matrix_calculator.update(matrix_calculator_params)
      render json: @matrix_calculator
    else
      render json: @matrix_calculator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matrix_calculators/1
  def destroy
    @matrix_calculator.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matrix_calculator
      @matrix_calculator = MatrixCalculator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def matrix_calculator_params
      params.require(:matrix_calculator).permit(:matrixA, :matrixB,:matrix_calculator)
    end
end
