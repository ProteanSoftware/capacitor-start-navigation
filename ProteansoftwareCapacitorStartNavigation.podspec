
  Pod::Spec.new do |s|
    s.name = 'ProteansoftwareCapacitorStartNavigation'
    s.version = '0.0.1'
    s.summary = 'Starts navigation in the native maps application'
    s.license = 'MIT'
    s.homepage = 'https://github.com/ProteanSoftware/capacitor-start-navigation'
    s.author = 'Ashley Medway'
    s.source = { :git => 'https://github.com/ProteanSoftware/capacitor-start-navigation', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '12.0'
    s.dependency 'Capacitor'
  end