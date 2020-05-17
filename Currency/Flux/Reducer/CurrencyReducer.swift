//
//  CurrencyReducer.swift
//  Currency
//
//  Created by Michael Haß on 17.05.20.
//  Copyright © 2020 Michael Hass. All rights reserved.
//

import Foundation

func currencyReducer(state: CurrencyState, action: Action) -> CurrencyState {

    var state = state

    switch action {
    case let fetchAction as CurrencyActions.SetFetching:
        state.requestState = .fetching(fetchAction.endoint)
    case let errorAction as CurrencyActions.ShowError:
        state.requestState = .error(errorAction.error)
    case let successAction as CurrencyActions.SetCurrencyList:
        state.requestState = .success(successAction.endpoint)
        state.currencyList = successAction.list
    default:
        break
    }

    return state
}
