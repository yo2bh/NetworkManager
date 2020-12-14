Pod::Spec.new do |s|
  s.name             = 'NetworkManager'
  s.version          = '1.0.0'
  s.summary          = 'This is demo of creating the network manager framework'
 
  s.description      = <<-DESC
This is demo of creating xcframework using cocoapods!
                       DESC
 
  s.homepage         = 'https://github.com/yo2bh/NetworkManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yogesh Bharate' => 'yogeshbharate2514@gmail.com' }
  s.source           = { :git => 'https://github.com/yo2bh/NetworkManager.git', :tag => 'v1.0.0' }
 
  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/NetworkManager/NetworkManager.swift'
 
end
