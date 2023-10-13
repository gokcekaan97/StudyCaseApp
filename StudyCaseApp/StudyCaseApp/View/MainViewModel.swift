//
//  MainViewModel.swift
//  StudyCaseApp
//
//  Created by kaan gokcek

import Foundation

public class MainViewModel{
  public var personList = [Person]()
  public var requestString: String?
  public var requestResponseResult: Bool = false
  
  public init() {
    DispatchQueue.main.async{
      self.request(requestString: nil) { result in
        switch result{
        case .success(let personList):
          self.personList = personList
        case .failure(let error):
          fatalError(error.localizedDescription)
        }
      }
    }
  }
  
  public func request(requestString: String?,
                      completion: @escaping (Result<[Person],Error>) -> Void){
    DataSource.fetch(next: requestString) { response, error in
      switch response {
      case .none:
        guard let error = error?.errorDescription else {return}
        completion(.failure(error as! Error))
      case .some(let responseResult):
        completion(.success(responseResult.people))
      }
    }
  }
}

