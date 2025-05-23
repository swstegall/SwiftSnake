import Raylib

internal class Player {
    // var xPosition: Int32
    // var yPosition: Int32
    var cellXSize: Int32
    var cellYSize: Int32
    var direction: Direction
    let color: Color = RaylibC.Color.lime

    init(
        // startX: Int32,
        // startY: Int32,
        cellXSize: Int32,
        cellYSize: Int32,
        direction: Direction
    ) {
        // xPosition = startX
        // yPosition = startY
        self.cellXSize = cellXSize
        self.cellYSize = cellYSize
        self.direction = direction
    }

    func updatePosition() {
        switch direction {
            case .north:
                // yPosition -= cellYSize
            case .south:
                // yPosition += cellYSize
            case .east:
                // xPosition += cellXSize
            case .west:
                // xPosition -= cellXSize
        }
    }
}

