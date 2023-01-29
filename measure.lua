
local meters = 0;

while not turtle.detect() do
    turtle.forward();
    meters = meters + 1;
    if meters >= 80 then
        print("Turned back early so I don't get lost uwu");
        break;
    end
end

print("Measured a distance of", meters, "blocks")

for i=1, meters do
    turtle.back();
end
