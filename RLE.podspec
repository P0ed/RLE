Pod::Spec.new do |s|
  s.name         = 'RLE'
  s.version      = '2'
  s.source       = { :git => 'https://github.com/P0ed/RLE.git', :tag => '2' }
  s.summary      = 'Literal convertibles for common obj-c types.'
  s.homepage     = 'https://github.com/P0ed/RLE'
  s.author       = { 'Konstantin Sukharev' => 'poed@me.com' }
  s.social_media_url = 'https://twitter.com/P0ed'
  s.license      = 'MIT'

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Source/'
  s.frameworks   = 'Foundation', 'UIKit'

end
