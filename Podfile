platform :ios, '14.1'

use_frameworks!
inhibit_all_warnings!

target 'Rails' do
  pod 'Macaw', :git => 'https://github.com/magauran/Macaw.git', :branch => 'master'
  pod 'TinyConstraints', '4.0.1'
  pod 'Pulsator', :git => 'https://github.com/shu223/Pulsator', :tag => '0.6.3'
  pod 'SwiftRichString', '3.7.2'
  pod 'SkyFloatingLabelTextField', '4.0.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.1'
    end
  end
end
