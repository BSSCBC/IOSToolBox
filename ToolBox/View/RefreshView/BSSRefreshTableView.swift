//
//  BSSRefreshTableView.swift
//  BSSRefreshTableView
//
//  Created by BSSCBC on 2024/8/21.
//

import UIKit
import MJRefresh

open class BSSRefreshTableView: UITableView {
    open var bcrefreshdatablock: (() -> Void)?
    open var bcrefreshmoredatablock: (() -> Void)?
    
    private(set) lazy var bchiddenfooterrefresh = true
    private(set) lazy var bchiddenheaderrefresh = false
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = UIColor.clear
        contentInsetAdjustmentBehavior = .never
        automaticallyAdjustsScrollIndicatorInsets = false
    }    
    
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

extension BSSRefreshTableView {
    @objc dynamic open func bcsetrefresh() {
        if mjheader != nil {
            mjheader = nil
        }
        
        if mjfooter != nil {
            mjfooter = nil
        }
        
        mjheader = MJRefreshStateHeader(refreshingTarget: self, refreshingAction: #selector(bcloaddata))
        mjfooter = MJRefreshAutoStateFooter(refreshingTarget: self, refreshingAction: #selector(bcrequestmoredata))
        mjfooter?.isHidden = bchiddenfooterrefresh
    }
    
    public func bcremoverefresh() {
        mjheader = nil
        mjfooter = nil
    }
}

extension BSSRefreshTableView {

    public func bcshowrefresh() {
        bchiddenheaderrefresh = false
        bchiddenfooterrefresh = false
        mjheader?.isHidden = bchiddenheaderrefresh
        mjfooter?.isHidden = bchiddenfooterrefresh
    }
    
    public func bchiddenrefresh() {
        bchiddenheaderrefresh = true
        bchiddenfooterrefresh = true
        mjheader?.isHidden = bchiddenheaderrefresh
        mjfooter?.isHidden = bchiddenfooterrefresh
    }

    @objc public func bchiddenheaderrefresh(isHidden: Bool) {
        bchiddenheaderrefresh = isHidden
        mjheader?.isHidden = bchiddenheaderrefresh
    }
    
    @objc public func bchiddenfooterrefresh(isHidden: Bool) {
        bchiddenfooterrefresh = isHidden
        mjfooter?.isHidden = bchiddenfooterrefresh
    }
}

extension BSSRefreshTableView {
    @objc public func bcloaddata(){
        if bchiddenheaderrefresh == true {
            bcendheaderrefresh()
            return
        }
        
        if bcrefreshdatablock != nil {
            bcrefreshdatablock!()
        }
        
        if bchiddenfooterrefresh == false {
            bcresetfooterrefresh()
        }
    }
    
    @objc public func bcbeginheaderrefresh() {
        if bchiddenheaderrefresh == true {
            bcendheaderrefresh()
            return
        }
        
        if bchiddenfooterrefresh == false {
            bcresetfooterrefresh()
        }
        
        mjheader?.beginRefreshing()
    }
    
    public func bcendheaderrefresh() {
        mjheader?.endRefreshing()
    }
}

extension BSSRefreshTableView {

    @objc public func bcrequestmoredata() {
        if bchiddenfooterrefresh == true {
            bcendfooterrefresh()
            return
        }
        
        if bcrefreshmoredatablock != nil {
            bcrefreshmoredatablock!()
        }
    }
    
    public func bcbeginfooterrefresh() {
        if bchiddenfooterrefresh == true {
            bcendfooterrefresh()
            return
        }
        
        mjfooter?.beginRefreshing()
    }
    
    public func bcendfooterrefresh() {
        mjfooter?.endRefreshing()
    }
    
    public func bcendfooterrefreshwithnoMore() {
        mjfooter?.endRefreshingWithNoMoreData()
    }
    
    public func bcresetfooterrefresh() {
        mjfooter?.resetNoMoreData()
    }
}
