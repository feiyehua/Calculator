cmake_minimum_required(VERSION 3.5.0)
project(CalculatorCore VERSION 0.1.0 LANGUAGES C)

add_executable(CalculatorCore Addition.c IsSymbol.c main.c ParseMathExpression.c GetValue.c)

