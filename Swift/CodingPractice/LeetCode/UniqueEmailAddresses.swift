/*
 https://leetcode.com/problems/unique-email-addresses/
 
 Topics: Array, Hash Table, String
 */

class UniqueEmailAddresses {
    func getUniqueEmail(_ email: String) -> String {
        let arr = email.components(separatedBy: "@")
        var local = arr.first!.components(separatedBy: "+").first!.replacingOccurrences(of: ".", with: "")
        let domain = arr.last!
        local.append("@")
        local.append(contentsOf: domain)
        return local
    }
    
    func numUniqueEmails(_ emails: [String]) -> Int {
        return Set(emails.map {getUniqueEmail($0)}).count
    }
}
