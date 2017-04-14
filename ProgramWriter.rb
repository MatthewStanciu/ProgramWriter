line_number = 0
file = File.open('program.rb', 'w')
file.write("#generated file")
File.readlines("instructions.txt").each do |line|
   split = line.split(' ')
   puts "#{line}"
   line_number+=1

   if line.include? "integer"
      var_index = split.index("called") + 1
      var_name = split.at(var_index)
      value_index = split.index("value") + 1
      value = split.at(value_index)

      file.write("\n#{var_name} = #{value}")
   end
   method_number = 0
   if line.include? "method"
      method_number = line_number
      method_index = split.index("called") + 1
      method_name = split.at(method_index)
      
            
      file.write("\ndef #{method_name}")
      file.write("\n\nend")
   end
   inmethod_number = 0
   if line.start_with? "*" #idea: loop through method start and end
      inmethod_number = line_number
      if inmethod_number - 1 == method_number
         if line.include? "print"
            print_message = ""
            print_index = split.index("print")
            print_message = "#{print_message}" + "#{split}"   
            file.write("\n#{line}") #temporary
            file.write("\n\nend")
         end
      end
   end
   if line.include? "call "
      call_index = split.index("call") + 1
      call_name = split.at(call_index)
      file.write("\n#{call_name}")
   end
end
file.close
