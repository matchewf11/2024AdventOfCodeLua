function SplitSpace(str)
	local start, curr, arr = 0, 0, {}
	while curr <= #str do
		if string.sub(str, curr, curr) == " " then
			arr[#arr + 1] = string.sub(str, start, curr - 1)
			curr = curr + 1
			start = curr
		else
			curr = curr + 1
		end
	end
	arr[#arr + 1] = string.sub(str, start, curr - 1)
	return arr
end

io.input("input.txt")
local line = io.read("*line")

local count = 0

while line ~= nil do
	local nums, safe = SplitSpace(line), true

	for i = 1, #nums do
		nums[i] = tonumber(nums[i])
	end

	local inc = nums[1] < nums[2]
	for i = 2, #nums do
		local dif = inc and (nums[i] - nums[i - 1]) or (nums[i - 1] - nums[i])
		if dif < 1 or dif > 3 then
			safe = false
		end
	end

	if safe then
		count = count + 1
	end

	line = io.read("*line")
end

print(count)
