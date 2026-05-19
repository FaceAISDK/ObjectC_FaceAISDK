# Uncomment the next line to define a global platform for your project
platform :ios, '15.5'

target 'ObjectC_FaceAISDK' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ObjectC_FaceAISDK
  
  # 1. 命令 pod update FaceAISDK_Core 安装更新FaceAISDK依赖,请指定版本。
  # 不同开发设备和网络环境，首次集成到主项目依赖同步耗时20-30分钟不等

  pod 'FaceAISDK_Core', :git => 'https://github.com/FaceAISDK/FaceAISDK_Core.git', :tag => '2026.05.18.xcode26.5'


end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
