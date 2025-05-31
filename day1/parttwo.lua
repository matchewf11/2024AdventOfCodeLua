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

-- Make a hashmap
local map = {}
for _, val in ipairs(second) do
	if map[val] == nil then
		map[val] = 1
	else
		map[val] = map[val] + 1
	end
end

local sum = 0
for _, val in ipairs(first) do
	if map[val] ~= nil then
		sum = sum + val * map[val]
	end
end

print(sum)

io.close()
