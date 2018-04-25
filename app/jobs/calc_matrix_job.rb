class CalcMatrixJob < ApplicationJob
  queue_as :calc_matrix

  def perform(*args)

    index = args[1]

    case args[0][:key]
    when "A1" 
      queue1 = Sidekiq::Queue.new("matrixB")
      queue1.each do |job1|
          
        keyMatrizB= job1.item["args"][0]["arguments"][0]["key"]

        if (keyMatrizB == "B1") && (index == job1.item["args"][0]["arguments"][1])  
          puts "wsedt"
        elsif (keyMatrizB == "B2") && (index == job1.item["args"][0]["arguments"][1])
          puts "putt"
        end

      end
    when "A2"
       
      queue2 = Sidekiq::Queue.new("matrixB")
      queue2.each do |job2|
          
        keyMatrizB= job2.item["args"][0]["arguments"][0]["key"]
          
        if (keyMatrizB == "B1") && (index == job2.item["args"][0]["arguments"][1])  
          puts "wsedt"
        elsif (keyMatrizB == "B2") && (index == job2.item["args"][0]["arguments"][1])
          puts "putt"
        end

      end
    else
    end

  end
end



# case keyMatrizA
# when "A1"

#   queue1 = Sidekiq::Queue.new("calc_matrix")
#   queue1.each do |job1|
    
#     keyMatrizB = job1.item["args"][0]["arguments"][0]["key"]  
#     rowMatrizB =  job1.item["args"][0]["arguments"][0]["row"]
#     total = 0


#     puts "A1 key " +  job1.item["args"][0]["arguments"][0]["key"]


#     case keyMatrizB
#     when "B1"  
#       puts "inside A1B1"
#       ResultMatrixJob.perform_later("A1B1",4,args[1]) ResultMatrixJob.perform_later("A1B1",4,args[1]) 
#     when "B2"
#       puts "inside A1B2"
#       ResultMatrixJob.perform_later("A1B2",5,args[1])
#     else
#       puts ""
#     end  
      
#       # for i in 0..rowMatrizB.length
#       #   total = total + (rowMatrizA[i].to_i() * rowMatrizB[i].to_i())
#       # end
#       #   ResultMatrixJob.perform_later("A1B1",total,args[1]) 
#     #   for i in 0..rowMatrizB.length
#     #     total = total + (rowMatrizA[i].to_i() * rowMatrizB[i].to_i())
#     #   end
#     #   ResultMatrixJob.perform_later("A1B2",total,args[1])
#     # end
#   end
      # when "A2"
      #   queue2 = Sidekiq::Queue.new("calc_matrix")
      #   queue2.each do |job2|
          
      #     keyMatrizB = job2.item["args"][0]["arguments"][0]["key"]  
      #     rowMatrizB =  job2.item["args"][0]["arguments"][0]["row"]
      #     total = 0
      #     puts "A2 key " +  job2.item["args"][0]["arguments"][0]["key"]


      #     case keyMatrizB
      #     when "B1"  
      #       puts "inside A2B1"
      #       esultMatrixJob.perform_later("A2B1",4,args[1])
      #     when "B2"
      #       puts "inside A2B2"
      #       ResultMatrixJob.perform_later("A2B2",7,args[1])
      #     else
      #       puts "vamos lá"  
      #     end  

      #       # for i in 0..rowMatrizB.length
      #       #   total = total + (rowMatrizA[i].to_i() * rowMatrizB[i].to_i())
      #       # end
      #       # ResultMatrixJob.perform_later("A2B1",total,args[1])
      #       # for i in 0..rowMatrizB.length
      #       #   total = total + (rowMatrizA[i].to_i() * rowMatrizB[i].to_i())
      #       # end
      #       # ResultMatrixJob.perform_later("A2B2",total,args[1])

      #   end
      # else
      #   "puts não foi"
      # end