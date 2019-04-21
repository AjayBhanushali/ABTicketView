Pod::Spec.new do |s|
          #1.
          s.name               = "ABTicketView"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary         = "Ticket, Coupon Views just made simpler by ABTicketView"
          #4.
          s.homepage        = "https://www.linkedin.com/in/ajaybhanushali/"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "Ajay Bhanushali"
          #7.
          s.platform            = :ios, "11.0"
          #8.
          s.source              = { :git => "https://github.com/AjayBhanushali/ABTicketView.git", :tag => "1.0.0" }
          #9.
          s.source_files     = "ABTicketView", "ABTicketView/*.{h,m,swift}"
    end