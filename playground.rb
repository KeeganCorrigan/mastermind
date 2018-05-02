# weight = 200
# target = 150
#
# until weight < target
#   weight = weight - 1
#   puts "weight is #{weight}"
# end

weight = 200
target = 150

loop do
  weight = weight - 1
  puts weight
  if weight < target
    break
  end
end
