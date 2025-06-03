local left, right = {}, {}
for line in io.lines("test.txt") do
	local _, _, x, y = string.find(line, "(%d+)   (%d+)")
	table.insert(left, x)
	table.insert(right, y)
end

table.sort(left)
table.sort(right)

local sum = 0
for i = 1, #left do
	sum = sum + math.abs(left[i] - right[i])
end
print(sum)
