Pod::Spec.new do |s|
s.name             = "MaterialProgressBar"
s.version          = "0.2"
s.summary          = "Material Linear Progress Bar for your iOS apps"
s.homepage         = "https://github.com/Recouse/LinearProgressBar"
s.license          = 'MIT'
s.author           = { "Firdavs Khaydarov" => "recouse@mail.ru" }
s.source           = { :git => "https://github.com/Recouse/LinearProgressBar.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = 'Sources/*.{swift,h,m}'
end
