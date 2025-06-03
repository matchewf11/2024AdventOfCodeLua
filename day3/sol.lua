io.input("input.txt")
local str = io.read()
local sum = 0

while str ~= nil do
	local i = 1
	while i <= #str do
		local start, last, val1, val2 = string.find(str, "mul%((%d+),(%d+)%)", i)
		if start and last then
			sum = sum + val1 * val2
			i = last + 1
		else
			i = i + 1
		end
	end
	str = io.read()
end

print(sum)
