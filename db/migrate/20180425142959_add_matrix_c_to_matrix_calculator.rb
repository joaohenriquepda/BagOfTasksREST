class AddMatrixCToMatrixCalculator < ActiveRecord::Migration[5.1]
  def change
    add_column :matrix_calculators, :matrixC, :json, array: true,default: []
  end
end
