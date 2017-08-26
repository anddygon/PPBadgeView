//
//  UITabBarItem+PPBadgeView.swift
//  PPBadgeViewSwift
//
//  Created by AndyPang on 2017/6/19.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

/*
 *********************************************************************************
 *
 * Weibo : jkpang-庞 ( http://weibo.com/jkpang )
 * Email : jkpang@outlook.com
 * QQ 群 : 323408051
 * GitHub: https://github.com/jkpang
 *
 *********************************************************************************
 */

import UIKit

public extension UITabBarItem {
    public var cv: CV<UITabBarItem> {
        return CV(self)
    }
}

public extension CV where Base: UITabBarItem {
    
    /// 添加带文本内容的Badge, 默认右上角, 红色, 18pts
    ///
    /// Add Badge with text content, the default upper right corner, red backgroundColor, 18pts
    ///
    /// - Parameter text: 文本字符串
    public func addBadge(text: String) {
        _bottomView.cv.addBadge(text: text)
        _bottomView.cv.moveBadge(x: 4, y: 3)
    }
    
    /// 添加带数字的Badge, 默认右上角,红色,18pts
    ///
    /// Add the Badge with numbers, the default upper right corner, red backgroundColor, 18pts
    ///
    /// - Parameter number: 整形数字
    public func addBadge(number: Int) {
        _bottomView.cv.addBadge(number: number)
        _bottomView.cv.moveBadge(x: 4, y: 3)
    }
    
    /// 添加带颜色的小圆点, 默认右上角, 红色, 8pts
    ///
    /// Add small dots with color, the default upper right corner, red backgroundColor, 8pts
    ///
    /// - Parameter color: 颜色
    public func addDot(color: UIColor?) {
        _bottomView.cv.addDot(color: color)
    }
    
    /// 设置Badge的偏移量, Badge中心点默认为其父视图的右上角
    ///
    /// Set Badge offset, Badge center point defaults to the top right corner of its parent view
    ///
    /// - Parameters:
    ///   - x: X轴偏移量 (x<0: 左移, x>0: 右移) axis offset (x <0: left, x> 0: right)
    ///   - y: Y轴偏移量 (y<0: 上移, y>0: 下移) axis offset (Y <0: up,   y> 0: down)
    public func moveBadge(x: CGFloat, y: CGFloat) {
        _bottomView.cv.moveBadge(x: x, y: y)
    }
    
    /// 设置Badge的高度,因为Badge宽度是动态可变的,通过改变Badge高度,其宽度也按比例变化,方便布局
    ///
    /// (注意: 此方法需要将Badge添加到控件上后再调用!!!)
    ///
    /// Set the height of Badge, because the Badge width is dynamically and  variable.By changing the Badge height in proportion to facilitate the layout.
    ///
    /// (Note: this method needs to add Badge to the controls and then use it !!!)
    ///
    /// - Parameter points: 高度大小
    public func setBadgeHeight(points: CGFloat) {
        _bottomView.cv.setBadgeHeight(points: points)
    }
    
    /// 设置Bage的属性 ;
    ///
    /// Set properties for Badge
    ///
    /// - Parameter attributes: 将badgeLabel对象回调出来的闭包
    public func setBadgeLabel(attributes: (PPBadgeLabel)->()) {
        _bottomView.cv.setBadgeLabel(attributes: attributes)
    }
    
    /// 显示Badge
    public func showBadge() {
        _bottomView.cv.showBadge()
    }
    
    /// 隐藏Badge
    public func hiddenBadge() {
        _bottomView.cv.hiddenBadge()
    }
    
    // MARK: - 数字增加/减少, 注意:以下方法只适用于Badge内容为纯数字的情况
    // MARK: - Digital increase /decrease, note: the following method applies only to cases where the Badge content is purely numeric
    /// badge数字加1
    public func increase() {
        _bottomView.cv.increase()
    }
    
    /// badge数字加number
    public func increaseBy(number: Int) {
        _bottomView.cv.increaseBy(number: number)
    }
    
    /// badge数字加1
    public func decrease() {
        _bottomView.cv.decrease()
    }
    
    /// badge数字减number
    public func decreaseBy(number: Int) {
        _bottomView.cv.decreaseBy(number: number)
    }
    
    /// 通过Xcode视图调试工具找到UITabBarItem原生Badge所在父视图
    private var _bottomView: UIView {
        let tabBarButton:UIView = self.base.value(forKey: "_view") as! UIView
        for subView in tabBarButton.subviews {
            if NSStringFromClass(subView.superclass!) == "UIImageView" {
                return subView
            }
        }
        return tabBarButton
    }
}
