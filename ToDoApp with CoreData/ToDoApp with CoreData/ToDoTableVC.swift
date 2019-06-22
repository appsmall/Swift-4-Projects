//
//  ToDoTableVC.swift
//  ToDoApp with CoreData
//
//  Created by Rahul Chopra on 24/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var resultController: NSFetchedResultsController<Todo>!
    let coreDataStack = CoreDataStack()

    @IBOutlet weak var tableView: UITableView!
    
    var arrName: [String] = ["Rahul","Akash","Ranaira"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Request (Core Data)
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "date", ascending: true)
        
        //Init (Core Data)
        request.sortDescriptors = [sortDescriptors]
        resultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: coreDataStack.managedObject, sectionNameKeyPath: nil, cacheName: nil)
        
        //Fetch
        do {
            try resultController.performFetch()
        }
        catch {
            print("Perform fetched error: \(error)")
        }
        

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let todo = resultController.object(at: indexPath)
        cell.textLabel?.text = todo.title
        
        return cell
    }
    
    //Table View Delegate Methods
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            
            //Delete Todo
            let todo = self.resultController.object(at: indexPath)
            self.resultController.managedObjectContext.delete(todo)
            do {
                try self.resultController.managedObjectContext.save()
            }
            catch {
                print("delete failed: \(error)")
                completion(false)
            }
        }
        
        //action.image =
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let action = UIContextualAction(style: .normal, title: "Check") { (action, view, completion) in
            
            //Check ToDo
            completion(true)
        }
        //action.image =
        action.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? AddToDoVC
        {
            vc.managedContext = resultController.managedObjectContext
        }
    }
    
    
    @IBAction func btnAdd(_ sender: Any)
    {
        
    }

}


extension ToDoTableVC: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            
        case .delete:
            if let indexPath = indexPath
            {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
        default:
            break;
        }
    }
    
}
