require 'webrick'

# Inject MIME types before server starts
WEBrick::HTTPUtils::DefaultMimeTypes['mp3']  = 'audio/mpeg'
WEBrick::HTTPUtils::DefaultMimeTypes['wav']  = 'audio/wav'
WEBrick::HTTPUtils::DefaultMimeTypes['ogg']  = 'audio/ogg'
WEBrick::HTTPUtils::DefaultMimeTypes['m4a']  = 'audio/mp4'
WEBrick::HTTPUtils::DefaultMimeTypes['flac'] = 'audio/flac'

server = WEBrick::HTTPServer.new(
  Port:         (ENV['PORT'] || 3000).to_i,
  DocumentRoot: File.dirname(__FILE__),
  AccessLog:    [],
  Logger:       WEBrick::Log.new(nil, WEBrick::Log::ERROR),
)

trap('INT')  { server.shutdown }
trap('TERM') { server.shutdown }

server.start
