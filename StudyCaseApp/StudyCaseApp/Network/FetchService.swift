//
//  Service.swift
//  StudyCaseApp
//
//  Created by kaan gokcek

import Foundation

public class FetchResponse {
  let people: [Person]
  let next: String?
  
  init(people: [Person], next: String?) {
    self.people = people
    self.next = next
  }
}

public class FetchError {
  let errorDescription: String
  
  init(description: String) {
    self.errorDescription = description
  }
}

public typealias FetchCompletionHandler = (FetchResponse?, FetchError?) -> ()
