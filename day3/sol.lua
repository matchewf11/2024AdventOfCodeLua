local sum = 0

for line in io.lines("input.txt") do
	for val1, val2 in string.gmatch(line, "mul%((%d+),(%d+)%)") do
		sum = sum + val1 * val2
	end
end

print(sum)
