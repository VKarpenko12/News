# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def api
  pod 'Moya'
  pod 'Moya-ModelMapper'
end

def autogeneration
  pod 'R.swift'
end

def ui
  pod 'SnapKit'
  pod 'Kingfisher'
  pod 'IHProgressHUD', :git => 'https://github.com/Swiftify-Corp/IHProgressHUD.git'
end

target 'News' do
  autogeneration
  api
  ui

end
