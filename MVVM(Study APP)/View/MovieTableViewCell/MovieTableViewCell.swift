//
//  MovieTableViewCell.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 15.01.2024.
//

import UIKit
import SnapKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    public static var indetifier: String {
        get {
            return "MovieTableViewCell"
        }
    }
    
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(gray: 20, alpha: 0.5)
        return view
    }()
    var movieImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.layer.cornerRadius = 10
        im.layer.masksToBounds = true
        return im
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    var rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        addView()
        setupConstraints()
    }
    
    func setupCell(viewModel: MovieTableViewCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageURL)
        
        
    }
    
}


//MARK: SETUP VIEW
extension MovieTableViewCell {
    func addView() {
        addSubview(backView)
        backView.addSubview(movieImageView)
        backView.addSubview(nameLabel)
        backView.addSubview(dateLabel)
        backView.addSubview(rateLabel)
        
        
    }
    
    func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(8)
        }
        movieImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(movieImageView.snp.right).offset(7.5)
            make.top.equalToSuperview().offset(8)
            //make.bottom.equalToSuperview().offset(-60)
            make.right.equalToSuperview().offset(-8)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(movieImageView.snp.right).offset(7.5)
            make.bottom.equalTo(rateLabel.snp.top).offset(-8)
            make.right.equalToSuperview().offset(-8)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.left.equalTo(movieImageView.snp.right).offset(7.5)
            make.bottom.equalTo(movieImageView.snp.bottom)
            make.right.equalToSuperview().offset(-8)
        }
        
        
        
    }
}
