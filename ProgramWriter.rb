file = File.open('program.rb', 'w')
file.write("#generated file")
File.readlines("instructions.txt").each do |line|
   split = line.split(' ')
   puts "#{line}"

   if line.include? "integer"
      var_index = split.index("called") + 1
      var_name = split.at(var_index)
      value_index = split.index("value") + 1
      value = split.at(value_index)

      file.write("\n#{var_name} = #{value}")
   end
   if line.include? "method"
      method_index = split.index("called") + 1
      method_name = split.at(method_index)
      
            
      file.write("\ndef #{method_name}")
      if line.start_with? "*"
         if line.include? "print"
            print_message = ""
            print_index = split.index("print")
            if split.index != print_index
               print_message = "#{print_message}" + "#{split}"
            end
            file.write("\n#{line}")
         end
      end
      file.write("\n\nend")
   end
   if line.include? "call "
      call_index = split.index("call") + 1
      call_name = split.at(call_index)
      file.write("\n#{call_name}")
   end
end
file.close
