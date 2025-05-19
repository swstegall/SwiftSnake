import Raylib

internal class Player: Actor {
    var xPosition: Int32
    var yPosition: Int32
    var xSize: Int32
    var ySize: Int32
    var direction: Direction
    let color: Color = RaylibC.Color.lime

    init(
        startX: Int32,
        startY: Int32,
        xSize: Int32,
        ySize: Int32,
        direction: Direction
    ) {
        xPosition = startX
        yPosition = startY
        self.xSize = xSize
        self.ySize = ySize
        self.direction = direction
    }

    func updatePosition() {
        switch direction {
            case .north:
                yPosition -= ySize
            case .south:
                yPosition += ySize
            case .east:
                xPosition += xSize
            case .west:
                xPosition -= xSize
        }
    }
}

