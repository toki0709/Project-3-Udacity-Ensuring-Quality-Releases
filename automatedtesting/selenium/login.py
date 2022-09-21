# #!/usr/bin/env python
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By


now = datetime.now()
current_date_time = now.strftime("%d/%m/%Y %H:%M:%S")

# Start the browser and login with standard_user
options = ChromeOptions()
options.add_argument("--headless")
driver = webdriver.Chrome(options=options)
driver = webdriver.Chrome()


def login(user, password):
    """
    Login to website
    """
    print('Starting the browser...')
    print("Current Timestamp ", current_date_time)

    # --uncomment when running in Azure DevOps.
    print('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')

    driver.find_element(
        By.CSS_SELECTOR, "input[id='user-name']").send_keys(user)
    driver.find_element(
        By.CSS_SELECTOR, "input[id='password']").send_keys(password)
    driver.find_element(
        By.CSS_SELECTOR, "input[id='login-button']").click()
    if current_url := driver.current_url:
        assert current_url == "https://www.saucedemo.com/inventory.html"
        print(f"{current_date_time} ---> Login succesfull!!")
    else:
        print(f"{current_date_time} ---> Login Unsuccesfull!!")


def add_to_cart(items):
    """
    add product to cart
    """
    print(f'Adding {len(items)} in the cart')
    for item in range(len(items)):
        driver.find_element(
            By.CSS_SELECTOR, "a[id='item_" + str(item) + "_title_link']").click()
        driver.find_element(
            By.CSS_SELECTOR, "button[class='btn btn_primary btn_small btn_inventory']").click()
        name = driver.find_element(
            By.CLASS_NAME, "inventory_details_name").text
        print(f'{current_date_time} ----> {name} ----> Added to cart')
        driver.find_element(
            By.CSS_SELECTOR, "button[id='back-to-products']").click()


def remove_products(items):
    """
    Removing all the products from cart
    """
    for item in range(len(items)):
        driver.find_element(
            By.CSS_SELECTOR, "a[id='item_" + str(item) + "_title_link']").click()
        driver.find_element(
            By.CSS_SELECTOR, "button[class='btn btn_secondary btn_small btn_inventory']").click()
        name = driver.find_element(
            By.CLASS_NAME, "inventory_details_name").text
        print(f'{current_date_time} ----> {name} ----> Removed from cart')
        driver.find_element(
            By.CSS_SELECTOR, "button[id='back-to-products']").click()


if __name__ == "__main__":
    login('standard_user', 'secret_sauce')
    items = driver.find_elements(By.CLASS_NAME, "inventory_item_price")
    add_to_cart(items)
    remove_products(items)
