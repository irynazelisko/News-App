//
//  NewsDataSourceMock.swift
//  News App
//
//  Created by Ірина Зеліско on 17.03.2023.
//


import Foundation

struct NewsDataSourceMock {
    
    static let newsArray = [
        NewsCell(title: "Desperate for a BLT? How to make 12 classic tomato recipes – without any tomatoes",author:"Dale Berning Sawa", source: "The Guardian", imageCellView:"https://i.guim.co.uk/img/media/67b085f20ff0149e0840abf2e7f8a792c311a576/0_2_1754_1052/master/1754.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=8fb651975502f99234b76e58efcc78af", id: UUID().uuidString),
        NewsCell(title: "Gen Z is more enthusiastic about iPhones than Androids because of their cameras, screen layouts, and apps", author: "kduffy@insider.com (Kate Duffy)", source: "Business Insider", imageCellView: "https://i.insider.com/63fdec99d5d80a001827749c?width=1200&format=jpeg", id: UUID().uuidString),
        NewsCell(title: "Warren Buffett's Berkshire Hathaway quietly made a $8.2 billion acquisition that taps into the electric-vehicle boom", author: "tmohamed@businessinsider.com (Theron Mohamed)", source: "Business Insider", imageCellView: "https://i.insider.com/63ff342f48c3550019f928f9?width=1200&format=jpeg", id: UUID().uuidString),
        NewsCell(title: "The giants of adtech are facing challengers in the privacy era | Singular", author: "Dean Takahashi", source: "VentureBeat", imageCellView: "https://venturebeat.com/wp-content/uploads/2023/03/SINGULAR.jpg?w=1200&strip=all", id: UUID().uuidString),
        NewsCell(title: "Las gafas AR de Meta podrían llegar en 2027", author: "Rubén Chicharro", source: "Hipertextual", imageCellView: "https://imgs.hipertextual.com/wp-content/uploads/2021/10/Facebook-Meta-Zuckerberg.jpg", id: UUID().uuidString),
        NewsCell(title: "Why Spy Agencies May Lose Sweeping Surveillance Powers", author: "Vera Bergengruen", source: "Time", imageCellView:
                    "https://api.time.com/wp-content/uploads/2023/02/assistant-ag-Matthew-Olsen.jpg?quality=85&w=1200&h=628&crop=1", id: UUID().uuidString),
        NewsCell(title: "Is \"Come Out, Ye Black & Tans\" just the 1920 version of \"Fuck The Police?\"", author: "Thom Dunn", source: "Boing Boing", imageCellView: "https://i0.wp.com/boingboing.net/wp-content/uploads/2023/02/a4010642901_10-2.jpg?fit=1200%2C760&ssl=1", id: UUID().uuidString),
        NewsCell(title: "Choice Day en AliExpress: aprovecha los descuentos en económicos relojes inteligentes, auriculares Bluetooth y mucho más", author: "Christian Ruiz", source: "Xataka.com", imageCellView:
                    "https://i.blogs.es/8a1d1e/apertura-choice-day-aliexpress/840_560.jpeg", id: UUID().uuidString),
        NewsCell(title: "Apple-ID nach PIN-Klau besser absichern: Bildschirmzeit hilft – so geht's", author: "Ben Schwan", source: "heise online", imageCellView: "https://heise.cloudimg.io/bound/1200x1200/q85.png-lossy-85.webp-lossy-85.foil1/_www-heise-de_/imgs/18/3/7/0/9/7/2/1/iphone-13-pro-camera-1f297811b0df11f4.jpeg", id: UUID().uuidString),
        NewsCell(title: "Apple patent granted for embedded Face ID expected in iPhone 16 Pro [U]", author: "Ben Lovejoy", source: "9to5Mac", imageCellView:  "https://i0.wp.com/9to5mac.com/wp-content/uploads/sites/6/2023/02/Embedded-Face-ID.jpg?resize=1200%2C628&quality=82&strip=all&ssl=1", id: UUID().uuidString),
        NewsCell(title: "Apple Card promotion promises $150 cash back for select new applicants", author: "news@appleinsider.com (Wesley Hilliard)", source: "AppleInsider", imageCellView:  "https://photos5.appleinsider.com/gallery/53256-106729-Apple-Card-xl.jpg", id: UUID().uuidString),
        NewsCell(title: "Streaming TV in March Is a Slam Dunk, But You Can Cancel 3 Services - CNET", author: "Kourtnee Jackson", source: "CNET", imageCellView: "https://www.cnet.com/a/img/resize/df5757338e2b7db93b09004c6fda5fc585d30e94/hub/2023/02/28/9fa2618a-234f-47e8-b50f-c76c45d76cde/the-mandalorian-season-3-poster.jpg?auto=webp&fit=crop&height=630&width=1200", id: UUID().uuidString),
        NewsCell(title: "Why Google Pays Apple Billions of Dollars Every Year", author: "Ayush Jalan", source: "MakeUseOf", imageCellView:  "https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2023/02/apple-rainbow-logo-on-grey-background.jpg", id: UUID().uuidString),
        NewsCell(title: "Apple's outsourced Lightning cable plant in India goes up in flames", author: "Simon Sharwood", source: "Theregister.com", imageCellView:  "https://regmedia.co.uk/2016/06/28/lightning_photo_via_shutterstock.jpg", id: UUID().uuidString),
        NewsCell(title: "Microsoft brings ChatGPT-powered Bing and iMessage support to Windows", author: "Adamya Sharma", source: "Android Authority", imageCellView:  "https://www.androidauthority.com/wp-content/uploads/2023/02/microsoft-bing-in-edge-scaled.jpg", id: UUID().uuidString),
        NewsCell(title: "USB-C iPhone 15: The end of Lightning and what it means for you", author: "oliver@monkeymanmedia.com (Oliver Haslam)", source: "iMore", imageCellView:  "https://cdn.mos.cms.futurecdn.net/DYdTEhd5o5ps3nd36uQbRV-1200-80.jpg", id: UUID().uuidString),
        NewsCell(title: "Microsoft finds a way to introduce new Bing to Windows users using the Moment 2 update", author: "Sharron Bennet", source: "MSPoweruser", imageCellView: "https://mspoweruser.com/wp-content/uploads/2023/02/new-Bing.webp", id: UUID().uuidString),
        NewsCell(title: "15+ Best Pixel Brushes for Procreate in 2023", author: "Jacob Cass", source: "Justcreative.com", imageCellView: "https://justcreative.com/wp-content/uploads/2022/05/PIXA-Procreate-Pixel-Brushes.jpg", id: UUID().uuidString),
        NewsCell(title: "Here's the Key to Warren Buffett's Long-Term Outperformance", author: "newsfeedback@fool.com (Matthew Frankel, CFP®)", source: "Motley Fool", imageCellView:  "https://g.foolcdn.com/editorial/images/722729/buffett-approved-3.jpg", id: UUID().uuidString),
        NewsCell(title: "Apple Watch’s March Activity Challenge is dedicated to International Women’s Day", author: "Tech Desk", source: "The Indian Express", imageCellView: "https://images.indianexpress.com/2023/03/apple-watch-womens-day-challenge-featured.jpg", id: UUID().uuidString)
    ]
    
}





