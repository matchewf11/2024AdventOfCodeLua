io.input("input.txt")

local currNum = io.read("*number")
local count = 0
local first = {}
local second = {}

while currNum ~= nil do
	if count % 2 == 0 then
		first[#first + 1] = currNum
	else
		if second[currNum] == nil then
			second[currNum] = 1
		else
			second[currNum] = second[currNum] + 1
		end
	end
	count = count + 1
	currNum = io.read("*number")
end

local sum = 0
for _, val in ipairs(first) do
	if second[val] ~= nil then
		sum = sum + val * second[val]
	end
end

print(sum)

io.close()
