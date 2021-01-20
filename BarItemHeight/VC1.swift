//
//  VC1.swift
//  BarItemHeight
//
//  Created by WillowRivers on 2021/1/8.
//

import UIKit

class VC1: UIViewController {
    lazy var imageV: UIImageView = {
        let tempV = UIImageView(frame: CGRect(x: 0, y: UI.navigationBarMaxY, width: self.view.frame.width, height: UI.screenHeigth - UI.navigationBarMaxY - UI.tabBarHeight))
        tempV.layer.borderWidth = 1.0
        tempV.layer.borderColor = UIColor.blue.cgColor
        tempV.backgroundColor = UIColor.red
        tempV.image = UIImage(named: "pageOne_image")
        tempV.contentMode = .scaleToFill
        return tempV
    }()
    
    lazy var btn: UIButton = {
        let buttonSize = CGSize(width: 85, height: 50)
        let tempBtn = UIButton(frame: CGRect(origin: CGPoint(x: UI.screenWidth - 20 - buttonSize.width, y: UI.screenHeigth - UI.tabBarHeight - 20 - buttonSize.height), size: buttonSize))
        tempBtn.layer.cornerRadius = buttonSize.height/2
        tempBtn.clipsToBounds = true
        tempBtn.backgroundColor = UIColor.brown
        tempBtn.setTitle("Detail", for: .normal)
        tempBtn.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return tempBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "first"
        view.addSubview(imageV)
        view.addSubview(btn)
        printTabHeight()
    }
    
    @objc func buttonAction(sender: UIButton) {
        self.navigationController?.pushViewController(DetailVC(), animated: true)
    }
    
    func printTabHeight() {
        
        print("screen width is :    \(UI.screenWidth)")
        print("screen height is :    \(UI.screenHeigth)")
        
        print("statusBar height is :    \(UI.statusBarHeight)")
        print("navigationbar height is :    \(UI.navigationBarHeight)")
        print("navigationbar maxY is :    \(UI.navigationBarMaxY)")
        print("tabbar height is :    \(UI.tabBarHeight)")
        print("homeBar height is :    \(UI.homeBarHeight)")
        
        print("true tabbar height is :    \(self.tabBarController?.tabBar.frame.height)")
    }
    
   
}
//给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 的那 两个 整数，并返回它们的数组下标。
extension VC1 {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
          var forSortArr = nums
          forSortArr.sort { (s0, s1) -> Bool in
              return s0 <= s1
          }
          let resultArr = twoValue(forSortArr, target)
          let leftIndex = getIndex(sourceArr: nums, anchorValue: resultArr[0], exception: nil)
          let rightIndex = getIndex(sourceArr: nums, anchorValue: resultArr[1], exception: leftIndex)
          let resultA = [leftIndex ?? 0, rightIndex ?? 0]
          return resultA
      }

      func twoValue(_ nums: [Int], _ target: Int) -> [Int] {
          let firstAnchorIndex = getLessMaxIndex(arr: nums, anchor: target)
          guard firstAnchorIndex != nil else {
              return []
          }
          let twoArrUnit = oneArrSplit(sourceArr: nums, anchorIndex: firstAnchorIndex!)
          guard twoArrUnit != nil else {
              return []
          }
          for (leftArrValue) in twoArrUnit!.leftArr {
              for (rightArrValue) in twoArrUnit!.rightArr{
                  if leftArrValue + rightArrValue == target {
                      return [leftArrValue, rightArrValue]
                  }
              }
          }
          return []
      }

        func oneArrSplit(sourceArr: [Int], anchorIndex: Int) -> (leftArr: [Int], rightArr: [Int])? {
          guard anchorIndex >= 0 else {
              return nil
          }
          guard sourceArr.count > anchorIndex else {
              return  nil
          }
          let leftArr: [Int] = Array(sourceArr[0 ... anchorIndex])//
          let rightArr = Array(sourceArr[anchorIndex + 1 ..< sourceArr.count])//
          return (leftArr, rightArr)
      }

        func getLessMaxIndex(arr: [Int], anchor: Int) -> Int? {
          //var resultValue: Int? = nil
          guard arr.count >= 2 else {
              if arr.count == 0 {
                  return nil
              }else {
                  if arr[0] <= anchor {
                      return 0
                  }else {
                      return nil
                  }
              }
          }
          for tempIndex in 0 ..< arr.count - 1 {
              if arr[tempIndex]*2 <= anchor {
                  if arr[tempIndex + 1] * 2 > anchor || (arr[tempIndex]*2 == anchor && arr[tempIndex + 1]*2 == anchor) {
                      return tempIndex
                  }
              }
          }
          return nil
      }

       func getIndex(sourceArr: [Int], anchorValue: Int, exception: Int?) -> Int? {
          for (index, element) in sourceArr.enumerated() {
              if element == anchorValue && (index != exception) {
                  return index
              }
          }
          return nil
      }
}
// 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
extension VC1 {
    //45645644545
    func reverse(_ x: Int) -> Int {
        let maxValue: Float = pow(2, 31) - 1
        let minValue: Float = pow(-2, 31)
        var result = 0
        if x > 0 {
            let meybeResult = getCompactStr(source: x)
            if meybeResult <= Int(maxValue) {
                result = meybeResult
            }
        }else if x < 0 {
            let maybeResult = getCompactStr(source: x) * (-1)
            if maybeResult >= Int(minValue) {
                result = maybeResult
            }
        }
        return result
    }
    
    /// 获取字符串，并去掉尾部的0
    /// - Parameter source: source description
    /// - Returns: description
    func getCompactStr(source: Int) -> Int {
        let absoltValue = abs(source)
        let str = absoltValue.description
        guard str != "0" else {
            return 0
        }
        let reverseStr = str.reversed()
        let intValue: Int = Int(String(reverseStr)) ?? 0
        return intValue
    }
}
/// 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
extension VC1 {
    
    func changeRomaStrToInt(RomaChar: String) -> Int {
        switch RomaChar {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        case "IV":
            return 4
        case "IX":
            return 9
        case "XL":
            return 40
        case "XC":
            return 90
        case "CD":
            return 400
        case "CM":
            return 900
        default:
            return  0
        }
    }
    
    /// 递归方式获取int value
    /// - Parameter sourceStr: sourceStr description
    /// - Returns: description
    func calculate(sourceStr: String) -> Int {
        var sumValue: Int = 0
        var calculateStr: String = sourceStr
        if calculateStr.first != nil {
            let firstChar = calculateStr.first
            switch firstChar {
            case "I":
                if calculateStr.count >= 2 {
                    let stringIndex =  String.Index(utf16Offset: 1, in: calculateStr)
                    if calculateStr[stringIndex] == "V" || calculateStr[stringIndex] == "X" {
                        let aimStr = "I" + String(calculateStr[stringIndex])
                        sumValue += changeRomaStrToInt(RomaChar: aimStr)
                        calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 2), in: calculateStr)!)
                    }else {
                        sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                        calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
                    }
                }else {
                    sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                    calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
                }
            case "X":
                if calculateStr.count >= 2 {
                    let stringIndex =  String.Index(utf16Offset: 1, in: calculateStr)
                    if calculateStr[stringIndex] == "L" || calculateStr[stringIndex] == "C" {
                        let aimStr = "X" + String(calculateStr[stringIndex])
                        sumValue += changeRomaStrToInt(RomaChar: aimStr)
                        calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 2), in: calculateStr)!)
                    }else {
                        sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                        calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
                    }
                }else {
                    sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                    calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
                }
                
            case "C":
                if calculateStr.count >= 2 {
                    let stringIndex =  String.Index(utf16Offset: 1, in: calculateStr)
                    if calculateStr[stringIndex] == "D" || calculateStr[stringIndex] == "M" {
                        let aimStr = "C" + String(calculateStr[stringIndex])
                        sumValue += changeRomaStrToInt(RomaChar: aimStr)
                        calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 2), in: calculateStr)!)
                    }else {
                        sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                        calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
                    }
                }else {
                    sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                    calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
                }
                
            default:
                sumValue += changeRomaStrToInt(RomaChar: String(firstChar!))
                calculateStr.removeSubrange(Range<String.Index>(NSRange(location: 0, length: 1), in: calculateStr)!)
            }
            sumValue = sumValue + calculate(sourceStr: calculateStr)
        }
        return sumValue
    }
}

//The left function in the DetailVC.swift
