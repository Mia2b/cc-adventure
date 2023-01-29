
local args = { ... }

function stepDig(change, headroom)
    change = tonumber(change)
    headroom = tonumber(headroom)

    if change > 0 then
        while change > 0 do
            forceDigUp();
            turtle.up();
            turtle.digUp();
            change = change - 1;
        end
    end

    forceDig();

    turtle.forward();

    forceDigUp();

    turtle.digDown();


    for i = 1, headroom do
        forceDigUp();
        turtle.up();
    end

    forceDigUp();

    for i = 1, headroom do
        turtle.down();
    end

    if change < 0 then
        while change < 0 do
            turtle.down();
            turtle.digDown();
            turtle.placeDown();
            change = change + 1;
        end
    end
    turtle.placeDown();
end

function forceDigUp()
    while turtle.detectUp() do
        turtle.digUp();
    end
end

function forceDig()
    while turtle.detect() do
        turtle.dig();
    end
end

if #args == 3 then
    local length = tonumber(args[1])
    local change = tonumber(args[2])
    local headroom  = tonumber(args[3])
    for i = 1, length do
        stepDig(change, headroom);
    end
else
    print("makeTunnel <length> <change> <headroom>");
end
