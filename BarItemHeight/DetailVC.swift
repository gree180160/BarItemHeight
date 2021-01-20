//
//  DetailVC.swift
//  BarItemHeight
//
//  Created by WillowRivers on 2021/1/8.
//

import UIKit

class DetailVC: UIViewController {
    lazy var imageV: UIImageView = {
        let tempV = UIImageView(frame: CGRect(x: 0, y: UI.navigationBarMaxY, width: self.view.frame.width, height: UI.screenHeigth - UI.navigationBarMaxY))
        tempV.layer.borderWidth = 1.0
        tempV.layer.borderColor = UIColor.blue.cgColor
        tempV.backgroundColor = UIColor.red
        tempV.image = UIImage(named: "pageDetail_image")
        tempV.contentMode = .scaleToFill
        return tempV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "detail"
        view.addSubview(imageV)
        //splitArr()
        let node1 = ListNode(9)
        let node2 = ListNode(9)
        let node3 = ListNode(9)
        let nodeA = ListNode(9)
        let nodeB = ListNode(9)
        
        let node4 = ListNode(9)
        let node5 = ListNode(9)
        let node6 = ListNode(9)
        
        node1.next = node2
        node2.next = node3
        node3.next = nodeA
        nodeA.next = nodeB
        
        node4.next = node5
        node5.next = node6
        let resultNode = addTwoNumbers(node1, node4)
        printNode(node: resultNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
/// spliter Array
extension DetailVC {
    func splitArr() {
        var arr = [3,2,3]
        let sourceArr = [3, 2, 3]
        arr.sort { (s0, s1) -> Bool in
            return s0 <= s1
        }
        let resultArr = twoSum(arr, 6)
        let leftIndex = getIndex(sourceArr: sourceArr, anchorValue: resultArr[0], exception: nil)
        let rightIndex = getIndex(sourceArr: sourceArr, anchorValue: resultArr[1], exception: leftIndex)
        let resultA = [leftIndex, rightIndex]
        print("reusultA is :\(resultA)")
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
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let firstAnchorIndex = getLessMaxIndex(arr: nums, anchor: target/2)
        guard firstAnchorIndex != nil else {
            return []
        }
        let twoArrUnit = oneArrSplit(sourceArr: nums, anchorIndex: firstAnchorIndex!)
        guard twoArrUnit != nil else {
            return []
        }
        for (_, leftArrValue) in twoArrUnit!.leftArr.enumerated() {
            for (_, rightArrValue) in twoArrUnit!.rightArr.enumerated() {
                if leftArrValue + rightArrValue == target {
                    return [leftArrValue, rightArrValue]
                }
            }
        }
        return []
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
            if arr[tempIndex] <= anchor {
                if arr[tempIndex + 1] > anchor || (arr[tempIndex] == anchor && arr[tempIndex + 1] == anchor) {
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

///给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() {
        self.val = 0;
        self.next = nil;
     }
     public init(_ val: Int) {
        self.val = val;
        self.next = nil;
     }
     public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
     }
 }

extension DetailVC {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        let resultList = ListNode()
        //let l1: ListNode?  = l1
        //let l2: ListNode? = l2
        if l1 != nil || l2 != nil {
            let tempSum = (l1?.val ?? 0) + (l2?.val ?? 0)
            if tempSum >= 10 {
                resultList.val = tempSum % 10
                if l1?.next != nil {
                    l1?.next?.val += 1
                    resultList.next = addTwoNumbers(l1?.next, l2?.next)
                }else {
                    let nextNode = ListNode(1)
                    resultList.next = addTwoNumbers(nextNode, l2?.next)
                }
            }else {
                resultList.val = tempSum
                resultList.next = addTwoNumbers(l1?.next, l2?.next)
            }
        }
        return resultList
    }
    
    func printNode(node: ListNode?) {
        guard node != nil else {
            return
        }
        var tempNode = node
        while tempNode != nil {
            print("value is :\(tempNode?.val)")
            tempNode = tempNode?.next
        }
    }
}
