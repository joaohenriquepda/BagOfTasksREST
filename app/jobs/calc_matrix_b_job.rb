class CalcMatrixBJob < ApplicationJob
  queue_as :matrixb

  def perform(*args)
    puts "awcrfrf"
  end
end
