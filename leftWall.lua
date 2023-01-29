local args = { ... }

function leftWall(distance)
    distance = tonumber(distance);
    for i=1, distance do
        while turtle.detect() do
            turtle.dig();
        end
        turtle.forward();
        turtle.turnLeft();
        turtle.place();
        turtle.turnRight();
    end
end

if #args == 1 then
    leftWall(args[1]);
else
    print("leftWall<distance>");
end
