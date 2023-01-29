
local args = { ... }

function bigDigForward()
    while turtle.detect() do
        turtle.dig();
    end
    turtle.forward();
    turtle.digUp();
    turtle.digDown();
end

function forward(distance)
    for i=1, distance do
        turtle.forward();
    end
end

function backward(distance)
    for i=1, distance do
        turtle.back();
    end
end

function down(distance)
    for i=1, distance do
        turtle.down();
    end
end

function turnAround()
    if math.random() < 0.5 then
        turtle.turnLeft();
        turtle.turnLeft();
    else
        turtle.turnRight();
        turtle.turnRight();
    end
end

function moveDigUp(distance)
    turtle.digUp();
    for i=1, distance do
        turtle.up();
        turtle.digUp();
    end
end

function hasEnoughFuel(cost)
    return turtle.getFuelLevel() > cost;
end

function levelArea(length, width, height)
    length = tonumber(length);
    width = tonumber(width);
    height = tonumber(height);
    local layers = math.ceil(height / 3)
    local closeSide = true;
    local fuelCost = (length * width * layers) + length + width + (layers * 3)

    if not hasEnoughFuel(fuelCost) then
        print("Error, not enough fuel to finish");
        print(turtle.getFuelLevel(), " of ", fuelCost, "needed");
        return false;
    else
        print(fuelCost, " of ", turtle.getFuelLevel(), " fuel will be used");
    end

    moveDigUp(1);
    bigDigForward();

    for k = 1, layers do
        closeSide = true;
        -- Level out a layer
        for i = 1, width do
            for j = 1, (length - 1) do
                bigDigForward();
            end
            closeSide = not closeSide;
            if i == width then
                break;
            end
            if closeSide then
                turtle.turnLeft();
                bigDigForward();
                turtle.turnLeft();
            else -- farSide
                turtle.turnRight();
                bigDigForward();
                turtle.turnRight();
            end
        end

        -- Return back to the starting tile
        if closeSide then
            turtle.turnRight();
            forward(width - 1);
            turtle.turnRight();
        else -- farSide
            turtle.turnLeft();
            forward(width - 1);
            turtle.turnRight();
            backward(length - 1);
        end

        -- Move up for the next layer if there are more to go
        if k < layers then
            moveDigUp(3);
        end
    end

    down(((layers - 1) * 3) + 1);
    backward(1);

end

if #args == 3 then
    levelArea(args[1],args[2],args[3]);
else
    print("level <Length> <Width> <Height>");
end
