/*
 An IP address is a numerical label assigned to each device (e.g., computer, printer) participating in a computer network that uses the Internet Protocol for communication. There are two versions of the Internet protocol, and thus two versions of addresses. One of them is the IPv4 address.

 Given a string, find out if it satisfies the IPv4 address naming rules.

 Example

 For inputString = "172.16.254.1", the output should be
 isIPv4Address(inputString) = true;

 For inputString = "172.316.254.1", the output should be
 isIPv4Address(inputString) = false.

 316 is not in range [0, 255].

 For inputString = ".254.255.0", the output should be
 isIPv4Address(inputString) = false.

 There is no first number.
 */

func isIPv4Address(inputString: String) -> Bool {
    if inputString.filter({$0 == "."}).count != 3 {
        return false
    }
    
    let inputArray = inputString.split(separator: ".")
    if inputArray.count != 4 {
        return false
    }
    
    for ipString in inputArray {
        if ipString.count > 1 && ipString.hasPrefix("0") {
            return false
        }
        
        guard let ipNumber = Int(ipString) else {
            return false
        }
        
        if ipNumber < 0 || ipNumber > 255 {
            return false
        }
    }
    
    return true
}

