//
//  ThreadTestViewController02.swift
//  Demo01
//
//  Created by ebamboo on 2021/11/29.
//

import UIKit

class ThreadTestViewController02: UIViewController {

    var thread: Thread!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "test 02"
        
        /// 一、Thread 利用runloop 保持活性
        thread = Thread(block: {
            Thread.current.name = "测试线程"
            // NSMachPort 属于 input source 事件，与之对应的还有 timer source 事件
            // perform 属于 input source 事件
            RunLoop.current.add(NSMachPort(), forMode: .default)
            // Runloop 的各种model都没有 source 时立即退出，所以保证添加相关source之后再运行runloop
            // Run 方法实际是个死循环方法（一直在执行runModel：beforeDate），所以之后代码不会执行（除非runloop已经退出）
            CFRunLoopRun()
            // 线程将要销毁时执行所剩余任务
            // 可用来判断线程有没有销毁
            print("after run loop run task")
        })
        thread.start()
        
        
    }

    
    func testRunloop() {
        /// 二、测试runloop 运行机制
        /// Runloop 的各种model都没有 source 时立即退出，所以保证添加相关source之后再运行runloop
        /// Run 方法实际是个死循环方法（一直在执行runModel：beforeDate），所以之后代码不会执行（除非runloop已经退出）
        DispatchQueue.global(qos: .default).async {
            // 1、此处启动 runloop 效果测试
//            RunLoop.current.run()
            
            self.perform(#selector(self.threadAction), on: Thread.current, with: nil, waitUntilDone: false)
            
            // 2、此处启动 runloop 效果测试
            RunLoop.current.run()
            
            print("hello world")
            
            // 3、此处启动 runloop 效果测试
//            RunLoop.current.run()
            
        }
    }
    
    
    @IBAction func test(_ sender: Any) {
        // waitUntilDone 参数表示是否阻塞当前线程
        // 通俗讲就是：要不要等待 threadAction 方法执行完毕再执行之后代码
        perform(#selector(threadAction), on: thread, with: nil, waitUntilDone: false)
        print("performSelector")
    }
    @objc func threadAction() {
        print("did performSelector")
    }
    
    
    deinit {
        // 必须使用类方法，因为当前对象即将销毁，而类则一直保存在内存中
        ThreadTestViewController02.perform(#selector(ThreadTestViewController02.cancelThread), on: thread, with: nil, waitUntilDone: true)
    }
    @objc class func cancelThread() {
        ///
        /// !!!!!!! 必须使用 CFRunLoopRun() 和 CFRunLoopStop(CFRunLoopGetCurrent()) 启动和停止 runloop !!!!!!!!!!!!
        /// 因为 Thread 的 cancel() 并不会停止和销毁 runloop
        ///
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
    
    
}
