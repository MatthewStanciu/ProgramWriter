file = File.open('program.rb', 'w')
file.write("#generated file")
File.readlines("instructions.txt").each do |line|
   puts "#{line}"
   if line.include? "integer"
      line_string = line.to_s
      split = line_string.split(' ')
      var_index = split.index("called") + 1
      var_name = split.at(var_index)
      value_index = split.index("value") + 1
      value = split.at(value_index)

      file.write("\n#{var_name} = #{value}")
   end
   
end
file.close
