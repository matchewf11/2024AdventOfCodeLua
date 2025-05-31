function CopyWO(arr, wo)
	local temp = {}
	for i = 1, #arr do
		if i ~= wo then
			temp[#temp + 1] = arr[i]
		end
	end
	return temp
end

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

function IsSafe(arr)
	local safe, inc = true, arr[1] < arr[2]
	for i = 2, #arr do
		local dif = inc and (arr[i] - arr[i - 1]) or (arr[i - 1] - arr[i])
		if dif < 1 or dif > 3 then
			safe = false
		end
	end
	return safe
end

function IsTolerable(arr)
	local tolerable = false
	for i = 1, #arr do
		local isSafe = IsSafe(CopyWO(arr, i))
		if isSafe then
			tolerable = true
		end
	end
	return tolerable
end

local count = 0

for line in io.lines("input.txt") do
	if IsTolerable(SplitSpace(line)) then
		count = count + 1
	end
end

print(count)
