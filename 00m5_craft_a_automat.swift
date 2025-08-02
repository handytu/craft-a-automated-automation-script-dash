import Cocoa

class AutomationScriptDashboard {
    let scripts: [String: () -> Void] = [
        "Daily Backup": {
            print("Running daily backup script...")
            // Add daily backup script logic here
        },
        "Weekly Report": {
            print("Generating weekly report...")
            // Add weekly report script logic here
        },
        "Monthly Cleanup": {
            print("Running monthly cleanup script...")
            // Add monthly cleanup script logic here
        }
    ]

    func runScript(_ scriptName: String) {
        if let script = scripts[scriptName] {
            script()
        } else {
            print("Script not found: \(scriptName)")
        }
    }

    func listScripts() {
        print("Available scripts:")
        for (index, (name, _)) in scripts.enumerated() {
            print("\(index + 1). \(name)")
        }
    }
}

let dashboard = AutomationScriptDashboard()

print("Automation Script Dashboard")
print("---------------------------")

dashboard.listScripts()

while true {
    print("\nEnter script number to run or 'q' to quit:")
    if let input = readLine() {
        if input.lowercased() == "q" {
            break
        } else if let scriptNumber = Int(input) {
            let scriptIndex = scriptNumber - 1
            if scriptIndex >= 0 && scriptIndex < dashboard.scripts.count {
                let scriptName = Array(dashboard.scripts.keys)[scriptIndex]
                dashboard.runScript(scriptName)
            } else {
                print("Invalid script number")
            }
        } else {
            print("Invalid input")
        }
    }
}