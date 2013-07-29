-- 2x2 Tree Cutter par Elios
-- Version : 1.0

-- Fonctionnalités :
-- # Coupe entièrement le bois d'un arbre 2x2 (bois de la jungle, redwood, fir, ...) en montant puis redescend avec le bois.

-- Fonctionnalités futures :
-- # Stockage automatique dans un coffre à l'aide de l'API GPS

-- Note : ce programme ainsi que celles futures seront faites en anglais.

-- _______________________________________

-- Features:
-- # Cut entirely of 2x2 wood tree (jungle wood, redwood, fir, ...) uphill and then down with the wood.

-- Future Features:
-- # Automatic Ssorage in a chest using the GPS API

-- Note : this program and all futures programs will be created in english.

-- _______________________________________


a = 0
nbrItems = 0

print("2x2 Tree Cutter by Elios")
while true do
	turtle.select(15)
	print("Place in the selected slot a block of wood to be cut, then press [Enter]")
	io.read()
	if turtle.getItemCount(15) == 0 then
		print("I haven't found your wood !")
		os.sleep(1)
	else
		break
	end
end

while true do
	turtle.select(15)
	print("Be sure that the turtle is positioned in front of the left side of the tree, then press [Enter]")
	io.read()
	if turtle.compare() then
		break
	else
		print("The block in my inventory and the block in front of me are not the same !")
		os.sleep(1)
	end
end

while true do
	turtle.select(16)
	print("Place in the selected slot some fuel, then press [Enter]")
	print("Note : a lava bucket is enough to cut one Jungle tree.")
	io.read()
	if turtle.getItemCount(16) == 0 then
		print("I haven't found your fuel !")
		os.sleep(1)
	else
		break
	end
end

print("If you are ready, press [Enter] to launch the program.")
io.read()

function fuel()
    if turtle.getFuelLevel() < 30 then
        turtle.select(16)
        turtle.refuel(1)
        turtle.select(1)
		print("Refuel success.")
    end
end

function detectdown()
    turtle.select(15)
    while a > 0 do
        fuel()
        turtle.digDown()
		nbrItems = nbrItems + 1
        turtle.down()
		a = a - 1
		print("Height : "..a)
    end
end

function cut()
    fuel()
    turtle.dig()
	nbrItems = nbrItems + 1
    turtle.turnRight()
    turtle.dig()
	nbrItems = nbrItems + 1
    turtle.turnLeft()
end

print("Starting...")
fuel()
turtle.dig()
nbrItems = nbrItems + 1
print("Enter...")
turtle.forward()
turtle.select(15)

print("Cutting wood...")
while turtle.detectUp() do
    cut()
    fuel()
    turtle.digUp()
	nbrItems = nbrItems + 1
    turtle.up()
	a = a + 1
	print("Height : "..a)
end

cut()
fuel()
print("Back down...")
turtle.forward()
turtle.turnRight()
turtle.dig()
nbrItems = nbrItems + 1
turtle.forward()
fuel()
detectdown()
print("End ! The turtle cut "..nbrItems.." blocks.")
-- print("Thank you for your confidence in me to use my scripts.") <- DAT TROLL