//
//  NetworkModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 21.06.2022.
//

import Foundation
import UIKit

class NetworkModel : ObservableObject {
    static let shared = NetworkModel()
    
    private var secretCode = "Gkl43klj2409)432bjkhUISHUIOh3j12kh3johChjhh7uyFyuids"
    
    @Published var loadBookings = false
    
    @Published var userProfile : User = (User(id: -1, mail: "null", phone: "null", userName: "null", bonus: 0, cashBack: 0))
    
    @Published var userAvatar = UIImage()
    @Published var selectedAvatar = 0
    
    func loadUserAvatar(){
        guard let data = UserDefaults.standard.data(forKey: "userAvatar") else { return }
            let decode = try! PropertyListDecoder().decode(Data.self, from: data)
            userAvatar = UIImage(data: decode) ?? UIImage()
            selectedAvatar = 1
    }
    
    
    func Login(phone : String){
        print(phone)
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/Login?phone=\(phone.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: "+", with: "%2B"))") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(User.self, from: data)
                        self.userProfile = decodedUsers
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getInfoUser(phone : String) {
        print(phone)
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetInfoUser?phone=\(phone.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: "+", with: "%2B"))") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(User.self, from: data)
                        self.userProfile = decodedUsers
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getFiltersTabacco(){
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetFilters?type=Tabacco") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedFiltersTabacco = try JSONDecoder().decode([Filter].self, from: data)
                        FilterModel.shared.tabaccoFilters = decodedFiltersTabacco
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getProductTabacco() {
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetProducts?type=ProductsTabacco") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedProductTabacco = try JSONDecoder().decode([Product].self, from: data)
                        CatalogViewModel.shared.productsTabacco = decodedProductTabacco
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getFiltersFood(){
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetFilters?type=Food") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedFiltersFood = try JSONDecoder().decode([Filter].self, from: data)
                        FilterModel.shared.foodFilters = decodedFiltersFood
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getProductFood() {
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetProducts?type=ProductsFood") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedProductFood = try JSONDecoder().decode([Product].self, from: data)
                        CatalogViewModel.shared.productsFood = decodedProductFood
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getNews(){
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetNews") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedNews = try JSONDecoder().decode([News].self, from: data)
                        HomeModel.shared.baseNews = decodedNews.reversed()
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getPopulars(){
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetPopulars") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedPopulars = try JSONDecoder().decode([Popular].self, from: data)
                        HomeModel.shared.basePopular = decodedPopulars.reversed()
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    func getTabelBookings(date : Date){
        loadBookings = true
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm"
        
        print(dateFormatter.string(from: date).replacingOccurrences(of: " ", with: "%20"))
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/GetTableBookingsDate?date=\(dateFormatter.string(from: date).replacingOccurrences(of: " ", with: "%20"))") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedTableBookings = try JSONDecoder().decode([Booking].self, from: data)
                        BookingModel.shared.tables = decodedTableBookings
                        self.loadBookings = false
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }
        
        dataTask.resume()
    }
    
    func sendCodeCall(phone : String, code : String){
        print("Phone-\(phone)")
        print("Code-\(code)")
        let url = URL(string: "https://smokezone.site/Zona_Smoke_API/SendCodeCall?phone=\(phone.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: "+", with: "%2B"))&code=\(code)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func sendOrder(order: [Hookah], food: [Product], user: User, date : Date, table: Int){
        print("SEND ORDER")
        print(order)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm"
        
        let jsonStringHookahs = (String(data: try! JSONEncoder().encode(order), encoding: .utf8)!).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let jsonStringFoods = (String(data: try! JSONEncoder().encode(food), encoding: .utf8)!).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        let url = URL(string: "https://smokezone.site/Zona_Smoke_API/SendOrder?idUser=\(user.id)&hookah=\(jsonStringHookahs)&food=\(jsonStringFoods)&table=\(table)&date=\(dateFormatter.string(from: date).replacingOccurrences(of: " ", with: "%20"))&secretCode=\(secretCode)")!
        
        print("URL -> \(url)")
        
        //let url = URL(string: "https://smokezone.site/Zona_Smoke_API/SendOrder?idUser=0&hookah=TestHookah&food=foodTest&table=\(table)&date=\(date.formatted().replacingOccurrences(of: " ", with: "%20"))&secretCode=\(secretCode)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            self.getTabelBookings(date: date)
        }
        task.resume()
    }
    
    
    func SetUserName(phone : String, userName : String) {
        print(phone)
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/SetUserName?phone=\(phone.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: "+", with: "%2B"))&userName=\(userName.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)&secretCode=\(secretCode)") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(User.self, from: data)
                        self.userProfile = decodedUsers
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    
    func getMusics(term : String) {
        guard let url = URL(string: "https://smokezone.site/Zona_Smoke_API/NewTestLastFM?term=\(term.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)&limit=10") else {return print("ERROR")}

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                print("DATA = \(data)")
                DispatchQueue.main.async {
                    do {
                        let decodedMusics = try JSONDecoder().decode([Music].self, from: data)
                        MusicModel.shared.musics = decodedMusics
                       
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else { print("ERRR")}
        }

        dataTask.resume()
    }
    
    
}
