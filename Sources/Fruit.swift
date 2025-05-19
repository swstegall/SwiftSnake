import Raylib

class Fruit: Actor {
    var xPosition: Int32
    var yPosition: Int32
    let xSize: Int32
    let ySize: Int32
    let color: Color

    init(
        startX: Int32,
        startY: Int32,
        xSize: Int32,
        ySize: Int32
    ) {
        self.xPosition = startX
        self.yPosition = startY
        self.xSize = xSize
        self.ySize = ySize
        self.color = RaylibC.Color.red
    }
}
