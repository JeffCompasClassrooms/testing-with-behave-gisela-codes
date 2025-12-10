from behave import given, when, then
from selenium.webdriver import *
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

@given('I open the bigprimes.org website')
def step_open_bigprimes(context):
    context.behave_driver.get("https://www.bigprimes.org/")
    WebDriverWait(context.behave_driver, 5).until(
        EC.presence_of_element_located((By.ID, "numPrimes"))
    )

@when('I navigate to primality test')
def step_navigate_to_primality_test(context):
    driver = context.behave_driver
  
        # look for button that says "primality test"
    link = driver.find_element(By.XPATH, "/html/body/center/ul/a[2]")
    link.click()
    WebDriverWait(driver, 5).until(
        EC.presence_of_element_located((By.XPATH, "//button[text()='Test that prime']"))
    )

@when('I search for the prime number "{number}"')
def step_search_prime(context, number):
    driver = context.behave_driver
    input_field = driver.find_element(By.ID, "primeCandidate")
    input_field.clear()
    input_field.send_keys(number)

@when('I search for the number "{number}"')
def step_search_composite(context, number):
    step_search_prime(context, number)

@when('I search for the large prime number "{number}"')
def step_search_large_prime(context, number):
    step_search_prime(context, number)

@when('I search for the negative number "{number}"')
def step_search_negative(context, number):
    step_search_prime(context, number)

@when('I click Test That Prime')
def step_click_test_prime(context):
    driver = context.behave_driver
    button = driver.find_element(By.XPATH, "//button[contains(text(), 'Test that prime')]")
    button.click()
    WebDriverWait(driver, 5).until(
        lambda d: d.find_element(By.ID, "isPrimeTitle").text.strip().lower() != "test your primes here"
    )

@then('I should see that "{number}" is a prime number!')
def step_verify_is_prime(context, number):
    driver = context.behave_driver
    is_prime = driver.find_element(By.ID, "isPrimeTitle")
    is_prime_text = is_prime.text.lower()
    assert f"{number} is a prime number!" in is_prime_text, (
        f"Expected '{number} is a prime number!', but got '{is_prime_text}'"
    )
@then('I should see that "{number}" is the negation of a prime number!')
def step_verify_is_negation_of_prime(context, number):
    driver = context.behave_driver
    is_prime = driver.find_element(By.ID, "isPrimeTitle")
    is_prime_text = is_prime.text.lower()
    assert f"{number} is the negation of a prime number!" in is_prime_text, (
        f"Expected '{number} is the negation of a prime number!', but got '{is_prime_text}'"
    )
@then('I should see that "{number}" is not prime')
def step_verify_not_prime(context, number):
    driver = context.behave_driver
    is_prime = driver.find_element(By.ID, "isPrimeTitle")
    is_prime_text = is_prime.text.lower()
    assert f"{number} is not prime." in is_prime_text, (
        f"Expected '{number} is not prime.', but got '{is_prime_text}'"
    )

@then('I should see the page title contains "{text}"')
def step_verify_page_title(context, text):
    driver = context.behave_driver
    page_title = driver.title.lower()
    assert text.lower() in page_title, f"Expected '{text}' in page title, but got '{driver.title}'"

@when('I enter "{count}" for number of primes')
def step_enter_num_primes(context, count):
    driver = context.behave_driver
    field = driver.find_element(By.ID, "numPrimes")
    field.clear()
    field.send_keys(count)

@when('I enter "{digits}" for number of digits')
def step_enter_num_digits(context, digits):
    driver = context.behave_driver
    field = driver.find_element(By.ID, "digits")
    field.clear()
    field.send_keys(digits)

@when('I click Get more primes')
def step_click_get_primes(context):
    driver = context.behave_driver
    button = driver.find_element(By.CSS_SELECTOR, "button.mdl-button")
    button.click()
    WebDriverWait(driver, 5).until(
        EC.presence_of_element_located((By.ID, "primeList"))
    )

@then('I should see a list of {count:d} primes')
def step_assert_prime_list_length(context, count):
    driver = context.behave_driver
    prime_list = driver.find_element(By.ID, "primeList")
    WebDriverWait(driver, 5).until(
        lambda d: len(prime_list.find_elements(By.CSS_SELECTOR, "table > tbody > tr")) == count
    )
    rows = prime_list.find_elements(By.CSS_SELECTOR, "table > tbody > tr")
    assert len(rows) == count, f"Expected {count} primes, got {len(rows)}"



