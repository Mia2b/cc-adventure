
function cook(index)
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
end

cook(0);
turtle.turnRight();
cook(1);
turtle.turnRight();
cook(2);
turtle.turnRight();
cook(3);
turtle.turnRight();
