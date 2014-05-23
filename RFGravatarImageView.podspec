Pod::Spec.new do |s|
  s.name         = "RFGravatarImageView"
  s.version      = "1.0"
  s.summary      = "A simple UIImageView subclass for dealing with http://gravatar.com images."
  s.homepage     = "https://github.com/ruddfawcett/RFGravatarImageView"
  s.license      = 'MIT'
  s.author       = { "Rudd Fawcett" => "rudd.fawcett@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/ruddfawcett/RFGravatarImageView.git", :tag => "v1.0" }
  s.source_files  = 'RFGravatarImageView', 'RFGravatarImageView/**/*.{h,m}'
  s.dependency 'SDWebImage', '~> 3.5'
  s.framework = 'UIKit'
  s.requires_arc = true
end
