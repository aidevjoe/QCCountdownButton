
Pod::Spec.new do |s|
  s.name         = "QCCountdownButton"
  s.version      = "1.0"
  s.summary      = "Countdown Button For iOS"
  s.homepage     = "https://github.com/Joe0708/QCCountdownButton"
  s.license      = "Copyright (c) 2016年 Joe. All rights reserved."
  s.author       = { "Joe" => "joesir7@foxmail.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/Joe0708/QCCountdownButton.git", :tag => s.version }
  s.source_files  = "QCCountdownButton/QCCountdownButton/*.*"
  s.requires_arc = true
end
