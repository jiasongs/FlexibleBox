//
//  ViewController.swift
//  FlexibleBoxExample
//
//  Created by jiasong on 2023/6/20.
//

import UIKit
import FlexibleBox

class ViewController: UIViewController {
    
    lazy var containerView: UIView = {
        return UIView()
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "subtitle"
        return label
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let margin = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        _ = Layout()
        _ = Layout()
        _ = Layout()
        
        let layout = self.view.flexbox.layout
        print("\(layout)")
        
        self.view.addSubview(self.titleLabel)
        self.titleLabel.flexbox.layout
            .flexDirection(.row)
            .justifyContent(.flexStart)
            .marginLeft(10)
            .marginLeft(10.5)
            .marginLeft(10%)
            .marginLeft(Value(self.margin))
        
        self.titleLabel.flexbox.layout = self.titleLabel.flexbox.layout
            .flexDirection(.row)
            .justifyContent(.flexStart)
        
        print("\(self.titleLabel.flexbox.layout)")
        
//        self.view.makeStacks {
//            self.containerView.makeStacks {
//                self.okButton
//                UIButton()
//                UIView().makeStacks {
//                    UILabel().flexbox.
//                    UILabel()
//                    self.subtitleLabel
//                }
//                UIView().makeStacks {
//                    UILabel()
//                    UILabel()
//                    UIView().makeStacks {
//                        UIView().makeStacks {
//                            self.titleLabel
//                        }
//                        UIImageView()
//                    }
//                }
//                UIView().makeStacks {
//                    UIView().makeStacks {
//                        UIView().makeStacks {
//                            self.titleLabel
//                        }
//                        UIImageView()
//                    }
//                    UILabel()
//                    UILabel()
//                }
//            }
//            UIView().makeStacks {
//                UIView().makeStacks {
//                    UILabel()
//                    UIView().makeStacks {
//                        self.titleLabel
//                    }
//                    UIImageView()
//                    UIImageView().makeStacks {
//                        UIButton().makeStacks {
//                            UILabel()
//                        }
//                    }
//                }
//                UILabel()
//                UILabel()
//            }
//            UILabel()
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = self.view.flexbox.layout
        print("\(layout)")
    }
    
}
