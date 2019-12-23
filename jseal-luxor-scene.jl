
using Pkg
Pkg.add("Luxor")
Pkg.add("Colors")
using Luxor, Colors

Drawing(1000, 1000, "jseal-luxor.png")

#Sets a blue-white gradient for the sky in the background()
bluewhite = blend(Point(0, 0), Point(0, 1000), "white", (50/255, 117/255, 194/255))
setblend(bluewhite)
rect(0, 0, 1000, 1000, :fill)

#Creates the grey mountains in the background from an array of points using Bezier paths functions (drawbezierpath and makebezierpath)
setcolor(87/255, 87/255, 87/255)
pts = [Point(0, 740), Point(150, 500), Point(190, 530), Point(240, 800)]
drawbezierpath(makebezierpath(pts), :fill)

setcolor(163/255, 163/255, 163/255)
pts = [Point(250, 1000), Point(450, 680), Point(500, 700), Point(580, 1000)]
drawbezierpath(makebezierpath(pts), :fill)

setcolor(120/255, 120/255, 120/255)
pts = [Point(150, 1000), Point(300, 600), Point(370, 660), Point(450, 1000)]
drawbezierpath(makebezierpath(pts), :fill)

#Creates the ice caps on the mountains from an array of points, again using Bezier paths functions
setcolor("white")
pts = [Point(165, 495), Point(100, 550), Point(125, 540), Point(150, 565), Point(175, 555),Point(200, 560)]
drawbezierpath(makebezierpath(pts), :fill)
pts = [Point(275, 630), Point(310, 580), Point(350, 620), Point(325, 640), Point(310, 655)]
drawbezierpath(makebezierpath(pts), :fill)
pts = [Point(430, 710), Point(470, 670), Point(495, 700), Point(460, 690)]
drawbezierpath(makebezierpath(pts), :fill)

#Creates the layer of snowfall on the ground using Bezier paths
setcolor(224/255, 224/255, 224/255)
pts = [Point(0, 740), Point(400, 840), Point(1000, 800), Point(1000, 1000), Point(0, 1000)]
drawbezierpath(makebezierpath(pts), :fill)
setcolor("white")
pts = [Point(0, 750), Point(400, 850), Point(1000, 820), Point(1000, 1000), Point(0, 1000)]
drawbezierpath(makebezierpath(pts), :fill)

#Creates the trees in the distance using Bezier paths
setcolor(70/255, 166/255, 71/255)
pts = [Point(300, 850), Point(310, 850), Point(305, 800)]
drawbezierpath(makebezierpath(pts), :fill)
pts = [Point(350, 840), Point(360, 840), Point(355, 780)]
drawbezierpath(makebezierpath(pts), :fill)
pts = [Point(390, 860), Point(400, 860), Point(395, 790)]
drawbezierpath(makebezierpath(pts), :fill)
pts = [Point(440, 890), Point(450, 890), Point(445, 850)]
drawbezierpath(makebezierpath(pts), :fill)
pts = [Point(480, 860), Point(490, 860), Point(485, 800)]
drawbezierpath(makebezierpath(pts), :fill)

#Creates a grey, rectangular border around the image using rect()
sethue("grey")
setline(20)
rect(0, 0, 1000, 1000, :stroke)

#Creates the snowman's three snowballs (as well as shadows beneath each snowball) using ellipse()
setcolor(224/255, 224/255, 224/255)
ellipse(700, 810, 270, 220, :fill)
setcolor(242/255, 249/255, 255/255)
ellipse(700, 800, 280, 220, :fill)
setcolor(224/255, 224/255, 224/255)
ellipse(700, 690, 170, 140, :fill)
setcolor(247/255, 251/255, 255/255)
ellipse(700, 680, 180, 140, :fill)
setcolor(224/255, 224/255, 224/255)
ellipse(700, 610, 110, 100, :fill)
setcolor("white")
ellipse(700, 600, 120, 100, :fill)

#Create the snowman's carrot nose using Bezier paths
setcolor(191/255, 123/255, 4/255)
pts = [Point(720, 600), Point(760, 610), Point(715, 620)]
drawbezierpath(makebezierpath(pts), :fill)

#Creates the snowman's charcoal eyes using ellipse()
setcolor("black")
ellipse(680, 590, 20, 15, :fill)
ellipse(740, 580, 15, 10, :fill)

#Creates the snowman's buttons using ellipse()
setcolor("grey")
ellipse(730, 680, 15, 10, :fill)
ellipse(730, 700, 15, 10, :fill)
ellipse(730, 720, 15, 10, :fill)

#Snowflakes are drawn with turtle graphics
#Arguments: the turtle, n (length of snowflake "arms"), width(thickness of snowflake arms), color of snowflake, coordinates of the center point of snowflake (x,y)
🐢 = Turtle()
function snowflake(t::Turtle, n, width, color, x, y)
    Penwidth(t, width)
    Pencolor(t, color)
    for i in 0:5
        Reposition(t, x, y)
        Orientation(t, 0)
        Turn(t, 60 * i)
        Pendown(t)
        Forward(t, n)
        Forward(t, -n/3)
        Turn(t, 40)
        Forward(t, n/3)
        Forward(t, -n/3)
        Turn(t, -80)
        Forward(t, n/3)
        Forward(t, -n/3)
        Turn(t, 40)
    end
end

#Draws six snowflakes by calling snowflake() function with desired snowflake characteristics as arguments
snowflake(🐢, 80, 8, (17/255, 139/255, 247/255), 147, 200)
snowflake(🐢, 80, 8, "white", 150, 203)
snowflake(🐢, 110, 10, (172/255, 212/255, 252/255), 145, 855)
snowflake(🐢, 110, 10, (17/255, 139/255, 247/255), 150, 850)
snowflake(🐢, 40, 3, (172/255, 212/255, 252/255), 300, 100)
snowflake(🐢, 40, 3, (17/255, 139/255, 247/255), 297, 95)
snowflake(🐢, 70, 5, (17/255, 139/255, 247/255), 797, 103)
snowflake(🐢, 70, 5, (172/255, 212/255, 252/255), 800, 100)
snowflake(🐢, 30, 3, "white", 750, 400)
snowflake(🐢, 50, 4, (17/255, 139/255, 247/255), 650, 247)

finish() #finishes the drawing and closes the file
preview() #view drawing in next cell


