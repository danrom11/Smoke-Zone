//
//  NetworkModel.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 21.06.2022.
//

import Foundation

class NetworkModel : ObservableObject {
    static let shared = NetworkModel()
    
    @Published var userProfile : User = (User(id: -1, mail: "null", phone: "null", userName: "null", bonus: 0))
    
    func Login(mail : String, phone : String){
        print(mail)
        print(phone)
        guard let url = URL(string: "http://localhost:5001/Zona_Smoke_API/Login?mail=\(mail)&phone=\(phone.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: "+", with: "%2B"))") else {return print("ERROR")}

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
    
    func getInfoUser(mail : String) {
        print(mail)
        guard let url = URL(string: "http://localhost:5001/Zona_Smoke_API/GetInfoUser?mail=\(mail)") else {return print("ERROR")}

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
    
    func getProductTabacco() {
        guard let url = URL(string: "http://localhost:5001/Zona_Smoke_API/GetProducts?type=ProductsTabacco") else {return print("ERROR")}

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
    
    func getProductFood() {
        guard let url = URL(string: "http://localhost:5001/Zona_Smoke_API/GetProducts?type=ProductsFood") else {return print("ERROR")}

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
    
    func sendCode(mail : String, code : String){
        let url = URL(string: "http://localhost:5001/Zona_Smoke_API/SendCode?mail=\(mail)&code=\(code)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    
    
    func SetUserName(mail : String, userName : String) {
        print(mail)
        guard let url = URL(string: "http://localhost:5001/Zona_Smoke_API/SetUserName?mail=\(mail)&userName=\(userName.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)") else {return print("ERROR")}

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
        guard let url = URL(string: "http://localhost:5001/Zona_Smoke_API/NewTestLastFM?term=\(term.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)&limit=10") else {return print("ERROR")}

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
