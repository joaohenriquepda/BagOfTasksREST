class ResultMatrixJob < ApplicationJob
  queue_as :result_matrix

  def perform(*args)
    puts "uuu"
    puts args[0][:cel]
    @matrix = MatrixCalculator.find(args[1])
    @matrix.matrixB = [@matrix.matrixB, args[0]]
    @matrix.save
  end
end
