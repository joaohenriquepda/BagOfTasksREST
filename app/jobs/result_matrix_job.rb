class ResultMatrixJob < ApplicationJob
  queue_as :result_matrix

  def perform(*args)
    puts args
    puts args[1]
  end
end
