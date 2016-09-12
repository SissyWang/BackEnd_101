flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#x={}
#puts x = Hash[(0...flintstones.size).zip flintstones]
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
puts flintstones_hash