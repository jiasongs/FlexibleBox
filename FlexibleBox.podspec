Pod::Spec.new do |s|
    s.name                  = 'FlexibleBox'
    s.version               = '0.0.2'
    s.summary               = 'flexbox'
    s.homepage              = 'https://github.com/jiasongs/FlexibleBox'
    s.license               = 'MIT'
    s.author                = { 'ruanmei' => 'jiasong@ruanmei.com' }
    s.source                = { :git => 'https://github.com/jiasongs/FlexibleBox.git', :tag => "#{s.version}" }
    s.platform              = :ios, '13.0'
    s.swift_versions        = ['5.2']
    s.cocoapods_version     = '>= 1.11.0'
    s.static_framework      = true
    s.requires_arc          = true
    s.frameworks            = 'UIKit'
    s.source_files          = 'Sources'

    s.dependency 'Yoga'
end