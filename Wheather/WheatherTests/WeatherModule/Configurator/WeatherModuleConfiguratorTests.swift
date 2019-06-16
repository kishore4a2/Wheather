//
//  WeatherModuleWeatherModuleConfiguratorTests.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import XCTest

class WeatherModuleModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = WeatherModuleViewControllerMock()
        let configurator = WeatherModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "WeatherModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is WeatherModulePresenter, "output is not WeatherModulePresenter")

        let presenter: WeatherModulePresenter = viewController.output as! WeatherModulePresenter
        XCTAssertNotNil(presenter.view, "view in WeatherModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in WeatherModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is WeatherModuleRouter, "router is not WeatherModuleRouter")

        let interactor: WeatherModuleInteractor = presenter.interactor as! WeatherModuleInteractor
        XCTAssertNotNil(interactor.output, "output in WeatherModuleInteractor is nil after configuration")
    }

    class WeatherModuleViewControllerMock: WeatherModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
