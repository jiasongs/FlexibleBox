Pod::Spec.new do |s|
  s.name                  = 'FlexibleBox'
  s.version               = '0.0.3'
  s.summary               = 'flexbox'
  s.homepage              = 'https://github.com/jiasongs/FlexibleBox'
  s.license               = 'MIT'
  s.author                = { 'ruanmei' => 'jiasong@ruanmei.com' }
  s.source                = { :git => 'https://github.com/jiasongs/FlexibleBox.git', :tag => s.version.to_s }
  s.static_framework      = true
  s.requires_arc          = true
  s.platform              = :ios, '13.4'
  s.swift_versions        = ['5.1']
  s.frameworks            = 'UIKit'
  s.source_files          = 'Sources/**/*.{swift,h,m}'
  
  s.dependency 'Yoga', '~> 2.0.0'
end
