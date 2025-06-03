local left, count = {}, {}

for line in io.lines("input.txt") do
	local _, _, x, y = string.find(line, "(%d+)   (%d+)")
	left[#left + 1] = x
	if count[y] then
		count[y] = count[y] + 1
	else
		count[y] = 1
	end
end

local sum = 0

for _, val in ipairs(left) do
	if count[val] then
		sum = sum + val * count[val]
	end
end

print(sum)
