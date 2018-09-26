#
# Be sure to run `pod lib lint HeroArchitecture.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HeroArchitecture'
  s.version          = '0.5.0.8'
  s.summary          = 'The Hero architecture for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The `Hero` architecture for iOS is a way to avoid large `UIViewController`
implementations and simultaneously separate the responsibilities.
This separation is achieved by creating modules and workflows.
                       DESC

  s.homepage         = 'https://github.com/fluidmobile/hero'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fluidmobile GmbH' => 'hello@fluidmobile.de' }
  s.source           = { :git => 'https://github.com/fluidmobile/hero.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fluidmobile'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HeroArchitecture/Classes/**/*'

  # s.resource_bundles = {
  #   'HeroArchitecture' => ['HeroArchitecture/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
