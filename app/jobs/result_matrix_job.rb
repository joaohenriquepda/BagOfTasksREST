class ResultMatrixJob < ApplicationJob
  queue_as :result_matrix

  def perform(*args)
    puts args[0][:cel]
    @matrix = MatrixCalculator.find(args[1])
    @matrix.matrixC.push args[0]
    @matrix.save
  end
end
