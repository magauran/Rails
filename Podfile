platform :ios, '14.1'

use_frameworks!
inhibit_all_warnings!

target 'Rails' do
  pod "Macaw", "0.9.7"
  pod "TinyConstraints", "4.0.1"
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.1'
    end
  end
end
