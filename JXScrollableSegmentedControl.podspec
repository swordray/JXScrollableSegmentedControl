#
# Be sure to run `pod lib lint JXScrollableSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JXScrollableSegmentedControl'
  s.version          = '0.1.2'
  s.summary          = 'An iOS UISegmentedControl replacement with scrollable, unlimited segments.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An iOS UISegmentedControl replacement with scrollable, unlimited segments. iOS 13+ and Swift 5 required.
                       DESC

  s.homepage         = 'https://bailushuyuan.org'
  s.screenshots      = 'https://raw.githubusercontent.com/swordray/JXScrollableSegmentedControl/master/screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swordray' => 'swordray@gmail.com' }
  s.source           = { :git => 'https://github.com/swordray/JXScrollableSegmentedControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'JXScrollableSegmentedControl/Classes/**/*'

  # s.resource_bundles = {
  #   'JXScrollableSegmentedControl' => ['JXScrollableSegmentedControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.swift_versions = '5.2'
end
