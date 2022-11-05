//
//  Extension2.swift
//  Core Score
//
//  Created by Remya on 11/1/22.
//

import Foundation
import UIKit


//MARK: - Searchbar Delegates
extension HomeViewController:UISearchBarDelegate{
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
    }
    
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trim() != ""{
            if searchText.lowercased() == HomeViewController.urlDetails?.key.lowercased(){
                gotoWebview()
            }
            else{
            doSearch(searchText: searchText)
            }
        }
        else{
            if selectedSportsType == .soccer{
            self.viewModel.matches?.removeAll()
                self.viewModel.matches = self.viewModel.searchOriginals
            }
            else{
                self.viewModel.basketballMatches?.removeAll()
                self.viewModel.basketballMatches = self.viewModel.searchOriginaBasketballMatches
            }
            prepareViews()
            
        }
        
    }
    
    func doSearch(searchText:String){
       
        if selectedSportsType == .soccer{
            let originals = viewModel.searchOriginals
            
        self.viewModel.matches?.removeAll()
        self.viewModel.matches = originals?.filter{($0.leagueName?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.leagueNameShort?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.homeName?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.awayName?.lowercased().contains(searchText.lowercased()) ?? false)}
        }
        else{
            let originals = viewModel.searchOriginaBasketballMatches
            
            self.viewModel.basketballMatches?.removeAll()
            self.viewModel.basketballMatches = originals?.filter{($0.leagueNameEn?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.leagueNameShortEn?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.homeTeamEn?.lowercased().contains(searchText.lowercased()) ?? false) || ($0.awayTeamEn?.lowercased().contains(searchText.lowercased()) ?? false)}
        }
        prepareViews()
        
    }
    
    func gotoWebview(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
        self.navigationController?.pushViewController(vc, animated: true)
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
    
}
