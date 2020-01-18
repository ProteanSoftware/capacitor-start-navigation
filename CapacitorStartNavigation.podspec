
  Pod::Spec.new do |s|
    s.name = 'CapacitorStartNavigation'
    s.version = '0.0.1'
    s.summary = 'Starts navigation in the native maps application'
    s.license = 'MIT'
    s.homepage = 'https://github.com/Protean-Software-Ltd/capacitor-start-navigation'
    s.author = 'Ashley Medway'
    s.source = { :git => 'https://github.com/Protean-Software-Ltd/capacitor-start-navigation', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end