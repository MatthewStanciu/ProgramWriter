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
   if line.include? "method"
      method_index = split.index("called") + 1
      method_name = split.at(method_index)
      file.write("def #{method_name}")
      
      if line.start_with? '*'
         method_counter = 0
         while line.start_with? '*' do   
            method_counter+=1
         end
         
      end
   end
end
file.close
