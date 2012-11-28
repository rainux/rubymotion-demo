class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    searchController = JCAutocompletingSearchViewController.autocompletingSearchViewController
    searchController.delegate = self

    navigationController = UINavigationController.alloc.initWithRootViewController(searchController)
    navigationController.navigationBarHidden = true
    window.rootViewController = navigationController

    window.makeKeyAndVisible

    true
  end

  def window
    @window ||= UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def searchController(searchController, performSearchForQuery: query, withResultsHandler: resultsHandler)
    p 'searchController'

    resultsHandler([
      {label: 'Result 1'},
      {label: 'Result 2'},
      {label: 'Result 3'}
    ])
  end

  def searchControllerCancelled(searchController)
    p 'Canceled'
  end

  def searchController(searchController, tableView: tableView, selectedResult: result)
    p result
  end
end
