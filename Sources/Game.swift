import Raylib

class Game {
    let screenWidth: Int32
    let screenHeight: Int32
    let screenTitle: String
    let targetFps: Int32
    var player: Player
    var fruit: Fruit
    private var fruitCount: Int32 = 0

    init(
        screenWidth: Int32 = 800,
        screenHeight: Int32 = 800,
        screenTitle: String = "Snake",
        targetFps: Int32 = 4
    ) {
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.screenTitle = screenTitle
        self.targetFps = targetFps
        let playerXIndex: Int32 = [4, 5, 6].randomElement() ?? 5
        let playerYIndex: Int32 = [4, 5, 6].randomElement() ?? 5
        self.player = Player(
            startX: playerXIndex * (screenWidth / 10),
            startY: playerYIndex * (screenHeight / 10),
            xSize: screenWidth / 10,
            ySize: screenHeight / 10,
            direction: [.north, .south, .east, .west].randomElement() ?? .east
        )
        let fruitXIndex: Int32 = (Array(0...10).filter { $0 != playerXIndex }).randomElement() ?? 6
        let fruitYIndex: Int32 = (Array(0...10).filter { $0 != playerYIndex }).randomElement() ?? 6
        self.fruit = Fruit(
            startX: fruitXIndex * (screenWidth / 10),
            startY: fruitYIndex * (screenHeight / 10),
            xSize: screenWidth / 10,
            ySize: screenHeight / 10
        )
        setup()
        gameLoop()
        teardown()
    }

    private func setupPlayerAndFruit() {
        print("OUCH! GAME OVER! TRY AGAIN!")
        print("FINAL SCORE: \(fruitCount).")
        fruitCount = 0
        Raylib.setTargetFPS(targetFps)
        let playerXIndex: Int32 = [4, 5, 6].randomElement() ?? 5
        let playerYIndex: Int32 = [4, 5, 6].randomElement() ?? 5
        player = Player(
            startX: playerXIndex * (screenWidth / 10),
            startY: playerYIndex * (screenHeight / 10),
            xSize: screenWidth / 10,
            ySize: screenHeight / 10,
            direction: [.north, .south, .east, .west].randomElement() ?? .east
        )
        let fruitXIndex: Int32 = (Array(0...9).filter { $0 != playerXIndex }).randomElement() ?? 6
        let fruitYIndex: Int32 = (Array(0...9).filter { $0 != playerYIndex }).randomElement() ?? 6
        fruit = Fruit(
            startX: fruitXIndex * (screenWidth / 10),
            startY: fruitYIndex * (screenHeight / 10),
            xSize: screenWidth / 10,
            ySize: screenHeight / 10
        )
    }

    private func setup() {
        Raylib.initWindow(
            screenWidth,
            screenHeight,
            screenTitle
        )
        Raylib.setTargetFPS(targetFps)
    }

    private func gameLoop() {
        while (!Raylib.windowShouldClose) {
            startDrawing()
            clearBackground()
            checkForTouchFruit()
            captureInput()
            updatePosition()
            checkBounds()
            drawPlayer()
            drawFruit()
            endDrawing()
        }
    }

    private func startDrawing() {
        Raylib.beginDrawing()
    }

    private func clearBackground() {
        Raylib.clearBackground(RaylibC.Color.gray)
    }

    private func captureInput() {
        if Raylib.isKeyPressed(KeyboardKey.letterD) && player.direction != .west {
            player.direction = .east
        }
        if Raylib.isKeyPressed(KeyboardKey.letterA) && player.direction != .east {
            player.direction = .west
        }
        if Raylib.isKeyPressed(KeyboardKey.letterS) && player.direction != .north {
            player.direction = .south
        }
        if Raylib.isKeyPressed(KeyboardKey.letterW) && player.direction != .south {
            player.direction = .north
        }
    }

    private func updatePosition() {
        player.updatePosition()
    }

    private func checkBounds() {
        if player.xPosition + player.xSize > screenWidth {
            setupPlayerAndFruit()
        }
        if player.xPosition < 0 {
            setupPlayerAndFruit()
        }
        if player.yPosition + player.ySize > screenHeight {
            setupPlayerAndFruit()
        }
        if player.yPosition < 0 {
            setupPlayerAndFruit()
        }
    }

    private func drawPlayer() {
        Raylib.drawRectangle(
            player.xPosition,
            player.yPosition,
            player.xSize,
            player.ySize,
            player.color
        )
    }

    private func drawFruit() {
        Raylib.drawRectangle(
            fruit.xPosition,
            fruit.yPosition,
            fruit.xSize,
            fruit.ySize,
            fruit.color
        )
    }

    private func endDrawing() {
        Raylib.endDrawing()
    }

    private func teardown() {
        Raylib.closeWindow()
    }

    private func checkForTouchFruit() {
        if player.xPosition == fruit.xPosition && player.yPosition == fruit.yPosition {
            consumeFruit()
        }
    }

    private func consumeFruit() {
        fruitCount += 1
        Raylib.setTargetFPS(targetFps + fruitCount)
        print("YUMMY FRUIT! SCORE: \(fruitCount).")
        let playerXIndex = player.xPosition == 0 ? 0 : (screenWidth / 10) / player.xPosition
        let playerYIndex = player.yPosition == 0 ? 0 : (screenHeight / 10) / player.yPosition
        let fruitXIndex: Int32 = (Array(0...9).filter { $0 != playerXIndex }).randomElement() ?? 6
        let fruitYIndex: Int32 = (Array(0...9).filter { $0 != playerYIndex }).randomElement() ?? 6
        fruit = Fruit(
            startX: fruitXIndex * (screenWidth / 10),
            startY: fruitYIndex * (screenHeight / 10),
            xSize: screenWidth / 10,
            ySize: screenHeight / 10
        )
    }
}

