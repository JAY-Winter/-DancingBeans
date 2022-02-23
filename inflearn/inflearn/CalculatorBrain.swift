////
////  CalculatorBrain.swift
////  inflearn
////
////  Created by JAEHYEON on 2022/02/17.
////
//
////
////class CalculatorBrain {
////
////    private var accumlator = 0.0
////
////    func setOperand (operand: Double) {
////        accumlator = operand
////    }
////
////    // operations 변수는 Dic<String, Operataion> 형태 > Operation 은 enum Operation
////    var operations: Dictionary<String, Operation> = [
////        "PI" : Operation.Constant(M_PI),
////        "e" : Operation.Constant(M_E),
////        "√" : Operation.UnaryOperation,
////        "cos" : Operation.UnaryOperation
////    ]
////
////    enum Operation {
////        case Constant(Double)
////        case UnaryOperation
////        case BinaryOperation
////        case Equals
////
////    }
////
////    func performOperation(symbol: String) {
////
////        // constant 상수는 Dic 타입 operations 변수 중 key 가 symbol인 값
////        if let constant = operations[symbol] {
////            if let operation = operations[symbol] {
////                switch operation {
////                case .Constant(let value) : accumlator = value
////                case .UnaryOperation : break
////                case .BinaryOperation : break
////                case .Equals :break
////                }
////            }
////        }
////    }
////
////    var result: Double {
////        get {
////            return accumlator
////        }
////    }
////
////
////}
//
//
//
//class CalculatorBrain {
//
//    func setOperand(operand: Double) {
//        accumlator = operand
//    }
//
//    // performOperation func 에서 1번 구문을 보면
//    // switch 구문을 통해 각 case 별 계산을 시행하게 되어있는데
//    // generic 하게 만들어주기 위해 operations 선언
//    var operations: Dictionary<String, Operation> = [
//        //  기존 operations: Dictionary<String, Double> 일 때 key, val
//        //        "PI" : M_PI,
//        //        "e" : M_E
//        //        "√" : sqrt(Double) 은 어떻게 해야할까?
//
//        // Operation 이란 enum(case 들을 모아둔 set) 생성
//        "PI" : Operation.Constant(M_PI),
//        "e" : Operation.Constant(M_E),
//        "√" : Operation.UnaryOperation,
//        "cos" : Operation.UnaryOperation
//    ]
//
//
//    enum Operation {
//        // enum > case 에 tuple 형식으로 연관값을 지정해줄 수 있음.
//        // 아래 처럼 method 도 가능
//        case Constant(Double)
//        case UnaryOperation
//        case BinaryOperation
//        case Equals
//    }
//
//    func performOperation(symbol: String) {
//        //        1. symbol 을 switch
//        //        switch symbol {
//        //        case "PI" : accumlator = M_PI
//        //        case "√" : accumlator = sqrt(accumlator)
//        //        default : break
//        //        }
//
//        // 2. constant의 type이 Double? Optional type 이다. 왜?
//        // operataions 의 value가 있을 수도 있고 없을 수도 있는 Optional 이기 때문에
//        // 이때, accumlator = constant! "!" Optional 해제를 통해 할 수도 있지만
//        // 3번 구문을 확인하자
//        //        let constant = operations[symbol]
//        //        accumlator = constant
//
//        // 3. if let 구문을 통해 안정성을 확보한다
//        //        if let constant = operations[symbol] {
//        // accumlator = constant //Cannot assign value of type 'calculatorBrain.Opertaion'to type 'Double' 오류 발생
//
//        // 4. let operation 이 .Operation 인데 대문자이지 않은 이유는 지역변수로 선언했기 때문에
//        // swift 에서  모든 지역변수의 시작은 소문자로 시작하고 type 은 다 대문자로 시작한다
//        if let operation = operations[symbol] {
//            switch operation {
//                // 5. switch operation의 declaration 이 CalculatorBrain.Operation 이어서 .Constant 로 표현가능
//                // case Operation.Constant : break
//                // case Operation.UnaryOperation : break
//                // case Operation.BinaryOperation : break
//                // case Operation.Equals : break
//
//                // 6. enum Operation으로 switch 하므로 Operation 의 모든 case 가 들어가야하는데
//                // 모든 case 를 정의했으므로 default 는 필요없다
//                //            case .Constant : break
//                //            case .UnaryOperation : break
//                //            case .BinaryOperation : break
//                //            case .Equals : break
//
//                // 7. 위에는 일단 break를 다 걸어줬지만 나는 상수 operation 이 각 case 별로
//                // 예를 들어 .Constant case 일 땐 Double 계산을 시켜주고 싶다
//                // 연관값을 가져오기 위해 patterMatching 함
//                // 아래 .Constant(let value) : accumlator = value 의미
//                // : operation case 중 Constant 는 value 라는 상수를 연관값으로 가지고
//                // Consant case 는 accumlator 이며 이는 연관값에서 생성한 value 다
//
//                // enum Operation case 중 Constant(Double) 을 해줬기 때문에
//                //
//            case .Constant(let value) : accumlator = value
//            case .UnaryOperation : break
//            case .BinaryOperation : break
//            case .Equals : break
//
//
//            }
//        }
//
//
//    }
//
//    var accumlator = 0.0
//
//    var result: Double {
//        get {
//            return accumlator
//        }
//    }
//
//
//
//
//
//}

import Foundation

func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

class CalculatorBrain {
    
    var accumlator = 0.0
    
    var result: Double {
        get {
            return accumlator
        }
    }
    
    func setOperand(operand: Double) {
        
        accumlator = operand
        
    }
    
    enum Operation {
        
        case Constant(Double) // 상수(Double)
        case UnaryOperation((Double) -> Double) // 단항 연산
        case BinaryOperation((Double, Double) -> Double) // 이항 연산
        case Equals // =
        
    }
    
    var operations : Dictionary<String, Operation> = [
        
        "PI" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "ⅹ" : Operation.BinaryOperation(multiply),
        "=" : Operation.Equals
        
    ]
    
    struct PendingBinaryOperationInfo {
        
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
        
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    func performOperation(symbol: String) {
        
        if let operations = operations[symbol] {
            
            switch operations {
                
            case .Constant(let value) :
                accumlator = value
            case .UnaryOperation(let function) :
                accumlator = function(accumlator)
            case .BinaryOperation(let function) :
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumlator)
            case .Equals : // "=" 기호가 눌러졌을 때 performOperation 작동
                // case : 5 x 3 = 눌러진 상태
                // PendingBinaryOperationInfo(binaryFunction: multiply, firstOperand: accmlator)
                if pending != nil {
                    
                    
                }
                
                
                break
                
            }
        }
    }
}

