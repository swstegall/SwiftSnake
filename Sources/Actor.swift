import Raylib

protocol Actor {
    var xPosition: Int32 { get set }
    var yPosition: Int32 { get set }
    var xSize: Int32 { get }
    var ySize: Int32 { get }
    var color: Color { get }
}

