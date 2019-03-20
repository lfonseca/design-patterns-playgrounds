
class VideoFile {
    let filename: String
    
    init(filename: String) {
        self.filename = filename
        print("Video \(filename) initialized")
    }
}

protocol CompressionCodec { }

class OggCompressionCodec: CompressionCodec {
    init() {
        print("Using OGG compression")
    }
}

class MPEG4CompressionCodec: CompressionCodec {
    init() {
        print("Using MPEG4 compression")
    }
}

protocol Buffer {
    func toFile(name: String)
}

class VideoBuffer: Buffer {
    init() {
        print("Buffer initialized")
    }
    
    func toFile(name: String) {
        print("Storing video at \(name)")
    }
}

class CodecFactory {
    static func extractVideo(file: VideoFile) -> CompressionCodec {
        print("Extracting \(file.filename)")
        return MPEG4CompressionCodec()
    }
}

class BitrateReader {
    private var filename: String = ""
    
    func readFile(named filename: String, using codec: CompressionCodec) -> Buffer {
        print("Compressing \(filename)")
        self.filename = filename
        return VideoBuffer()
    }
    
    func convert(video: Buffer, using codec: CompressionCodec) -> File {
        print("Converting video")
        return File(name: filename, buffer: video)
    }
}

class File {
    init(name: String, buffer: Buffer) {
        buffer.toFile(name: name)
    }
}

class VideoConverterFacade {
    enum FormatCodec {
        case ogg
        case mp4
    }
    
    func convertVideo(named filename: String, to format: FormatCodec) -> File {
        let videoFile = VideoFile(filename: filename)
        let sourceCodec = CodecFactory.extractVideo(file: videoFile)
        var destinationCodec: CompressionCodec
        switch format {
        case .ogg:
            destinationCodec = OggCompressionCodec()
        case .mp4:
            destinationCodec = MPEG4CompressionCodec()
        }
        let bitrateReader = BitrateReader()
        let videoBuffer = bitrateReader.readFile(named: filename, using: sourceCodec)
        return bitrateReader.convert(video: videoBuffer, using: destinationCodec)
    }
}

let videoConverter = VideoConverterFacade()
let convertedVideo = videoConverter.convertVideo(named: "sample.mp4", to: .ogg)
