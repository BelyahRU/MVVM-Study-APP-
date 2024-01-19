//
//  Observable.swift
//  MVVM(Study APP)
//
//  Created by Александр Андреев on 11.01.2024.
//

import Foundation


class Observable<T> {
    
    var value: T? {
        // до того как установилось
        didSet {
            //асинхронно(потому что отлично от основного потока)
            DispatchQueue.main.async {
                //мы передаем слушателю значение
                self.listener?(self.value)
            }
        }
    }
    
    //инициализатор
    init( _ value: T?) {
        self.value = value
    }
    
    
    // приватный слушатель
    private var listener: ((T?) -> Void)?
    
    
    //сама привязка
    //Всякий раз, когда изменяется значение,: у нас должно быть что-то внутри замыкания
    //escaping, потому что мы принимаем данные с сервера
    func bind( _ listener: @escaping ((T?) -> Void)) {
        //передаем слушателю значение
        listener(value)
        // обновляем слушателя
        self.listener = listener
    }
}
