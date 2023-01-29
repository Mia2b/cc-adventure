local args = { ... }

function max(numbers)
	table.sort(numbers)
	return numbers[#numbers]
end

function placeFurnace(index)
	local cookCount = turtle.getItemCount(index * 4 + 3)
	turtle.select(index * 4 + 1);
	turtle.place();
	turtle.select(index * 4 + 2);
	turtle.drop();
	turtle.up();
	turtle.forward();
	turtle.select(index * 4 + 3);
	turtle.dropDown();
	turtle.back();
	turtle.down();
	turtle.select(1);
	return cookCount;
end

function cleanupFurnaces()
	turtle.dig()
	turtle.turnRight()
	turtle.dig()
	turtle.turnRight()
	turtle.dig()
	turtle.turnRight()
	turtle.dig()
	turtle.turnRight()
end

function placeFurnaces()
	local stacks = {}
	table.insert(stacks, placeFurnace(0));
	turtle.turnRight();
	table.insert(stacks, placeFurnace(1));
	turtle.turnRight();
	table.insert(stacks, placeFurnace(2));
	turtle.turnRight();
	table.insert(stacks, placeFurnace(3));
	turtle.turnRight();

	return max(stacks);
end

function waitToCook(itemCount)
	for i = 1, itemCount do
		sleep(10)
		print("Cooked item", i, "of", itemCount, ": ", 10 * (itemCount - i), " s")
	end
end


if #args == 1 then
	if args[1] == "clean" then
		cleanupFurnaces();
	elseif args[1] == "auto" then
		local itemCount = placeFurnaces();
		waitToCook(itemCount);
		cleanupFurnaces();
	else
		placeFurnaces();
	end
else
	placeFurnace(0);
end
