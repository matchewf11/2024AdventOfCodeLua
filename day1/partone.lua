io.input("input.txt")

local count, first, second = 0, {}, {}

local currNum = io.read("*number")
while currNum ~= nil do
	if count % 2 == 0 then
		first[#first + 1] = currNum
	else
		second[#second + 1] = currNum
	end
	count = count + 1
	currNum = io.read("*number")
end

function BubbleSort(arr)
	for i = 1, #arr - 1 do
		for j = 1, #arr - i do
			if arr[j] > arr[j + 1] then
				arr[j], arr[j + 1] = arr[j + 1], arr[j]
			end
		end
	end
end

BubbleSort(first)
BubbleSort(second)

local sum = 0

for j, firstVal in ipairs(first) do
	local secVal = second[j]
	local dif = firstVal - secVal
	if dif < 0 then
		dif = dif * -1
	end
	sum = sum + dif
end

print(sum)

io.close()
