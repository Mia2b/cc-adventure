turtle.dig();
turtle.forward();
turtle.dig();
local count = 0;


while turtle.inspectUp() do
	turtle.digUp();
	turtle.up();
	turtle.dig();
	count = count + 1;
end

turtle.turnRight();
turtle.dig();
turtle.forward();
turtle.turnLeft();
turtle.dig();

while count > 0 do
	turtle.digDown();
	turtle.down();
	turtle.dig();
	count = count - 1;
end

turtle.turnRight();
turtle.back();
turtle.turnLeft();
turtle.back();
