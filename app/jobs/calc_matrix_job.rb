class CalcMatrixJob < ApplicationJob
  queue_as :calc_matrixA

  def perform(*args)

    index = args[1]
    row = args[0][:row]

    case args[0][:key]
    when "A1" 
      queue1 = Sidekiq::Queue.new("calc_matrixB")
      queue1.each do |job1|
                
        keyMatrizB= job1.item["args"][0]["arguments"][0]["key"]

        if (keyMatrizB == "B1") && (index == job1.item["args"][0]["arguments"][1])  
          total = 0 
          for i in 0..row.length
            total = total + (row[i].to_i() * job1.item["args"][0]["arguments"][0]["row"][i].to_i())
          end
          result = {key:"C11",cel:total}
          ResultMatrixJob.perform_later(result,index)
          job1.delete
       elsif (keyMatrizB == "B2") && (index == job1.item["args"][0]["arguments"][1])
          total = 0 
          for i in 0..row.length
            total = total + (row[i].to_i() * job1.item["args"][0]["arguments"][0]["row"][i].to_i())
          end
          result = {key:"C12",cel:total}
          ResultMatrixJob.perform_later(result,index)
          job1.delete
        end
      end
      
    when "A2"
       
      queue2 = Sidekiq::Queue.new("calc_matrixB")
      queue2.each do |job2|
          
        keyMatrizB= job2.item["args"][0]["arguments"][0]["key"]
          
        if (keyMatrizB == "B1") && (index == job2.item["args"][0]["arguments"][1])  
          total = 0 
          for i in 0..row.length
            total = total + (row[i].to_i() * job2.item["args"][0]["arguments"][0]["row"][i].to_i())
          end
          result = {key:"C21",cel:total}
          ResultMatrixJob.perform_later(result,index)
          job2.delete
        elsif (keyMatrizB == "B2") && (index == job2.item["args"][0]["arguments"][1])
          total = 0 
          for i in 0..row.length
            total = total + (row[i].to_i() * job2.item["args"][0]["arguments"][0]["row"][i].to_i())
          end
          result = {key:"C22",cel:total}
          ResultMatrixJob.perform_later(result,index)
          job2.delete
        end

      end
    else
    end

  end
end