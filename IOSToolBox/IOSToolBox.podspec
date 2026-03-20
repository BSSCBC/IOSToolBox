Pod::Spec.new do |spec|
  	spec.name         = "IOSToolBox"
  	spec.version      = "1.0.0"
  	spec.summary      = "iOS development tools (for personal use)"
  	spec.homepage     = "https://github.com/BSSCBC/IOSToolBox"
  	spec.license      = { :type => "MIT", :file => "LICENSE" }
  	spec.author       = { "BSSCBC" => "No mailBox" }
  	spec.platform     = :ios, "13.0"
  	spec.source       = { :git => "https://github.com/BSSCBC/IOSToolBox.git", :tag => "#{spec.version}" }
  	spec.source_files  = "IOSToolBox/ToolBox/**/*.{h,m,swift}"
	spec.swift_versions = ['5.0', '5.1', '5.2']

  	spec.dependency 'MJRefresh',   '~> 3.7.9'
	spec.dependency 'NotificationBannerSwift'

end
