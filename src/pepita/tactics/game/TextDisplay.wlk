import wollok.game.*

class Image {

	const path

	method image() = path
}

class LettersBlockDisplay {

	const topLeft
	const topCenter
	const topRight
	const bottomLeft
	const bottomCenter
	const bottomRight
	const position

	method visuals() {
		const topLeftVisual = topLeft + "-topLeft"
		const topCenterVisual = topCenter + "-topCenter"
		const topRightVisual = topRight + "-topRight"
		const bottomRightVisual = bottomRight + "-bottomRight"
		const bottomLeftVisual = bottomLeft + "-bottomLeft"
		const bottomCenterVisual = bottomCenter + "-bottomCenter"
		return [ topLeftVisual, topCenterVisual, topRightVisual, bottomLeftVisual, bottomCenterVisual, bottomRightVisual ].
			filter{ x => !x.contains(" ") }.
			map { x => new Image(path = "font/" + x + ".png") }
	}

	method draw() {
		self.visuals().forEach{ visual => game.addVisualIn(visual, position)}
	}

}

class TextDisplay {

	const text
	const caracteresDeAncho
	const renglones
	const position
	
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

	method visuals() {
		const maxTextAllowed = renglones * self.width() * 6
		if (text.size() > maxTextAllowed) throw new Exception(message="Too much text, max text allowed: " + maxTextAllowed + " , text passed: " + text.size())
		const rows = self.chunksOfList(self.chunksOfText(), self.width())
		var visuals = []
		const emptyChunk = "   "
		const emptyRow = [emptyChunk, emptyChunk, emptyChunk]
		const rowPairs = self.chunksOfList(rows, 2)
		var pos = position
		rowPairs.forEach { rowPair =>
			const firstRow = rowPair.first()
			const secondRow = self.getOr(rowPair, 1, emptyRow)
			firstRow.size().times { n =>
				visuals.add(self.visualFromChunks(firstRow.get(n-1), self.getOr(secondRow, n-1, emptyChunk), pos))
				pos = pos.right(1)
			}
			pos = game.at(position.x(), pos.down(1).y())
		}
		return visuals
	}
	
	method draw() {
		self.visuals().forEach { visual => visual.draw() }
	}
	
	method letterFromChunk(chunk, index) = if(chunk.size() < index + 1) " " else chunk.charAt(index) 
	
	method visualFromChunks(topChunk, bottomChunk, pos) {
		return new LettersBlockDisplay(topLeft=self.letterFromChunk(topChunk, 0), topCenter = self.letterFromChunk(topChunk, 1), topRight = self.letterFromChunk(topChunk, 2), bottomLeft = self.letterFromChunk(bottomChunk, 0), bottomCenter = self.letterFromChunk(bottomChunk, 1), bottomRight = self.letterFromChunk(bottomChunk, 2), position=pos)
	}

}

