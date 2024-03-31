//
//  APIResponseModel.swift
//

class APIResponse: Codable {
    var statusCode: Int?
    var status: String?
    var message: String?
    var error: String?
    var formMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode
        case status
        case message
        case error
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try container.decodeIfPresent(Int.self, forKey: .statusCode)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        error = try container.decodeIfPresent(String.self, forKey: .error)
        
        // Decode formErrors if needed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(statusCode, forKey: .statusCode)
        try container.encode(status, forKey: .status)
        try container.encode(message, forKey: .message)
        try container.encode(error, forKey: .error)
        
        // Encode formErrors if needed
    }
}

class APIMessage: Codable {
    var statusCode: Int?
    var status: String?
    var message: String?
    var formMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode
        case status
        case message
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try container.decodeIfPresent(Int.self, forKey: .statusCode)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        
        // Decode formErrors if needed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(statusCode, forKey: .statusCode)
        try container.encode(status, forKey: .status)
        try container.encode(message, forKey: .message)
        
        // Encode formErrors if needed
    }
}

class APIDataResponse<T: Codable>: APIResponse {
    var data: T?
    
    enum DataCodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataCodingKeys.self)
        data = try container.decodeIfPresent(T.self, forKey: .data)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataCodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}

class APIListDataResponse<T: Codable>: APIResponse {
    var data: [T]?
    
    enum DataCodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataCodingKeys.self)
        data = try container.decodeIfPresent([T].self, forKey: .data)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataCodingKeys.self)
        try container.encode(data, forKey: .data)
        try super.encode(to: encoder)
    }
}
