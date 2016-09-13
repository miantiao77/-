//
//  ViewController.swift
//  正则表达式
//
//  Created by lixiang on 16/6/24.
//  Copyright © 2016年 lixiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       test2()
    }
    func test3() {
        let str = "@jack12:【动物尖叫合辑】#肥猪流#猫头鹰18388934243这么尖叫[偷笑]、@南哥: 老鼠这么尖叫、兔子这么尖叫[吃惊]、@江哥: 莫名奇#小笼包#妙的笑到最后[挖鼻屎]！~ http://t.cn/zYBuKZ8"
        // 1.创建一个正则表达式对象
        do{
            let dataDetector = try NSDataDetector(types: NSTextCheckingTypes(NSTextCheckingType.PhoneNumber.rawValue))
            let res = dataDetector.matchesInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            for che in res
            {
                print((str as NSString).substringWithRange(che.range))
            }
            
        }catch{
            print(error)
        }
    }
    func test2 () {
        let str = "@jack12:【动物尖叫合辑】#肥猪流#猫头鹰这么尖叫[偷笑]、@南哥: 老鼠这么尖叫、兔子这么尖叫[吃惊]、@江哥: 莫名奇#小笼包#妙的笑到最后[挖鼻屎]！~ http://t.cn/zYBuKZ8"
        do{
            // 1.创建规则
            
            // a. 表情
            //let pattern = "\\[.*?\\]"
            // b.@某人
            let pattern = "@.*?:"
            //let pattern = "#.*?#"
            // c.网页
            // let pattern = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?"
            
            // 2.创建正则表达式对象
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
            // 3.开始匹配
            let res = regex.matchesInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            for checkingRes in res
            {
                print((str as NSString).substringWithRange(checkingRes.range))
            }
        }catch{
        print(error)
        }
    }
    func mobilePhoneNumber()
    {
        /*
         匹配手机号码
         1. 以1开头
         2.第二位 3 5 7 8
         3.必须都是数字
         4.必须是11位
         */
        let str = "fdjskfjklsd13554499311fjdksj"
        
        do{
            // 1.创建规则
            let pattern = "[1][3578][0-9]{9}"
            //2.创建正则对象
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
            // 3.开始匹配
            let res = regex.rangeOfFirstMatchInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            print(res)
            print((str as NSString).substringWithRange(res))
            
        }catch{
            print(error)
        }
    }
    func test() {
        let str = "_123mfSfvCV2ri0-294r90rAC&*&39845"
        do{
            // 1.定义规律
    
            // a.判断字符串的是不是m
            // let pattern = "[m]"
            
            // b.判断字符串是否是字母, 注意正则表达式是区分大小写的
           // let pattern = "[a-zA-Z]"
            
            // c.// 判断是否是数字
            let pattern = "[0-9]"
            
            // Error Domain=NSCocoaErrorDomain Code=2048 因为表达式中有空格或中文
            
            // 2.创建正则表达式对象
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
            
            // 3.开始匹配
            let res = regex.rangeOfFirstMatchInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            print(res)
            print((str as NSString).substringWithRange(res))
        }catch{
            print(error)
        }
    }
    private func checkQQ2(str : String)
    {
        /*
         需求:判断一个字符串是否是QQ号码
         1.不能以0开头
         2.长度5~15
         3.必须都是数字
         */
        let str = "a123456"
        // 注意点:正则表达式会匹配整个字符串,如果前面不匹配会继续往后匹配
        do{
            // 1.创建规则
            let pattern = "[1-9][0-9]{4,14}"
            // 2.创建正则表达式对象
            /*
             第一个参数:匹配规则
             第二个参数:附加选项
             */
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
            // 3.开始匹配
            /*
             // 匹配字符串中所有的符合规则的字符串, 返回匹配到的NSTextCheckingResult数组
             public func matchesInString(string: String, options: NSMatchingOptions, range: NSRange) -> [NSTextCheckingResult]
             
             // 按照规则匹配字符串, 返回匹配到的个数
             public func numberOfMatchesInString(string: String, options: NSMatchingOptions, range: NSRange) -> Int
             
             // 按照规则匹配字符串, 返回第一个匹配到的字符串的NSTextCheckingResult
             public func firstMatchInString(string: String, options: NSMatchingOptions, range: NSRange) -> NSTextCheckingResult?
             
             // 按照规则匹配字符串, 返回第一个匹配到的字符串的范围
             public func rangeOfFirstMatchInString(string: String, options: NSMatchingOptions, range: NSRange) -> NSRange
             
             */
            /*
             let number = regex.numberOfMatchesInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
             print("number = \(number)")
             */
            /*
            let res  = regex.firstMatchInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            print(res?.range)
            print((str as NSString).substringWithRange(res!.range))
            */
            /*
             let range  = regex.rangeOfFirstMatchInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
             print((str as NSString).substringWithRange(range))
             */
            let res = regex.matchesInString(str, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            for checkingRes in res {
                print(checkingRes.range)
                print((str as NSString).substringWithRange(checkingRes.range))
            }
            
            
            
            
            
        }catch{
            print(error)
        }
    }
    private func checkQQ(str: String) ->Bool
    {
        // 1.判断开头是否为0
        if str.hasPrefix("0") {
            return false
        }
        // 2.判断开头是否长度5~15
        let len = str.characters.count
        if len < 5 || len > 15 {
            return false
        }
        // 3.断开头是否都是数字
        for c in str.characters {
            if !(c >= "0" && c <= "9") {
                return false
            }
        }
        return  true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

