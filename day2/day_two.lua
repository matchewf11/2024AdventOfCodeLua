function SplitSpace(str)
	local start, curr, arr = 0, 0, {}
	while curr <= #str do
		if string.sub(str, curr, curr) == " " then
			arr[#arr + 1] = tonumber(string.sub(str, start, curr - 1))
			curr = curr + 1
			start = curr
		else
			curr = curr + 1
		end
	end
	arr[#arr + 1] = tonumber(string.sub(str, start, curr - 1))
	return arr
end

local count = 0
for line in io.lines("input.txt") do
	local nums = SplitSpace(line)
	local safe, inc = true, nums[1] < nums[2]

	for i = 2, #nums do
		local dif = inc and (nums[i] - nums[i - 1]) or (nums[i - 1] - nums[i])
		if dif < 1 or dif > 3 then
			safe = false
		end
	end

	if safe then
		count = count + 1
	end
end

print(count)
