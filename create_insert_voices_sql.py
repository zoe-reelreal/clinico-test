import random
from datetime import datetime, timedelta

# 設定發票字軌範圍
invoice_ranges = [
    ("AA", 12345600, 12345649),
    ("AB", 98765400, 98765449),
    ("AC", 45678900, 45678988)  # 只包含到 45678988
]

# 生成所有可用的發票號碼
invoice_numbers = []
for prefix, start, end in invoice_ranges:
    invoice_numbers.extend([f"{prefix}-{str(num).zfill(8)}" for num in range(start, end + 1)])

# 確保最後一個發票號碼是AC-45678988
invoice_numbers.remove("AC-45678988")
random.seed(42)
used_invoices = set(random.sample(invoice_numbers, 167))
used_invoices.add("AC-45678988")

# 排序並確保最後一筆是 AC-45678988
sorted_invoices = sorted(list(used_invoices))
sorted_invoices.remove("AC-45678988")
sorted_invoices.append("AC-45678988")

# 生成插入SQL語法
start_date = datetime.strptime('2024-03-01', '%Y-%m-%d')
sql_values = []
for i, invoice in enumerate(sorted_invoices):
    invoice_date = (start_date + timedelta(days=i % 31)).strftime('%Y-%m-%d')
    created_at = (start_date + timedelta(hours=random.randint(0, 720))).strftime('%Y-%m-%d %H:%M:%S')
    sql_values.append(f"('{invoice}', '{invoice_date}', '{created_at}', '{created_at}')")

sql_insert = "INSERT INTO invoices (invoice_number, invoice_date, created_at, updated_at) VALUES\n" + ",\n".join(sql_values) + ";"
print(sql_insert)
