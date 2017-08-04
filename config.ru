require 'rack'

use Rack::Static,
  :urls => ["/img", "/js", "/css", "/vendor"],
  :root => "assets"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('assets/index.html', File::RDONLY)
  ]
}
