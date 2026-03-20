//
//  BSSRefreshCollectionView.swift
//  BSSRefreshCollectionView
//
//  Created by BSSCBC on 2024/8/21.
//

import UIKit
import MJRefresh

open class BSSRefreshCollectionView: UICollectionView {
    open var bcrefreshdatablock: (() -> Void)?
    open var bcrefreshmoredatablock: (() -> Void)?
    
    private(set) lazy var bchiddenfooterrefresh = true
    private(set) lazy var bchiddenheaderrefresh = false
    
    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = UIColor.clear
        contentInsetAdjustmentBehavior = .never
        automaticallyAdjustsScrollIndicatorInsets = false
    }
    
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension BSSRefreshCollectionView {
    @objc dynamic open func bcsetrefresh() {
        if mj_header != nil {
            mj_header = nil
        }
        
        if mj_footer != nil {
            mj_footer = nil
        }
        
        mj_header = MJRefreshStateHeader(refreshingTarget: self, refreshingAction: #selector(bcloaddata))
        mj_footer = MJRefreshAutoStateFooter(refreshingTarget: self, refreshingAction: #selector(bcrequestmoredata))
        mj_footer?.isHidden = bchiddenfooterrefresh
    }
    
    public func bcremoverefresh() {
        mj_header = nil
        mj_footer = nil
    }
}

extension BSSRefreshCollectionView {

    public func bcshowrefresh() {
        bchiddenheaderrefresh = false
        bchiddenfooterrefresh = false
        mj_header?.isHidden = bchiddenheaderrefresh
        mj_footer?.isHidden = bchiddenfooterrefresh
    }
    
    public func bchiddenrefresh() {
        bchiddenheaderrefresh = true
        bchiddenfooterrefresh = true
        mj_header?.isHidden = bchiddenheaderrefresh
        mj_footer?.isHidden = bchiddenfooterrefresh
    }

    @objc public func bchiddenheaderrefresh(isHidden: Bool) {
        bchiddenheaderrefresh = isHidden
        mj_header?.isHidden = bchiddenheaderrefresh
    }
    
    @objc public func bchiddenfooterrefresh(isHidden: Bool) {
        bchiddenfooterrefresh = isHidden
        mj_footer?.isHidden = bchiddenfooterrefresh
    }
}

extension BSSRefreshCollectionView {
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
        
        mj_header?.beginRefreshing()
    }
    
    public func bcendheaderrefresh() {
        mj_header?.endRefreshing()
    }
}

extension BSSRefreshCollectionView {

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
        
        mj_footer?.beginRefreshing()
    }
    
    public func bcendfooterrefresh() {
        mj_footer?.endRefreshing()
    }
    
    public func bcendfooterrefreshwithnoMore() {
        mj_footer?.endRefreshingWithNoMoreData()
    }
    
    public func bcresetfooterrefresh() {
        mj_footer?.resetNoMoreData()
    }
}
