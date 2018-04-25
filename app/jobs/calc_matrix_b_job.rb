class CalcMatrixBJob < ApplicationJob
  queue_as :matrixB

  def perform(*args)
    puts "awcrfrf"
  end
end
