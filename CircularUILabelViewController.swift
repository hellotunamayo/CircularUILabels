//
//  CircularUILabelViewController.swift
//  Created by Minyoung Yoo on 6/3/24.
//

import UIKit

class CircularUILabelViewController: UIViewController {
    
    let circleCenter = CGPoint(x: -150, y: 430)
    let circleRadius: CGFloat = 360.0
    
    let textArray: [String] = [
        "Afghanistan",
        "Albania",
        "Algeria",
        "American Samoa",
        "Andorra",
        "Angola",
        "Anguilla",
        "Antarctica",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Aruba",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas (the)",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin",
        "Bermuda",
        "Bhutan",
        "Bolivia",
        "Bonaire",
        "Bosnia and Herzegovina",
        "Botswana",
        "Bouvet Island",
        "Brazil",
        "British Indian Ocean Territory (the)",
        "Brunei Darussalam",
        "Bulgaria",
        "Burkina Faso",
        "Burundi",
        "Cabo Verde",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Cayman Islands (the)",
        "Central African Republic (the)",
        "Chad",
        "Chile",
        "China",
        "Christmas Island",
        "Cocos Islands",
        "Colombia",
        "Comoros",
        "Congo",
        "Congo",
        "Cook Islands",
        "Costa Rica",
        "Croatia",
        "Cuba",
        "Curaçao",
        "Cyprus",
        "Czechia",
        "Côte d'Ivoire",
        "Denmark",
        "Djibouti",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        addLabelAlongCircle()
    }
    
    func addLabelAlongCircle() {
        let angleIncrement = 2 * CGFloat.pi / CGFloat(textArray.count)
        
        textArray.enumerated().forEach { (index, item) in
            let angle = angleIncrement * CGFloat(index)
            let labelCenter = CGPoint(x: circleCenter.x + circleRadius * cos(angle),
                                      y: circleCenter.y + circleRadius * sin(angle))
            let label = createLabel(at: labelCenter, with: angle, indexNumber: index)
            view.addSubview(label)
        }
    }
    
    func createLabel(at position: CGPoint, with angle: CGFloat, indexNumber index: Int) -> UILabel {
        let label = UILabel()
        label.text = textArray[index]
        label.sizeToFit()
        label.center = position
        
        // UILabel들 왼쪽정렬 시키기 (근데 레이아웃 찐빠남...)
//        let labelWidth = label.frame.size.width
//        let labelHeight = label.frame.size.height
//        let labelX = position.x - labelWidth / 2 * cos(angle + .pi / 2)
//        let labelY = position.y - labelHeight / 2 * sin(angle + .pi / 2)
//        label.frame.origin = CGPoint(x: labelX, y: labelY)
        
        let rotationTransform = CGAffineTransform(rotationAngle: angle + CGFloat.pi)
        let verticalFlipTransform = CGAffineTransform(scaleX: -1, y: -1)
        
        label.transform = rotationTransform.concatenating(verticalFlipTransform)
        
        return label
    }
    
}
