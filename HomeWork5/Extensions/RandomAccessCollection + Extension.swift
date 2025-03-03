//
//  RandomAccessCollection + Extension.swift
//  HomeWork5
//
//  Created by Karina Blinova on 02.03.2025.
//

extension RandomAccessCollection where Self.Element: Identifiable {
    func needToLoad<Item: Identifiable>(item: Item) -> Bool {
        guard !isEmpty else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable(item.id) == AnyHashable($0.id) }) else { return false }
        let distance = distance(from: itemIndex, to: endIndex)
        return distance == 3
    }
}
