import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {return true}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (sstoreDescription, error) in
            if let error = error as NSError? {
                fatalError("Unressolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                fatalError("Unressolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
