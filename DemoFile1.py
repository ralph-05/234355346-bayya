def get_deductions(gross_monthly_income):
    # Tax and contribution rates
    tax_rate = 0.18
    sss_gsis_contribution = 900
    phil_health_contribution = 450

    # Adjust rates based on income ranges
    if gross_monthly_income < 15000:
        tax_rate = 0.10
        sss_gsis_contribution = 300
        phil_health_contribution = 150
    elif gross_monthly_income < 40000:
        tax_rate = 0.14
        sss_gsis_contribution = 600
        phil_health_contribution = 300
    elif gross_monthly_income < 100000:
        tax_rate = 0.18
        sss_gsis_contribution = 900
        phil_health_contribution = 450
    else:
        tax_rate = 0.26
        sss_gsis_contribution = 1200
        phil_health_contribution = 600

    # Calculate deductions and net income
    tax_deduction = gross_monthly_income * tax_rate
    net_monthly_income = gross_monthly_income - tax_deduction - sss_gsis_contribution - phil_health_contribution

    return tax_deduction, sss_gsis_contribution, phil_health_contribution, net_monthly_income

# User input
employee_name = input("Please enter your name: ")
employee_id = input("Please enter your employee ID: ")
gross_monthly_income = float(input("Please enter your Gross Monthly Income: "))

# Calculate deductions and net income
tax_deduction, sss_gsis_contribution, phil_health_contribution, net_monthly_income = get_deductions(gross_monthly_income)

# Display results using f-strings
print(f"Employee Name: {employee_name}")
print(f"Employee ID: {employee_id}")
print(f"Tax Deduction (18%): {tax_deduction}")
print(f"SSS/GSIS Contribution: {sss_gsis_contribution}")
print(f"Phil Health Contribution: {phil_health_contribution}")
print(f"Gross Monthly Income: {gross_monthly_income}")
print(f"Net Monthly Income: {net_monthly_income}")

