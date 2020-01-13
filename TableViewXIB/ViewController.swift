//
//  ViewController.swift
//  TableViewXIB
//
//  Created by 刘佳艳 on 2020/01/13.
//  Copyright © 2020 刘佳艳. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   var tableData = [["title":"Swift - 让标签栏按钮UITabBarItem图片居中","image":"img1.png"],
   ["title":"Swift - 使用SSZipArchive实现文件的压缩、解压缩","image":"img2.png"],
   ["title":"Swift - 使用LINQ操作数组/集合","image":"img3.png"],
   ["title":"Swift - 给表格UITableView添加索引功能","image":"img4.png"],
   ["title":"Swift - 列表项尾部附件点击响应","image":"img5.png"]]
    var tableView:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
         //创建表视图
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        //设置表格背景色
        tableView!.backgroundColor = UIColor(red: 0xf0/255, green: 0xf0/255,
            blue: 0xf0/255, alpha: 1)
        //去除单元格分隔线
        tableView!.separatorStyle = .none
         
        //创建一个重用的单元格
        tableView!.register(UINib(nibName:"MyTableViewCell", bundle:nil),
            forCellReuseIdentifier:"myCell")
         
        self.view.addSubview(self.tableView!)
    }
    
   //在本例中，只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    //单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        let item = tableData[indexPath.row]
        cell.titleLable.text = item["title"]
        cell.customImage.image = UIImage(named:item["image"]!)
        return cell
    }
    
    //可有可无
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

