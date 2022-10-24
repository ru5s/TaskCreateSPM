//
//  TableViewCell.swift
//  TaskCreateSPM
//
//  Created by Ruslan Ismailov on 24/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let separatorLine: UIView = {
        var line = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        line.isSkeletonable = true
        
        return line
    }()
    
    let image: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .darkGray
        image.isSkeletonable = true
        image.layer.cornerRadius = 30
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        return image
    }()
    
    let mainLabel: UILabel = {
        var label = UILabel()
        label.text = "                                     "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .black
        label.isSkeletonable = true
        
        return label
    }()
    
    let underLabel: UILabel = {
        let label = UILabel()
        label.text = "                                                               "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .gray
        label.isSkeletonable = true
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        isSkeletonable = true
        
        contentView.addSubview(separatorLine)
        separatorLine.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        separatorLine.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        contentView.addSubview(image)
        image.widthAnchor.constraint(equalToConstant: 60).isActive = true
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        contentView.addSubview(mainLabel)
        mainLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20).isActive = true
        mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        contentView.addSubview(underLabel)
        underLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20).isActive = true
        underLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
