Pod::Spec.new do |s|
  s.name             = "BUKButtonComponents"
  s.version          = "0.0.2"
  s.summary          = "Button components for Baixing iOS developers."
  s.homepage         = "https://github.com/Leppard/BUKButtonComponents"
  s.license          = 'MIT'
  s.author           = { "Li Zhenliang" => "coldlefthand@gmail.com" }
  s.source           = { :git => "https://github.com/Leppard/BUKButtonComponents.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/'
  s.resource_bundles = {
    'BUKButtonComponents' => ['Pod/Assets/*.png']
  }
end
