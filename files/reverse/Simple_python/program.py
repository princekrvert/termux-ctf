import os
os.system("pip install hashlib")
import hashlib
# This program adds two numbers
num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
sum = num1 + num2
print(f"The sum of {num1} and {num2} is {sum}")
if hashlib.md5(str(sum).encode()).hexdigest() == "c0c7c76d30bd3dcaefc96f40275bdc0a":
    print("Here is your flag..")
    print(f"\033[35;1m HackMe127.0.0.1")

