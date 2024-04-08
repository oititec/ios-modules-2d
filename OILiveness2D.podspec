Pod::Spec.new do |s|
    s.name             = 'OILiveness2D'
    s.version          = '1.3.1'
    s.summary          = 'Framework OILiveness2D para iOS.'
    s.homepage         = 'https://www.oititec.com.br/'
    s.license          = { :type => 'Copyright', :text => 'Copyright © 2022 Oiti. All rights reserved.' }
    s.source           = { :git => 'https://github.com/oititec/ios-modules-2d.git', :tag => s.version.to_s }
    s.author           = 'Oititec'
    s.platform         = :ios, '11.0'
    s.swift_version    = '5.0'
    s.vendored_frameworks = 'Framework/OILiveness2D.xcframework'
    
    s.dependency 'OICommons', '~> 1.1'
    s.dependency 'OINetwork', '~> 1.2'
    s.dependency 'OIComponents', '~> 1.4'
    s.dependency 'OISecurity', '~> 2.0'
  end
  