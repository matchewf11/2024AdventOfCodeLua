io.input("input.txt")

local currNum = io.read("*number")
local count = 0
local first = {}
local second = {}

while currNum ~= nil do
	if count % 2 == 0 then
		first[#first + 1] = currNum
	else
		second[#second + 1] = currNum
	end
	count = count + 1
	currNum = io.read("*number")
end

local sum = 0

for i, val in ipairs(first) do
	local occ = 0
	for _, secVal in ipairs(second) do
		if secVal == val then
			occ = occ + 1
		end
	end
	sum = sum + occ * val
end

print(sum)

io.close()
