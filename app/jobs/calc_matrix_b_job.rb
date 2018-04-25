class CalcMatrixBJob < ApplicationJob
  queue_as :calc_matrixB

  def perform(*args)
    puts "awcrfrf"
  end
end
