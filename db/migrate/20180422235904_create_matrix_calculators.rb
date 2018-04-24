class CreateMatrixCalculators < ActiveRecord::Migration[5.1]
  def change
    create_table :matrix_calculators do |t|
      t.string :matrixA
      t.string :matrixB

      t.timestamps
    end
  end
end
