# EatUp

Eat is an arcade style game where you have to avoid the other balls. Every hit you take causes your ball size to increase making it difficult for you to avoid them again.

## Implementation:

Software: Xlinix Vivado(Verilog)
Hardware: FPGA Board

## Rules
When game is started the all circles are in embargo until the user presses Enter.

Each time the player circle collides with a blue circle their radius increases and each time they collide with a green circle their radius decreases. If the circle size decreases 5 times the player loses. The blue circle stays in its place while the green circles keep moving randomly.

At any point the user can press the delete key to pause the game and press escape to return to the reset state. If they press enter while on pause the game resumes.

If the circle decreases to a radius of 10 the player loses the game and the game goes to pause screen. The player can press escape to start the game again.

## Run

To run the game you will need an FPGA board and vivado design suite software.

## Video

https://www.youtube.com/watch?v=46foIAfIwKM

## Screens

![Alt text](/images/image.PNG "Eat Up")
