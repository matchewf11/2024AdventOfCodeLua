io.input("input.txt")

local line, left, count = io.read(), {}, {}

while line do
	local _, _, x, y = string.find(line, "(%d+)   (%d+)")
	left[#left + 1] = x
	if count[y] then
		count[y] = count[y] + 1
	else
		count[y] = 1
	end
	line = io.read()
end

local sum = 0

for _, val in ipairs(left) do
	if count[val] then
		sum = sum + val * count[val]
	end
end

print(sum)
