//
//  Router.swift
//  User
//
//  Created by imac on 12/19/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import Foundation
import UIKit
import KWDrawerController

let mainPresenter : PresenterInputProtocol & InterectorToPresenterProtocol = Presenter()
let mainInteractor : PresenterToInterectorProtocol & WebServiceToInteractor = Interactor()
let mainRouter : PresenterToRouterProtocol = Router()
let mainWebservice : WebServiceProtocol = Webservice()

var presenterObject :PresenterInputProtocol?

class Router: PresenterToRouterProtocol{
    
    static let main = UIStoryboard(name: "Main", bundle: Bundle.main)
    static let home = UIStoryboard(name: "Home", bundle: Bundle.main)
    
    static func createModule() -> UIViewController {
        UserDefaultConfig.Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI0NDRkNWFjOGE0ZTA2ODBmZDVhNDVkM2I5YTUyOGNjZjQyY2EyMjA0ODNhNjI0NDY3NTc1OGMxZjgzZTQxZmJiNzViNTIwODc1ZTEzMTJlIn0.eyJhdWQiOiIyIiwianRpIjoiMjQ0NGQ1YWM4YTRlMDY4MGZkNWE0NWQzYjlhNTI4Y2NmNDJjYTIyMDQ4M2E2MjQ0Njc1NzU4YzFmODNlNDFmYmI3NWI1MjA4NzVlMTMxMmUiLCJpYXQiOjE1OTYyNjc4MjAsIm5iZiI6MTU5NjI2NzgyMCwiZXhwIjoxNTk3NTYzODE5LCJzdWIiOiIxMjUiLCJzY29wZXMiOltdfQ.T69qQM9ZAlp9bN3qzy9zvmYfU9vriITmyrJFqC6ZCcQrkiYQvPDSL7s-yJEUSSQQ7XSFi6JnmiCqWEeR51q7jLmue0gBFGEo7W3EdmXcOt6VqmIXqC90_a0AW_7YDz7EqxWqx3SaTA_LytqXnzo30rHQp37AKBmojAABpb_ylNMs0Ah6fV_nVnxWvukdeTjahZa-sJC8JxMD6beppNzxpR2K_thPpCNxBwgNvUllamaEr9LeH9XwKjVrB59vamIx1psa5GmNt5NFCBMbEf1Ss4Nfn5pIdud2pjW_pD4pUhafxxhJFxZw5zZdzz8AC-s1n9e9PmW--8nXE9m3W8sTUkx3fI-yBgiEHRXHUz9a0ZApG8B5bMs8H7V5WrHWWyGSpo2dUGduNCf8zZCwigIl5sBDq098fApEQedRTWfbSVg33IdwsfsTTj_c9f7bXeQqd6DIinGn2buKZIbSL2WRjT3i2vSpX5kOKxDO3JidpsAOIBHchaxlsY80RC10OK3Lq1Uzklx8oAQycmKfUgQ6ZAhLWNMg7cKvUpOk5-34AFeN_wHv39rhi13_OIntnRGCfF893rxITAANnl7RF7Sfai8xPnOaAJ8v_merbJH0-SCK1fOtLYi6lykzG0dhX3I8eJ8jt0MgqB3wB7mlMYHGmxx7V3TMhkvF29K5bLARZPA"
        
        if !UserDefaultConfig.Token.isEmpty {
             let view = home.instantiateViewController(withIdentifier: Storyboard.Ids.TapBarVC) as? TapBarViewController
            view?.presenter = mainPresenter
            mainPresenter.view = view
            mainPresenter.interactor = mainInteractor
            mainPresenter.router = mainRouter
            mainInteractor.presenter = mainPresenter
            mainInteractor.webService = mainWebservice
            mainWebservice.interactor = mainInteractor
            presenterObject = view?.presenter
            let navigationController = UINavigationController(rootViewController: view!)
            navigationController.isNavigationBarHidden = true
            
            return navigationController
        }else{
//            let vc = main.instantiateViewController(withIdentifier: Storyboard.Ids.LaunchViewController)
            let view = main.instantiateViewController(withIdentifier: Storyboard.Ids.LaunchViewController) as? LaunchViewController
            view?.presenter = mainPresenter
            mainPresenter.view = view
            mainPresenter.interactor = mainInteractor
            mainPresenter.router = mainRouter
            mainInteractor.presenter = mainPresenter
            mainInteractor.webService = mainWebservice
            mainWebservice.interactor = mainInteractor
            presenterObject = view?.presenter
            let navigationController = UINavigationController(rootViewController: view!)
            navigationController.isNavigationBarHidden = true
            return navigationController
        }
      
    }
    
}
