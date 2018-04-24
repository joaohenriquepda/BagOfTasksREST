class CalcMatrixWorker
  include Sidekiq::Worker
 
  def perform(*args)
    sleep 1
    puts "fodassse"

      for i in 0..5
        CalcMatrixJob.perform_later("d",23)
      end

    queue = Sidekiq::Queue.new("calc_matrix")
    queue.each do |job|
      puts job.to_json
    end

    # # matrix = MatrixCalculator.find(args[:args][:id])
    # matrix.update(matrixB:"AQUI_WORKER")

  end


end
