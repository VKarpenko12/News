//
//  TableViewProvider.swift
//  News
//
//  Created by Vitalii Karpenko on 8/23/21.
//

import UIKit

class TableViewProvider<
    TableView: UITableView,
    ViewModel
>:  NSObject,
    UITableViewDataSource,
    UITableViewDelegate {

    // MARK: - Properties

    weak var tableView: TableView?
    let viewModel: ViewModel


    // MARK: - Initialization

    init(
        tableView: TableView,
        viewModel: ViewModel
    ) {
        self.tableView = tableView
        self.viewModel = viewModel

        super.init()

        configureTableView()
    }


    // MARK: - Appearance

    func reloadData() {
        tableView?.reloadData()
    }

    func remove(
        at indexPath: IndexPath,
        animation: TableView.RowAnimation = .fade
    ) {
        tableView?.beginUpdates()
        tableView?.deleteRows(at: [indexPath], with: animation)
        tableView?.endUpdates()
    }

    func reload(
        at indexPath: IndexPath,
        animation: TableView.RowAnimation = .none
    ) {
        tableView?.beginUpdates()
        tableView?.reloadRows(at: [indexPath], with: animation)
        tableView?.endUpdates()
    }


    // MARK: - Configuration

    func configureTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
    }


    // MARK: - UITableViewDataSource

    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        1
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        fatalError()
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        fatalError()
    }

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        nil
    }

    func sectionIndexTitles(
        for tableView: UITableView
    ) -> [String]? {
        nil
    }


    // MARK: - UITableViewDelegate

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

    }

    func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        0
    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        0
    }

    func tableView(
        _ tableView: UITableView,
        estimatedHeightForHeaderInSection section: Int
    ) -> CGFloat {
        0
    }

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        0
    }

    func tableView(
        _ tableView: UITableView,
        estimatedHeightForFooterInSection section: Int
    ) -> CGFloat {
        0
    }

    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        0
    }

    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {

    }

    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        view.tintColor = .white
    }

    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        nil
    }
    
    final func scrollViewDidScroll(
        _ scrollView: UIScrollView
    ) {
        (scrollView as? TableView).flatMap(tableViewDidScroll)
    }
    
    func tableViewDidScroll(
        _ tableView: TableView
    ) {
        
    }
    
    final func scrollViewDidEndDragging(
        _ scrollView: UIScrollView,
        willDecelerate decelerate: Bool
    ) {
        (scrollView as? TableView).flatMap {
            self.tableViewDidEndDragging($0, willDecelerate: decelerate)
        }
    }
    
    func tableViewDidEndDragging(
        _ tableView: TableView,
        willDecelerate decelerate: Bool
    ) {
        
    }
    
    final func scrollViewDidEndDecelerating(
        _ scrollView: UIScrollView
    ) {
        (scrollView as? TableView).flatMap {
            self.tableViewDidEndDecelerating($0)
        }
    }
    
    func tableViewDidEndDecelerating(
        _ tableView: TableView
    ) {
        
    }
}
