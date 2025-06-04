local count = 0

for line in io.lines("test.txt") do
	local nums = {}
	for n in string.match(line, "(%d+)") do
		table.insert(nums, n)
	end
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
