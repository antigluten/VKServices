//
//  VKMainScreen.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit
import SDWebImage
import SafariServices

class VKMainScreen: UITableViewController {
    
    var apps = [VKApp]()
    var manager: Manager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Сервисы VK"
        
        tableView.backgroundColor = .systemBackground
        
        tableView.register(VKAppRowCell.self, forCellReuseIdentifier: VKAppRowCell.identifier)
        
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        
        fetchData()
    }
    
    private func fetchData() {
        guard let manager = manager else {
            return
        }
        
        manager.fetchApps { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let request):
                self.apps = request.body.services
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VKAppRowCell.identifier, for: indexPath) as? VKAppRowCell else {
            return UITableViewCell()
        }
        
        let app = apps[indexPath.item]
        
        cell.appName.text = app.name
        cell.appDescription.text = app.description
        cell.appIcon.sd_setImage(with: URL(string: app.icon))
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let app = apps[indexPath.item]
        let application = UIApplication.shared
        
        let key = String(app.link.split(separator: "/")[1].prefix { $0 != "." })

        let appPath = Constants.appPaths[key]
        let safariURL = URL(string: app.link)
        
        if let appPath = appPath, let appUrl = URL(string: appPath), application.canOpenURL(appUrl)  {
            application.open(appUrl)
        } else {
            if let safariURL = safariURL {
                let safariVC = SFSafariViewController(url: safariURL)
                present(safariVC, animated: true)
            }
        }
    }
}
