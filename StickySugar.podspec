#
# Be sure to run `pod lib lint StickySugar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StickySugar'
  s.version          = '1.1.3'
  s.summary          = 'Syntactic sugar untop of AutoLayout to stick views together'

  s.description      = <<-DESC
  Syntactic sugar untop of AutoLayout to stick views together.
  Sticky sugar adds convenience methods on top of auto layout to build and apply constraints to your view in a nice and chainable way.
                       DESC

  s.homepage         = 'https://github.com/Kleemann/StickySugar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mads Kleemann' => '' }
  s.source           = { :git => 'https://github.com/Kleemann/StickySugar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/madskleemann'

  s.ios.deployment_target = '9.0'

  s.source_files = 'StickySugar/Classes/**/*'
  
  # Ensure the correct version of Swift is used
  s.swift_version = '4.2'
end
