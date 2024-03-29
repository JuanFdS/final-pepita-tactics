import wollok.game.*

class Image {

	const path

	method image() = path
}

class Posicionado {
	const property position
}

class LettersBlockDisplay {
	const topLeft
	const topCenter
	const topRight
	const bottomLeft
	const bottomCenter
	const bottomRight
	const parent
	const relativePos
	
	var visuals = null
	
	method initialize() {
		visuals = self.calculateVisuals()
	}

	method calculateVisuals() {
		const topLeftVisual = topLeft + "-topLeft"
		const topCenterVisual = topCenter + "-topCenter"
		const topRightVisual = topRight + "-topRight"
		const bottomRightVisual = bottomRight + "-bottomRight"
		const bottomLeftVisual = bottomLeft + "-bottomLeft"
		const bottomCenterVisual = bottomCenter + "-bottomCenter"
		return [ topLeftVisual, topCenterVisual, topRightVisual, bottomLeftVisual, bottomCenterVisual, bottomRightVisual ].
			filter{ x => !x.contains(" ") }.
			map { x => new Image(path = "font8bits/" + x + ".png") }
	}

	method draw() {
		visuals.forEach{ visual => game.addVisualIn(visual, parent.position().right(relativePos.x()).up(relativePos.y()))}
	}
	
	method remove() {
		visuals.forEach { visual => game.removeVisual(visual) }
	}

}

class TextDisplay {
	const text
	const caracteresDeAncho
	const renglones
	const parent
	var visuals = null
	
	method initialize() {
		visuals = self.calculateVisuals()
	}
	
	method position() = parent.position()
	
	method width() = (caracteresDeAncho / 3).roundUp()

	method chunksOfList(list, chunkSize) {
		if(list.isEmpty()) return []
		return [ list.take(chunkSize) ] + self.chunksOfList(list.drop(chunkSize), chunkSize)
	}

	method chunksOfText() {
		const quantityOfChars = text.size()
		var chunks = []
		(quantityOfChars / 3).roundUp().times{ n => chunks.add(text.substring((n - 1) * 3, (n * 3).min(quantityOfChars)))}
		return chunks
	}
	
	method getOr(list, index, default) = if(list.size() <= index) default else list.get(index)

	method calculateVisuals() {
		const calculatedVisuals = []
		const maxTextAllowed = renglones * self.width() * 6
		if (text.size() > maxTextAllowed) throw new Exception(message="Too much text, max text allowed: " + maxTextAllowed + " , text passed: " + text.size())
		const rows = self.chunksOfList(self.chunksOfText(), self.width())
		const emptyChunk = "   "
		const emptyRow = [emptyChunk, emptyChunk, emptyChunk]
		const rowPairs = self.chunksOfList(rows, 2)
		var relativePos = new Position(x=0, y=0)
		rowPairs.forEach { rowPair =>
			const firstRow = rowPair.first()
			const secondRow = self.getOr(rowPair, 1, emptyRow)
			firstRow.size().times { n =>
				calculatedVisuals.add(self.visualFromChunks(firstRow.get(n-1), self.getOr(secondRow, n-1, emptyChunk), relativePos))
				relativePos = relativePos.right(1)
			}
			relativePos = new Position(x=0, y=relativePos.down(1).y())
		}
		return calculatedVisuals
	}
	
	method draw() {
		visuals.forEach { visual => visual.draw() }
	}
	
	method remove() {
		visuals.forEach { visual => visual.remove() }
	}
	
	method letterFromChunk(chunk, index) = if(chunk.size() < index + 1) " " else chunk.charAt(index) 
	
	method visualFromChunks(topChunk, bottomChunk, relativePos) {
		return new LettersBlockDisplay(topLeft=self.letterFromChunk(topChunk, 0), topCenter = self.letterFromChunk(topChunk, 1), topRight = self.letterFromChunk(topChunk, 2), bottomLeft = self.letterFromChunk(bottomChunk, 0), bottomCenter = self.letterFromChunk(bottomChunk, 1), bottomRight = self.letterFromChunk(bottomChunk, 2), parent=self, relativePos=relativePos)
	}

}

