require 'test_helper'

class MatrixCalculatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matrix_calculator = matrix_calculators(:one)
  end

  test "should get index" do
    get matrix_calculators_url, as: :json
    assert_response :success
  end

  test "should create matrix_calculator" do
    assert_difference('MatrixCalculator.count') do
      post matrix_calculators_url, params: { matrix_calculator: { matrixA: @matrix_calculator.matrixA, matrixB: @matrix_calculator.matrixB } }, as: :json
    end

    assert_response 201
  end

  test "should show matrix_calculator" do
    get matrix_calculator_url(@matrix_calculator), as: :json
    assert_response :success
  end

  test "should update matrix_calculator" do
    patch matrix_calculator_url(@matrix_calculator), params: { matrix_calculator: { matrixA: @matrix_calculator.matrixA, matrixB: @matrix_calculator.matrixB } }, as: :json
    assert_response 200
  end

  test "should destroy matrix_calculator" do
    assert_difference('MatrixCalculator.count', -1) do
      delete matrix_calculator_url(@matrix_calculator), as: :json
    end

    assert_response 204
  end
end
