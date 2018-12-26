
from cashflow import CashFlow

print("Testing cash flow class")

c = CashFlow()
c.addVector([-100.0, 10.0, 20.0, 30.0, 15.0])

print("Before adding 200")
c.show()
print(" Net present value => NPV(c, 8%) =", c.npv(0.08))
print("After adding 200")
c.add(200)
c.show()
print(" Net present value => NPV(c, 8%) =", c.npv(0.08))
