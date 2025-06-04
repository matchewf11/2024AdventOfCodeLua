local left, count = {}, {}

for line in io.lines("input.txt") do
	local _, _, x, y = string.find(line, "(%d+)   (%d+)")
	table.insert(left, x)
	count[y] = count[y] and count[y] + 1 or 1
end

local sum = 0

for _, val in ipairs(left) do
	if count[val] then
		sum = sum + val * count[val]
	end
end

print(sum)
