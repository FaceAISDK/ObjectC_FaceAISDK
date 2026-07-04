# Uncomment the next line to define a global platform for your project
platform :ios, '15.5'

target 'ObjectC_FaceAISDK' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ObjectC_FaceAISDK
  # 1. 命令 pod update FaceAISDK_Core 安装更新FaceAISDK依赖,请指定版本。
  # 不同开发设备和网络环境，首次集成到主项目依赖同步耗时20-30分钟不等
<<<<<<< HEAD
  pod 'FaceAISDK_Core', :git => 'https://github.com/FaceAISDK/FaceAISDK_Core.git', :tag => '2026.05.21.xcode265'
=======
  pod 'FaceAISDK_Core', :git => 'https://github.com/FaceAISDK/FaceAISDK_Core.git', :tag => '2026.05.28.xcode15'
>>>>>>> refs/remotes/origin/main

end

# 将所有的 post_install 逻辑合并到一个 block 中
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      
      # 全局配置：排除模拟器的 arm64 架构
       config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      
      # 针对特定 Target (FaceAISDK_Core) 的配置
      if target.name == 'FaceAISDK_Core'
        # 确保分发库编译选项在 Pod 目标中生效 (解决 Swift Module 稳定性报错)
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
      
    end
  end
end
