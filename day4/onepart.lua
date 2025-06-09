local input = {}
for line in io.lines("input.txt") do
	table.insert(input, {})
	for c in string.gmatch(line, "%u") do
		table.insert(input[#input], c)
	end
end

local dirs = {
	{ 0, -1 },
	{ 0, 1 },
	{ 1, 0 },
	{ 1, 1 },
	{ 1, -1 },
	{ -1, 1 },
	{ -1, -1 },
	{ -1, 0 },
}

local count = 0
for i, row in ipairs(input) do
	for j, val in ipairs(row) do
		if val == "X" then
			for _, dir in ipairs(dirs) do
				local x = dir[1]
				local y = dir[2]
				local boundX = i + 3 * x
				local boundY = j + 3 * y
				if
					boundX >= 1
					and boundY >= 1
					and boundX <= #input
					and boundY <= #row
					and input[i + x][j + y] == "M"
					and input[i + x * 2][j + y * 2] == "A"
					and input[i + x * 3][j + y * 3] == "S"
				then
					count = count + 1
				end
			end
		end
	end
end

print(count)
