//
//  BooksViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController,
UICollectionViewDataSource,
UICollectionViewDelegate,
UIViewControllerTransitioningDelegate,
GroupsPickerDelegate {
    
    let SegueListDetails = "kListDetailsSegue"
    let kGroupsSegue = "kGroupsSegue"
    
    var lists: Array<List> = []
    var groups: Array<Group> = []
    var session: NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let layout = collectionView.collectionViewLayout as! PhoneCardsCollectionViewLayout
        layout.interItemSpace = 30
        
        self.switchToLocalContent(self)
 
    }
    @IBAction func switchToLocalContent(sender: AnyObject) {
        let song = Song()
        song.title = "Witaj Pokarmie"
        song.text = "1. Witaj pokarmie w którym niezmierzony\nNieba i ziemie Twórca jest zamkniony\nWitaj napoju zupełnie gaszący\nUmysł pragnący.\n\n2. Witaj krynico wszystkiego dobrego\nGdy bowiem w sobie masz Boga samego\nZnasz\nludziom wszystkie jego wszechmocności\nNiesiesz godności.\n\n3. Witaj z niebiosów manno padająca\nRozkoszny w sercu naszym smak czyniąca\nWszystko na świecie co jedno smakuje\nW tym się znajduje.\n\n4. Witaj rozkoszne z ogrodu rajskiego\nDrzewo owocu pełne żywiącego\nKto cię skosztuje śmierci się nie boi\nChoć nad nim stoi.\n\n5. Witaj jedyna serc ludzkich radości\nWitaj strapionych wszelka łaskawości\nCiebie dziś moje łzy słodkie szukają\nK Tobie wołają.\n1. Witaj pokarmie w którym niezmierzony\nNieba i ziemie Twórca jest zamkniony\nWitaj napoju zupełnie gaszący\nUmysł pragnący.\n\n2. Witaj krynico wszystkiego dobrego\nGdy bowiem w sobie masz Boga samego\nZnasz\nludziom wszystkie jego wszechmocności\nNiesiesz godności.\n\n3. Witaj z niebiosów manno padająca\nRozkoszny w sercu naszym smak czyniąca\nWszystko na świecie co jedno smakuje\nW tym się znajduje.\n\n4. Witaj rozkoszne z ogrodu rajskiego\nDrzewo owocu pełne żywiącego\nKto cię skosztuje śmierci się nie boi\nChoć nad nim stoi.\n\n5. Witaj jedyna serc ludzkich radości\nWitaj strapionych wszelka łaskawości\nCiebie dziś moje łzy słodkie szukają\nK Tobie wołają.\n1. Witaj pokarmie w którym niezmierzony\nNieba i ziemie Twórca jest zamkniony\nWitaj napoju zupełnie gaszący\nUmysł pragnący.\n\n2. Witaj krynico wszystkiego dobrego\nGdy bowiem w sobie masz Boga samego\nZnasz\nludziom wszystkie jego wszechmocności\nNiesiesz godności.\n\n3. Witaj z niebiosów manno padająca\nRozkoszny w sercu naszym smak czyniąca\nWszystko na świecie co jedno smakuje\nW tym się znajduje.\n\n4. Witaj rozkoszne z ogrodu rajskiego\nDrzewo owocu pełne żywiącego\nKto cię skosztuje śmierci się nie boi\nChoć nad nim stoi.\n\n5. Witaj jedyna serc ludzkich radości\nWitaj strapionych wszelka łaskawości\nCiebie dziś moje łzy słodkie szukają\nK Tobie wołają.\nBoom."
        
        
        let gaudete = Song()
        gaudete.title = "Gaudete"
        gaudete.text = "Gaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nTempus ad est gratiae hoc quod optabamus\nCarmina laetitiae devote redamus\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nDeus homo factus est natura mirante\nMundus renovatus est a Christo regnante\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nEzechielis porta clausa per transitur\nUnde lux est orta salus invenitur\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nErgo nostro cantio psallat jam in lustro\nBenedicat domino salus regi nostro\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nTempus ad est gratiae hoc quod optabamus\nCarmina laetitiae devote redamus\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nDeus homo factus est natura mirante\nMundus renovatus est a Christo regnante\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nEzechielis porta clausa per transitur\nUnde lux est orta salus invenitur\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n\nErgo nostro cantio psallat jam in lustro\nBenedicat domino salus regi nostro\n\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\nGaudete, gaudete Christus est natus\nEx Maria virgine gaudete\n"
        
        let list = List()
        list.title = "Procesja Palmowa"
        list.songs = [song, gaudete, song, song, gaudete, song]
        list.image = UIImage(named: "tmpImg")
        
        let majowkaList = List()
        majowkaList.title = "Majówka"
        majowkaList.songs = [song, gaudete, song, song, gaudete, song]
        majowkaList.image = UIImage(named: "tmpGory")
        
        let sylwList = List()
        sylwList.title = "Sylwester Beta"
        sylwList.songs = [song, gaudete, song, song, gaudete, song]
        sylwList.image = UIImage(named: "tmpSylw")
        
        lists = [list,
                 majowkaList,
                 sylwList,
                 list]
        
        self.collectionView.reloadData()
    }
    
    @IBAction func switchToBackend(sender: AnyObject) {
        
        
        let listEndpoint = "list"
        let songsEndpoint = "song"
        let groupsEndpoint = "group"
        
        self.dataForEndpoint(listEndpoint) { (listData) in
            if let listData = listData {
                self.dataForEndpoint(songsEndpoint, completion: { (songsData) in
                    if let songsData = songsData {
                        let lists = self.listsFromDict(listData)
                        
                        let songsArray = songsData["songs"] as! [[String : AnyObject]]
                        self.updateRelationships(lists, songsArray: songsArray)
                        
                        self.lists = lists
                        self.collectionView.reloadData()
                    }
                    
                    
                    print ("======LOAD GROUPS======")
                    self.dataForEndpoint(groupsEndpoint, completion: { (groupsData) in
                        if let groupsData = groupsData {
                            let groupsArray = groupsData["groups"] as! [[String : AnyObject]]
                            let groups = self.groupsFromDict(groupsArray)
                            
                            self.groups = groups
                        }
                    })
                })
            }
        }
    }
    
    
    
    func groupsFromDict(groupsArray: [[String : AnyObject]]) -> [Group] {
        var allGroups: [Group] = []
        
        print (groupsArray)
        
        for groupInfo in groupsArray {
            let group = Group()
            group.id = groupInfo["id"] as? String
            group.name = groupInfo["title"] as? String
            
            if let imagePath = groupInfo["img_url"] as? String {
                if let imageURL = NSURL(string: imagePath) {
                    if let data = NSData(contentsOfURL: imageURL) {
                        print("\(imageURL)")
                        group.image = UIImage(data: data)
                    }
                }
            }
            
            allGroups.append(group)
        }
        
        return allGroups
    }
    
    func dataForEndpoint(endpoint: String,
                         completion: ((Dictionary<String, AnyObject>?) -> Void)?) {
        let URL = NSURL(string: "http://172.17.17.177:8888/\(endpoint)")!
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"
        session.dataTaskWithRequest(request) { (data, response, error) in
            
            if let error = error {
                print("\(error) - \(response)")
            }
            else {
                let obj = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! Dictionary<String, AnyObject>
                
                dispatch_async(dispatch_get_main_queue(), {
                    completion?(obj)
                })
            }
            }.resume()
    }
    
    func listsFromDict(dict: Dictionary<String, AnyObject>) -> [List] {
        var allLists: [List] = []
        
        let listsArray = dict["lists"] as! Array<Dictionary<String, AnyObject>>
        for listInfo in listsArray {
            let list = List()
            list.id = listInfo["id"] as? String
            list.title = listInfo["title"] as? String
            
            if let imagePath = listInfo["img_url"] as? String {
                if let imageURL = NSURL(string: imagePath) {
                    if let data = NSData(contentsOfURL: imageURL) {
                        print("\(imageURL)")
                        list.image = UIImage(data: data)
                    }
                }
            }
            
            allLists.append(list)
        }
        
        return allLists
    }
    
    func songsFromDict() {
        
    }
    
    func updateRelationships(lists: [List], songsArray: [[String : AnyObject]]) {
        print(songsArray)
        
        for songInfo in songsArray {
            let song = Song()
            song.title = songInfo["title"] as? String
            song.id = songInfo["id"] as? String
            song.text = songInfo["content"] as? String
            
            let listId = songInfo["list_id"] as? String
            for list in lists {
                if list.id == listId {
                    song.lists.append(list)
                    list.songs.append(song)
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! PhoneCardsCollectionViewLayout
        layout.itemSize = CGSizeMake(self.view.bounds.size.width - 30, self.view.bounds.size.height - 150)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ListCollectionViewCell
        let list = lists[indexPath.item]
        
        cell.imageView.image = list.image
        cell.titleLabel.text = list.title
        cell.songsCountLabel.text = String(list.songs.count)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView,
                        didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let list = lists[indexPath.item]
        self.performSegueWithIdentifier(SegueListDetails, sender: ["item" : list])
    }
    

    // MARK: UIViewController
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if (segue.identifier == SegueListDetails) {
            let details = sender as! Dictionary<String, AnyObject>
            let list = details["item"] as! List
            let navVC = segue.destinationViewController as! UINavigationController
            let listVC = navVC.viewControllers.first as! ListViewController
            listVC.list = list
            
            navVC.transitioningDelegate = self
            navVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
        else if (segue.identifier == kGroupsSegue) {
            let navVC = segue.destinationViewController as! UINavigationController
            let groupsVC = navVC.viewControllers.first as! GroupsViewController
            groupsVC.groups = self.groups
            groupsVC.delegate = self
        }
    }

    // MARK: UIViewControllerTransitionDelegate
    
    func animationControllerForPresentedController(presented: UIViewController,
                                                   presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = CardTransition()
        transition.presenting = true
        
        let visibleCell = self.collectionView.visibleCells().first!
        transition.startCardFrame = self.collectionView.convertRect(visibleCell.frame, toView: nil)
        
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = CardTransition()
        transition.presenting = false
        
        let visibleCell = self.collectionView.visibleCells().first!
        transition.startCardFrame = self.collectionView.convertRect(visibleCell.frame, toView: nil)
        
        return transition
    }

    // MARK: GroupsPickerDelegate
    
    func didPickGroup(group: Group) {
        print("Picked group")
    }
    
}

