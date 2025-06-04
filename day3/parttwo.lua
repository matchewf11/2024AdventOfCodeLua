local sum = 0
local lock = false
for line in io.lines("input.txt") do
	local i = 1
	while i <= #line do
		local sMul, eMul, n, m = string.find(line, "mul%((%d+),(%d+)%)", i)
		local sDo, eDo = string.find(line, "do%(%)", i)
		local sNot, eNot = string.find(line, "don't%(%)", i)

		local temp = {}

		if sMul then
			table.insert(temp, sMul)
		end
		if sDo then
			table.insert(temp, sDo)
		end
		if sNot then
			table.insert(temp, sNot)
		end

		if #temp == 0 then
			break
		end

		local min = math.huge
		for j = 1, #temp do
			min = math.min(min, temp[j])
		end

		if min == sMul then
			if not lock then
				sum = sum + n * m
			end
			i = eMul + 1
		elseif min == sDo then
			lock = false
			i = eDo + 1
		else
			lock = true
			i = eNot + 1
		end
	end
end

print(sum)
