
Pod::Spec.new do |s|
  s.name             = 'AJAttributeLabel'
  s.version          = '0.1.0'
  s.summary          = 'UILabel Category'

  s.description      = <<-DESC
                              UILabel Category Userd
                       DESC

  s.homepage         = 'https://github.com/YLazyCat/AJAttributeLabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YLazyCat' => 'shanmj@urwork.cn' }
  s.source           = { :git => 'https://github.com/YLazyCat/AJAttributeLabel.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'AJAttributeLabel/Classes/**/*'

end
