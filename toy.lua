local arg = { ... }

for i=1,arg[1] do
	turtle.forward();
end


for i=1,10 do
	turtle.forward()
	turtle.down()
end


function l()
	turtle.turnLeft();
end

function r()
	turtle.turnRight();
end



function spruce()
	turtle.forward();
	turtle.place();
	turtle.turnRight();
	turtle.forward();
	turtle.turnLeft();
	turtle.place();
	turtle.back();
	turtle.turnRight();
	turtle.place();
	turtle.back();
	turtle.turnLeft();
	turtle.place();
end