Pod::Spec.new do |spec|
    spec.name     = 'RetriableSDWebImage'
    spec.version  = '1.0.1'
    spec.license  = 'MIT'
    spec.summary  = 'Retriable SDWebImage'
    spec.homepage = 'https://github.com/emsihyo/RetriableSDWebImage'
    spec.author   = { 'emsihyo' => 'emsihyo@gmail.com' }
    spec.source   = { :git => 'https://github.com/emsihyo/RetriableSDWebImage.git',:tag => "#{spec.version}" }
    spec.description = 'Retriable SDWebImage.'
    spec.requires_arc = true
    spec.ios.deployment_target = '8.0'
    spec.watchos.deployment_target = '2.0'
    spec.tvos.deployment_target = '9.0'
    spec.osx.deployment_target = '10.9'
    spec.ios.source_files = 'RetriableSDWebImage/*.{h,m}'
    spec.dependency 'Retriable'
    spec.dependency 'SDWebImage'    
end
