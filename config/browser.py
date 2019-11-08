from selenium import webdriver
import time
driver = webdriver.Chrome()
driver.get("http://cdcfan/media/page/index.html#")
#place_order
driver.find_element_by_id('user-pick-identity').send_keys("Selong Wang")
time.sleep(0.5)
driver.find_element_by_id('user-pick-enter').click()
time.sleep(2)
driver.find_element_by_id('place_order').click()
driver.close()
# import webbrowser
#
# webbrowser.open("baidu.com")

# import datetime
#
# def get_current_week():
#     monday, sunday = datetime.date.today(), datetime.date.today()
#     one_day = datetime.timedelta(days=1)
#     while monday.weekday() != 0:
#         monday -= one_day
#     while sunday.weekday() != 6:
#         sunday += one_day
#
#     return monday, sunday
#
# print(get_current_week())