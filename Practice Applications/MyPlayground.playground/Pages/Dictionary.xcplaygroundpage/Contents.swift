//Dictionary

import Foundation
var emails = [String : String]()
emails["123@gj.m"]="Mr.Mark"
emails["234@gj.m"]="Mr.Shark"
emails["567@gj.m"]="Mr.Lark"
emails["890@gj.m"]="Mr.Bark"
print(emails)

emails["123@gj.m"]="Mr.Qark"
print(emails)

emails.removeValue(forKey:"123@gj.m")
print(emails.count)


for email in emails.keys {
    print("Email: \(email)")
}

for name in emails.values {
    print("Name: \(name)")
}
for (email,name) in emails{
    print("Email: \(email) is from \(name)")
}


